-- 직원 삭제: 직원 아이디 삭제

DELETE FROM employee
WHERE emp_id = 202;

-- report 테이블에서 NULL 허용 + RESTRICT에서 SET NULL로 설정을 변경하면 해결된다.




-- 직원 등록: 직원 아이디 등록

INSERT INTO employee (emp_id, work_date, start_time, end_time, work_hour, position)
VALUES (203, '2024-01-02', '2024-01-02 09:00:00', '2024-01-02 18:00:00', '08:00:00', '직원');





-- 로그인: 직원별 부여된 코드로 로그인

DELIMITER $$

CREATE OR REPLACE PROCEDURE LoginProcedure(IN input_emp_id INT)
BEGIN
    -- emp_id 값이 employee 테이블에 있는지 확인
    IF input_emp_id IN (SELECT emp_id FROM employee) THEN
        -- 로그인 성공: start_time을 현재 시간으로 업데이트
        UPDATE employee
        SET 
            start_time = CURRENT_TIME, -- 로그인 시간 설정
            work_date = CURRENT_DATE,  -- 작업 날짜 설정
            end_time = NULL,  -- end_time을 NULL로 설정 (삭제 효과)
            work_hour = NULL  -- work_hour를 NULL로 설정 (삭제 효과)
        WHERE emp_id = input_emp_id;

        -- 성공 메시지 반환
        SELECT '로그인 되었습니다.' AS message;
    ELSE
        -- emp_id가 없을 경우 실패 메시지 반환
        SELECT '로그인 실패: 유효하지 않은 emp_id입니다.' AS message;
    END IF;
END $$

CALL LoginProcedure(201);





-- 로그아웃: 근무 시작 시간과 종료시간을 기입

DELIMITER $$

CREATE OR REPLACE PROCEDURE LogoutProcedure(IN input_emp_id INT)
BEGIN
    -- 로그아웃 시간 설정
    DECLARE logout_time TIME;
    SET logout_time = CURRENT_TIME;

    -- emp_id가 존재하는지 확인
    IF input_emp_id IN (SELECT emp_id FROM employee) THEN
        -- 행 업데이트: work_date, end_time, work_hour 수정
        UPDATE employee
        SET 
            work_date = CURRENT_DATE, -- 현재 날짜
            end_time = logout_time, -- 현재 시간 (로그아웃 시간)
            work_hour = TIMESTAMPDIFF(SECOND, start_time, logout_time) -- 시간 차이 계산
        WHERE emp_id = input_emp_id;

        -- 로그아웃 성공 메시지
        SELECT CONCAT('로그아웃 되었습니다. (emp_id: ', input_emp_id, ')') AS message;
    ELSE
        -- emp_id가 없을 경우 실패 메시지
        SELECT '로그아웃 실패: 유효하지 않은 emp_id입니다.' AS message;
    END IF;
END $$

DELIMITER ;

CALL LogoutProcedure(201);





-- 근무시간 추적: 출근 및 퇴근 시간 기록,실시간 근무 상태 모니터링.

DELIMITER $$

CREATE PROCEDURE CheckWorkStatus(IN input_emp_id INT)
BEGIN
    DECLARE work_status VARCHAR(255);

    -- emp_id 값이 employee 테이블에 있는지 확인
    IF input_emp_id IN (SELECT emp_id FROM employee) THEN
        -- end_time이나 work_hour가 NULL인 경우 근무 중으로 판단
        IF (SELECT end_time FROM employee WHERE emp_id = input_emp_id) IS NULL 
            OR (SELECT work_hour FROM employee WHERE emp_id = input_emp_id) IS NULL THEN
            SET work_status = '근무 중입니다.';
        ELSE
            SET work_status = '근무 종료되었습니다.';
        END IF;
        
        SELECT work_status AS message;
    ELSE
        SELECT '유효하지 않은 emp_id입니다.' AS message;
    END IF;
END $$

DELIMITER ;

CALL CheckWorkStatus(201);





-- 프로모션 코드 및 할인을 적용한다.
 
ALTER TABLE EVENT ADD COLUMN discount_code INT AFTER event_end; -- event 테이블에 코드 행을 추가한다.
INSERT INTO event VALUES(5, '티셔츠 쿠폰 할인 행사', '2024-12-19 00:00:00', '2025-12-19 00:00:00', '1234567890'); -- 티셔츠 쿠폰 할인 행사행 추가
UPDATE product SET event_id = 5 WHERE product_id = 102; -- product 테이블의 티셔츠 행의 event_id를 5으로 수정

DELIMITER $$

CREATE OR REPLACE PROCEDURE CouponDiscount(
	IN coupon_code VARCHAR(100) -- 쿠폰 코드 입력
)

BEGIN
	SELECT 
  	   s.sales_id, 
   	p.product_name, 
   	CASE 
        	WHEN coupon_code = e.discount_code THEN s.sales_price * 0.9
        	ELSE s.sales_price
    	END AS sales_price
	FROM product p
	JOIN sales s ON s.product_id = p.product_id
	JOIN event e ON e.event_id = p.event_id;
END $$

DELIMITER ;

CALL CouponDiscount('1234567890'); -- 40000만원임 티셔츠가 36000원으로 할인!





-- 고객 등록: 신규 고객 정보를 입력한다.

INSERT INTO membership (mem_id, customer_name, email, mobile, birth_year, addr)
VALUES (3, '임꺽정', 'im@example.com', '01025864823', '1999', '서울특별시 노원구');





-- 고객 구매 내역 확인: 특정 고객의 과거 구매 내역을 조회한다.

DELIMITER $$

CREATE OR REPLACE PROCEDURE GetReceiptsByMember(IN input_mem_id INT)
BEGIN
    -- mem_id가 일치하는 모든 행을 조회
    SELECT *
    FROM receipt
    WHERE mem_id = input_mem_id;
END $$

DELIMITER ;

CALL GetReceiptsByMember(1);





-- 반품 처리: 반품 사유 기록 및 반품된 상품의 재고를 반영한다.

DELIMITER $$

CREATE OR REPLACE PROCEDURE ProcessExchangeByReceipt(
    IN input_recp_id INT,        -- 영수증 ID
    IN new_exchange_reason VARCHAR(255), -- 새로운 환불 사유
    IN exchange_quantity INT,       -- 환불된 상품 수량
    IN new_stock_id INT          -- 새로운 재고 기록의 ID
)
BEGIN
    -- 1. refund_reason 업데이트
    UPDATE refund r
    SET r.refund_reason = new_exchange_reason
    WHERE r.recp_id = input_recp_id;

    -- 2. stock 테이블에 새로운 행 추가
    INSERT INTO stock (
        stock_id,
        stock_status, 
        stock_date, 
        s_quantity, 
        r_quantity, 
        product_id
    )
    SELECT
	     new_stock_id,         -- stock_id
        '입고',               -- stock_status
        NOW(),                  -- stock_date
        exchange_quantity,        -- s_quantity (들어온 양)
        0,                      -- r_quantity (나간 양)
        r.product_id            -- product_id
    FROM refund r
    WHERE r.recp_id = input_recp_id;

    -- 3. product 테이블의 quantity 값 증가
    UPDATE product p
    JOIN refund r ON p.product_id = r.product_id
    SET p.quantity = p.quantity + exchange_quantity
    WHERE r.recp_id = input_recp_id;
END $$

DELIMITER ;

CALL ProcessExchangeByReceipt(502, '상품 풀질 불량', 5, 6);





-- 환불 처리: 환불 사유 기록 및 환불된 상품의 재고를 반영한다.

DELIMITER $$

CREATE OR REPLACE PROCEDURE ProcessRefundByReceipt(
    IN input_recp_id INT,        -- 영수증 ID
    IN new_refund_reason VARCHAR(255), -- 새로운 환불 사유
    IN refund_quantity INT,       -- 환불된 상품 수량
    IN new_stock_id INT          -- 새로운 재고 기록의 ID
)
BEGIN
    -- 1. refund_reason 업데이트
    UPDATE refund r
    SET r.refund_reason = new_refund_reason
    WHERE r.recp_id = input_recp_id;

    -- 2. stock 테이블에 새로운 행 추가
    INSERT INTO stock (
        stock_id,
        stock_status, 
        stock_date, 
        s_quantity, 
        r_quantity, 
        product_id
    )
    SELECT
	     new_stock_id,         -- stock_id
        '입고',               -- stock_status
        NOW(),                  -- stock_date
        refund_quantity,        -- s_quantity (들어온 양)
        0,                      -- r_quantity (나간 양)
        r.product_id            -- product_id
    FROM refund r
    WHERE r.recp_id = input_recp_id;

    -- 3. product 테이블의 quantity 값 증가
    UPDATE product p
    JOIN refund r ON p.product_id = r.product_id
    SET p.quantity = p.quantity + refund_quantity
    WHERE r.recp_id = input_recp_id;
END $$

DELIMITER ;

CALL ProcessRefundByReceipt(501, '상품 파손으로 인한 환불', 5, 5);





-- 회원 전용 할인 제공

DELIMITER $$

CREATE OR REPLACE PROCEDURE MembershipDiscount(
    IN new_mem_id INT        -- 멤버십 ID 입력
)
BEGIN
	SELECT 
  	   s.sales_id, 
   	p.product_name, 
   	s.sales_quantity, 
    	CASE 
        	WHEN new_mem_id IN (SELECT mem_id FROM membership) THEN s.sales_price * 0.9
        	ELSE s.sales_price
    	END AS sales_price
	FROM product p
	JOIN sales s ON s.product_id = p.product_id;
END $$

DELIMITER ;

CALL MembershipDiscount(1);

                
                
                
 
-- 멤버십 포인트 적립(1%)

DELIMITER $$

CREATE OR REPLACE PROCEDURE MembershipPoint(
	IN new_recp_id BIGINT -- 영수증 ID 입력
)

BEGIN

UPDATE membership
SET `point` = `point` + 
                (SELECT total_price * 0.01 FROM receipt WHERE recp_id = new_recp_id)
WHERE mem_id = 
                (SELECT mem_id FROM receipt WHERE recp_id = new_recp_id);
      
END $$

DELIMITER ;

CALL MembershipPoint(501);




		                         
-- 특정 시간대(예: 오전 커피 할인)의 자동 적용.(이벤트 시간 7시~9시)

-- 커피 하나 당 2000원이라 하고 4개 주문했을 때의 결과 (위의 쿠폰 코드를 실행하고 해야합니다.)
ALTER TABLE EVENT ADD COLUMN product_name VARCHAR(100) AFTER discount_code; -- event 테이블에 행사 제품 이름 행을 추가한다.
INSERT INTO event VALUES(4, '아침커피 할인 행사', '2024-12-19 00:00:00', '2025-12-19 00:00:00', NULL, '커피'); -- 커피라는 행 추가
INSERT INTO category VALUES(3, '음료'); -- 음료 카테고리 추가
INSERT INTO report VALUES(3, 4, 3, '보통', 0, 202); -- 커피에 대한 보고서 추가
INSERT INTO product VALUES(103, '2025-12-31 00:00:00', '커피', '아메리카노', 1000, 2000, 4, 3, 3); -- product 테이블에 커피 행 추가
INSERT INTO receipt VALUES(503, '2025-01-02 15:00:00', 0, '카드', 8000, 2, 3, 3); -- 커피 결재에 해당하는 receipt 추가
INSERT INTO sales VALUES(3, 4, 8000, 103, 503); -- sales 테이블에 커피 행 추가

DELIMITER $$

CREATE OR REPLACE PROCEDURE CoffeeDiscount()

BEGIN                
	SELECT 
    	s.sales_id, 
    	p.product_name, 
    	s.sales_quantity, 
    	CASE 
        	WHEN p.product_name = '커피' AND HOUR(CURTIME()) BETWEEN 7 AND 9 THEN s.sales_price - 100*s.sales_quantity
        	ELSE s.sales_price
    	END AS sales_price,
    	e.event_id
	FROM product p
	JOIN sales s ON s.product_id = p.product_id
	JOIN event e ON p.event_id = e.event_id;
END $$

DELIMITER ;

CALL CoffeeDiscount();

   
	
	
	            
-- 특정 상품을 구매할 경우 하나를 추가로 준다.
-- 주의) 밑의 2줄은 위쪽의 '프로모션 코드 및 할인을 적용' 쿼리문과 '특정 시간대(예: 오전 커피 할인)의 자동 적용.(이벤트 시간 7시~9시)'을 실행한 뒤에 실행 할 것
INSERT INTO event VALUES(3, '노트북 1+1 행사', '2024-12-19 00:00:00', '2025-12-19 00:00:00', NULL, '노트북'); -- 1+1 행사를 하는 행 추가
UPDATE product SET event_id = 3 WHERE product_id = 101; -- product 테이블의 노트북 행의 event_id를 3으로 수정

DELIMITER $$

CREATE OR REPLACE PROCEDURE OnePlusOne()

BEGIN
	SELECT 
  	   s.sales_id, 
   	p.product_name, 
   	CASE 
        	WHEN e.event_type LIKE '%1+1%' THEN s.sales_quantity + 1
        	ELSE s.sales_quantity
    	END AS sales_quantity
	FROM product p
	JOIN sales s ON s.product_id = p.product_id
	JOIN event e ON e.event_id = p.event_id;
END $$

DELIMITER ;

CALL OnePlusOne();





-- 재고 수정: 새로 출시된 제품 등록
-- 쿼리문 실행 전 product 테이블에서 외래 키들에 대해서 NULL값을 허용하는 것으로 변경
INSERT INTO category VALUES(4, '식품'); -- 식품 카테고리 추가
INSERT INTO product 
VALUES (104, '2025-01-29 12:30:00', '햄)트리플불고기치즈버거', '풍성한 3단 구성 햄버거 (패티 3장 & 체다치즈 2장)', 3, 2700, NULL, 4, NULL);
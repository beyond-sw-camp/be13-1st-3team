-- 환불 정보 삽입
INSERT INTO refund (recp_id, product_id, refund_quantity, refund_reason, refund_date)
VALUE (401, 501, 1, '단순변심', NOW());

-- refund 테이블에서 모든 데이터 확인
SELECT * from refund;

-- 마지막 삽입된 환불 ID 가져오기
SELECT LAST_INSERT_ID();

-- 마지막 삽입된 환불의 product_id를 변수에 저장
SET @refund_product_id = (SELECT product_id FROM refund WHERE refund_id = LAST_INSERT_ID());

-- product 테이블에서 환불된 수량만큼 재고 증가
UPDATE product
SET quantity = quantity + (SELECT refund_quantity FROM refund WHERE refund_id = LAST_INSERT_ID())
WHERE product_id = @refund_product_id;

-- 초코파이 50개에서 51개로 변경됨
SELECT * from product;

-- 영수증 환불 유무 변경
UPDATE receipt 
SET recp_refund = 1
WHERE recp_id = (SELECT recp_id FROM refund WHERE refund_id = LAST_INSERT_ID());

SELECT * from receipt; 

-- 영수증 금액 갱신
UPDATE receipt
SET total_price = total_price - 
				(SELECT price FROM product WHERE product_id = (SELECT product_id FROM refund WHERE refund_id = LAST_INSERT_ID()))
WHERE recp_id = (SELECT recp_id FROM refund WHERE refund_id = LAST_INSERT_ID());

-- 환불 완료된 최종 영수증
SELECT * FROM receipt WHERE recp_id = (SELECT recp_id FROM refund WHERE refund_id = LAST_INSERT_ID());
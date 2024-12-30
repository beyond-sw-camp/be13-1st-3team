DROP DATABASE pos_db;
CREATE DATABASE `pos_db`;
USE `pos_db`;

CREATE TABLE `membership` (
	`mem_id`	INT AUTO_INCREMENT PRIMARY KEY,
	`customer_name`	VARCHAR(20)	NULL,
	`email`	VARCHAR(20)	NOT NULL,
	`mobile`	VARCHAR(11)	NULL,
	`birth_year`	VARCHAR(4)	NULL,
	`addr`	VARCHAR(30)	NULL,
	`point`	INT	NULL	DEFAULT 0
);

CREATE TABLE `stock` (
	`stock_id`	BIGINT AUTO_INCREMENT PRIMARY KEY,
	`stock_status`	VARCHAR(20)	NOT NULL,
	`stock_date`	DATETIME	NOT NULL,
	`s_quantity`	BIGINT	NOT NULL,
	`r_quantity`	BIGINT	NOT NULL,
	`product_id`	BIGINT	null
);

CREATE TABLE `event` (
	`event_id`	INT AUTO_INCREMENT PRIMARY KEY,
	`event_type`	VARCHAR(20)	NOT NULL,
	`event_start`	DATETIME	NOT NULL,
	`event_end`	DATETIME	NOT NULL
);

CREATE TABLE `report` (
	`report_id`	BIGINT AUTO_INCREMENT PRIMARY KEY,
	`quarter`	INT	NULL,
	`category_id`	BIGINT	NULL,
	`sales_performance`	VARCHAR(300)	NULL,
	`sales_quantity`	INT	NULL,
	`emp_id`	BIGINT	NULL
);

CREATE TABLE `employee` (
	`emp_id`	BIGINT AUTO_INCREMENT PRIMARY KEY,
	`work_date`	DATE	NULL,
	`start_time`	DATETIME	NULL,
	`end_time`	DATETIME	NULL,
	`work_hour`	TIME	NULL,
	`position`	VARCHAR(20)	NULL	DEFAULT '관리자'
);

CREATE TABLE `category` (
	`category_id`	BIGINT AUTO_INCREMENT PRIMARY KEY,
	`category_name`	VARCHAR(20)	NOT NULL
); 	

CREATE TABLE `product` (
	`product_id`	BIGINT AUTO_INCREMENT PRIMARY KEY,
	`ex_date`	DATETIME	NULL,
	`product_name`	VARCHAR(30)	NULL,
	`product_detail`	VARCHAR(100)	NULL,
	`quantity`	INT	NULL,
	`price`	INT	NULL,
	`event_id`	INT	NULL,
	`category_id`	bigINT	NULL
);

CREATE TABLE `refund` (
	`refund_id`	BIGINT AUTO_INCREMENT PRIMARY KEY,
	`refund_quantity`	INT	NOT NULL,
	`refund_reason`	TEXT	NULL,
	`refund_date`	DATETIME	NULL,
	`exchange_date`	DATETIME	NULL,
	`product_id`	bigINT	NULL,
	`recp_id`	BIGINT	NULL
);

CREATE TABLE `receipt` (
	`recp_id`	BIGINT AUTO_INCREMENT PRIMARY KEY,
	`recp_date`	DATETIME	NOT NULL,
	`recp_refund`	BOOLEAN	NULL CHECK(recp_refund = TRUE OR recp_refund = FALSE),
	`recp_way`	VARCHAR(20)	NOT NULL,
	`total_price`	INT	NOT NULL,
	`mem_id`	INT	NULL ,
	`report_id`	bigINT NULL
);

CREATE TABLE `sales` (
	`sales_id`	BIGINT AUTO_INCREMENT PRIMARY KEY,
	`sales_quantity`	INT	NOT NULL,
	`sales_price`	INT	NOT NULL,
	`product_id`	BIGINT	NULL,
	`category_id`	bigINT	NULL,
	`recp_id`	BIGINT	NULL
);


AlTER TABLE `membership` ADD CONSTRAINT `UNIQUE_MEMBERSHIP` UNIQUE(`email`);

ALTER TABLE `employee` AUTO_INCREMENT = 200;

ALTER TABLE `product` AUTO_INCREMENT = 500;

ALTER TABLE `receipt` AUTO_INCREMENT = 400;

ALTER TABLE `sales` AUTO_INCREMENT = 300;

INSERT INTO category (category_id, category_name)
VALUES
(1, '간편식사'),
(2, '즉석조리'),
(3, '과자류'),
(4, '아이스크림'),
(5, '식품'),
(6, '음료'),
(7, '생활용품');

INSERT INTO event (event_id, event_type, event_start, event_end)
VALUES
(1, '신년 할인', '2024-01-01 00:00:00', '2024-01-15 23:59:59'),
(2, '구정 할인', '2024-02-01 00:00:00', '2024-02-10 23:59:59'),
(3, '군인 할인', '2024-01-01 00:00:00', '2024-05-31 23:59:59'),
(4, '직원 할인', '2024-01-01 00:00:00', '2025-05-31 23:59:59');

INSERT INTO employee (work_date, start_time, end_time, work_hour, position)
VALUES
('2024-01-01', '2024-01-01 09:00:00', '2024-01-01 18:00:00', '08:00:00', '관리자'),
('2024-01-02', '2024-01-02 09:00:00', '2024-01-02 18:00:00', '08:00:00', '직원');



INSERT INTO membership (mem_id, customer_name, email, mobile, birth_year, addr, point) 
VALUES 
    (1, '홍길동', 'hong@example.com', '01012345678', '1985', '서울특별시 강남구', 500), 
    (2, '김영희', 'kim@example.com', '01098765432', '1990', '부산광역시 해운대구', 300),
    (3, '이철수', 'lee@example.com', '01055557777', '1988', '대구광역시 달서구', 200),
    (4, '박민수', 'park@example.com', '01044446666', '1995', '인천광역시 남동구', 450),
    (5, '최수진', 'choi@example.com', '01033335555', '1992', '광주광역시 북구', 350),
    (6, '정은혜', 'jung@example.com', '01022223333', '1987', '대전광역시 서구', 600),
    (7, '김도현', 'kimd@example.com', '01011112222', '1983', '울산광역시 중구', 700),
    (8, '박소연', 'parks@example.com', '01099998888', '1998', '경기도 수원시', 400);

-- ---------------------------------------------------------------------------------------------------

INSERT INTO stock (stock_status, stock_date, s_quantity, r_quantity, product_id)
VALUES
('입고', '2024-01-01 10:00:00', 100, 0, 500),
('출고', '2024-01-05 15:00:00', 0, 50, 501);

INSERT INTO report (quarter, category_id, sales_performance, sales_quantity)
VALUES
(1, 1, '매우 우수', 1500),
(2, 2, '보통', 800);


INSERT INTO product (ex_date, product_name, product_detail, quantity, price, category_id) VALUES
('2025-12-31', '조스바', '딸기맛', 100, 1200, 1),
('2025-12-31', '초코파이', '오리지널', 50, 6000, 3),
('2026-01-15', '초코칩', '바삭한 맛', 200, 1500, 5),
('2026-02-20', '아이스크림', '초코콘', 300, 2500, 1),
('2026-03-10', '감자칩', '소금맛', 120, 1800, 5),
('2025-12-15', '비타민 음료', 'C500', 400, 800, 7),
('2026-04-25', '햄버거', '불고기 맛', 500, 4500, 6),
('2026-05-30', '콜라', '제로', 350, 1700, 2),
('2026-06-01', '사이다', '라임맛', 250, 1600, 2),
('2026-07-04', '초코바', '견과류 함유', 130, 1400, 4),
('2026-08-01', '커피', '아메리카노', 220, 3000, 2),
('2026-09-01', '케이크', '딸기 케이크', 180, 7000, 6),
('2026-10-15', '샌드위치', '에그 샌드위치', 90, 4000, 6),
('2026-11-01', '피자', '콤비네이션', 45, 15000, 3),
('2026-12-25', '스낵', '바베큐 맛', 320, 1900, 5),
('2027-01-01', '요거트', '플레인', 270, 1000, 7),
('2027-02-14', '초콜릿', '다크초콜릿', 500, 5000, 4),
('2027-03-03', '빵', '우유빵', 150, 2000, 6),
('2027-04-18', '음료수', '탄산수', 300, 1200, 2),
('2027-05-10', '스파게티', '크림 스파게티', 100, 8000, 3),
('2027-05-12', '아이스크림', '바닐라콘', 250, 2200, 1),
('2027-06-15', '콜드브루', '무가당', 300, 4500, 2),
('2027-06-20', '쿠키', '초코칩 쿠키', 180, 3200, 5),
('2027-07-01', '초코바', '초코맛', 100, 1300, 4),
('2027-07-10', '아이스크림', '딸기맛', 400, 2000, 1),
('2027-08-05', '탄산수', '라임', 500, 1200, 2),
('2027-08-20', '크래커', '치즈맛', 220, 1800, 5),
('2027-09-01', '샌드위치', '치킨 샌드위치', 70, 5000, 6),
('2027-09-15', '스낵', '치즈볼', 200, 2500, 5),
('2027-10-10', '초콜릿', '화이트초콜릿', 150, 4500, 4),
('2027-10-25', '비타민 음료', 'B500', 350, 900, 7),
('2027-11-01', '핫도그', '머스터드', 120, 3500, 6),
('2027-11-15', '감자칩', '칠리맛', 250, 2000, 5),
('2027-12-01', '아이스크림', '초코칩콘', 300, 2400, 1),
('2027-12-20', '커피', '카페라떼', 180, 4000, 2),
('2028-01-10', '초코바', '헤이즐넛', 90, 1600, 4),
('2028-01-25', '사이다', '포도맛', 500, 1800, 2),
('2028-02-15', '스낵', '갈릭맛', 400, 2300, 5),
('2028-03-01', '피자', '불고기피자', 100, 18000, 3),
('2028-03-15', '케이크', '초코 케이크', 130, 8000, 6),
('2028-04-01', '요거트', '블루베리맛', 200, 1500, 7),
('2028-04-20', '아이스크림', '멜론콘', 220, 2100, 1),
('2028-05-01', '커피', '바닐라라떼', 300, 4500, 2),
('2028-05-15', '샌드위치', '참치 샌드위치', 90, 6000, 6),
('2028-06-01', '초코바', '밀크초콜릿', 200, 2000, 4),
('2028-06-20', '콜라', '체리맛', 250, 2500, 2),
('2028-07-10', '아이스크림', '초코시럽콘', 300, 2700, 1),
('2028-07-25', '크래커', '허브맛', 200, 1900, 5),
('2028-08-01', '비타민 음료', 'D500', 400, 950, 7),
('2028-08-15', '스낵', '양파맛', 500, 2000, 5),
('2028-09-01', '초콜릿', '트러플', 150, 5000, 4),
('2028-09-10', '피자', '마르게리타', 90, 17000, 3),
('2028-10-01', '감자칩', '갈릭맛', 400, 2200, 5),
('2028-10-15', '샌드위치', '햄 샌드위치', 70, 4500, 6),
('2028-11-01', '케이크', '블루베리 케이크', 200, 9000, 6),
('2028-11-20', '콜드브루', '카라멜맛', 250, 5000, 2),
('2028-12-01', '사이다', '딸기맛', 300, 2100, 2);


INSERT INTO refund (refund_quantity, refund_reason, refund_date, exchange_date, product_id, recp_id)
VALUES
(2, '불량 제품', '2024-01-10 14:00:00', NULL, 500, 400);

INSERT INTO receipt (recp_date, recp_refund, recp_way, total_price, mem_id)
VALUES
('2024-01-01 12:00:00', TRUE, '카드', 1500000, 1),
('2024-01-02 15:00:00', FALSE, '현금', 40000, 2);

INSERT INTO sales (sales_quantity, sales_price, product_id, recp_id, category_id)
VALUES
(1, 1500000, 500, 400, 7),
(2, 40000, 501, 401, 7);

ALTER TABLE `stock` ADD CONSTRAINT `fk_STOCK` FOREIGN KEY(`product_id`) REFERENCES product(`product_id`);

ALTER TABLE `report` ADD CONSTRAINT `fk_report_category` FOREIGN KEY(`category_id`) REFERENCES `category`(`category_id`);

ALTER TABLE `report` ADD CONSTRAINT `fk_report_employee` FOREIGN KEY(`emp_id`) REFERENCES `employee`(`emp_id`);

ALTER TABLE `product` ADD CONSTRAINT `fk_product_event` FOREIGN KEY(`event_id`) REFERENCES `event`(`event_id`);

ALTER TABLE `product` ADD CONSTRAINT `fk_product_category` FOREIGN KEY(`category_id`) REFERENCES `category`(`category_id`);

ALTER TABLE `refund` ADD CONSTRAINT `fk_refund_product` FOREIGN KEY(`product_id`) REFERENCES `product`(`product_id`);

ALTER TABLE `refund` ADD CONSTRAINT `fk_refund_receipt` FOREIGN KEY(`recp_id`) REFERENCES `receipt`(`recp_id`);

ALTER TABLE `receipt` ADD CONSTRAINT `fk_receipt_mem` FOREIGN KEY(`mem_id`) REFERENCES `membership`(`mem_id`);

ALTER TABLE `receipt` ADD CONSTRAINT `fk_receipt_report` FOREIGN KEY(`report_id`) REFERENCES `report`(`report_id`);

ALTER TABLE `sales` ADD CONSTRAINT `fk_sales_category` FOREIGN KEY(`category_id`) REFERENCES `category`(`category_id`);

ALTER TABLE `sales` ADD CONSTRAINT `fk_sales_product` FOREIGN KEY(`product_id`) REFERENCES `product`(`product_id`);

ALTER TABLE `sales` ADD CONSTRAINT `fk_sales_receipt` FOREIGN KEY(`recp_id`) REFERENCES `receipt`(`recp_id`);




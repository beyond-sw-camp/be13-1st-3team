-- CREATE DATABASE `pos_db`;

CREATE TABLE `membership` (
	`mem_id`	INT	NOT NULL,
	`customer_name`	VARCHAR(20)	NULL,
	`email`	VARCHAR(20)	NOT NULL,
	`mobile`	VARCHAR(11)	NULL,
	`birth_year`	VARCHAR(4)	NULL,
	`addr`	VARCHAR(30)	NULL,
	`point`	INT	NULL	DEFAULT 0
);

CREATE TABLE `stock` (
	`stock_id`	BIGINT	NOT NULL,
	`stock_status`	VARCHAR(20)	NOT NULL,
	`stock_date`	DATETIME	NOT NULL,
	`s_quantity`	BIGINT	NOT NULL,
	`r_quantity`	BIGINT	NOT NULL,
	`product_id`	BIGINT	
);

CREATE TABLE `event` (
	`event_id`	INT	NOT NULL,
	`event_type`	VARCHAR(20)	NOT NULL,
	`event_start`	DATETIME	NOT NULL,
	`event_end`	DATETIME	NOT NULL
);

CREATE TABLE `report` (
	`report_id`	BIGINT	NOT NULL,
	`quarter`	INT	NULL,
	`category_id`	BIGINT	NOT NULL,
	`sales_performance`	VARCHAR(300)	NULL,
	`sales_quantity`	INT	NULL,
	`emp_id`	BIGINT	NOT NULL
);

CREATE TABLE `employee` (
	`emp_id`	BIGINT	NOT NULL,
	`work_date`	DATE	NULL,
	`start_time`	DATETIME	NULL,
	`end_time`	DATETIME	NULL,
	`work_hour`	TIME	NULL,
	`position`	VARCHAR(20)	NULL	DEFAULT '관리자'
);

CREATE TABLE `category` (
	`category_id`	BIGINT	NOT NULL,
	`category_name`	VARCHAR(20)	NOT NULL
); 	

CREATE TABLE `product` (
	`product_id`	BIGINT	NOT NULL,
	`ex_date`	DATETIME	NULL,
	`product_name`	VARCHAR(30)	NULL,
	`product_detail`	VARCHAR(100)	NULL,
	`quantity`	INT	NULL,
	`price`	INT	NULL,
	`event_id`	INT	NOT NULL,
	`category_id`	bigINT	NOT NULL,
--	`report_id`	bigINT	NOT NULL
);

CREATE TABLE `refund` (
	`refund_id`	BIGINT	NOT NULL,
	`refund_quantity`	INT	NOT NULL,
	`refund_reason`	TEXT	NULL,
	`refund_date`	DATETIME	NULL,
	`exchange_date`	DATETIME	NULL,
	`product_id`	bigINT	NOT NULL,
	`recp_id`	BIGINT	NOT NULL
);

CREATE TABLE `receipt` (
	`recp_id`	BIGINT	NOT NULL,
	`recp_date`	DATETIME	NOT NULL,
	`recp_refund`	BOOLEAN	NULL CHECK(recp_refund = TRUE OR recp_refund = FALSE),
	`recp_way`	VARCHAR(20)	NOT NULL,
	`total_price`	INT	NOT NULL,
	`mem_id`	INT	NULL ,
	`category_id`	bigINT	NOT NULL,
	`report_id`	bigINT	NOT NULL
);

CREATE TABLE `sales` (
	`sales_id`	BIGINT	NOT NULL,
	`sales_quantity`	INT	NOT NULL,
	`sales_price`	INT	NOT NULL,
	`product_id`	BIGINT	NOT NULL,
	`recp_id`	BIGINT	NOT NULL
);

ALTER TABLE `membership` ADD CONSTRAINT `PK_MEMBERSHIP` PRIMARY KEY (
	`mem_id`
);

AlTER TABLE `membership` ADD CONSTRAINT `UNIQUE_MEMBERSHIP` UNIQUE(`email`);

ALTER TABLE `stock` ADD CONSTRAINT `PK_STOCK` PRIMARY KEY (
	`stock_id`
);


ALTER TABLE `event` ADD CONSTRAINT `PK_EVENT` PRIMARY KEY (
	`event_id`
);

ALTER TABLE `report` ADD CONSTRAINT `PK_REPORT` PRIMARY KEY (
	`report_id`
);


ALTER TABLE `employee` ADD CONSTRAINT `PK_EMPLOYEE` PRIMARY KEY (
	`emp_id`
);

ALTER TABLE `category` ADD CONSTRAINT `PK_CATEGORY` PRIMARY KEY (
	`category_id`
);

ALTER TABLE `product` ADD CONSTRAINT `PK_PRODUCT` PRIMARY KEY (
	`product_id`
);

ALTER TABLE `refund` ADD CONSTRAINT `PK_REFUND` PRIMARY KEY (
	`refund_id`
);

ALTER TABLE `receipt` ADD CONSTRAINT `PK_RECEIPT` PRIMARY KEY (
	`recp_id`
);


ALTER TABLE `sales` ADD CONSTRAINT `PK_SALES` PRIMARY KEY (
	`sales_id`
);


INSERT INTO category (category_id, category_name)
VALUES
(1, '가전제품'),
(2, '의류');

INSERT INTO membership (mem_id, customer_name, email, mobile, birth_year, addr, point)
VALUES
(1, '홍길동', 'hong@example.com', '01012345678', '1985', '서울특별시 강남구', 500),
(2, '김영희', 'kim@example.com', '01098765432', '1990', '부산광역시 해운대구', 300);


INSERT INTO stock (stock_id, stock_status, stock_date, s_quantity, r_quantity, product_id)
VALUES
(1, '입고', '2024-01-01 10:00:00', 100, 0, 101),
(2, '출고', '2024-01-05 15:00:00', 0, 50, 102);

INSERT INTO event (event_id, event_type, event_start, event_end)
VALUES
(1, '신년 할인', '2024-01-01 00:00:00', '2024-01-15 23:59:59'),
(2, '구정 할인', '2024-02-01 00:00:00', '2024-02-10 23:59:59');


INSERT INTO report (report_id, quarter, category_id, sales_performance, sales_quantity, emp_id)
VALUES
(1, 1, 1, '매우 우수', 1500, 201),
(2, 2, 2, '보통', 800, 202);


INSERT INTO employee (emp_id, work_date, start_time, end_time, work_hour, position)
VALUES
(201, '2024-01-01', '2024-01-01 09:00:00', '2024-01-01 18:00:00', '08:00:00', '관리자'),
(202, '2024-01-02', '2024-01-02 09:00:00', '2024-01-02 18:00:00', '08:00:00', '직원');


INSERT INTO product (product_id, ex_date, product_name, product_detail, quantity, price, event_id, category_id)
VALUES
(101, '2025-12-31', '노트북', '고성능 노트북', 10, 1500000, 1, 1),
(102, '2025-12-31', '티셔츠', '면 티셔츠', 50, 20000, 2, 2);


INSERT INTO refund (refund_id, refund_quantity, refund_reason, refund_date, exchange_date, product_id, recp_id)
VALUES
(1, 2, '불량 제품', '2024-01-10 14:00:00', NULL, 101, 501),
(2, 1, '사이즈 불일치', '2024-01-11 11:00:00', '2024-01-12 10:00:00', 102, 502);

INSERT INTO receipt (recp_id, recp_date, recp_refund, recp_way, total_price, mem_id, category_id, report_id)
VALUES
(501, '2024-01-01 12:00:00', TRUE, '카드', 1500000, 1, 1, 1),
(502, '2024-01-02 15:00:00', FALSE, '현금', 40000, 2, 2, 2);

INSERT INTO sales (sales_id, sales_quantity, sales_price, product_id, recp_id)
VALUES
(1, 1, 1500000, 101, 501),
(2, 2, 40000, 102, 502);


ALTER TABLE `stock` ADD CONSTRAINT `fk_STOCK` FOREIGN KEY(`product_id`) REFERENCES product(`product_id`);

ALTER TABLE `report` ADD CONSTRAINT `fk_report_category` FOREIGN KEY(`category_id`) REFERENCES `category`(`category_id`);

ALTER TABLE `report` ADD CONSTRAINT `fk_report_employee` FOREIGN KEY(`emp_id`) REFERENCES `employee`(`emp_id`);

ALTER TABLE `product` ADD CONSTRAINT `fk_product_event` FOREIGN KEY(`event_id`) REFERENCES `event`(`event_id`);

ALTER TABLE `product` ADD CONSTRAINT `fk_product_category` FOREIGN KEY(`category_id`) REFERENCES `category`(`category_id`);

ALTER TABLE `refund` ADD CONSTRAINT `fk_refund_product` FOREIGN KEY(`product_id`) REFERENCES `product`(`product_id`);

ALTER TABLE `refund` ADD CONSTRAINT `fk_refund_receipt` FOREIGN KEY(`recp_id`) REFERENCES `receipt`(`recp_id`);

ALTER TABLE `receipt` ADD CONSTRAINT `fk_receipt_mem` FOREIGN KEY(`mem_id`) REFERENCES `membership`(`mem_id`);

ALTER TABLE `receipt` ADD CONSTRAINT `fk_receipt_category` FOREIGN KEY(`category_id`) REFERENCES `category`(`category_id`);

ALTER TABLE `receipt` ADD CONSTRAINT `fk_receipt_report` FOREIGN KEY(`report_id`) REFERENCES `report`(`report_id`);

ALTER TABLE `sales` ADD CONSTRAINT `fk_sales_product` FOREIGN KEY(`product_id`) REFERENCES `product`(`product_id`);

ALTER TABLE `sales` ADD CONSTRAINT `fk_sales_receipt` FOREIGN KEY(`recp_id`) REFERENCES `receipt`(`recp_id`);
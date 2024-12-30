SELECT * FROM product;

-- 상품 이름과 상품의 카테고리 조회
SELECT p.product_name, c.category_name
FROM product p
INNER JOIN category c ON p.category_id = c.category_id;


-- membership id 1번인 회원의 이름, 영수증 날짜, 구매 상품 이름, 구매 수량, 가격 조회
SELECT m.customer_name, r.recp_date, p.product_name, s.sales_quantity, s.sales_price
FROM membership m
JOIN receipt r ON m.mem_id = r.mem_id
JOIN sales s ON r.recp_id = s.recp_id
JOIN product p ON s.product_id = p.product_id
WHERE m.mem_id = 1;

-- 카테고리 별  판매수량,  판매가격 조회
SELECT c.category_name, SUM(s.sales_quantity) AS total_quantity, SUM(s.sales_price) AS total_sales
FROM category c
JOIN product p ON c.category_id = p.category_id
JOIN sales s ON p.product_id = s.product_id
GROUP BY c.category_name;

SELECT * FROM stock;
SELECT * FROM product;


-- 구매 수량에 맞추어 상품 수량 (재고) 조정
UPDATE product
SET quantity = quantity - (
    SELECT sales_quantity
    FROM sales
    WHERE sales.product_id = product.product_id
)
WHERE product_id IN (
    SELECT product_id
    FROM sales
);

SELECT * FROM product;

SELECT * FROM EVENT;



-- DROP DATABASE pos_db;
-- create DATABASE pos_db;


-- 일별 매출
SELECT date(recp_date), SUM(total_price)
FROM receipt
GROUP BY date(recp_date);

-- 월별 매출
SELECT year(recp_date), MONTH(recp_date), SUM(total_price)
FROM receipt
GROUP BY year(recp_date), month(recp_date);

-- 시간대별 매출
SELECT hour(recp_date), SUM(total_price)
FROM receipt
GROUP BY hour(recp_date);



-- 손실 상품 보고 및 재고 관리
SELECT p.product_name AS '제품명', 
                 p.product_id AS '제품코드', 
                 p.category_id AS '카테고리', 
                 s.s_quantity '입고수량', 
                 s.r_quantity '판매수량', 
                 r.refund_quantity '반품/환불 개수'
FROM stock s 
join product p ON p.product_id = s.product_id
JOIN refund r ON r.product_id = s.product_id;



-- 카테고리별 매출 분석
SELECT p.category_id, c.category_name, 
                p.product_id, s.r_quantity
FROM product p 
JOIN category c ON p.category_id = c.category_id 
JOIN stock s ON p.product_id = s.product_id
ORDER BY s.r_quantity DESC
LIMIT 3;
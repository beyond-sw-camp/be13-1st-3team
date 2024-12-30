-- 수량 수동 조절
UPDATE product
SET quantity = quantity - 1
WHERE product_id = 500;
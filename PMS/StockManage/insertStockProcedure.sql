-- 상품 입고 -> 수량 추가
DELIMITER $$
CREATE PROCEDURE InsertStock(
    IN p_stock_date DATETIME,    
    IN p_quantity INT,            
    IN p_product_id BIGINT          
)
BEGIN
    INSERT INTO stock(stock_status, stock_date, r_quantity, product_id)
    VALUES ('입고', p_stock_date, p_quantity, p_product_id);

    UPDATE product
    SET quantity = quantity + p_quantity
    WHERE product_id = p_product_id;
END$$
DELIMITER ;


-- 상품 출고
DELIMITER $$
CREATE PROCEDURE RemoveStock(
	IN r_stock_date DATETIME,
	IN r_quantity INT,
	IN r_product_id BIGINT 	
)
BEGIN
	INSERT INTO stock(stock_status, stock_date, r_quantity, product_id)
	VALUES('출고', r_stock_date, r_quantity ,r_product_id);
	
	UPDATE product
	SET quantity = quantity - r_quantity
	WHERE product_id = r_product_id;
END$$
DELIMITER ;
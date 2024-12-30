DELIMITER $$
CREATE PROCEDURE RemoveStock(
    IN r_stock_date DATETIME,
    IN r_quantity INT,
    IN r_product_id BIGINT
)
BEGIN
    DECLARE current_quantity INT;

    SELECT quantity INTO current_quantity
    FROM product
    WHERE product_id = r_product_id;

    IF current_quantity - r_quantity < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: Insufficient stock for the requested operation.';
    END IF;


    INSERT INTO stock(stock_status, stock_date, s_quantity, r_quantity, product_id)
    VALUES('출고', r_stock_date, 0 , r_quantity, r_product_id);

    UPDATE product
    SET quantity = quantity - r_quantity
    WHERE product_id = r_product_id;
END$$
DELIMITER ;
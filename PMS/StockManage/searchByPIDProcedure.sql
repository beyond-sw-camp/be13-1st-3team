-- 상품 ID를 이용하여 상품의 상세 정보 조회

DELIMITER $$
CREATE PROCEDURE SearchByPID(
	IN p_id BIGINT
)
BEGIN
	SELECT p.product_id AS '상품ID', p.ex_date AS '유통기한', p.product_name AS '품명', p.product_detail AS '상세',
			 p.price AS '가격', e.event_type AS '이벤트 여부', c.category_name AS '상품카테고리'
	FROM product p
	LEFT OUTER JOIN EVENT e ON p.event_id = e.event_id
	LEFT OUTER JOIN category c ON p.category_id = c.category_id
	WHERE p.product_id = p_id;
END$$
DELIMITER ;
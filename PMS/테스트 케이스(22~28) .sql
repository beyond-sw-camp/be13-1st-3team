-- TEST-22
ALTER TABLE employee MODIFY START_time TIME DEFAULT NULL;
ALTER TABLE employee MODIFY end_time TIME DEFAULT NULL;

INSERT INTO employee (emp_id, work_date, start_time, end_time, work_hour, position)
VALUES (203, '2024-01-02', '09:00:00', '18:00:00', '08:00:00', '알바');

-- TEST-23
DELETE FROM employee
WHERE emp_id = 203;

-- TEST-24
DELIMITER $$
CREATE OR REPLACE PROCEDURE LoginProcedure(IN input_emp_id INT)
BEGIN
    -- emp_id 값이 employee 테이블에 있는지 확인
    IF input_emp_id IN (SELECT emp_id FROM employee) THEN
        -- 로그인 성공: start_time을 현재 시간으로 업데이트
        UPDATE employee
        SET 
            start_time = CURRENT_TIME, -- 로그인 시간 설정
            work_date = CURRENT_DATE,  -- 작업 날짜 설정
            end_time = NULL
        WHERE emp_id = input_emp_id;

        -- 성공 메시지 반환
        SELECT '로그인 되었습니다.' AS message;
    ELSE
        -- emp_id가 없을 경우 실패 메시지 반환
        SELECT '로그인 실패: 유효하지 않은 emp_id입니다.' AS message;
    END IF;
END $$

DELIMITER ;

CALL LoginProcedure(201);

-- TEST-27
DELIMITER $$

CREATE OR REPLACE PROCEDURE LogoutProcedure(IN input_emp_id INT)
BEGIN
    -- 로그아웃 시간 설정
    DECLARE logout_time TIME;
    SET logout_time = CURRENT_TIME;

    -- emp_id가 존재하는지 확인
    IF input_emp_id IN (SELECT emp_id FROM employee) THEN
        -- 행 업데이트: work_date, end_time, work_hour 수정
        UPDATE employee
        SET 
            work_date = CURRENT_DATE, -- 현재 날짜
            end_time = logout_time, -- 현재 시간 (로그아웃 시간)
            work_hour = TIMESTAMPDIFF(SECOND, start_time, logout_time) -- 시간 차이 계산
        WHERE emp_id = input_emp_id;

        -- 로그아웃 성공 메시지
        SELECT CONCAT('로그아웃 되었습니다. (emp_id: ', input_emp_id, ')') AS message;
    ELSE
        -- emp_id가 없을 경우 실패 메시지
        SELECT '로그아웃 실패: 유효하지 않은 emp_id입니다.' AS message;
    END IF;
END $$

DELIMITER ;

CALL LogoutProcedure(201);

-- TEST-28

DELIMITER $$

CREATE or REPLACE PROCEDURE CheckWorkStatus(IN input_emp_id INT)
BEGIN
    DECLARE work_status VARCHAR(255);

    -- emp_id 값이 employee 테이블에 있는지 확인
    IF input_emp_id IN (SELECT emp_id FROM employee) THEN
        -- end_time이나 work_hour가 NULL인 경우 근무 중으로 판단
        IF (SELECT end_time FROM employee WHERE emp_id = input_emp_id)  IS NULL THEN
            SET work_status = '근무 중입니다.';
        ELSE
            SET work_status = '근무 종료되었습니다.';
        END IF;
        
        SELECT work_status AS message;
    ELSE
        SELECT '유효하지 않은 emp_id입니다.' AS message;
    END IF;
END $$

DELIMITER ;

CALL CheckWorkStatus(201);

SELECT end_time FROM employee WHERE emp_id = 201;



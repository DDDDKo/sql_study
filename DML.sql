USE practice_sql;
-- DDL (데이터 조작어)
-- 테이블에 데이터를 삽입, 조회, 수정, 삭제 할때 사용

-- INSERT: 테이블에 데이터를 삽입하는 명령어

-- 1. 모든 열에 대하여 데이터 삽입
-- INSERT INTO 테이블명 VALUES (데이터1, 데이터2, ...)
INSERT INTO example_table
VALUES ('문자열데이터', '텍스트데이터', 99, 3.14, 3.14, true, 
'2024-02-05', now()); #now(): 함수사용 현재 시간을 입력됨

-- 2. 특정 열에 대하여 데이터 삽입
-- INSERT INTO 테이블명 (컬럼명1, 컬럼명2, ...)
-- VALUES (데이터1, 데이터2, ...)
INSERT INTO example_table(int_column, boolean_column)
VALUES(50, false);

-- SELECT: 테이블에서 데이터를 조회할때 사용하는 명령어
-- SELECT 컬럼 FROM 테이블명 where 조건; =>기본형

-- 1.테이블의 모든 데이터 조회
-- SELECT * FROM 테이블명;
SELECT * FROM example_table;

-- 2.테이블의 특정 컬럼 데이터 조회
-- SELECT 컬럼명1, 컬럼명2, ... FROM 테이블명;
SELECT int_column, text_column FROM example_table;

-- 3.테이블에서 특정 조건에 따른 데이터 조회
-- SELECT 조회할컬럼... FROM 테이블명 WHERE 조건; 
SELECT * FROM example_table where int_column = 50;

-- UPDATE: 테이블에서 데이터를 수정할 때 사용하는 명령어

-- UPDATE 테이블명 SET 컬럼1= 데이터1, ...;
-- UPDATE 테이블명 SET 컬럼1= 데이터1, ... WHERE 조건;
UPDATE example_table SET boolean_column = false;
UPDATE example_table SET date_column = null WHERE int_column = 50;
SELECT * FROM example_table;

-- DELETE: 테이블에서 데이터를 삭제할 때 사용하는 명령어
-- DELETE FROM 테이블명;
-- DELETE FROM 테이블명 WHERE 조건;
DELETE FROM example_table WHERE int_column = 50; 
SELECT * FROM example_table;

DELETE FROM example_table;
SELECT * FROM example_table;

TRUNCATE TABLE example_table; -- 구조만 남기고 모두 다 지우는 명령어

CREATE TABLE auto_table(
	idx INT PRIMARY KEY AUTO_INCREMENT,
    num INT
);
INSERT INTO auto_table (num) VALUES (0);
SELECT * FROM auto_table;
DELETE FROM auto_table;  -- 데이터 값만 삭제하는 명령어
TRUNCATE TABLE auto_table; -- TRUNCATE TABE 테이블명: 테이블 구조만 남기고 나머지 초기화

-- DROP TABLE: DDL이고 테이블의 구조 전체를 삭제하는 명령어
-- TRUNCATE TABLE: DDL이고 테이블의 구조만 남기고 나머지 초기화
-- DELETE FROM: DML이고 테이블에서 데이터만 제거




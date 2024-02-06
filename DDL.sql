-- 주석
#주석

-- DDL (데이터 정의어)
-- 데이터베이스, 테이블, 인덱스, 사용자를 정의하는데 사용되는 언어
# sql에는 대소문자 구분이 없음, 항상 ;을 찍어야함
# sql은 스크립트 언어이기 때문에 컴파일?시에 한줄만 읽는다

-- CREATE: 구조를 생성하는 명령어
-- CREATE 생성할구조 구조의 이름[...구조 정의];

-- 데이터 베이스 생성
CREATE DATABASE practice_sql;
-- 특정 데이터 베이스 사용 (*사용시에 꼭 실행하고 작업해야함*) 
-- 데이터베이스 더블클릭으로도 사용 가능
USE practice_sql;

-- 테이블 생성
# 스트링은 표현 방법이 많음 그 중 varchar타입을 가장 많이 사용
CREATE TABLE example_table (
	-- VARCHAR(문자열길이): 가변길이 문자열 / 인덱스 사용 가능
	string_column VARCHAR(100),
	-- TXT: 장문의 대문자열을 저장하기 위한 문자열 타입
    # TXT는 인덱스를 적용 불가능
    text_column TEXT,
    -- INT: 정수 ()를 사용해 가변길이도 지정 가능하지만 쓰지 않아도 사용 가능
    int_column INT,
	-- DOUBLE: 실수 INT와 마찬가지로 ()를 사용해 가변길이도 지정 가능하지만 쓰지 않아도 사용 가능
    double_column DOUBLE,
	-- FLOAT: 실수 DOUBLE보다 많이 사용
    float_column float,
    -- BOOLEAN: 논리형
    # 불리언은 데이터베이스에 tinyint타입으로 저장됨
    boolean_column boolean,
    -- DATE: 날짜
    date_column DATE,
    -- DATETIME: 날짜 및 시간
    datetime_column DATETIME
);

-- 사용자 생성
-- CREATE USER '사용자명'@'접속IP(도메인)' IDENTIFIED BY '비밀번호';
# 127.0.0.1 => 로컬 컴퓨터(내컴퓨터)
# IDENTIFIED BY => 비밀번호 지정
CREATE USER 'developer'@'localhost' IDENTIFIED BY 'xodnr';
# 프로젝트 할 때에 사용자 계정 만들어서 사용하기

-- 생성된 사용자 보기
# USE mysql 먼저 실행하고 select구문을 사용해야함
USE mysql;
SELECT user, host FROM user;
-- SELECT * FROM user; 하면 모든 정보가 다 나옴

-- DROP: 데이터 구조를 삭제하는 명령어

-- 테이블 삭제
DROP TABLE example_table;

-- 데이터베이스 삭제
DROP DATABASE practice_sql;

-- ALTER: 데이터 구조를 변경하는 명령어

-- 테이블 컬럼 추가
ALTER TABLE example_table 
ADD added_column INT;

-- 테이블 컬럼 삭제
ALTER TABLE example_table 
DROP COLUMN added_column;

-- 테이블 컬럼 타입 수정
ALTER TABLE example_table
MODIFY COLUMN string_column VARCHAR(200);

-- 테이블 컬럼 이름 수정
ALTER TABLE example_table
CHANGE string_column varchar_column VARCHAR(200);





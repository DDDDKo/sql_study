USE practice_sql;

-- transaction: SQL로 작업하는 작업 단위
-- 삽입 수정 삭제 => 트랜잭션 작업

-- transaction의 4가지 특성
-- Atomicity (원자성): 트랜잭션은 모두 성공하거나 모두 실패해야 한다.
-- Consistency (일관성): 트랜잭션의 작업 결과는 항상 일관성이 있어야 한다.
-- Isolation (독립성): 트랜잭션은 모두 독립적이어야 한다.
-- Durablitiy (영구성): 트랜잭션이 성공적으로 완료되면 영구히 반영되어야 한다.

-- 회원가입: USER - email_authentication
-- 사용자는 아이디를 입력하고 중복확인을 함
-- 만약 입력한 아이디가 중복된 아이디가 아니라면
-- 비밀번호, 비밀번호 확인, 이메일을 입력하고
-- 이메일로 인증 번호를 전송
-- 사용자는 이메일에 전송된 인증 번호를 확인 후 입력하여
-- 이메일 인증을 진행함
-- 이메일 인증을 완료한 후 회원가입 버튼을 눌러서 회원가입을 마무리함
-- --------------------------------------------------회원가입 트랜잭션이라고 함(밑에 4번까지)
CREATE TABLE user (
	id VARCHAR(100) PRIMARY KEY,
    password VARCHAR(255) not null,
	email VARCHAR(255) not null
);

CREATE TABLE email_authentication(
	email VARCHAR(255) PRIMARY KEY,
    authentication_code VARCHAR(4) not null
);

-- 4. 회원가입 처리
INSERT user VALUES('iddd', 'P!ssw0rd', 'email@eamil.com');

SHOW variables LIKE '%commit%';
SET AUTOCOMMIT = 0;

-- 트랜잭션 시작
START TRANSACTION;

-- 사용자가 아이디를 'iddd'로 입력 했다.
-- 1. 아이디 중복확인
SELECT * FROM user WHERE id = 'iddd3';

-- 사용자가 비밀번호를 'P!ssw0rd', 비밀번호 확인을 'P!ssw0rd,
-- 이메일을 'email@eamil.com', 서버가 생성한 코드는 'OCMD'이다.
-- 2. 이메일 인증
INSERT email_authentication VALUES('email3@email.com', 'OCMD');

-- 트랜잭션 초기상태로 변경(트랜잭션 취소)
ROLLBACK;

-- 트랜잭션 롤백 위치 지정
SAVEPOINT A;

-- 서버가 지정한 이메일로 인증코드를 전송하고 사용자는 그 코드를 확인한 후 인증 코드를 입력하여 인증함
-- 3. 이메일 인증 확인
SELECT * FROM email_authentication 
WHERE email = 'email3@email.com' AND
authentication_code = 'OCMD';

-- 4. 회원가입 처리
INSERT user VALUES('iddd3', 'P!ssw0rd', 'email3@eamil.com');

-- 특정 세이브 포인트로 롤백
ROLLBACK TO SAVEPOINT A;

-- 트랜잭션 성공 처리(영구히 적용)
COMMIT;

SELECT *
FROM user;

SELECT *
FROM email_authentication;

-- ----------------------------------------
-- LIMIT 갯수 : SELECT 결과 테이블에서 지정한 갯수 만큼의 상위 데이터만 보여줌
SELECT *
FROM jeju 
LIMIT 10;
-- LIMIT 제외 레코드 개수, 개수 : 상위에서 제외 레코드 개수만큼 제외 후 개수만큼의 데이터만 보여줌
SELECT *
FROM jeju 
LIMIT 10, 3;


-- LIMIT은 SELECT FROM WHERE 구문 중 가장 마지막에 작성professor
SELECT *
FROM jeju 
WHERE speed_80m > 5
LIMIT 10, 3;






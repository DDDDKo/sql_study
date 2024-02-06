USE qatar_asian_cup;
INSERT INTO player VALUES('대한민국', '조규성', 0, null, null, null);
INSERT INTO player VALUES('대한민국', '박용우', 0, null, null, null);
INSERT INTO player VALUES('대한민국', '황인범', 0, null, null, null);
INSERT INTO player VALUES('대한민국', '손흥민', 0, null, null, null);
INSERT INTO player VALUES('한국', '송범근', 0, null, null, null);
INSERT INTO player VALUES('한국', '오현규', 0, null, null, null);

INSERT INTO player VALUES('일본', '쿠보 다케후사', 0, null, null, null);
INSERT INTO player VALUES('일본', '이토 준야', 0, null, null, null);
INSERT INTO player VALUES('일본', '미토마 가오루', 0, null, null, null);
INSERT INTO player VALUES('일본', '엔도 와타루', 0, null, null, null);

-- 플레이어 이름이 조규성이면 나이를 27, 포지션을 FW, 프로팀을 FC밀트윌란, 등번호를 10으로 변경
UPDATE player 
SET age = 27, position = 'FW', pro_team = 'FC밀트윌란', uniform_number = 10
WHERE player_name = '조규성';
-- 플레이어 이름이 박용우이면 나이를 32, 포지션을 MF, 프로팀을 알 아인 FC, 등번호를 5로 변경
UPDATE player 
SET age = 32, position = 'MF', pro_team = '알 아인 FC', uniform_number = 5
WHERE player_name = '박용우';

-- 플레이어 이름이 쿠보 다케후사 이면서 국적이 일본이면 나이를 24, 포지션을 MF/FW, 프로팀을 레알 소시에다드, 등번호를 20로 변경
UPDATE player 
SET age = 24, position = 'MF/FW', pro_team = '레알 소시에다드', uniform_number = 20
WHERE player_name = '쿠보 다케후사' AND country_name = '일본';
-- UPDATE절과 WHERE절을 적절히 사용

SELECT * FROM player WHERE player_name = '손흥민';
UPDATE player
SET age = 34, position = 'MF', pro_team = '토트넘 홋스퍼', uniform_number = 7
WHERE player_name = '손흥민';

-- 대한민국 선수중 나이가 30세 이상인 선수를 조회
SELECT *
FROM player
WHERE age >= 30 AND country_name = '대한민국';

-- 국가명이 요르단인 국가를 제거
-- 기본키를 참조하고 있어서 삭제 x
-- DELETE FROM country WHERE country_name = '요르단';



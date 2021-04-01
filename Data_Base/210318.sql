-- PLAYER 테이블에 몸무게가 200kg 이상인 4명의 데이터를 INSERT 하는 SQL문을 4개 작성하고 실행 후
INSERT INTO player VALUES ('210301', '아킨펜와', 'K04', '', '', '2021', 'MF', 23, 'FRA', NULL, '2', 178, 230); 
INSERT INTO player VALUES ('210302', '트라오레', 'K03', '', '', '2021', 'ST', 10, 'ENG', NULL, '3', 184, 400);
INSERT INTO player VALUES ('210303', '김민재', 'K01', '', '', '2021', 'CB', 4, 'KOR', NULL, '1', 198, 350);
INSERT INTO player VALUES ('210304', '메과이어', 'K01', '', '', '2021', 'CB', 5, 'ENG', NULL, '5', 189, 205);

-- SELECT 문을 활용하여 4명의 선수 정보 모두를 출력하라.
SELECT *
FROM player
WHERE WEIGHT>=200;

-- 생성한 몸무게가 200kg 이상인 열 4개를 가지고, [예제2-1]을 변형하여 4명의 NICKNAME을 "TB"로 UPDATE 하는 SQL문을 작성
UPDATE player
SET NICKNAME = 'TB'
where WEIGHT>=200;

-- 선수의 정보를 조회하는 한글 질의문과 SQL문을 작성하고 실행 후, 그 결과를 출력하라. (단, 합성 연산자(||)와 산술 연산자를 각각 3개 이상 사용하세요.) 
-- BMI 지수가 24.00 보다 큰 선수들을 선별하여 선수 이름, 키, 몸무게, BMI 지수를 차례로 출력하라.
SELECT PLAYER_NAME || ' 선수,' || HEIGHT || 'cm, ' || WEIGHT || 'kg, ('  || 
ROUND(WEIGHT/((HEIGHT/100)*(HEIGHT/100)), 2) || ' BMI)' "BMI지수가 24.00보다 큰 선수"
FROM player
WHERE ROUND(WEIGHT/((HEIGHT/100)*(HEIGHT/100)), 2) >= 24.00;

-- 3개 이상의 컬럼을 IN, LIKE를 이용하여 검색하는 한글 질의문과 SQL문을 작성하고 그 결과를 출력하라. (이름, 팀명, 포지션)
-- 
SELECT *
FROM player
WHERE team_id IN ('K01', 'K02') AND POSITION LIKE '_F' AND join_yyyy LIKE '%1';

-- AND, NOT, IS NULL을 포함하는 한글 질의문과 SQL문을 작성하고 그 결과를 출력하라.
-- 키가 170-180cm 사이(AND)가 아닌(NOT) 선수 중 등번호가 없는(IS NULL) 선수를 출력하라.
SELECT *
FROM player
WHERE BACK_NO IS NULL AND NOT HEIGHT BETWEEN 170 AND 180; 

-- BACK_NO가 없는 사람들 중에서 성이 김씨인 사람들만 조회하는 SQL문을 작성하고 그 결과를 출력하라.
SELECT *
FROM player
WHERE player_name LIKE '김%' AND back_no IS NULL;

-- IS NULL과 ROWNUM을 사용하여 2개의 행을 조회하는 한글 질의문과 SQL문을 작성하고 출력하라.
-- 국적이 기록되지 않은 선수 2명을 출력하라.
SELECT *
FROM player
WHERE ROWNUM <=2 AND nation IS NULL;
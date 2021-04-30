-- [과제9-1] PLAYER 테이블에서 팀ID 별, 포지션 별 선수들의 합계를 구하는 SQL문을 작성하고 그 결과를 출력하라.
-- (단, 포지션이 NULL인 데이터는 제외하고 팀ID 순으로 정렬한다.) 
SELECT 
    DECODE(GROUPING(team_id), 1, 'All team_id', team_id) as 팀명, 
    DECODE(GROUPING(position), 1, 'All position', position) as 포지션, 
    count(*) "Sum of players"
FROM player
WHERE position is not null
GROUP BY GROUPING SETS(team_id, position)
ORDER BY team_id;

-- [과제9-2] PLAYER 테이블에서 CUBE 함수를 이용하는 한글 질의문과 SQL문을 작성하고 그 결과를 출력하라. 
-- player 테이블에서, 팀과 포지션 별로 키가 183 이상이고 몸무게가 75 이상인 선수들을 출력하라. 
SELECT 
    DECODE(GROUPING(team_id), 1, 'All team_id', team_id) as 팀명,
    DECODE(GROUPING(position), 1, 'ALL position', position) as 포지션,
    count(*) 합계
FROM player 
WHERE height>=183 AND weight>=75
GROUP BY CUBE(team_id, position);

-- [과제9-3] PLAYER 테이블에서 팀ID, 소속선수 수, 소속 선수 수가 많은 순으로 팀 순위를 구하는 SQL문을 작성하고 그 결과를 출력하라. 
-- 단, 하나의 SQL문으로 작성되어야 하며, 팀 순위는 동일한 값에 대해서 동일한 순서를 부여하는 것과 동일한 순위를 하나의 건수로 취급하는 것 두 가지 방법을 모두 사용하여 출력한다.) 
SELECT team_id, count(player_id) "소속선수 수",
        RANK() OVER(ORDER BY count(*) DESC) RANK,
        DENSE_RANK() OVER(ORDER BY count(*) DESC) DENSE_RANK
FROM player 
GROUP BY team_id;
    
-- [과제9-4] PLAYER 테이블에서 선수들의 소속팀ID, 선수이름, 선수의 키, 소속팀 선수들 중 최장신 선수의 키, 최단신 선수의 키를 출력하는 SQL문을 작성하고 그 결과를 출력하라. 
SELECT team_id,player_name, height, 
         MAX(height) OVER (partition by team_id) as "최장신 키",
         MIN(height) OVER (partition by team_id) as "최단신 키"
FROM player
WHERE height is not null;

-- [과제9-5] PLAYER 테이블에서 같은 연도에 입단한 선수들의 평균 몸무게를 출력하는 SQL문을 작성하고 그 결과를 출력하라. (단, 평균 몸무게는 소수점 첫째자리까지 표시한다.)
SELECT player_id, player_name, join_yyyy, weight, 
        ROUND(AVG(weight) OVER (partition by join_yyyy), 1) as avrg_weight
FROM player
WHERE join_yyyy is not null;

-- [과제9-6] [예제9], [예제10]을 참고하여 PLAYER 테이블에서 포지션 별로 선수들의 입단연도가 빠른 순으로 포지션명, 선수이름, 입단연도, 포지션 내에서 가장 입단연도가 빠른 선수와 가장 늦은 선수이름을 출력하는 SQL문을 작성하고 그 결과를 출력하라. (단, 입단연도가 같으면 이름 순으로 정렬한다.) 
SELECT position, player_name, join_yyyy, 
        first_value(join_yyyy) OVER (partition by position ORDER BY join_yyyy) as "해당 포지션에서 입단연도 가장 빠른 선수",
        last_value(join_yyyy) OVER (partition by position) as "해당 포지션에서 입단연도 가장 느린 선수"
FROM player
WHERE join_yyyy is not null;

-- [과제9-7] [예제17]을 참고하여 PLAYER 테이블에서 NTILE 함수를 이용하는 한글 질의문과 SQL문을 작성하고 그 결과를 출력하라. 
-- player 테이블에서 height를 기준으로 5개의 그룹으로 분할한 결과를 팀 이름, 선수이름, 포지션과 함께 출력하시오.
SELECT team_id, player_name, position, height,
        NTILE(5) OVER (ORDER BY height DESC) as QUAR_SAL
FROM player
WHERE height is not null;

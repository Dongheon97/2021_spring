-- [예제1-2]를 변형하여 PLAYER 테이블의 TEAM_ID 별 선수들의 평균 키와 평균 몸무게를 출력하는 SQL 문을 작성하세요. 그리고 그 결과를 출력하세요. (단, 평균 키와 평균 몸무게는 소수점 첫째 자리까지 표시한다.) 
SELECT round(AVG(height), 1) "평균 키", round(AVG(weight), 1) "평균 몸무게"
FROM player
GROUP BY team_id;

-- EMP 테이블에서 역할(JOB) 별 직원 수, 연봉 총합, 연봉 평균, 연봉의 표준편차를 구하는 SQL 문을 작성하세요. 그리고 그 결과를 출력하세요.
-- (단, 연봉은 월 급여와 커미션을 포함하여 계산합니다. 또한, 소수점 이하 자리는 모두 버리고, 평균 연봉이 30,000불을 초과하는 JOB만 출력하세요.) 
SELECT COUNT(*) "직원 수", SUM((sal*12)+NVL(com,0)) "연봉 총합", AVG(((sal*12)+NVL(com,0))) "연봉 평균", STDDEV((sal*12)+NVL(com,0)) "연봉의 표준편차"
FROM emp
GROUP BY job
HAVING AVG( ( (sal*12)+NVL(com,0) ) ) > 30000;

-- EMP 테이블에서 역할(JOB)이 ‘CLERK’ 이거나 ‘MANAGER’ 인 직원의 역할, 직원 이름, 입사일, 월 급여를 출력하는 SQL 문을 작성하세요. 
-- 그리고 그 결과를 출력하세요. (단, JOB, 입사일(내림차순), 월 급여(오름차순) 순으로 정렬하여 출력합니다.)
SELECT job "직원의 역할", ename "직원 이름", hiredate "입사일", sal "월 급여"
FROM emp
WHERE job = 'CLERK' or job = 'MANAGER'
ORDER BY job, hiredate DESC, sal ;

-- PLAYER 테이블에서 E_PLAYER_NAME이 없는 사람들은 제외하고, 팀별로 소속선수의 수를 조회하되 소속 선수의 수가 20명 이상인 상위 5개 미만의 팀만 출력하는 SQL 문을 작성하세요.
-- 그리고 그 결과를 출력하세요. (단, WHERE, ORDER BY, GROUP BY, HAVING, ROW LIMITING 절을 모두 사용하세요.) 
SELECT COUNT(*) "소속 선수의 수"
FROM player
WHERE e_player_name is not null
GROUP BY team_id
HAVING COUNT(*) >= 20
ORDER BY COUNT(*) DESC
FETCH first 4 rows only;


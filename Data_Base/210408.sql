-- order by : 기준점을 명시.
-- self join : 별명을 붙여야 함.

-- [예제1-*]을 변형하여 EMP와 DEPT 테이블을 조인하여 사원번호와 사원 이름, 부서번호, 부서 이름을 출력하는 SQL 문을 작성하세요. 그리고 그 결과를 출력하세요.
SELECT e.empno "사원 번호", e.ename "사원 이름", d.deptno "부서 번호", d.dname "부서 이름"
FROM emp e, dept d;

-- [예제2]를 변형하여 TEAM, STADIUM, SCHEDULE 테이블을 조인하여 경기 일과 구장 명, 홈팀 이름, 원정팀 이름을 출력하는 SQL 문을 작성하세요. 
-- 그리고 그 결과를 출력하세요. (단, 경기 일과 구장 명 순으로 오름차순 정렬하여 출력하세요.) 
-- self join of team (t1 = hometeam, t2 = awayteam)
SELECT sc.sche_date "경기 일", s.stadium_name "구장 명", t1.team_name "홈팀 이름", t2.team_name "원정팀 이름"
FROM schedule sc, stadium s, team t1, team t2
WHERE s.hometeam_id = t1.team_id AND sc.awayteam_id = t2.team_id
ORDER BY sc.sche_date, s.stadium_name;

-- [예제2]를 변형하여 NATURAL JOIN을 하는 한글 질의문과 SQL 문을 작성하세요. 그리고 그 결과를 출력하세요. 
-- EMP 테이블과 DEPT 테이블을 사용하여 직원의 번호, 이름, job, sal을 deptno와 함께 출력하시오.
SELECT empno "직원 번호", deptno "부서", ename "직원 이름", job "직무", sal "급여"
FROM emp NATURAL JOIN dept
ORDER BY deptno;  


-- SCHEDULE과 STADIUM 테이블을 ON 조건절을 조인하여 경기 일과 구장 명, 홈팀 점수, 원정팀 점수를 출력하는 한글 질의문과 SQL 문을 작성하세요.
-- 그리고 그 결과를 출력하세요. (단, WHERE 절로 조건을 지정하여 특정 조건에 맞는 행만을 출력하세요.) 
-- SCHEDULE 테이블과 STADIUM 테이블을 사용하여 홈 경기에서 홈 팀이 이긴 경기를 출력하시오.
-- (구장 ID, 경기 일자, 홈 팀, 원정 팀, 홈팀 점수, 원정팀 점수를 출력하시오)
SELECT sc.sche_date "경기 일", s.stadium_name "구장 명", sc.hometeam_id "홈팀 이름", sc.home_score "홈팀 점수", sc.awayteam_id "원정팀 이름", sc.away_score "원정팀 점수"
FROM schedule sc JOIN stadium s
     ON s.hometeam_id = sc.hometeam_id
WHERE home_score > away_score
ORDER BY sche_date ;

-- CROSS JOIN(p.243)을 참고하고, STADIUM을 좌측, TEAM을 우측 테이블로 하는 CROSS JOIN을 수행하는 SQL 문을 작성하세요. 그리고 인출된 행의 개수를 출력하세요. 
SELECT *
FROM stadium CROSS JOIN TEAM
ORDER BY stadium.stadium_id;

-- RIGHT OUTER JOIN(p.248)을 참고하고, STADIUM을 좌측, TEAM을 우측 테이블로 하는 RIGHT OUTER JOIN을 수행하는 SQL 문을 작성하세요. 그리고 인출된 행의 개수를 출력하세요. 
SELECT s.stadium_name "구장 이름", t.team_name "홈팀 이름", s.address "구단 주소"
FROM stadium s RIGHT JOIN team t
     ON s.hometeam_id = t.team_id
ORDER BY t.team_id;

-- [예제 10] 
SELECT stadium_name, stadium.stadium_id, seat_count, hometeam_id, team_name
FROM stadium LEFT OUTER JOIN team
    ON stadium.hometeam_id = team.team_id
ORDER BY hometeam_id;
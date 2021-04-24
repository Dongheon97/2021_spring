-- 슬라이드 301페이지에 있는 질의문을 참고하여 EMP 테이블에서 단일행 서브쿼리를 포함하는 한글 질의문과 SQL문을 작성하세요. 그리고 그 실행결과를 출력하세요. 
-- emp 테이블에서 'MILLER'와 같은 업무를 가지고 있는 사람의 사원번호, 이름, job, 급여, 고용날짜를 출력하시오.
SELECT empno 사원번호, ename 이름, job 업무, sal 급여, hiredate 고용날짜
FROM emp
WHERE job = (SELECT job
                FROM emp
                WHERE ename = 'MILLER')
ORDER BY ename;

-- 다중컬럼 서브쿼리를 사용해서 EMP, DEPT 테이블을 대상으로 부서 별 가장 최근에 입사한 사원의 사원번호, 사원이름, 입사일자, 부서이름을 출력하는 SQL문을 작성하세요.
SELECT e.empno 사원번호, e.ename 사원이름, e.hiredate 입사일자, d.dname 부서이름
FROM emp e, dept d 
WHERE e.deptno = d.deptno AND (e.deptno, e.hiredate) IN (SELECT deptno, max(hiredate)
                                FROM emp 
                                GROUP BY deptno) 
ORDER BY d.dname;

-- [예제4]를 참고하여 EMP 테이블을 대상으로 연관 서브쿼리를 포함하는 한글 질의문과 SQL문을 작성하세요. 그리고 그 실행결과를 출력하세요
-- emp 테이블에서 자신이 속한 직무의 평균 임금 이상인 직원만을 출력하는 sql문을 작성하시오.
SELECT deptno 사원번호, ename 이름, sal 급여, deptno 부서번호, job 직무
FROM emp
WHERE emp.sal >= (SELECT AVG(s.sal)
                FROM emp s
                WHERE s.job = emp.job
                GROUP BY job);

-- [예제9]~[예제12]를 참고하여 PLAYER, TEAM 테이블을 대상으로 90년 이후에 출생한 선수들에 대한 INLINE VIEW를 정의하고, 
-- 이로부터 각 팀별 팀 이름, 포지션별 평균키를 출력하는 SQL문을 작성하세요. 그리고 그 결과를 출력하세요. 
-- (단, 평균키는 소수점 첫째 자리까지 표시하고 팀 이름 기준 오름차순으로 정렬하세요.) 
SELECT t.team_name 팀이름, inline_view.position 포지션, ROUND(inline_view.avr_h,1) 평균키
FROM team t, 
    (SELECT team_id, position, AVG(height) avr_h FROM player WHERE birth_date >= to_date('1990.01.01', 'yyyy-mm-dd') GROUP BY team_id, position) inline_view
WHERE t.team_id = inline_view.team_id
ORDER BY t.team_name;


-- 슬라이드 315페이지에 있는 질의문을 참고하여 EMP 테이블과 DEPT 테이블을 조인하는 뷰를 생성하고 [예제13]과 같이 생성된 뷰를 사용하여 데이터를 조회하는 한글 질의문과 SQL문을 작성하세요. 
CREATE VIEW emp_dept AS
SELECT d.dname, e.ename, e.job, e.hiredate, e.sal, e.deptno, e.empno
FROM emp e, dept d
WHERE e.deptno = d.deptno;

-- emp와 dept 테이블을 조인한 emp_dept 테이블을 생성하고, emp_dept 테이블에서 직원의 부서이름, 사번, 이름, 직무, 고용일자, 급여를 출력하시오.
SELECT dname, empno, ename, job, hiredate, sal, deptno
FROM emp_dept
WHERE job = 'MANAGER';

-- 슬라이드 320페이지에 있는 질의문을 참고하여 Select List 항목으로 위치하는 스칼라 서브쿼리를 포함하는 한글 질의문과 SQL문을 작성하세요. 그리고 그 결과를 출력하세요. 
-- 스칼라 서브쿼리를 사용하여 stadium 테이블에서 구장번호, 구장이름, 홈팀 이름, 주소, 전화번호를 출력하는 sql문을 작성하시오.
SELECT (SELECT team_name FROM team WHERE team.team_id = stadium.hometeam_id) hometeam, stadium_id ID, stadium_name 이름, address 주소, tel 전화번호
FROM stadium;

-- [예제1]을 참고하여 EMP 테이블에서 UNION 연산을 실행하는 한글 질의문과 SQL문을 작성하세요. 그리고 그 실행결과를 출력하세요.
-- UNION을 사용하여 EMP 테이블에서 MANAGER 와 CLERK의 사원번호와 이름을 출력하라.
SELECT job 직무, empno 사원번호, ename 이름
FROM emp
WHERE job = 'MANAGER'
UNION
SELECT job 직무, empno 사원번호, ename 이름
FROM emp
WHERE job = 'CLERK'
ORDER BY 1;

-- [예제5]를 참고하여 EMP 테이블에서 MINUS 연산을 실행하는 한글 질의문과 SQL문을 작성하세요. 그리고 그 실행결과를 출력하세요. 
-- EMP 테이블에서 연봉이 1300 이상인 사람 중에서 대표가 아닌 직원의 사번, 이름, 직무, 급여를 출력하시오.
SELECT empno 사원번호, job 직무, ename 이름, sal 급여
FROM emp
WHERE sal >= 1300
MINUS
SELECT empno 사원번호, job 직무, ename 이름, sal 급여
FROM emp
WHERE job = 'PRESIDENT'
ORDER BY 2;

-- [예제1]을 참고하여 순방향 전개를 나타내는 계층형 SQL문을 한글 질의문과 함께 작성하세요. 그리고 그 실행결과를 출력하세요. (EMP 테이블을 사용할 경우 JOB을 출력하도록 하세요.)
-- EMP 테이블에서 순방향 전개로 직원의 계층구조 직무를 기준으로 출력하되 사원번호, 직속상사 사번, 이름, 부하직원유무를 함께 출력하시오.
SELECT level, lpad(' ', 3*(level-1)) || job 직무, empno 사원번호, mgr "직속상사 사번", ename 이름, 
            CASE WHEN CONNECT_BY_ISLEAF = 0 THEN '유'
                                            ELSE '무'
            END 하위사원유무
FROM emp
START WITH mgr IS NULL
CONNECT BY PRIOR empno = mgr;

-- [예제3]을 참고하여 역방향 전개를 나타내는 계층형 SQL문을 한글 질의문과 함께 작성하세요. 그리고 그 결과를 출력하세요. 
-- EMP 테이블에서, SMITH는 말단직원이며 사원번호가 '7369'이다, 이를 활용하여 SMITH부터 계층형으로 출력하시오.
SELECT level, lpad(' ', 3*(level-1)) || job 직무, empno 사원번호, mgr "직속상사 사번", ename 이름, 
            CASE WHEN CONNECT_BY_ISLEAF = 0 THEN '유'
                                            ELSE '무'
            END as 하위직원유무
FROM emp
START WITH empno = '7369'
CONNECT BY PRIOR mgr = empno;

-- [예제5]를 참고하여 셀프 조인을 수행하는 SQL문을 한글 질의문과 함께 작성하세요. 그리고 그 결과를 출력하세요. 
-- EMP 테이블에서 직원의 레벨은 4이다. 루트를 제외하고 사원부터 관리자, 차상위 관리자까지 출력하시오.
SELECT E1.ename 사원, E2.ename 관리자, E3.ename "차상위 관리자"
FROM emp E1, emp E2, emp E3
WHERE E1.mgr = E2.empno AND E2.mgr = E3.empno
ORDER BY E2.ename;

-- [예제6]를 참고하여 [과제7-5]에서 만든 질의문을 최상위 레벨로 출력되도록 변경하세요.
-- [과제7-5]는 최상위 레벨(루트)는 표시되어있지 않다. 최상위 레벨까지 출력되도록 변경하시오.
SELECT E1.ename 사원, E2.ename 관리자, E3.ename "차상위 관리자"
FROM emp E1 LEFT OUTER JOIN emp E2 ON E1.mgr = E2.empno LEFT OUTER JOIN emp E3 ON E2.mgr = E3.empno
ORDER BY E2.ename;
-- [과제10-1] EMP 테이블에 데이터를 추가, 수정, 삭제하는 SQL문을 작성하고 그 중간에 저장점을 설정하고 그 결과를 출력하라. 
INSERT INTO emp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
VALUES (1111, 'dongheon', 'clerk', 7839, '19970411', 2000, 100, 10);

UPDATE emp
SET sal = sal + 500;

SAVEPOINT svpt1;

DELETE FROM emp where deptno = 20;



--[과제10-2] [과제10-1]에서 작성한 SQL문들에 설정된 저장점까지 ROLLBACK을 수행하는 문장을 추가하고 그 결과를 출력하라. 
ROLLBACK TO svpt1;
SELECT * FROM emp;

--[과제10-3] [과제10-2]에서 작성한 SQL문들에 저장점을 지정하지 않는 ROLLBACK문장을 추가하고 그 결과를 출력하라. 
DELETE FROM emp where sal < 2000;
select * from emp;
ROLLBACK;
select * from emp;




-- [����10-1] EMP ���̺� �����͸� �߰�, ����, �����ϴ� SQL���� �ۼ��ϰ� �� �߰��� �������� �����ϰ� �� ����� ����϶�. 
INSERT INTO emp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
VALUES (1111, 'dongheon', 'clerk', 7839, '19970411', 2000, 100, 10);

UPDATE emp
SET sal = sal + 500;

SAVEPOINT svpt1;

DELETE FROM emp where deptno = 20;



--[����10-2] [����10-1]���� �ۼ��� SQL���鿡 ������ ���������� ROLLBACK�� �����ϴ� ������ �߰��ϰ� �� ����� ����϶�. 
ROLLBACK TO svpt1;
SELECT * FROM emp;

--[����10-3] [����10-2]���� �ۼ��� SQL���鿡 �������� �������� �ʴ� ROLLBACK������ �߰��ϰ� �� ����� ����϶�. 
DELETE FROM emp where sal < 2000;
select * from emp;
ROLLBACK;
select * from emp;




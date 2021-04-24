-- �����̵� 301�������� �ִ� ���ǹ��� �����Ͽ� EMP ���̺��� ������ ���������� �����ϴ� �ѱ� ���ǹ��� SQL���� �ۼ��ϼ���. �׸��� �� �������� ����ϼ���. 
-- emp ���̺��� 'MILLER'�� ���� ������ ������ �ִ� ����� �����ȣ, �̸�, job, �޿�, ��볯¥�� ����Ͻÿ�.
SELECT empno �����ȣ, ename �̸�, job ����, sal �޿�, hiredate ��볯¥
FROM emp
WHERE job = (SELECT job
                FROM emp
                WHERE ename = 'MILLER')
ORDER BY ename;

-- �����÷� ���������� ����ؼ� EMP, DEPT ���̺��� ������� �μ� �� ���� �ֱٿ� �Ի��� ����� �����ȣ, ����̸�, �Ի�����, �μ��̸��� ����ϴ� SQL���� �ۼ��ϼ���.
SELECT e.empno �����ȣ, e.ename ����̸�, e.hiredate �Ի�����, d.dname �μ��̸�
FROM emp e, dept d 
WHERE e.deptno = d.deptno AND (e.deptno, e.hiredate) IN (SELECT deptno, max(hiredate)
                                FROM emp 
                                GROUP BY deptno) 
ORDER BY d.dname;

-- [����4]�� �����Ͽ� EMP ���̺��� ������� ���� ���������� �����ϴ� �ѱ� ���ǹ��� SQL���� �ۼ��ϼ���. �׸��� �� �������� ����ϼ���
-- emp ���̺��� �ڽ��� ���� ������ ��� �ӱ� �̻��� �������� ����ϴ� sql���� �ۼ��Ͻÿ�.
SELECT deptno �����ȣ, ename �̸�, sal �޿�, deptno �μ���ȣ, job ����
FROM emp
WHERE emp.sal >= (SELECT AVG(s.sal)
                FROM emp s
                WHERE s.job = emp.job
                GROUP BY job);

-- [����9]~[����12]�� �����Ͽ� PLAYER, TEAM ���̺��� ������� 90�� ���Ŀ� ����� �����鿡 ���� INLINE VIEW�� �����ϰ�, 
-- �̷κ��� �� ���� �� �̸�, �����Ǻ� ���Ű�� ����ϴ� SQL���� �ۼ��ϼ���. �׸��� �� ����� ����ϼ���. 
-- (��, ���Ű�� �Ҽ��� ù° �ڸ����� ǥ���ϰ� �� �̸� ���� ������������ �����ϼ���.) 
SELECT t.team_name ���̸�, inline_view.position ������, ROUND(inline_view.avr_h,1) ���Ű
FROM team t, 
    (SELECT team_id, position, AVG(height) avr_h FROM player WHERE birth_date >= to_date('1990.01.01', 'yyyy-mm-dd') GROUP BY team_id, position) inline_view
WHERE t.team_id = inline_view.team_id
ORDER BY t.team_name;


-- �����̵� 315�������� �ִ� ���ǹ��� �����Ͽ� EMP ���̺�� DEPT ���̺��� �����ϴ� �並 �����ϰ� [����13]�� ���� ������ �並 ����Ͽ� �����͸� ��ȸ�ϴ� �ѱ� ���ǹ��� SQL���� �ۼ��ϼ���. 
CREATE VIEW emp_dept AS
SELECT d.dname, e.ename, e.job, e.hiredate, e.sal, e.deptno, e.empno
FROM emp e, dept d
WHERE e.deptno = d.deptno;

-- emp�� dept ���̺��� ������ emp_dept ���̺��� �����ϰ�, emp_dept ���̺��� ������ �μ��̸�, ���, �̸�, ����, �������, �޿��� ����Ͻÿ�.
SELECT dname, empno, ename, job, hiredate, sal, deptno
FROM emp_dept
WHERE job = 'MANAGER';

-- �����̵� 320�������� �ִ� ���ǹ��� �����Ͽ� Select List �׸����� ��ġ�ϴ� ��Į�� ���������� �����ϴ� �ѱ� ���ǹ��� SQL���� �ۼ��ϼ���. �׸��� �� ����� ����ϼ���. 
-- ��Į�� ���������� ����Ͽ� stadium ���̺��� �����ȣ, �����̸�, Ȩ�� �̸�, �ּ�, ��ȭ��ȣ�� ����ϴ� sql���� �ۼ��Ͻÿ�.
SELECT (SELECT team_name FROM team WHERE team.team_id = stadium.hometeam_id) hometeam, stadium_id ID, stadium_name �̸�, address �ּ�, tel ��ȭ��ȣ
FROM stadium;

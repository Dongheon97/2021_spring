-- [����1]�� �����Ͽ� EMP ���̺��� UNION ������ �����ϴ� �ѱ� ���ǹ��� SQL���� �ۼ��ϼ���. �׸��� �� �������� ����ϼ���.
-- UNION�� ����Ͽ� EMP ���̺��� MANAGER �� CLERK�� �����ȣ�� �̸��� ����϶�.
SELECT job ����, empno �����ȣ, ename �̸�
FROM emp
WHERE job = 'MANAGER'
UNION
SELECT job ����, empno �����ȣ, ename �̸�
FROM emp
WHERE job = 'CLERK'
ORDER BY 1;

-- [����5]�� �����Ͽ� EMP ���̺��� MINUS ������ �����ϴ� �ѱ� ���ǹ��� SQL���� �ۼ��ϼ���. �׸��� �� �������� ����ϼ���. 
-- EMP ���̺��� ������ 1300 �̻��� ��� �߿��� ��ǥ�� �ƴ� ������ ���, �̸�, ����, �޿��� ����Ͻÿ�.
SELECT empno �����ȣ, job ����, ename �̸�, sal �޿�
FROM emp
WHERE sal >= 1300
MINUS
SELECT empno �����ȣ, job ����, ename �̸�, sal �޿�
FROM emp
WHERE job = 'PRESIDENT'
ORDER BY 2;

-- [����1]�� �����Ͽ� ������ ������ ��Ÿ���� ������ SQL���� �ѱ� ���ǹ��� �Բ� �ۼ��ϼ���. �׸��� �� �������� ����ϼ���. (EMP ���̺��� ����� ��� JOB�� ����ϵ��� �ϼ���.)
-- EMP ���̺��� ������ ������ ������ �������� ������ �������� ����ϵ� �����ȣ, ���ӻ�� ���, �̸�, �������������� �Բ� ����Ͻÿ�.
SELECT level, lpad(' ', 3*(level-1)) || job ����, empno �����ȣ, mgr "���ӻ�� ���", ename �̸�, 
            CASE WHEN CONNECT_BY_ISLEAF = 0 THEN '��'
                                            ELSE '��'
            END �����������
FROM emp
START WITH mgr IS NULL
CONNECT BY PRIOR empno = mgr;

-- [����3]�� �����Ͽ� ������ ������ ��Ÿ���� ������ SQL���� �ѱ� ���ǹ��� �Բ� �ۼ��ϼ���. �׸��� �� ����� ����ϼ���. 
-- EMP ���̺���, SMITH�� ���������̸� �����ȣ�� '7369'�̴�, �̸� Ȱ���Ͽ� SMITH���� ���������� ����Ͻÿ�.
SELECT level, lpad(' ', 3*(level-1)) || job ����, empno �����ȣ, mgr "���ӻ�� ���", ename �̸�, 
            CASE WHEN CONNECT_BY_ISLEAF = 0 THEN '��'
                                            ELSE '��'
            END as ������������
FROM emp
START WITH empno = '7369'
CONNECT BY PRIOR mgr = empno;

-- [����5]�� �����Ͽ� ���� ������ �����ϴ� SQL���� �ѱ� ���ǹ��� �Բ� �ۼ��ϼ���. �׸��� �� ����� ����ϼ���. 
-- EMP ���̺��� ������ ������ 4�̴�. ��Ʈ�� �����ϰ� ������� ������, ������ �����ڱ��� ����Ͻÿ�.
SELECT E1.ename ���, E2.ename ������, E3.ename "������ ������"
FROM emp E1, emp E2, emp E3
WHERE E1.mgr = E2.empno AND E2.mgr = E3.empno
ORDER BY E2.ename;

-- [����6]�� �����Ͽ� [����7-5]���� ���� ���ǹ��� �ֻ��� ������ ��µǵ��� �����ϼ���.
-- [����7-5]�� �ֻ��� ����(��Ʈ)�� ǥ�õǾ����� �ʴ�. �ֻ��� �������� ��µǵ��� �����Ͻÿ�.
SELECT E1.ename ���, E2.ename ������, E3.ename "������ ������"
FROM emp E1 LEFT OUTER JOIN emp E2 ON E1.mgr = E2.empno LEFT OUTER JOIN emp E3 ON E2.mgr = E3.empno
ORDER BY E2.ename;
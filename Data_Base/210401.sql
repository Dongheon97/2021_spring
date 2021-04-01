-- [����1-2]�� �����Ͽ� PLAYER ���̺��� TEAM_ID �� �������� ��� Ű�� ��� �����Ը� ����ϴ� SQL ���� �ۼ��ϼ���. �׸��� �� ����� ����ϼ���. (��, ��� Ű�� ��� �����Դ� �Ҽ��� ù° �ڸ����� ǥ���Ѵ�.) 
SELECT round(AVG(height), 1) "��� Ű", round(AVG(weight), 1) "��� ������"
FROM player
GROUP BY team_id;

-- EMP ���̺��� ����(JOB) �� ���� ��, ���� ����, ���� ���, ������ ǥ�������� ���ϴ� SQL ���� �ۼ��ϼ���. �׸��� �� ����� ����ϼ���.
-- (��, ������ �� �޿��� Ŀ�̼��� �����Ͽ� ����մϴ�. ����, �Ҽ��� ���� �ڸ��� ��� ������, ��� ������ 30,000���� �ʰ��ϴ� JOB�� ����ϼ���.) 
SELECT COUNT(*) "���� ��", SUM((sal*12)+NVL(com,0)) "���� ����", AVG(((sal*12)+NVL(com,0))) "���� ���", STDDEV((sal*12)+NVL(com,0)) "������ ǥ������"
FROM emp
GROUP BY job
HAVING AVG( ( (sal*12)+NVL(com,0) ) ) > 30000;

-- EMP ���̺��� ����(JOB)�� ��CLERK�� �̰ų� ��MANAGER�� �� ������ ����, ���� �̸�, �Ի���, �� �޿��� ����ϴ� SQL ���� �ۼ��ϼ���. 
-- �׸��� �� ����� ����ϼ���. (��, JOB, �Ի���(��������), �� �޿�(��������) ������ �����Ͽ� ����մϴ�.)
SELECT job "������ ����", ename "���� �̸�", hiredate "�Ի���", sal "�� �޿�"
FROM emp
WHERE job = 'CLERK' or job = 'MANAGER'
ORDER BY job, hiredate DESC, sal ;

-- PLAYER ���̺��� E_PLAYER_NAME�� ���� ������� �����ϰ�, ������ �ҼӼ����� ���� ��ȸ�ϵ� �Ҽ� ������ ���� 20�� �̻��� ���� 5�� �̸��� ���� ����ϴ� SQL ���� �ۼ��ϼ���.
-- �׸��� �� ����� ����ϼ���. (��, WHERE, ORDER BY, GROUP BY, HAVING, ROW LIMITING ���� ��� ����ϼ���.) 
SELECT COUNT(*) "�Ҽ� ������ ��"
FROM player
WHERE e_player_name is not null
GROUP BY team_id
HAVING COUNT(*) >= 20
ORDER BY COUNT(*) DESC
FETCH first 4 rows only;


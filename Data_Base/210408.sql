-- order by : �������� ���.
-- self join : ������ �ٿ��� ��.

-- [����1-*]�� �����Ͽ� EMP�� DEPT ���̺��� �����Ͽ� �����ȣ�� ��� �̸�, �μ���ȣ, �μ� �̸��� ����ϴ� SQL ���� �ۼ��ϼ���. �׸��� �� ����� ����ϼ���.
SELECT e.empno "��� ��ȣ", e.ename "��� �̸�", d.deptno "�μ� ��ȣ", d.dname "�μ� �̸�"
FROM emp e, dept d;

-- [����2]�� �����Ͽ� TEAM, STADIUM, SCHEDULE ���̺��� �����Ͽ� ��� �ϰ� ���� ��, Ȩ�� �̸�, ������ �̸��� ����ϴ� SQL ���� �ۼ��ϼ���. 
-- �׸��� �� ����� ����ϼ���. (��, ��� �ϰ� ���� �� ������ �������� �����Ͽ� ����ϼ���.) 
-- self join of team (t1 = hometeam, t2 = awayteam)
SELECT sc.sche_date "��� ��", s.stadium_name "���� ��", t1.team_name "Ȩ�� �̸�", t2.team_name "������ �̸�"
FROM schedule sc, stadium s, team t1, team t2
WHERE s.hometeam_id = t1.team_id AND sc.awayteam_id = t2.team_id
ORDER BY sc.sche_date, s.stadium_name;

-- [����2]�� �����Ͽ� NATURAL JOIN�� �ϴ� �ѱ� ���ǹ��� SQL ���� �ۼ��ϼ���. �׸��� �� ����� ����ϼ���. 
-- EMP ���̺�� DEPT ���̺��� ����Ͽ� ������ ��ȣ, �̸�, job, sal�� deptno�� �Բ� ����Ͻÿ�.
SELECT empno "���� ��ȣ", deptno "�μ�", ename "���� �̸�", job "����", sal "�޿�"
FROM emp NATURAL JOIN dept
ORDER BY deptno;  


-- SCHEDULE�� STADIUM ���̺��� ON �������� �����Ͽ� ��� �ϰ� ���� ��, Ȩ�� ����, ������ ������ ����ϴ� �ѱ� ���ǹ��� SQL ���� �ۼ��ϼ���.
-- �׸��� �� ����� ����ϼ���. (��, WHERE ���� ������ �����Ͽ� Ư�� ���ǿ� �´� �ุ�� ����ϼ���.) 
-- SCHEDULE ���̺�� STADIUM ���̺��� ����Ͽ� Ȩ ��⿡�� Ȩ ���� �̱� ��⸦ ����Ͻÿ�.
-- (���� ID, ��� ����, Ȩ ��, ���� ��, Ȩ�� ����, ������ ������ ����Ͻÿ�)
SELECT sc.sche_date "��� ��", s.stadium_name "���� ��", sc.hometeam_id "Ȩ�� �̸�", sc.home_score "Ȩ�� ����", sc.awayteam_id "������ �̸�", sc.away_score "������ ����"
FROM schedule sc JOIN stadium s
     ON s.hometeam_id = sc.hometeam_id
WHERE home_score > away_score
ORDER BY sche_date ;

-- CROSS JOIN(p.243)�� �����ϰ�, STADIUM�� ����, TEAM�� ���� ���̺�� �ϴ� CROSS JOIN�� �����ϴ� SQL ���� �ۼ��ϼ���. �׸��� ����� ���� ������ ����ϼ���. 
SELECT *
FROM stadium CROSS JOIN TEAM
ORDER BY stadium.stadium_id;

-- RIGHT OUTER JOIN(p.248)�� �����ϰ�, STADIUM�� ����, TEAM�� ���� ���̺�� �ϴ� RIGHT OUTER JOIN�� �����ϴ� SQL ���� �ۼ��ϼ���. �׸��� ����� ���� ������ ����ϼ���. 
SELECT s.stadium_name "���� �̸�", t.team_name "Ȩ�� �̸�", s.address "���� �ּ�"
FROM stadium s RIGHT JOIN team t
     ON s.hometeam_id = t.team_id
ORDER BY t.team_id;

-- [���� 10] 
SELECT stadium_name, stadium.stadium_id, seat_count, hometeam_id, team_name
FROM stadium LEFT OUTER JOIN team
    ON stadium.hometeam_id = team.team_id
ORDER BY hometeam_id;
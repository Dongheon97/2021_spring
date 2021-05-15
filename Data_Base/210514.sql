-- <����11-1> [����1]~[����5]�� �����Ͽ� PLAYER ���̺��� ������ �� �����Ǻ� ������ ���� ��� ����(Ű)�� ���ϴ� �並 �����ϰ� 
-- ������ ���� ��ü �����͸� ��ȸ�ϴ� SQL���� �ۼ��϶�. (��, PIVOT���� ����ϰ� �� ID������ �����Ѵ�.) 
SELECT *
FROM (SELECT team_id, height, position FROM player where position is not null AND height is not null)
PIVOT (AVG(height) as "��� ����", count(*) as "�ο�(��)" 
        for position IN ('FW' as "���ݼ�", 'MF' as "�̵��ʴ�", 'DF' as "�����", 'GK' as "��Ű��"))
ORDER BY team_id;

-- <����11-2> [����6]~[����11]�� �����Ͽ� [����11-1]���� ������ ���� ��ü ������ ��ȸ ��� �� 
-- �� ������ �������� ��MF���� �������� ����(������ ��, ��� ����(Ű))�� ��ȸ�ϴ� SQL���� �ۼ��϶�. (��, UNPIVOT���� ����ϰ� �� ID������ �����Ѵ�.)
DROP table avg_height purge;

create table avgavg as
select *
from (select team_id, position, height from player where position = 'MF')
pivot (AVG(height) as "��� ����", count(*) as "�ο�(��)" 
        for position IN ('MF' as "�̵��ʴ�"));

SELECT *
FROM avgavg
UNPIVOT (value for category IN ("�̵��ʴ�_��� ����", "�̵��ʴ�_�ο�(��)")) 
ORDER BY team_id;


-- <����11-3> EMP ���̺��� �̸��� �ּҰ� ���ҹ���+����@�ҹ���+����.�ҹ��ڡ� ������ ������ ������ȣ, �����̸�, ����, �̸��� �ּҸ� ����ϴ� SQL���� �ۼ��϶�. 
-- (��, REGEXP_LIKE �Լ��� ����ϸ� POSIX �����ڿ� PERL ���� ǥ���� ������ �� ���� ����� ��� ����Ͽ� ����Ѵ�.) 
SELECT empno, ename, job, email
FROM emp
WHERE REGEXP_LIKE(email, '[:lower:]+[:digit:]+\@[:lower:]+[:digit:]+\.[:lower:]+');

SELECT empno, ename, job, email
FROM emp
WHERE REGEXP_LIKE(email, '[a-z]+?\d+?\@[a-z]+?\d+?\.[a-z]+?');


-- <����11-4> EMP ���̺��� ��� ������ ������ȣ, �����̸�, ������ �ڵ��� ��ȣ, ������-����-���ڡ� �������� ������ �ڵ��� ��ȣ�� ����ϴ� SQL���� �ۼ��϶�. 
-- (��, REGEXP_REPLACE �Լ��� ����ϸ�, POSIX �����ڿ� PERL ���� ǥ���� ������ �� ���� ����� ��� ����Ͽ� ����Ѵ�.) 
SELECT empno, ename, mobile, 
        regexp_replace(mobile, '[^[:digit:]]', '-') as "posix",
        regexp_replace(mobile, '(\d{3}).(\d{4}).(\d{4})', '\1-\2-\3') as "perl"
FROM emp;



-- <����11-5> EMP ���̺��� ���� Ȩ�������� �ִ� �������� ������ȣ, �����̸�, ������ ���� Ȩ������ �ּ�, ���� URL�� �и��� ���� Ȩ������ �ּ� 
-- (����: http://www.naver.com/)�� ����ϴ� SQL���� �ۼ��϶�. 
-- (��, REGEXP_SUBSTR �Լ��� ����ϸ� POSIX �����ڿ� PERL ���� ǥ���� ������ �� ���� ����� ��� ����Ͽ� ����ϰ� ���� Ȩ������ �ּҰ� ���� ������ �����Ѵ�.) 
SELECT empno, ename, personal_homepage, 
    regexp_substr(personal_homepage, 'http://[[:alnum:]]+(\.[[:alnum:]]+)+/') as "POSIX",
    regexp_substr(personal_homepage, 'http://\w+(\.\w+)+/') as "PERL"
FROM emp
WHERE personal_homepage is not null;


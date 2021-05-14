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

create table avg_height as
select team_id, position, height
from (select team_id, position, height from player where position in ('MF')

SELECT team_id, height, position
FROM player
UNPIVOT (AVG(height) as "��ս���", count(*) as "�ο�(��)" for position IN ('FW' as "���ݼ�", 'MF' as "�̵��ʴ�", 'DF' as "�����", 'GK' as "��Ű��")) 
ORDER BY team_id;


-- <����11-3> EMP ���̺��� �̸��� �ּҰ� ���ҹ���+����@�ҹ���+����.�ҹ��ڡ� ������ ������ ������ȣ, �����̸�, ����, �̸��� �ּҸ� ����ϴ� SQL���� �ۼ��϶�. 
-- (��, REGEXP_LIKE �Լ��� ����ϸ� POSIX �����ڿ� PERL ���� ǥ���� ������ �� ���� ����� ��� ����Ͽ� ����Ѵ�.) 


-- <����11-4> EMP ���̺��� ��� ������ ������ȣ, �����̸�, ������ �ڵ��� ��ȣ, ������-����-���ڡ� �������� ������ �ڵ��� ��ȣ�� ����ϴ� SQL���� �ۼ��϶�. 
-- (��, REGEXP_REPLACE �Լ��� ����ϸ�, POSIX �����ڿ� PERL ���� ǥ���� ������ �� ���� ����� ��� ����Ͽ� ����Ѵ�.) 

-- <����11-5> EMP ���̺��� ���� Ȩ�������� �ִ� �������� ������ȣ, �����̸�, ������ ���� Ȩ������ �ּ�, ���� URL�� �и��� ���� Ȩ������ �ּ� 
-- (����: http://www.naver.com/)�� ����ϴ� SQL���� �ۼ��϶�. 
-- (��, REGEXP_SUBSTR �Լ��� ����ϸ� POSIX �����ڿ� PERL ���� ǥ���� ������ �� ���� ����� ��� ����Ͽ� ����ϰ� ���� Ȩ������ �ּҰ� ���� ������ �����Ѵ�.) 
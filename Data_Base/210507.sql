-- [����1]~[����3]�� �����Ͽ� �ý��� �����ڷ� �����Ͽ� ������ ������ ���� �� ������ ������ �����Ͽ� ������ ���̺��� �����ϰų� ���� ���̺��� �����͸� ��ȸ�ϴ� SQL���� �ۼ��ϰ� �����غ��� �� ����� ����϶�. 
--CONN SYSTEM/090170
--CREATE USER c##t01 IDENTIFIED BY 1234;

--CONN SYSTEM/090170
--GRANT CREATE SESSION TO c##t01;
--GRANT CREATE TABLE TO c##t01;

--CONN c##t01/1234
--CREATE TABLE lecture(lec_code number not null, lec_name varchar2(10));

--CONN c##t01/1234
--select * from lecture;

--[����10-5] [����4]�� �����Ͽ� �ý��� �����ڷ� �����Ͽ� [����10-4]���� ������ �������� �ٸ� ����, ����, ���̺� ���� ������ �ο��϶�.
--�׷� ���� �� ������ �����Ͽ� ������ ���̺��� ������ �� �����͸� �߰��ϰ� �� �����͸� ��ȸ�ϴ� SQL���� �ۼ��ϰ� �� ���� ����� ����϶�. 
CONN SYSTEM/090170 
alter user c##t01 default tablespace users quota unlimited on users;
GRANT CREATE USER TO c##t01;
GRANT CREATE SESSION TO c##t01;
GRANT CREATE TABLE TO c##t01;

CONN c##t01/1234
CREATE TABLE coffee(coffee_id number not null, coffee_name varchar2(10), coffee_from varchar2(10));
GRANT INSERT, SELECT ON coffee TO c##t01;
INSERT INTO coffee VALUES (001,'drip', 'Columbia');
INSERT INTO coffee VALUES (002,'blend', 'Kenya');
SELECT * FROM coffee;

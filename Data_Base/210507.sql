-- [예제1]~[예제3]을 참고하여 시스템 관리자로 접속하여 임의의 유저를 생성 후 생성한 유저로 접속하여 임의의 테이블을 생성하거나 기존 테이블에서 데이터를 조회하는 SQL문을 작성하고 실행해보고 그 결과를 출력하라. 
--CONN SYSTEM/090170
--CREATE USER c##t01 IDENTIFIED BY 1234;

--CONN SYSTEM/090170
--GRANT CREATE SESSION TO c##t01;
--GRANT CREATE TABLE TO c##t01;

--CONN c##t01/1234
--CREATE TABLE lecture(lec_code number not null, lec_name varchar2(10));

--CONN c##t01/1234
--select * from lecture;

--[과제10-5] [예제4]를 참고하여 시스템 관리자로 접속하여 [과제10-4]에서 생성한 유저에게 다른 유저, 세션, 테이블 생성 권한을 부여하라.
--그런 다음 그 유저로 접속하여 임의의 테이블을 생성한 뒤 데이터를 추가하고 그 데이터를 조회하는 SQL문을 작성하고 그 실행 결과를 출력하라. 
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

-- <과제11-1> [예제1]~[예제5]를 참고하여 PLAYER 테이블에서 팀별로 각 포지션별 선수의 수와 평균 신장(키)을 구하는 뷰를 생성하고 
-- 생성된 뷰의 전체 데이터를 조회하는 SQL문을 작성하라. (단, PIVOT절을 사용하고 팀 ID순으로 정렬한다.) 
SELECT *
FROM (SELECT team_id, height, position FROM player where position is not null AND height is not null)
PIVOT (AVG(height) as "평균 신장", count(*) as "인원(명)" 
        for position IN ('FW' as "공격수", 'MF' as "미드필더", 'DF' as "수비수", 'GK' as "골키퍼"))
ORDER BY team_id;

-- <과제11-2> [예제6]~[예제11]을 참고하여 [과제11-1]에서 생성한 뷰의 전체 데이터 조회 결과 중 
-- 각 팀에서 포지션이 ‘MF’인 선수들의 정보(선수의 수, 평균 신장(키))를 조회하는 SQL문을 작성하라. (단, UNPIVOT절을 사용하고 팀 ID순으로 정렬한다.)
DROP table avg_height purge;

create table avgavg as
select *
from (select team_id, position, height from player where position = 'MF')
pivot (AVG(height) as "평균 신장", count(*) as "인원(명)" 
        for position IN ('MF' as "미드필더"));

SELECT *
FROM avgavg
UNPIVOT (value for category IN ("미드필더_평균 신장", "미드필더_인원(명)")) 
ORDER BY team_id;


-- <과제11-3> EMP 테이블에서 이메일 주소가 ‘소문자+숫자@소문자+숫자.소문자’ 패턴인 직원의 직원번호, 직원이름, 직무, 이메일 주소를 출력하는 SQL문을 작성하라. 
-- (단, REGEXP_LIKE 함수를 사용하며 POSIX 연산자와 PERL 정규 표현식 연산자 두 가지 방법을 모두 사용하여 출력한다.) 
SELECT empno, ename, job, email
FROM emp
WHERE REGEXP_LIKE(email, '[:lower:]+[:digit:]+\@[:lower:]+[:digit:]+\.[:lower:]+');

SELECT empno, ename, job, email
FROM emp
WHERE REGEXP_LIKE(email, '[a-z]+?\d+?\@[a-z]+?\d+?\.[a-z]+?');


-- <과제11-4> EMP 테이블에서 모든 직원의 직원번호, 직원이름, 기존의 핸드폰 번호, ‘숫자-숫자-숫자’ 패턴으로 변경한 핸드폰 번호를 출력하는 SQL문을 작성하라. 
-- (단, REGEXP_REPLACE 함수를 사용하며, POSIX 연산자와 PERL 정규 표현식 연산자 두 가지 방법을 모두 사용하여 출력한다.) 
SELECT empno, ename, mobile, 
        regexp_replace(mobile, '[^[:digit:]]', '-') as "posix",
        regexp_replace(mobile, '(\d{3}).(\d{4}).(\d{4})', '\1-\2-\3') as "perl"
FROM emp;



-- <과제11-5> EMP 테이블에서 개인 홈페이지가 있는 직원들의 직원번호, 직원이름, 기존의 개인 홈페이지 주소, 메인 URL만 분리한 개인 홈페이지 주소 
-- (예시: http://www.naver.com/)를 출력하는 SQL문을 작성하라. 
-- (단, REGEXP_SUBSTR 함수를 사용하며 POSIX 연산자와 PERL 정규 표현식 연산자 두 가지 방법을 모두 사용하여 출력하고 개인 홈페이지 주소가 없는 직원은 제외한다.) 
SELECT empno, ename, personal_homepage, 
    regexp_substr(personal_homepage, 'http://[[:alnum:]]+(\.[[:alnum:]]+)+/') as "POSIX",
    regexp_substr(personal_homepage, 'http://\w+(\.\w+)+/') as "PERL"
FROM emp
WHERE personal_homepage is not null;


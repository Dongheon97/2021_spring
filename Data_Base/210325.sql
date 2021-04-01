-- EMP 테이블의 HIREDATE를 사용하여 연차를 계산하는 한글 질의문과 SQL문을 작성하세요. 그리고 그 결과를 출력하세요. 날짜형, 변환형, case
SELECT empno, ename, job, TO_NUMBER(TO_CHAR(hiredate, 'yyyy')) as 입사연도,
        CASE WHEN (TO_DATE('01-03-2000', 'dd-mm-yyyy') - hiredate)/365 >= 19 THEN '    부장님'
             WHEN (TO_DATE('01-03-2000', 'dd-mm-yyyy') - hiredate)/365 >= 18 THEN '    과장님'
             ELSE '    @@신입@@'
             END
FROM emp; 

-- PLAYER 테이블을 가지고 [예제3-4]를 변형하여 SEARCHED_CASE_ EXPRESSION 표현을 사용하는 한글 질의문과 SQL문을 작성하세요. 그리고 그 결과를 출력하세요.
SELECT player_id, player_name, team_id, position, back_no, height,
        CASE WHEN height >= 183 THEN '    장신'
             WHEN height >= 173 THEN '    평균'
             ELSE '    단신'
             END
FROM player; 

-- PLAYER 테이블의 JOIN_YYYY 컬럼을 가지고 CASE문 중첩과 NVL을 사용하는 한글 질의문과 SQL문을 작성하세요. 그리고 그 결과를 출력하세요.
-- 국적 null이면 KOR으로 바꾸어서 출력, 입단연도가 2007년 이하 선수들 중 포지션이 DF인 선수를 '주장후보'라는 태그로 출력
SELECT player_id, player_name, team_id, join_yyyy, position, back_no, NVL(nation, 'KOR'), 
        CASE WHEN join_yyyy <= 2007 THEN  
            CASE WHEN position = 'DF' THEN '주장 후보'
            ELSE ' '
            END
        END
FROM player
WHERE join_yyyy <= 2007;

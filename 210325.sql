-- EMP ���̺��� HIREDATE�� ����Ͽ� ������ ����ϴ� �ѱ� ���ǹ��� SQL���� �ۼ��ϼ���. �׸��� �� ����� ����ϼ���. ��¥��, ��ȯ��, case
SELECT empno, ename, job, TO_NUMBER(TO_CHAR(hiredate, 'yyyy')) as �Ի翬��,
        CASE WHEN (TO_DATE('01-03-2000', 'dd-mm-yyyy') - hiredate)/365 >= 19 THEN '    �����'
             WHEN (TO_DATE('01-03-2000', 'dd-mm-yyyy') - hiredate)/365 >= 18 THEN '    �����'
             ELSE '    @@����@@'
             END
FROM emp; 

-- PLAYER ���̺��� ������ [����3-4]�� �����Ͽ� SEARCHED_CASE_ EXPRESSION ǥ���� ����ϴ� �ѱ� ���ǹ��� SQL���� �ۼ��ϼ���. �׸��� �� ����� ����ϼ���.
SELECT player_id, player_name, team_id, position, back_no, height,
        CASE WHEN height >= 183 THEN '    ���'
             WHEN height >= 173 THEN '    ���'
             ELSE '    �ܽ�'
             END
FROM player; 

-- PLAYER ���̺��� JOIN_YYYY �÷��� ������ CASE�� ��ø�� NVL�� ����ϴ� �ѱ� ���ǹ��� SQL���� �ۼ��ϼ���. �׸��� �� ����� ����ϼ���.
-- ���� null�̸� KOR���� �ٲپ ���, �Դܿ����� 2007�� ���� ������ �� �������� DF�� ������ '�����ĺ�'��� �±׷� ���
SELECT player_id, player_name, team_id, join_yyyy, position, back_no, NVL(nation, 'KOR'), 
        CASE WHEN join_yyyy <= 2007 THEN  
            CASE WHEN position = 'DF' THEN '���� �ĺ�'
            ELSE ' '
            END
        END
FROM player
WHERE join_yyyy <= 2007;

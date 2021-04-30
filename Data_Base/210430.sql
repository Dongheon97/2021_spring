-- [����9-1] PLAYER ���̺��� ��ID ��, ������ �� �������� �հ踦 ���ϴ� SQL���� �ۼ��ϰ� �� ����� ����϶�.
-- (��, �������� NULL�� �����ʹ� �����ϰ� ��ID ������ �����Ѵ�.) 
SELECT 
    DECODE(GROUPING(team_id), 1, 'All team_id', team_id) as ����, 
    DECODE(GROUPING(position), 1, 'All position', position) as ������, 
    count(*) "Sum of players"
FROM player
WHERE position is not null
GROUP BY GROUPING SETS(team_id, position)
ORDER BY team_id;

-- [����9-2] PLAYER ���̺��� CUBE �Լ��� �̿��ϴ� �ѱ� ���ǹ��� SQL���� �ۼ��ϰ� �� ����� ����϶�. 
-- player ���̺���, ���� ������ ���� Ű�� 183 �̻��̰� �����԰� 75 �̻��� �������� ����϶�. 
SELECT 
    DECODE(GROUPING(team_id), 1, 'All team_id', team_id) as ����,
    DECODE(GROUPING(position), 1, 'ALL position', position) as ������,
    count(*) �հ�
FROM player 
WHERE height>=183 AND weight>=75
GROUP BY CUBE(team_id, position);

-- [����9-3] PLAYER ���̺��� ��ID, �ҼӼ��� ��, �Ҽ� ���� ���� ���� ������ �� ������ ���ϴ� SQL���� �ۼ��ϰ� �� ����� ����϶�. 
-- ��, �ϳ��� SQL������ �ۼ��Ǿ�� �ϸ�, �� ������ ������ ���� ���ؼ� ������ ������ �ο��ϴ� �Ͱ� ������ ������ �ϳ��� �Ǽ��� ����ϴ� �� �� ���� ����� ��� ����Ͽ� ����Ѵ�.) 
SELECT team_id, count(player_id) "�ҼӼ��� ��",
        RANK() OVER(ORDER BY count(*) DESC) RANK,
        DENSE_RANK() OVER(ORDER BY count(*) DESC) DENSE_RANK
FROM player 
GROUP BY team_id;
    
-- [����9-4] PLAYER ���̺��� �������� �Ҽ���ID, �����̸�, ������ Ű, �Ҽ��� ������ �� ����� ������ Ű, �ִܽ� ������ Ű�� ����ϴ� SQL���� �ۼ��ϰ� �� ����� ����϶�. 
SELECT team_id,player_name, height, 
         MAX(height) OVER (partition by team_id) as "����� Ű",
         MIN(height) OVER (partition by team_id) as "�ִܽ� Ű"
FROM player
WHERE height is not null;

-- [����9-5] PLAYER ���̺��� ���� ������ �Դ��� �������� ��� �����Ը� ����ϴ� SQL���� �ۼ��ϰ� �� ����� ����϶�. (��, ��� �����Դ� �Ҽ��� ù°�ڸ����� ǥ���Ѵ�.)
SELECT player_id, player_name, join_yyyy, weight, 
        ROUND(AVG(weight) OVER (partition by join_yyyy), 1) as avrg_weight
FROM player
WHERE join_yyyy is not null;

-- [����9-6] [����9], [����10]�� �����Ͽ� PLAYER ���̺��� ������ ���� �������� �Դܿ����� ���� ������ �����Ǹ�, �����̸�, �Դܿ���, ������ ������ ���� �Դܿ����� ���� ������ ���� ���� �����̸��� ����ϴ� SQL���� �ۼ��ϰ� �� ����� ����϶�. (��, �Դܿ����� ������ �̸� ������ �����Ѵ�.) 
SELECT position, player_name, join_yyyy, 
        first_value(join_yyyy) OVER (partition by position ORDER BY join_yyyy) as "�ش� �����ǿ��� �Դܿ��� ���� ���� ����",
        last_value(join_yyyy) OVER (partition by position) as "�ش� �����ǿ��� �Դܿ��� ���� ���� ����"
FROM player
WHERE join_yyyy is not null;

-- [����9-7] [����17]�� �����Ͽ� PLAYER ���̺��� NTILE �Լ��� �̿��ϴ� �ѱ� ���ǹ��� SQL���� �ۼ��ϰ� �� ����� ����϶�. 
-- player ���̺��� height�� �������� 5���� �׷����� ������ ����� �� �̸�, �����̸�, �����ǰ� �Բ� ����Ͻÿ�.
SELECT team_id, player_name, position, height,
        NTILE(5) OVER (ORDER BY height DESC) as QUAR_SAL
FROM player
WHERE height is not null;

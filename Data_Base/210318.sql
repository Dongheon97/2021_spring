-- PLAYER ���̺� �����԰� 200kg �̻��� 4���� �����͸� INSERT �ϴ� SQL���� 4�� �ۼ��ϰ� ���� ��
INSERT INTO player VALUES ('210301', '��Ų���', 'K04', '', '', '2021', 'MF', 23, 'FRA', NULL, '2', 178, 230); 
INSERT INTO player VALUES ('210302', 'Ʈ�����', 'K03', '', '', '2021', 'ST', 10, 'ENG', NULL, '3', 184, 400);
INSERT INTO player VALUES ('210303', '�����', 'K01', '', '', '2021', 'CB', 4, 'KOR', NULL, '1', 198, 350);
INSERT INTO player VALUES ('210304', '�ް��̾�', 'K01', '', '', '2021', 'CB', 5, 'ENG', NULL, '5', 189, 205);

-- SELECT ���� Ȱ���Ͽ� 4���� ���� ���� ��θ� ����϶�.
SELECT *
FROM player
WHERE WEIGHT>=200;

-- ������ �����԰� 200kg �̻��� �� 4���� ������, [����2-1]�� �����Ͽ� 4���� NICKNAME�� "TB"�� UPDATE �ϴ� SQL���� �ۼ�
UPDATE player
SET NICKNAME = 'TB'
where WEIGHT>=200;

-- ������ ������ ��ȸ�ϴ� �ѱ� ���ǹ��� SQL���� �ۼ��ϰ� ���� ��, �� ����� ����϶�. (��, �ռ� ������(||)�� ��� �����ڸ� ���� 3�� �̻� ����ϼ���.) 
-- BMI ������ 24.00 ���� ū �������� �����Ͽ� ���� �̸�, Ű, ������, BMI ������ ���ʷ� ����϶�.
SELECT PLAYER_NAME || ' ����,' || HEIGHT || 'cm, ' || WEIGHT || 'kg, ('  || 
ROUND(WEIGHT/((HEIGHT/100)*(HEIGHT/100)), 2) || ' BMI)' "BMI������ 24.00���� ū ����"
FROM player
WHERE ROUND(WEIGHT/((HEIGHT/100)*(HEIGHT/100)), 2) >= 24.00;

-- 3�� �̻��� �÷��� IN, LIKE�� �̿��Ͽ� �˻��ϴ� �ѱ� ���ǹ��� SQL���� �ۼ��ϰ� �� ����� ����϶�. (�̸�, ����, ������)
-- 
SELECT *
FROM player
WHERE team_id IN ('K01', 'K02') AND POSITION LIKE '_F' AND join_yyyy LIKE '%1';

-- AND, NOT, IS NULL�� �����ϴ� �ѱ� ���ǹ��� SQL���� �ۼ��ϰ� �� ����� ����϶�.
-- Ű�� 170-180cm ����(AND)�� �ƴ�(NOT) ���� �� ���ȣ�� ����(IS NULL) ������ ����϶�.
SELECT *
FROM player
WHERE BACK_NO IS NULL AND NOT HEIGHT BETWEEN 170 AND 180; 

-- BACK_NO�� ���� ����� �߿��� ���� �达�� ����鸸 ��ȸ�ϴ� SQL���� �ۼ��ϰ� �� ����� ����϶�.
SELECT *
FROM player
WHERE player_name LIKE '��%' AND back_no IS NULL;

-- IS NULL�� ROWNUM�� ����Ͽ� 2���� ���� ��ȸ�ϴ� �ѱ� ���ǹ��� SQL���� �ۼ��ϰ� ����϶�.
-- ������ ��ϵ��� ���� ���� 2���� ����϶�.
SELECT *
FROM player
WHERE ROWNUM <=2 AND nation IS NULL;
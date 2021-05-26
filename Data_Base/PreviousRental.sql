-- ����
-- PREVIOUS_TABLE�� ISBN�� CNO�� ����Ͽ� �뿩�� ����� �ִ� å ����� �뿩�� �� �̸��� ����Ͻÿ�.
SELECT p.isbn "ISBN", e.title "����", p.cno "�� ID", c.name "�� �̸�" 
FROM previous_rental p join customer c ON p.cno = c.cno
    JOIN ebook e ON p.isbn = e.isbn;

-- �׷� �Լ�
-- ������ ���� ���� �뿩�� ������� ���� cno, �̸��� �뿩 Ƚ���� ����ϴ� sql���� �ۼ��Ͻÿ�(�ݳ��� å���� ������� �ۼ��Ѵ�).
SELECT p.cno "�� ID", c.name "�� �̸�", count(*) "���� Ƚ��" 
FROM previous_rental p join customer c ON p.cno = c.cno
GROUP BY p.cno, c.name
ORDER BY count(*) DESC;

-- ������ �Լ�
-- �泲���б� �������� 2021�� 12�� 31�� �������� �����Ϸ��� �Ѵ�. ���ݱ��� å �뿩�� ���� ���� �� ����� ������ �û��� �����̴�. 
-- PREVIOUS_RENTAL ���̺��� ����Ͽ� ������ �ĺ� ������ ����ϴ� sql���� �ۼ��Ͻÿ�. (�뿩�� �ݳ� Ƚ���� ����)
SELECT p.cno "�� ID", c.name "�� �̸�", count(*) "�뿩-�ݳ� Ƚ��", RANK() OVER (ORDER BY count(*) DESC) as "������ �ĺ�" 
FROM previous_rental p join customer c ON p.cno = c.cno
GROUP BY p.cno, c.name;
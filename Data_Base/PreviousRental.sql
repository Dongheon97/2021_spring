-- 조인
-- PREVIOUS_TABLE의 ISBN과 CNO를 사용하여 대여된 기록이 있는 책 제목과 대여한 고객 이름을 출력하시오.
SELECT p.isbn "ISBN", e.title "제목", p.cno "고객 ID", c.name "고객 이름" 
FROM previous_rental p join customer c ON p.cno = c.cno
    JOIN ebook e ON p.isbn = e.isbn;

-- 그룹 함수
-- 도서를 가장 많이 대여한 순서대로 고객의 cno, 이름과 대여 횟수를 출력하는 sql문을 작성하시오(반납한 책들을 대상으로 작성한다).
SELECT p.cno "고객 ID", c.name "고객 이름", count(*) "대출 횟수" 
FROM previous_rental p join customer c ON p.cno = c.cno
GROUP BY p.cno, c.name
ORDER BY count(*) DESC;

-- 윈도우 함수
-- 충남대학교 도서관은 2021년 12월 31일 독서왕을 선발하려고 한다. 지금까지 책 대여를 가장 많이 한 사람을 독서왕 시상할 예정이다. 
-- PREVIOUS_RENTAL 테이블을 사용하여 독서왕 후보 순위를 출력하는 sql문을 작성하시오. (대여는 반납 횟수로 정함)
SELECT p.cno "고객 ID", c.name "고객 이름", count(*) "대여-반납 횟수", RANK() OVER (ORDER BY count(*) DESC) as "독서왕 후보" 
FROM previous_rental p join customer c ON p.cno = c.cno
GROUP BY p.cno, c.name;
CREATE TABLE CUSTOMER(
cno NUMBER(5) NOT NULL,
name VARCHAR(20),
password VARCHAR(15),
email VARCHAR2(30),
CONSTRAINT customer_pk PRIMARY KEY (cno),
CONSTRAINT customer_uq UNIQUE (email),
CONSTRAINT CHK_cno CHECK (cno>=0)
);

CREATE TABLE EBOOK(
isbn NUMBER(5) NOT NULL,
title VARCHAR2(50),
publisher VARCHAR2(50),
year DATE,
cno NUMBER(5),
extTimes NUMBER(1) CHECK (extTimes>=0 AND extTimes<=2),
dateRented DATE,
dateDue DATE,
CONSTRAINT ebook_pk PRIMARY KEY (isbn),
CONSTRAINT ebook_fk FOREIGN KEY (cno) REFERENCES CUSTOMER(cno)
);

CREATE TABLE RESERVATION(
isbn NUMBER(5) NOT NULL,
cno NUMBER(5) NOT NULL,
reservationTime DATE,
CONSTRAINT reservation_fk1 FOREIGN KEY (isbn) REFERENCES EBOOK(isbn),
CONSTRAINT reservation_fk2 FOREIGN KEY (cno) REFERENCES CUSTOMER(cno)
);

CREATE TABLE PREVIOUS_RENTAL(
isbn NUMBER(5) NOT NULL,
dateRented DATE NOT NULL,
dateReturned DATE NOT NULL,
cno NUMBER(5) NOT NULL,
CONSTRAINT previousRental_pk PRIMARY KEY (isbn, dateRented),
CONSTRAINT previousRental_fk1 FOREIGN KEY (isbn) REFERENCES EBOOK(isbn),
CONSTRAINT previousRental_fk2 FOREIGN KEY (cno) REFERENCES CUSTOMER(cno)
);

CREATE TABLE AUTHORS(
isbn NUMBER(5) NOT NULL,
author VARCHAR(50) NOT NULL,
CONSTRAINT authors_pk PRIMARY KEY (author),
CONSTRAINT authors_fk FOREIGN KEY (isbn) REFERENCES EBOOK(isbn)
);

DESCRIBE customer;
DESCRIBE ebook;
DESCRIBE reservation;
DESCRIBE previous_rental;
DESCRIBE authors;

CREATE VIEW ReservationInfo
AS
SELECT ebook.isbn as "예약 도서 ISBN", ebook.title "예약 도서 제목", customer.cno "예약 고객 CNO", 
        customer.name "예약 고객 이름", NVL(customer.email,0) "예약 고객 이름", reservation.reservationtime "예약시간"
FROM customer, reservation, ebook
WHERE reservation.isbn = ebook.isbn AND reservation.cno = customer.cno
ORDER BY reservation.reservationTime DESC;

select ReservationInfo, text
from user_views;





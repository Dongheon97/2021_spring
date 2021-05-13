CREATE TABLE CUSTOMER(
cno CHAR(10) NOT NULL,
name VARCHAR(20) NOT NULL,
password VARCHAR(15) NOT NULL,
email VARCHAR2(30),
CONSTRAINT customer_pk PRIMARY KEY (cno)
);

CREATE TABLE EBOOK(
isbn CHAR(14) NOT NULL,
title VARCHAR2(30) NOT NULL,
publisher VARCHAR2(15),
year CHAR(4),
cno CHAR(10) NOT NULL,
extTimes CHAR(8),
dateRented CHAR(8),
dateDue CHAR(8),
CONSTRAINT ebook_pk PRIMARY KEY (isbn),
CONSTRAINT ebook_fk FOREIGN KEY (cno) REFERENCES CUSTOMER(cno)
);

CREATE TABLE RESERVATION(
isbn CHAR(14) NOT NULL,
cno CHAR(10) NOT NULL,
reservationTime CHAR(8) NOT NULL,
CONSTRAINT reservation_fk1 FOREIGN KEY (isbn) REFERENCES EBOOK(isbn),
CONSTRAINT reservation_fk2 FOREIGN KEY (cno) REFERENCES CUSTOMER(cno)
);

CREATE TABLE PREVIOUS_RENTAL(
isbn CHAR(14) NOT NULL,
dateRented CHAR(8) NOT NULL,
dateReturned CHAR(8),
cno CHAR(10) NOT NULL,
CONSTRAINT previousRental_pk PRIMARY KEY (dateRented),
CONSTRAINT previousRental_fk1 FOREIGN KEY (isbn) REFERENCES EBOOK(isbn),
CONSTRAINT previousRental_fk2 FOREIGN KEY (cno) REFERENCES CUSTOMER(cno)
);

CREATE TABLE AUTHORS(
isbn CHAR(14) NOT NULL,
author VARCHAR(20) NOT NULL,
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



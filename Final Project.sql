CREATE DATABASE Libraries

CREATE TABLE library_branch (
	branch_id INT PRIMARY KEY NOT NULL,
	branch_name VARCHAR (50) NOT NULL, 
	branch_address VARCHAR (50) NOT NULL
);

INSERT INTO library_branch
	(branch_id, branch_name, branch_address)
	VALUES
	(1, 'Sharpstown', '897 Aberdeen Dr.'),
	(2, 'Englewood', '302 Fey Blv.'), 
	(3, 'Central', '495 Haven Way.'),
	(4, 'Sartosa', '495 Haven Way.')
; 

CREATE TABLE publisher (
	publisher_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	publisher_name VARCHAR (50) NOT NULL, 
	publisher_address VARCHAR (50) NOT NULL,
	publisher_phone BIGINT NOT NULL
);

INSERT INTO publisher
	(publisher_name, publisher_address, publisher_phone)
	VALUES
	('Archaic Bindings', '1403 Skalitz Rd.', 9093482985),
	('Dystopian Distributors', '1984 Cynic St.', 4025941948),
	('Atompunk Acolytes', '2001 Clarke Rd.', 50410592846)
;	 

CREATE TABLE books (
	book_id INT PRIMARY KEY NOT NULL,
	book_title VARCHAR (100) NOT NULL,
	publisher_name VARCHAR (100) NOT NULL
);

INSERT INTO books
	(book_id, book_title, publisher_name)
	VALUES
	(1, 'Salem''s Lot', 'Archaic Bindings'),
	(2,	'High Rise', 'Dystopian Distributors'),
	(3, 'For Whom The Bell Tolls', 'Archaic Bindings'),
	(4, 'Cujo', 'Archaic Bindings'),
	(5, 'Mortal Engines', 'Atompunk Acolytes'),
	(6, 'A Game of Thrones', 'Archaic Bindings'),
	(7, 'Annihilation', 'Dystopian Distributors'),
	(8, 'A Clockwork Orange', 'Dystopian Distributors'),
	(9, 'The Hunt for Red October', 'Atompunk Acolytes'),
	(10, 'Ship It', 'Archaic Bindings'),
	(11, 'Paradise Lost', 'Archaic Bindings'),
	(12, 'Frankenstein', 'Archaic Bindings'),
	(13, 'The Da Vinci Code', 'Dystopian Distributors'),
	(14, 'The Misadventures of Benjamin Bartholomew Piff: You Wish', 'Archaic Bindings'),
	(15, '2001: A Space Odyssey', 'Atompunk Acolytes'),
	(16, 'A Series of Unfortunate Events: The Bad Beginning', 'Dystopian Distributors'), 
	(17, 'Fahrenheit 451', 'Dystopian Distributors'),
	(18, 'Equus', 'Archaic Bindings'),
	(19, 'The Haunting of Hill House', 'Archaic Bindings'),
	(20, 'The Catcher in the Rye', 'Archaic Bindings'),
	(21, 'The Lost Tribe', 'Dystopian Distributors')
;

CREATE TABLE book_authors (
	book_authors_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	book_id INT NOT NULL, 
	author_name VARCHAR (50) NOT NULL,
	CONSTRAINT FK1_book_id FOREIGN KEY (book_id)
	REFERENCES books(book_id),
);

INSERT INTO book_authors
	(book_id, author_name)
	VALUES
	(1, 'Stephen King'),
	(2, 'J.G. Ballard'),
	(3, 'Ernest Hemingway'),
	(4, 'Stephen King'),
	(5, 'Philip Reeve'),
	(6, 'George R. R. Martin'),
	(7, 'Jeff VanderMeer'),
	(8, 'Anthony Burgess'),
	(9, 'Tom Clancy'),
	(10, 'Britta Ludin'),
	(11, 'John Milton'),
	(12, 'Mary Shelley'),
	(13, 'Dan Brown'),
	(14, 'Jason Lethcoe'),
	(15, 'Arthur C. Clarke'), 
	(16, 'Lemony Snicket'),
	(17, 'Ray Bradbury'),
	(18, 'Peter Shaffer'),
	(19, 'Shirley Jackson'),
	(20, 'J. D. Salinger'),
	(21, 'Josephine Estell')
;

CREATE TABLE book_copies (
	book_id INT NOT NULL,
	branch_id INT NOT NULL,
	number_of_copies INT NOT NULL,
	CONSTRAINT FK2_book_id FOREIGN KEY (book_id)
	REFERENCES books(book_id),
);

INSERT INTO book_copies 
	(book_id, branch_id, number_of_copies)
	VALUES
	/*CENTRAL LIBRARY*/
	(4, 3, 2),
	(1, 3, 2),
	(9, 3, 2),
	(18, 3, 2),
	(19, 3, 2),
	(3, 3, 2),
	(7, 3, 2), 
	(5, 3, 2), 
	(2, 3, 2),
	(8, 3, 2),
	/*SHARPSTOWN LIBRARY*/
	(5, 1, 2),
	(21, 1, 2),
	(8, 1, 2),
	(9, 1, 2),
	(17, 1, 2),
	(14, 1, 2), 
	(16, 1, 2),
	(7, 1, 2),
	(3, 1, 2),
	(4, 1, 2),
	/*ENGLEWOOD LIBRARY*/
	(6, 2, 2),
	(10, 2, 2),
	(11, 2, 2), 
	(12, 2, 2),
	(20, 2, 2),
	(15, 2, 2),
	(13, 2, 2), 
	(5, 2, 2),
	(8, 2, 2), 
	(1, 2, 2),
	/*SARTOSA LIBRARY*/
	(2, 4, 2), 
	(9, 4, 2),
	(18, 4, 2),
	(15, 4, 2),
	(12, 4, 2),
	(3, 4, 2),
	(7, 4, 2),
	(10, 4, 2),
	(6, 4, 2),
	(5, 4, 2)
;

CREATE TABLE book_loans (
	book_loans_id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	book_id INT NOT NULL,
	branch_id INT NOT NULL,
	card_no INT NOT NULL,
	date_out DATE NOT NULL,
	date_due DATE NOT NULL,
	CONSTRAINT FK3_book_id FOREIGN KEY (book_id)
	REFERENCES books(book_id),
);

INSERT INTO book_loans 
	(book_id, branch_id, card_no, date_out, date_due)
	VALUES
	/*1-10 (NUMBER OF LOANS)*/
	(1,3,1,'2018-09-22', '2019-02-01'),
	(1,3,2,'2018-12-14', '2019-03-02'),
	(2,3,3,'2018-12-16', '2019-01-18'),
	(2,2,4,'2018-12-18', '2019-10-19'),
	(3,3,5,'2018-11-24', '2019-05-19'),
	(3,1,6,'2018-08-15', '2019-02-20'),
	(4,3,7,'2018-12-09', '2019-01-08'),
	(4,1,8,'2018-11-02', '2019-02-20'),
	(5,2,9,'2018-12-05', '2019-02-06'),
	(5,4,10,'2018-07-23', '2019-01-07'),
	/*11-20*/
	(6,2,11,'2018-10-06', '2019-04-02'),
	(6,4,12,'2018-10-19', '2019-01-15'),
	(7,4,13, '2018-11-01','2019-01-11'),
	(7,1,14, '2018-09-12', '2019-02-20'),
	(8,3,15, '2018-07-12', '2019-02-02'),
	(8,1,16, '2018-06-12', '2019-01-03'),
	(9,1,17, '2018-06-11', '2019-02-04'),
	(9,4,18, '2018-04-10', '2019-01-03'),
	(10,2,19,'2018-07-09', '2019-01-04'),
	(10,4,20, '2018-06-03', '2019-02-09'),
	/*21-30*/
	(11,2,21, '2018-07-12', '2019-03-05'),
	(11,4,22, '2018-08-12', '2019-02-04'),
	(12,2,23, '2018-09-01', '2019-01-22'),
	(12,4,24, '2018-10-10', '2019-05-15'),
	(13,2,25, '2018-11-04', '2019-04-02'),
	(13,2,26, '2018-08-05', '2019-02-01'), 
	(14,1,27, '2018-09-10', '2019-03-04'),
	(14,1,28, '2018-08-01', '2019-01-10'),
	(15,2,29, '2018-07-01', '2019-02-03'),
	(15,4,30, '2018-06-20', '2019-05-30'),
	/*31-40*/
	(16,1,31, '2018-10-15', '2019-04-21'),
	(16,1,32, '2018-02-16', '2018-08-25'),
	(17,1,33, '2017-05-18', '2017-11-04'),
	(17,1,34, '2017-07-20', '2017-08-10'),
	(18,3,35, '2016-05-15', '2016-10-12'),
	(18,4,36, '2016-06-12', '2016-12-01'),
	(19,3,37, '2017-08-18', '2018-01-03'),
	(19,3,38, '2016-09-13', '2016-12-06'),
	(20,2,39, '2015-10-17', '2016-05-05'),
	(20,2,40, '2018-03-14', '2018-08-24'),
	/*41-54*/
	(21,1,52, '2018-02-15', '2019-03-15'),
	(21,1,52, '2018-06-22', '2019-12-23'),
	(2,3,43, '2018-05-25', '2018-11-17'),
	(2,4,52, '2019-01-14', '2019-02-15'),
	(3,3,52, '2018-02-20', '2018-08-19'),
	(3,1,52, '2015-05-26', '2019-10-18'),
	(4,3,52, '2017-03-15', '2019-06-29'),
	(4,1,48, '2018-08-19', '2019-01-30'),
	(5,2,49, '2018-04-02', '2018-04-20'),
	(5,4,50, '2016-07-09', '2016-12-05'),
	(6,2,51, '2018-11-18', '2019-03-10'),
	(6,4,51, '2018-12-19', '2019-04-05'),
	(7,3,52, '2018-12-20', '2019-04-10'),
	(8,1,52, '2018-12-02', '2019-03-11')
;

CREATE TABLE borrower (
	card_no INT PRIMARY KEY NOT NULL,
	borrower_name VARCHAR (50) NOT NULL,
	borrower_address VARCHAR (50) NOT NULL,
	borrower_phone BIGINT NOT NULL
);

INSERT INTO borrower
	(card_no, borrower_name, borrower_address, borrower_phone)
	VALUES
	(52, 'Luna_Campbell', '4590 Hallow St.', 8303920481),
	(51, 'Randy_Eckford', '205 Walton Way.', 8302917456),
	(1, 'Melissa_Houndsmouth', '9480 Trevor Ln.', 8302917586),
	(2, 'Oswald_Lepus', '285 Rabbit Ave.', 8307591831),
	(3, 'Joan_Marcus', '431 Burrow Blv.', 3910485030),
	(4, 'Avery_Winslow', '38 Canpoy St.', 8308291567),
	(5, 'Joseph_Magnolia', '1910 Deco Dr.', 3910481395),
	(6, 'Christopher Ahnk', '992 Eliza Ave.', 3913027469),
	(53, 'Manfred Ortensia', '597 Abbot Ave.', 3915042876),
	(54, 'Valentine McDodd', '686 Meridian St.', 8309286760)
;




DROP TABLE borrower

DROP TABLE book_loans

DROP TABLE book_copies

DROP TABLE book_authors

DROP TABLE books

DROP TABLE publisher

DROP TABLE library_branch

DROP DATABASE Libraries
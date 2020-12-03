-- Base de données Bibliothèque 

DROP DATABASE IF EXISTS usal37_bibli;

CREATE DATABASE IF NOT EXISTS usal37_bibli;

USE usal37_bibli;


CREATE TABLE clients 
(
	client_id INT auto_increment,
    client_lastname VARCHAR(50) NOT NULL,
    client_firstname VARCHAR(50) NOT NULL,
    client_address VARCHAR(255) NOT NULL,
    client_deposit DECIMAL(5,2) NOT NULL,
    PRIMARY KEY (client_id)
);

CREATE TABLE books 
(
	book_id INT auto_increment,
    book_title VARCHAR(50) NOT NULL,
    book_editor VARCHAR(50) NOT NULL,
    book_buy_date DATE NOT NULL,
    book_state VARCHAR(50) NOT NULL,
    book_authors VARCHAR(255) NOT NULL,
    PRIMARY KEY (book_id)
);

CREATE TABLE books_clients
(
	book_id INT,
    client_id INT,
	borrow_date DATE NOT NULL,
    borrow_return DATE NULL,
    PRIMARY KEY (book_id, client_id), 
    FOREIGN KEY (book_id) REFERENCES books(book_id),
    FOREIGN KEY (client_id) REFERENCES clients(client_id)
);


INSERT INTO clients
(client_lastname, client_firstname, client_address, client_deposit)
VALUES
('DEV', 'Mike', 'AAAA', 9.50),
('Dupond', 'Jean', 'BBB', 4.50),
('Neymar', 'Jean', 'CCC', 29);


INSERT INTO books
(book_title, book_editor, book_buy_date, book_state, book_authors)
VALUES 
('L\'orientalisme', 'Hachette', '1998-02-20', 'Neuf', 'Romain'),
('One Piece', 'Editeur1', '2005-04-12', 'Légèrement abimé', 'Felix'),
('Le langage SQL par la pratique', 'GOT', '2010-10-02', 'OK', 'Jacques');


INSERT INTO books_clients
(book_id, client_id, borrow_date, borrow_return)
VALUES
(1, 1, '2019-11-19', '2020-11-21'),
(2, 1, '2020-11-17', '2020-11-28'),
(3, 2, '2020-11-18', '2020-11-19'),
(3, 3, '2020-11-19', NULL);


SELECT * FROM clients;
SELECT * FROM books;
SELECT * FROM books_clients;


SELECT 
borrow_date, borrow_return, client_lastname, client_deposit
FROM books_clients
JOIN clients ON books_clients.client_id = clients.client_id
;



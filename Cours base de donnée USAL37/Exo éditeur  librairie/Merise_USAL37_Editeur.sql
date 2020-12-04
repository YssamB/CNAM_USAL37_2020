-- Suppression de la base de données usal37_editeur 
DROP DATABASE IF EXISTS usal37_editeur;

-- Création de la base de données usal37_editeur 
CREATE DATABASE IF NOT EXISTS usal37_editeur;

-- Sélectionner la base de données 
USE usal37_editeur; 


-- Création de la table shops 
CREATE TABLE shops
(
	shop_name VARCHAR(50) PRIMARY KEY,
    shop_address VARCHAR(255) NOT NULL
);


-- Création de la table authors  
CREATE TABLE authors
(
	author_lastname VARCHAR(50),
    author_firstname VARCHAR(50),
    author_pseudo VARCHAR(50) NULL,
    author_percentage INT NOT NULL,
    PRIMARY KEY (author_lastname, author_firstname)
);


-- Création de la table books  
CREATE TABLE books 
(
	book_isbn CHAR(20) PRIMARY KEY,
    book_title VARCHAR(255) NOT NULL,
    book_price DECIMAL(5,2) NOT NULL, 
    book_reward VARCHAR(255) NULL
);


-- Création de la table editions  
CREATE TABLE editions 
(
	edition_isbn CHAR(20),
    edition_date DATE NOT NULL,
    edition_order TINYINT UNSIGNED NOT NULL,
    edition_nb INT UNSIGNED NOT NULL,
    book_isbn CHAR(20) NOT NULL, 
    PRIMARY KEY (edition_isbn),
    FOREIGN KEY (book_isbn) REFERENCES books(book_isbn)
);


-- ajout de données de test dans la table authors   
INSERT INTO authors 
(author_lastname, author_firstname, author_pseudo, author_percentage) 
VALUES 
('Salten', 'Felix', NULL, 10),
('Doe', 'Maria', 'Madoe', 8);


-- ajout de données de test dans la table shops 
INSERT INTO shops 
(shop_name, shop_address) 
VALUES
('Magasin 1', '11 rue de Paris' ),
('Magasin 2', '11 rue de Mulhouse' ),
('Bookshop 3', '22 rue de Paris' ),
('Magasin 4', '33 rue de Strasbourg' );


-- ajout de données de test dans la table books 
INSERT INTO books 
(book_isbn, book_title, book_price, book_reward) 
VALUES 
('2020A', "L'orientalisme", 19.99, NULL),
('2019A', "One Piece", 6.99, 'Manga 2019'),
('1920A', "Le langage SQL par la pratique", 39, NULL),
('2007A', "Le Horla", 9.50, NULL);


-- ajout de données de test dans la table books (syntaxe alternative)  
INSERT INTO books 
VALUES 
('1954B', 'Bambi', 29.50, 'Goncourt');


-- ajout de données de test dans la table editions  
INSERT INTO editions
(edition_isbn, edition_date, edition_order, edition_nb, book_isbn) 
VALUES 
('AAAA', '2018-02-25', 1, 150, '2020A'),
('AAAB', '2019-10-02', 2, 207, '1954B');



SELECT * FROM books;
SELECT * FROM shops;
SELECT * FROM editions;
SELECT * FROM authors;

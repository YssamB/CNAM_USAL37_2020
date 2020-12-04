USE usal37_editeur;
-- mettre à jour le livre 2019A, nouveau prix 5.50€
UPDATE books SET book_price=5.50 WHERE book_isbn = "2019A";

-- soustraire 5€ de tout les livres supérieurs à 20€
UPDATE books SET book_price=book_price-5 WHERE book_price > 20;

-- supprimer le livre dont l'isbn correspond à 2007A
DELETE FROM books WHERE book_isbn = "2007A";

SELECT * FROM books;

USE usal37_editeur; 

SELECT shops.* FROM shops; 

SELECT shop_name, shop_address 
FROM shops;


-- sélection du magasin dont le nom est égal à "Magasin 1" 
SELECT shop_name, shop_address 
FROM shops WHERE shop_name = 'Magasin 1';

-- sélection des magasins dont le nom est différent de "Magasin 1" 
SELECT shop_name, shop_address 
FROM shops WHERE shop_name <> 'Magasin 1';

-- sélection des magasins dont le nom commence par "Mag" 
SELECT shop_name, shop_address 
FROM shops WHERE shop_name LIKE 'Mag%';

-- sélection des magasins dont le nom se termine par "4" 
SELECT shop_name, shop_address 
FROM shops WHERE shop_name LIKE '%4';

-- sélection des magasins dont le nom contient "sin" 
SELECT shop_name, shop_address 
FROM shops WHERE shop_name LIKE '%sin%';

-- sélection des magasins dont le nom ne contient pas "sin" 
SELECT shop_name, shop_address 
FROM shops WHERE shop_name NOT LIKE '%sin%';

-- sélection des magasins dont le nom est égal à "Magasin 2" ou "Bookshop 3" 
SELECT shop_name 
FROM shops WHERE shop_name IN ('Magasin 2', 'Bookshop 3');

-- sélection des magasins dont le nom est différent de "Magasin 2" ou "Bookshop 3" 
SELECT shop_name 
FROM shops WHERE shop_name NOT IN ('Magasin 2', 'Bookshop 3');




-- selection des livres dont le prix est égal à 19.99 
SELECT book_isbn, book_title, book_price
FROM books 
WHERE book_price = '19.99';

-- selection des livres dont le prix est inférieur à 20 € 
SELECT book_isbn, book_title, book_price, book_reward
FROM books 
WHERE book_price < 20;

-- selection des livres dont le prix est supérieur à 20 € 
SELECT book_isbn, book_title, book_price, book_reward
FROM books 
WHERE book_price > 20;


-- selectionner tous les livres qui ont reçu une récompense 
-- selection des livres dont la valeur de book_reward est différente de NULL
SELECT book_isbn, book_title, book_price, book_reward
FROM books 
WHERE book_reward IS NOT NULL; 

-- selectionner tous les livres qui n'ont pas reçu de récompense 
-- selection des livres dont la valeur de book_reward est égale à NULL
SELECT book_isbn, book_title, book_price, book_reward
FROM books 
WHERE book_reward IS NULL; 


-- selectionner tous les livres qui n'ont pas reçu de récompense 
-- et dont le prix est inférieur à 20 €
-- et dont le titre contient "H"
SELECT book_isbn, book_title, book_price
FROM books 
WHERE book_reward IS NULL 
AND book_price < 20 
AND book_title LIKE '%L%'; 


-- selectionner tous les livres dont le prix se situe entre 10€ et 30€

SELECT book_isbn, book_title, book_price, book_reward
FROM books 
WHERE book_price BETWEEN 10 AND 30; 

-- sélectionner tout les livres 
-- dont le prix est inférieur à 10€ 
-- ET dont le isbn commence par 2
-- OU qui ont reçu un prix

SELECT book_isbn, book_title, book_price, book_reward
FROM books 
WHERE book_price < 10 
AND book_isbn LIKE '2%'
OR book_reward IS NOT NULL;





 



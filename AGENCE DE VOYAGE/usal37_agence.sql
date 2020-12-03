-- SQL 
-- DDL (CREATE DROP ALTER)
-- DML (INSERT UPDATE DELETE)
-- DQL (SELECT)

DROP DATABASE IF EXISTS usal37_agence;

CREATE DATABASE usal37_agence DEFAULT CHARACTER SET 'utf8';

USE usal37_agence;

CREATE TABLE countries
(
	country_code CHAR(2),
    country_name VARCHAR(128) NOT NULL,
    PRIMARY KEY (country_code)
);

CREATE TABLE cities
( 
	city_code INT AUTO_INCREMENT,
    city_name VARCHAR(128) NOT NULL,
    country_code CHAR(2) NOT NULL,
	PRIMARY KEY (city_code)
);

CREATE TABLE trips
(
	trip_code INT AUTO_INCREMENT,
    trip_title VARCHAR(128) NOT NULL,
    trip_available INT NOT NULL,
    trip_start DATETIME NOT NULL,
    trip_end DATETIME NOT NULL,
    trip_price DECIMAL(7,2) NOT NULL,
    trip_overview TEXT NOT NULL,
    trip_description MEDIUMTEXT,
    city_code INT NOT NULL,
    PRIMARY KEY (trip_code)
);
/*
TINYINT = 255 valeurs (-128 à +127)
SMALLINT = 65000 valeurs (-32000 à +32000)
MEDIUMINT = 16 millions de valeurs (-800 000 à +800 000)
INT = 4 milliards de valeurs (-2 milliards à 2 milliards)
BIGINT = 2^63 valeurs possibles (-2^63 à +2^64-1)

TINYTEXT = 255 caractère max  			 	0.25 ko
TEXT = 65535 caractère max   				64 ko
MEDIUMTEXT = 16 millions caractère max    	16 mb
LONGTEXT = 4 milliards caractère max 		4 go

TINYBLOB
BLOB
MEDIUMBLOB
LONGBLOB

-- contraintes de clés étrangèreset
-- 2 syntaxes possibles

/*
ALTER TABLE cities
ADD COLUMN coutry_code CHAR(2) NOT NULL;

ALTER TABLE cities
MODIFY COLUMN
 
ALTER TABLE cities
DROP COLUMN
*/

/* ALTER TABLE cities
ADD
FOREIGN KEY (country_code) REFERENCES countries(country_code);
*/

ALTER TABLE cities
ADD CONSTRAINT fk_cities_countries
FOREIGN KEY (country_code) REFERENCES coutries(country_code);

ALTER TABLE trips
ADD CONSTRAINt fk_trips_cities
FOREIGN KEY (city_code) REFERENCES cities(city_code);

INSERT INTO countries
(country_code, country_name)
VALUE
('FR', 'Fance'),
('DE', 'Allemange'),
('BE', 'Belgique'),
('IT', 'Italie'),
('MA', 'Maroc'),
('UA', 'Ukraine'),
('GB', 'Écosse');

INSERT INTO cities
(city_name, country_code)
VALUE
('Paris', 'FR'),
('Mulhouse', 'FR'),
('Rust', 'DE'),
('Bruxelles', 'BE'),
('Milan', 'IT'),
('Rome', 'IT'),
('Chernobyl', 'UA'),
('Édimbourg', 'GB'),
('Marrakech', 'MA');

INSERT INTO trips
(
trip_title,
trip_available,
trip_start,
trip_end,
trip_price,
trip_overview,
trip_description,
city_code
)
VALUES 
('Séjour touristique', 			100,	'2021-01-25 18:00:00', '2021-01-31 14:00:00', 899,  't1 overview', 	'trip1 desc', 	9),
('Séjour Gastronomique',		100, 	'2021-02-14 19:30:00', '2021-02-18 08:45:00', 399,  't2 over', 		NULL, 			2),
('Voyage Aventure', 			100, 	'2021-02-21 20:00:00', '2021-02-23 23:30:00', 1299, 't3 over', 		NULL, 			7),
('Destination Vert-Bouteille', 	700,	'2021-03-17 06:45:00', '2021-03-22 20:00:00', 849,	't4 over',		NULL,			8),
('Europa Park',					 99,	'2019-05-15 08:30:00', '2019-05-17 18:00:00',  99,	't5 over',		NULL,			3);

-- Sélectionner les voyages déjà passés.
SELECT trip_code, trip_title, trip_available, trip_start, trip_end, trip_price, trip_overview, trip_description, city_code
FROM trips
WHERE trip_end < NOW()
;

SELECT NOW(); -- dat + heure atm
SELECT CURDATE(); -- date d'aujourdhui
SELECT CURTIME(); -- heure courante 

-- Sélectionner les voyages au départ de Mulhouse.
SELECT trip_code, trip_title, trip_available, trip_start, trip_end, trip_price, trip_overview, trip_description, cities.city_code, city_name
FROM trips
JOIN cities ON trips.city_code = cities.city_code
WHERE cities.city_name='Mulhouse';

-- Sélectionner tous les voyages.
	-- (nom de la ville, code pays et nom du pays)
SELECT 
trip_code, trip_title, trip_available, trip_start, trip_end, trip_price, trip_overview, trip_description,
cities.city_code, city_name, countries.country_code, country_name
FROM trips
JOIN cities ON trips.city_code = cities.city_code
JOIN countries ON cities.country_code = countries.country_code;

SELECT * FROM trips;

SELECT city_code, city_name, countries.country_code, country_name
FROM cities
JOIN countries ON cities.country_code = countries.country_code
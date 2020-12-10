/*
1) 	Créer la table "sales" (commerciaux) et ajouter 5 commerciaux

2) 	Créer la table "clients" et ajouter 5 clients dans la table
	Chaque client est associé à un commercial différent 
    
3) 	Sélectionnez tous les clients (nom du commercial associé inclus)
*/

use usal37_agence;

CREATE TABLE clients
(
	client_id INT AUTO_INCREMENT,
    client_lastname VARCHAR(32) NOT NULL,
    client_firstname VARCHAR(32) NOT NULL,
    client_email VARCHAR(128) NOT NULL,
    client_phone VARCHAR(16) NOT NULL,
    client_added DATE NOT NULL,
    client_password VARCHAR(60) NOT NULL,
    com_code VARCHAR(5) NOT NULL,
    PRIMARY KEY (client_id)
);

CREATE TABLE sales
(
	com_code VARCHAR(5),
    com_name VARCHAR(64) NOT NULL,
    com_password VARCHAR(60) NOT NULL,
    PRIMARY KEY (com_code)
);

ALTER TABLE clients
ADD CONSTRAINT fk_clients_sales
FOREIGN KEY (com_code) REFERENCES sales (com_code);

INSERT INTO clients
(
    client_lastname, 
	client_firstname,
	client_email,
	client_phone,
	client_added,
    client_password,
    com_code
)
VALUES
('Honnet', 'Andréas',	'honnet.andréas@sardoche.ctsur',	'06 06 06 06 06', 	'2020-11-08',	'azerty', 	'TOTO1'),
('Dupont', 'Arnold',	'dupont.arnold@gmail.com',			'06 01 01 01 01', 	'2020-08-28',	'azerto',	'TOTO2'),
('Castex', 'Jean',		'castex.jean@outlook.con',			'06 12 13 37 02', 	'2020-07-09',	'azerty',	'TOTO3'),
('Jaeger', 'Eren',		'jaeger.eren@paradis.net',			'07 09 11 13 15', 	'2020-03-16',	'azerty', 	'TOTO4'),
('Dragon', 'Luffy',		'dragon.luffy@sabaody.com',			'06 55 55 55 55', 	'2020-12-10',	'azerty',	'TOTO5');

INSERT INTO sales
(
	com_code, 
	com_name, 
	com_password
)
VALUES
('TOTO1', 'Monsieur Yi', 				'2569525456256'),
('TOTO2', 'Titouan Asperge', 			'dqsfgbnhgdfsqsfsghfbf'),
('TOTO3', 'Rachmaninov Sergeï', 		'qdsrgfSQRGSRQGv25'),
('TOTO4', 'Shimada Genji', 				'2569525456256'),
('TOTO5', 'Ahri Potter', 				'qsfdfgdhjkjjhtfsthgjkeqhbthbbvcfcv25');

SELECT * FROM clients 
JOIN sales ON sales.com_code = clients.com_code;

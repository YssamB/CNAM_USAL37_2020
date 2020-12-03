-- Sélection de la base de données
USE usal37_employees;


-- Affichage des donnéses des 4 tyables (contrôle visuel)
SELECT * FROM projects;
SELECT * FROM services;
SELECT * FROM employees;
SELECT * FROM teams;


-- Sélection des employés avec le nom du service auquel ils sont associés
-- Pour sélectionner des données dnas plusieurs tables en 1 seule instruction
-- On utilise les jointures 
-- https://sql.sh/cours/jointures
-- https://sql.sh/cours/jointures/inner-join
SELECT employee_id, employee_name, service_name 
FROM employees  
JOIN services ON employees.service_id = services.service_id;


-- Sélection des employés du service n°1 (avec le nom du service)
-- Utilisation des jointures
-- https://sql.sh/cours/jointures
SELECT 
employee_id, 
employee_name, 
service_name, 
services.service_id 
FROM employees  
JOIN services ON employees.service_id = services.service_id
WHERE services.service_id=1; 


-- Sélection des employés du service N°1 (avec nom du service)
-- Utilisation des alias sur les noms de colonnes (AS)
-- https://sql.sh/cours/alias
SELECT 
employee_id AS IDENTIFIANT, 
employee_name, 
service_name
FROM employees  
JOIN services ON employees.service_id = services.service_id
WHERE services.service_id=1; 


-- Sélection de tous les employés (avec nom du service) 
-- Utilisation des alias sur les noms des tables (AS)
-- https://sql.sh/cours/alias
-- Pour la requête ci-dessous, 
-- la table "employees" est identifiée sous le nom "E"
-- la table "services" est identifiée sous le nom "S"
SELECT 
employee_id, 
employee_name, 
service_name
FROM employees AS E 
JOIN services AS S 
ON E.service_id = S.service_id; 


-- Sélection de tous les employés (nom du manager inclus)
-- Utilisation des alias sur les noms des colonnes et des tables (AS)
-- https://sql.sh/cours/alias
SELECT 
E1.employee_id, 
E1.employee_name,
E2.employee_name AS manager_name 
FROM employees AS E1 
JOIN employees AS E2 
ON E1.employee_id_manager = E2.employee_id;


-- Sélection de tous les employés (nom du manager inclus)
-- Utilisation des jointures GAUCHE (LEFT JOIN)
-- https://sql.sh/cours/jointures/left-join
SELECT 
E1.employee_id, 
E1.employee_name, 
E2.employee_name AS manager_name 
FROM employees AS E1 
LEFT JOIN employees AS E2 
ON E2.employee_id = E1.employee_id_manager;


-- Sélection de tous les employés (nom du manager et du service inclus)
-- Utilisation de plusieurs jointures
-- https://sql.sh/cours/jointures
SELECT 
E1.employee_id, 
E1.employee_name, 
S1.service_name, 
E2.employee_name AS manager_name 
FROM employees AS E1 
LEFT JOIN employees AS E2 ON E2.employee_id = E1.employee_id_manager
JOIN services S1 ON E1.service_id = S1.service_id;



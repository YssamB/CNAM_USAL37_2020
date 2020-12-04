-- Supression de la base de données
DROP DATABASE IF EXISTS usal37_employees;

-- Création de la base de données
CREATE DATABASE IF NOT EXISTS usal37_employees;

-- Sélection de la base de données
USE usal37_employees;



-- Création des tables


CREATE TABLE projects 
(
	project_id INT PRIMARY KEY,
    project_name VARCHAR(50) NOT NULL
);


CREATE TABLE services 
(
	service_id INT PRIMARY KEY,
    service_name VARCHAR(50) NOT NULL
);


CREATE TABLE employees
(
	employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50) NOT NULL,
    employee_id_manager INT NULL,
    service_id INT, 
    FOREIGN KEY (employee_id_manager) REFERENCES employees(employee_id),
    FOREIGN KEY (service_id) REFERENCES services(service_id)
);


CREATE TABLE teams 
(
	project_id INT,
	employee_id INT,
    PRIMARY KEY (project_id, employee_id)
);



-- Insertion du jeu d'essai


INSERT INTO projects 
(project_id, project_name)
VALUES
(1, 'Site wordpress'),
(2, 'Base de données editeur');


INSERT INTO services 
(service_id, service_name)
VALUES
(1, 'Ressources Humaines'),
(2, 'DEV'),
(3, 'COMPTABLE');


INSERT INTO employees 
(employee_id, employee_name, employee_id_manager, service_id)
VALUES
(1, 'Mike', NULL, 1),
(2, 'Dorian', 1, 1),
(3, 'Mélanie', 2, 2),
(4, 'Sami', 2, 2);



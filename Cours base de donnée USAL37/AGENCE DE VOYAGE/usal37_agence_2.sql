DROP DATABASE IF EXISTS usal37_agence_2;

CREATE DATABASE usal37_agence_2 DEFAULT CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci';

USE usal37_agence_2;

CREATE TABLE themes
( 
	theme_code INT AUTO_INCREMENT,
    theme_name VARCHAR(32) NOT NULL UNIQUE,
    theme_description MEDIUMTEXT,
    PRIMARY KEY (theme_code)
);

CREATE TABLE services
(
	service_code INT AUTO_INCREMENT,
    service_name VARCHAR(32) NOT NULL UNIQUE,
    service_description TEXT,
    service_score TINYINT NOT NULL,
    service_commentaire VARCHAR(255),
    PRIMARY KEY (service_code) 
);

CREATE TABLE trips_themes
(
	trip_code INT,
    theme_code INT,
    PRIMARY KEY (trip_code, theme_code)
);
 CREATE DATABASE vet_clinic;
 
 CREATE TABLE animals (
 id INT PRIMARY KEY,
 name CHAR(10) NOT NULL,
 date_of_birth DATE NOT NULL,
 escape_attempts INT NOT NULL,
 neutered BOOLEAN NOT NULL,
 weight_kg DECIMAL NOT NULL
 );

 ALTER TABLE animals ADD COLUMN species VARCHAR(30);
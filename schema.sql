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

 CREATE TABLE IF NOT EXISTs owners(id SERIAL PRIMARY KEY,
full_name VARCHAR(60),
age INT);

CREATE TABLE species(
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
name VARCHAR(50)); 

ALTER TABLE animals DROP COLUMN species; 
 ALTER TABLE animals ADD species_id INT;
 ALTER TABLE animals ADD CONSTRAINT species_constraint FOREIGN KEY (species_id) references species (id);

 ALTER TABLE animals ADD owner_id INT;
 ALTER TABLE animals ADD CONSTRAINT owner_constraint FOREIGN KEY (owner_id) REFERENCES owners (id);

CREATE TABLE vets(id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY, name VARCHAR(20) NOT NULL, age INT NOT NULL, date_of_graduation DATE);

CREATE TABLE specializations (
species_id INT,
vets_id INT,
CONSTRAINT vets_fk FOREIGN KEY(vets_id) REFERENCES vets (id),
CONSTRAINT species_fk FOREIGN KEY(species_id) REFERENCES species (id));

CREATE TABLE visits (animals_id INT,
vets_id INT,
visist_date date,
CONSTRAINT vets_fk
 FOREIGN KEY(vets_id) 
 REFERENCES vets (id),
CONSTRAINT animals_fk 
FOREIGN KEY(animals_id) 
REFERENCES animals (id));

ALTER TABLE owners ADD COLUMN email VARCHAR(120);
create index visits_animals_id ON visits(animals_id);
create index visits_vets_id ON visits(vets_id);
create index owners_email ON owners(email);
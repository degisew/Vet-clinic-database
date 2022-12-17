SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' and '2019-01-01';
SELECT name FROM animals WHERE neutered AND escape_attempts<3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon','Pikachu');
SELECT date_of_birth, name FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered;
SELECT * FROM animals WHERE name NOT IN ('Gabumon');
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

BEGIN;
UPDATE animals SET species='unspecified';
select * from animals;
ROLLBACK;
select * from animals;

BEGIN;
UPDATE animals SET species='digimon' WHERE name LIKE '%mon';
UPDATE animals SET species='pokemon' WHERE species is NULL;
COMMIT;

BEGIN;
TRUNCATE animals;
SELECT * FROM animals;
ROLLBACK;

BEGIN;
DELETE from animals where date_of_birth>'2022-01-01';
SAVEPOINT sp1;
UPDATE animals SET weight_kg=weight_kg*-1;
ROLLBACK to sp1;
UPDATE animals SET weight_kg=weight_kg*-1 WHERE weight_kg<0;
COMMIT;

SELECT count(*) from animals;
 SELECT count(*) from animals where escape_attempts=0;
 SELECT AVG(weight_kg) from animals;
 SELECT neutered, AVG(escape_attempts) FROM animals GROUP BY neutered;
 SELECT MIN(weight_kg),MAX(weight_kg),species from animals GROUP BY species;
 SELECT AVG(escape_attempts),species from animals WHERE date_of_birth BETWEEN '1990-01-01' and '2000-01-01' GROUP BY species;

 SELECT name, owner_id, full_name FROM animals JOIN owners ON animals.owner_id=owners.id where owners.id=4;
 SELECT animals.name, date_of_birth,species.name FROM animals JOIN species ON animals.species_id=species.id WHERE species.name='pokemon';
 SELECT owners.full_name,animals.name FROM animals RIGHT JOIN owners ON animals.owner_id=owners.id;
 SELECT a.name, s.name as species, o.full_name as owner FROM animals a JOIN species s ON a.species_id=s.id JOIN owners o ON a.owner_id=o.id WHERE o.full_name='jennifer orwell' AND s.name='digimon';
 SELECT a.name, a.escape_attempts, o.full_name as owner FROM animals a JOIN owners o ON a.owner_id=o.id WHERE a.escape_attempts=0 and o.full_name='dean winchester';
 SELECT a.name, s.name as species, o.full_name as owner FROM animals a JOIN species s ON a.species_id=s.id JOIN owners o ON a.owner_id=o.id WHERE o.full_name='jennifer orwell' AND s.name='digimon';
 SELECT o.full_name, COUNT(a.name) as total_animals from animals a left join owners o on o.id=a.owner_id group by o.full_name;
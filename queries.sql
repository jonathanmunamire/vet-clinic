/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name ilike '%mon%';
SELECT * FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.3 AND 17.4;

BEGIN;
UPDATE animals SET species = 'unspecified';
ROLLBACK;
UPDATE animals SET species = 'digimon' WHERE name ilike '%mon%';
UPDATE animals SET species = 'pokemon' WHERE species is null;
COMMIT;

BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT SP1;
UPDATE animals SET weight_kg = (weight_kg * (-1));
ROLLBACK TO SP1;
UPDATE animals SET weight_kg = (weight_kg * (-1)) WHERE weight_kg < 0;
COMMIT;

SELECT COUNT (*) FROM animals;
SELECT COUNT (*) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered,SUM(escape_attempts) FROM animals GROUP BY neutered;
SELECT neutered,MIN(weight_kg),MAX(weight_kg) FROM animals GROUP BY neutered;
SELECT neutered,AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-01-01' GROUP BY neutered;

SELECT name, full_name FROM animals JOIN owners ON animals.owner_id = owners.id WHERE owners.id = 4;
SELECT animals.name, species.name FROM animals JOIN species ON animals.species_id = species.id WHERE species.id = 1;
SELECT full_name, name FROM owners LEFT JOIN animals ON animals.owner_id = owners.id;
SELECT COUNT (animals) as pokemons FROM animals JOIN species ON animals.species_id = species.id WHERE species.id = 1;
SELECT COUNT (animals) as digimons FROM animals JOIN species ON animals.species_id = species.id WHERE species.id = 2;
SELECT animals.name, owners.full_name FROM animals JOIN owners ON owner_id = owners.id WHERE owners.id = 2 AND species_id = 2;
SELECT animals.name FROM animals JOIN owners ON owner_id = owners.id WHERE owners.id = 5 AND escape_attempts = 0;
SELECT owners.full_name FROM animals JOIN owners ON owners.id = owner_id GROUP BY owners.full_name ORDER BY count(*) DESC LIMIT 1;

SELECT animals.name FROM visits JOIN animals ON animals_id = animals.id WHERE vets_id = 1 ORDER BY date_of_the_visit DESC LIMIT 1;
SELECT animals.name FROM visits JOIN animals ON animals_id = animals.id WHERE vets_id = 2;
SELECT vets.name, species.name FROM vets LEFT JOIN specializations ON vets_id = vets.id LEFT JOIN species ON species_id = species.id;
SELECT animals.name FROM animals JOIN visits ON animals.id = animals_id WHERE vets_id = 3 AND date_of_the_visit BETWEEN '2020-04-01' AND '2020-08-30';
SELECT animals.name FROM animals JOIN visits ON animals.id = animals_id GROUP BY animals.name ORDER BY COUNT(*) DESC LIMIT 1;
SELECT animals.name FROM animals JOIN visits ON animals.id = animals_id WHERE vets_id = 2 ORDER BY date_of_the_visit LIMIT 1;
SELECT animals.name, animals.date_of_birth, animals.escape_attempts, animals.weight_kg, date_of_the_visit, vets.name as vets_name, vets.age as vets_age, vets.date_of_graduation FROM animals JOIN visits ON animals.id = animals_id JOIN vets ON vets_id = vets.id ORDER BY date_of_the_visit DESC LIMIT 1;
SELECT COUNT(*) FROM visits JOIN specializations ON visits.vets_id = specializations.vets_id JOIN animals ON animals.species_id = specializations.vets_id WHERE ;
SELECT vets.name,species.name FROM vets JOIN specializations ON vets.id!=specializations.vets_id JOIN species ON species.id !=specializations.species_id WHERE vets.name='Maisy Smith' LIMIT 1;
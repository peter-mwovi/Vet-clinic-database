/*Queries that provide answers to the questions from all projects.*/
SELECT *
FROM animals
WHERE name LIKE '%mon';
SELECT name
FROM animals
WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name
FROM animals
WHERE neutered = true
    AND escape_attempts < 3;
SELECT date_of_birth
FROM animals
WHERE name = 'Agumon'
    OR name = 'Pikachu';
SELECT name,
    escape_attempts
FROM animals
WHERE weight_kg > 10.5;
SELECT *
FROM animals
WHERE neutered = true;
SELECT *
FROM animals
WHERE name <> 'Gabumon';
SELECT *
FROM animals
WHERE weight_kg BETWEEN 10.4 AND 17.3;
/* FEATURE BRANCH 02-query-and-update-animals-table */
-- A) TRANSACTION: Update species column and ROLLBACK
BEGIN;
UPDATE animals
SET species = 'unspecified';
SELECT *
FROM animals;
ROLLBACK;
SELECT *
FROM animals;
COMMIT;
-- B) TRANSACTION: Update species column to 'digimon' and 'pokemon'and COMMIT the changes.
BEGIN;
UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon';
UPDATE animals
SET species = 'pokemon'
WHERE name NOT LIKE '%mon';
SELECT *
FROM animals;
COMMIT;
SELECT *
FROM animals;
-- C) TRANSACTION: DELETE all records from animals table and ROLLBACK changes.
BEGIN;
DELETE FROM animals;
ROLLBACK;
SELECT *
FROM animals;
COMMIT;
SELECT *
FROM animals;
--D) TRANSACTION: 
--   * Delete all animals born after Jan 1st, 2022;
--   * Create a savepoint for the transaction;
--   * Update all animals' weight to be their weight multiplied by -1;
--   * Rollback to the savepoint;
--   * Update all animals' weights that are negative to be their weight multiplied by -1;
--   * Commit transaction.
BEGIN;
DELETE FROM animals
WHERE date_of_birth > '2022-01-01';
SAVEPOINT point1;
UPDATE animals
SET weight_kg = weight_kg * -1;
ROLLBACK TO point1;
UPDATE animals
SET weight_kg = weight_kg * -1
WHERE weight_kg < 0;
COMMIT;
/* QUERYING THE DATABASE */
-- A) How many animals are there?
SELECT COUNT(*)
FROM animals;
-- B) How many animals have never tried to escape?
SELECT COUNT(*)
FROM animals
WHERE escape_attempts = 0;
-- C) What is the average weight of animals?
SELECT AVG(weight_kg)
FROM animals;
-- D) Who escapes the most, neutered or not neutered animals?
SELECT neutered,
    SUM(escape_attempts)
FROM animals
GROUP BY neutered;
-- E) What is the minimum and maximum weight of each type of animal?
SELECT species,
    MIN(weight_kg),
    MAX(weight_kg)
FROM animals
GROUP BY species;
-- F) What is the average number of escape attempts per animal type of those born between 1990 and 2000?
SELECT species,
    AVG(escape_attempts)
FROM animals
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31'
GROUP BY species;
-- H) QUERYING THE TABLES
-- 1) What animals belong to Melody Pond?
SELECT animals.name,
    owners.full_name
FROM animals
    JOIN owners ON (
        animals.owner_id = owners.id
        AND owners.full_name LIKE 'Melody Pond'
    );
-- 2) List of all animals that are pokemon (their type is Pokemon):
SELECT animals.name,
    species.name
FROM animals
    JOIN species ON (
        animals.species_id = species.id
        AND species.name LIKE 'Pokemon'
    );
-- 3) List all owners and their animals, remember to 
--    include those that don't own any animal
SELECT owners.full_name,
    animals.name
FROM owners
    LEFT JOIN animals ON (owners.id = animals.owner_id);
-- 4) How many animals are there per species?
SELECT COUNT(animals.name),
    species.name
FROM animals
    JOIN species ON (animals.species_id = species.id)
GROUP BY species.name;
-- 5) List all Digimon owned by Jennifer Orwell...
SELECT animals.name as animal_name,
    owners.full_name as owner_name,
    species.name as species
FROM animals
    JOIN owners ON (
        animals.owner_id = owners.id
        AND owners.full_name like 'Jennifer Orwell'
    )
    JOIN species ON (animals.species_id = species.id);
-- 6) List all animals owned by Dean Winchester that haven't 
--    tried to escape
SELECT animals.name as animal_name,
    owners.full_name as owner_name,
    animals.escape_attempts
FROM animals
    JOIN owners ON (
        animals.owner_id = owners.id
        AND owners.full_name like 'Dean Winchester'
    );
-- ALL HIS ANIMALS HAVE TRIED TO ESCAPE
-- 7) Who owns the most animals?
SELECT owners.full_name as owner_name,
    COUNT(animals.name)
FROM owners
    LEFT JOIN animals ON (owners.id = animals.owner_id)
GROUP BY owners.full_name;
-- MELODY POND OWNS THE MOST ANIMALS (3)
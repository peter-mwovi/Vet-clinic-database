/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name <> 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

/* FEATURE BRANCH 02-query-and-update-animals-table */

-- A) TRANSACTION: Update species column and ROLLBACK

BEGIN;

UPDATE animals SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;

COMMIT;

-- B) TRANSACTION: Update species column to 'digimon' and 'pokemon'and COMMIT the changes.

BEGIN;

UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE name NOT LIKE '%mon';
SELECT * FROM animals;

COMMIT;

-- C) TRANSACTION: DELETE all records from animals table and ROLLBACK changes.

BEGIN;

DELETE FROM animals;
ROLLBACK;

SELECT * FROM animals;

COMMIT;

--D) TRANSACTION: 
--   * Delete all animals born after Jan 1st, 2022;
--   * Create a savepoint for the transaction;
--   * Update all animals' weight to be their weight multiplied by -1;
--   * Rollback to the savepoint;
--   * Update all animals' weights that are negative to be their weight multiplied by -1;
--   * Commit transaction.

BEGIN;

DELETE FROM animals WHERE date_of_birth > '2022-01-01';

SAVEPOINT point1;

UPDATE animals SET weight_kg = weight_kg * -1;

ROLLBACK TO point1;

UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;

COMMIT;


/* QUERYING THE DATABASE */

-- A) How many animals are there?
SELECT COUNT(*) FROM animals;

-- B) How many animals have never tried to escape?
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;

-- C) What is the average weight of animals?
SELECT AVG(weight_kg) FROM animals;

-- D) Who escapes the most, neutered or not neutered animals?
SELECT neutered, AVG(escape_attempts) FROM animals GROUP BY neutered;

-- E) What is the minimum and maximum weight of each type of animal?
SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;

-- F) What is the average number of escape attempts per animal type of those born between 1990 and 2000?
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;

/* Populate database with sample data. */
/* FEATURE BRANCH 01-create-animals-table */
INSERT INTO animals (
        name,
        date_of_birth,
        weight_kg,
        neutered,
        escape_attempts
    )
VALUES ('Agumon', '2020-02-03', 10.23, true, 0);
INSERT INTO animals (
        name,
        date_of_birth,
        weight_kg,
        neutered,
        escape_attempts
    )
VALUES ('Gabumon', '2018-11-15', 8, true, 2);
INSERT INTO animals (
        name,
        date_of_birth,
        weight_kg,
        neutered,
        escape_attempts
    )
VALUES ('Pikachu', '2021-01-07', 15.04, false, 1);
INSERT INTO animals (
        name,
        date_of_birth,
        weight_kg,
        neutered,
        escape_attempts
    )
VALUES ('Devimon', '2017-05-12', 11, true, 5);
-- ACTIVITY 2
/* FEATURE BRANCH 02-query-and-update-animals-table */
INSERT INTO animals (
        name,
        date_of_birth,
        weight_kg,
        neutered,
        escape_attempts
    )
VALUES ('Charmander', '2020-02-08', -11, false, 0),
    ('Plantmon', '2021-11-15', -5.7, true, 2),
    ('Squirtle', '1993-04-02', -12.13, false, 3),
    ('Angemon', '2005-06-12', -45, true, 1),
    ('Boarmon', '2005-06-07', 20.4, true, 7),
    ('Blossom', '1998-10-13', 17, true, 3),
    ('Ditto', '2022-05-14', 22, true, 4);
-- ACTIVITY 3
INSERT INTO owners(full_name, age)
VALUES('Sam Smith', 34),
    ('Jennifer Orwell', 19),
    ('Bob', 45),
    ('Melody Pond', 77),
    ('Dean Winchester', 14),
    ('Jodie Whittaker', 38)
INSERT INTO species(name)
VALUES('Pokemon'),
    ('Digimon')
UPDATE animals
SET species_id = (
        SELECT id
        from species
        WHERE name = 'Digimon'
    )
WHERE name LIKE '%mon';
UPDATE animals
SET species_id = (
        SELECT id
        from species
        WHERE name = 'Pokemon'
    )
WHERE species_id is NULL;
UPDATE animals
SET owner_id = (
        SELECT id
        from owners
        where full_name = 'Sam Smith'
    )
WHERE id = 1;
-- Jennifer Orwell owns Gabumon and Pikachu:
UPDATE animals
SET owner_id = (
        SELECT id
        from owners
        where full_name = 'Jennifer Orwell'
    )
WHERE id in (2, 3);
-- Bob owns Devimon and Plantmon:
UPDATE animals
SET owner_id = (
        SELECT id
        from owners
        where full_name = 'Bob'
    )
WHERE id in (4, 6);
-- Melody Pond owns Charmander, Squirtle, and Blossom:
UPDATE animals
SET owner_id = (
        SELECT id
        from owners
        where full_name = 'Melody Pond'
    )
WHERE id in (5, 7, 10);
-- Dean Winchester owns Angemon and Boarmon:
UPDATE animals
SET owner_id = (
        SELECT id
        from owners
        where full_name = 'Dean Winchester'
    )
WHERE id in (8, 9);
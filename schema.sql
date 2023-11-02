/* Database schema to keep the structure of entire database. */

/* FEATURE BRANCH 01-create-animals-table */

CREATE TABLE animals (
    id int,
    name varchar(100),
    date_of_birth date,
    escape_attempts int,
    neutered boolean,
    weight_kg float
);

/* FEATURE BRANCH 02-query-and-update-animals-table */

ALTER TABLE animals ADD COLUMN species varchar(100);
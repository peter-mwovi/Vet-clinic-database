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

/* FEATURE BRANCH 03-querying-multiple-tables */

-- Create a table named owners 
CREATE TABLE owners (
        id SERIAL PRIMARY KEY,
        full_name varchar(100),
        age int
)

-- Create a table named species
CREATE TABLE species (
        id SERIAL PRIMARY KEY,
        name varchar(100)
)

ALTER TABLE animals 
MODIFY id INT AUTO_INCREMENT PRIMARY KEY;

-- Modify animals table:
ALTER TABLE animals
        DROP COLUMN species,
        ADD owner_id integer,
        ADD species_id integer;


ALTER TABLE animals ADD PRIMARY KEY (id);

ALTER TABLE animals
    ADD CONSTRAINT fk_owner 
    FOREIGN KEY (owner_id) 
    REFERENCES owners (id)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
    ADD CONSTRAINT fk_species
    FOREIGN KEY (species_id)
    REFERENCES species (id)
    ON UPDATE CASCADE
    ON DELETE CASCADE;


 
/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id              INT,
    name            CHAR(20),
    date_of_birth   DATE,
    escape_attempts INT, 
    neutered        BOOLEAN,
    weight_kg       DECIMAL
);

ALTER TABLE animals ADD species CHAR(20);

CREATE TABLE owners (
    id         INT  GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    full_name  CHAR(30),
    age        INT 
);

CREATE TABLE species (
    id         INT  GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name       CHAR(30)
);

ALTER TABLE animals DROP id;
ALTER TABLE animals ADD id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY;
ALTER TABLE animals DROP species;
ALTER TABLE animals ADD species_id INT;
ALTER TABLE animals ADD FOREIGN KEY (species_id) REFERENCES species(id);
ALTER TABLE animals ADD owner_id INT;
ALTER TABLE animals ADD FOREIGN KEY (owner_id) REFERENCES owners(id);

CREATE TABLE vets (
    id                 INT  GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name               CHAR(30),
    age                INT,
    date_of_graduation date
);

CREATE TABLE specializations (
    species_id  INT,
    vets_id     INT,
);

CREATE TABLE visits (
    animals_id        INT,
    vets_id           INT,
    date_of_the_visit date
);
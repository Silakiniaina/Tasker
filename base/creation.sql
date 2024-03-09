CREATE EXTENSION IF NOT EXISTS pgcrypto;

CREATE TABLE specialitiy(
   id SERIAL,
   libelle VARCHAR(150)  NOT NULL,
   description VARCHAR(250),
   PRIMARY KEY(id),
   UNIQUE(libelle)
);

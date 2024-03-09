CREATE EXTENSION IF NOT EXISTS pgcrypto;

CREATE TABLE specialitiy(
   id SERIAL,
   libelle VARCHAR(150)  NOT NULL,
   description VARCHAR(250),
   PRIMARY KEY(id),
   UNIQUE(libelle)
);

CREATE TABLE Permission(
   id VARCHAR(50) ,
   libelle VARCHAR(250)  NOT NULL,
   description VARCHAR(50)  NOT NULL,
   PRIMARY KEY(id),
   UNIQUE(description)
);

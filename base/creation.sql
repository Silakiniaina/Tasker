CREATE EXTENSION IF NOT EXISTS pgcrypto;

CREATE TABLE speciality(
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

CREATE TABLE role(
   id SERIAL,
   libelle VARCHAR(50)  NOT NULL,
   description VARCHAR(50) ,
   PRIMARY KEY(id),
   UNIQUE(libelle)
);

CREATE TABLE role_permissions(
   permission VARCHAR(50) ,
   role INTEGER,
   PRIMARY KEY(permission, role),
   FOREIGN KEY(permission) REFERENCES Permission(id),
   FOREIGN KEY(role) REFERENCES role(id)
);

CREATE TABLE collaborator(
   id SERIAL,
   first_name VARCHAR(250) ,
   name VARCHAR(250)  NOT NULL,
   date_of_birth DATE NOT NULL,
   username VARCHAR(150)  NOT NULL,
   password VARCHAR(253)  NOT NULL,
   role INTEGER,
   speciality INTEGER,
   PRIMARY KEY(id),
   UNIQUE(username,password),
   FOREIGN KEY(role) REFERENCES role(id),
   FOREIGN KEY(speciality) REFERENCES speciality(id)
);
CREATE DATABASE devtechwatch_studiscrum062022;

USE devtechwatch_studiscrum062022;


CREATE TABLE users
(
    iduser INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    surname VARCHAR(100) NOT NULL,
    forename VARCHAR(100) NOT NULL,
    mail VARCHAR(255) NOT NULL,
    password VARCHAR(255),
    phone varchar(13),
    date_embauche DATE,
    date_renvoi DATE,
    subjectid VARCHAR(255),
    password_key VARCHAR(255)
);

CREATE TABLE projet
(
    idprojet INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nom VARCHAR(100) NOT NULL,
    description VARCHAR(500),
    date_debut DATE,
    date_fin DATE,
    id_proprietaire int NOT NULL, 
    FOREIGN KEY (id_proprietaire) REFERENCES users(iduser)
);

CREATE TABLE affectations
(
    id_projet INT NOT NULL,
    id_utilisateur int NOT NULL, 
    PRIMARY KEY (id_projet, id_utilisateur),
    FOREIGN KEY (id_projet) REFERENCES projet(idprojet),
    FOREIGN KEY (id_utilisateur) REFERENCES users(iduser)
);

CREATE TABLE taches
(
    idtaches INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nom VARCHAR(100) NOT NULL,
    description VARCHAR(500),
    date_debut DATE,
    status varchar(50),
    deadline DATE, 
    id_projet_parent INT NOT NULL, 
    id_utilisateur_affecte INT, 
    FOREIGN KEY (id_projet_parent) REFERENCES projet(idprojet),
    FOREIGN KEY (id_utilisateur_affecte) REFERENCES users(iduser)
);
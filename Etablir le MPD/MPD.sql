CREATE TABLE rayon (
    id_rayon INT AUTO_INCREMENT PRIMARY KEY,
    nom_rayon VARCHAR(100) NOT NULL
);

CREATE TABLE ouvrage (
    id_ouvrage INT AUTO_INCREMENT PRIMARY KEY,
    titre VARCHAR(150) NOT NULL,
    date_pub DATE,
    id_rayon INT NOT NULL,
    FOREIGN KEY (id_rayon) REFERENCES rayon(id_rayon)
);

CREATE TABLE auteur (
    id_auteur INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100)
);

CREATE TABLE ouvrage_auteur (
    id_ouvrage INT NOT NULL,
    id_auteur INT NOT NULL,
    PRIMARY KEY (id_ouvrage, id_auteur),
    FOREIGN KEY (id_ouvrage) REFERENCES ouvrage(id_ouvrage),
    FOREIGN KEY (id_auteur) REFERENCES auteur(id_auteur)
);

CREATE TABLE lecteur (
    id_lecteur INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100),
    email VARCHAR(150)  UNIQUE,
    tele VARCHAR(20) NOT NULL,
    cin VARCHAR(20) NOT NULL
);

CREATE TABLE emprunts (
    id_emprunts INT AUTO_INCREMENT PRIMARY KEY,
    date_de_emprunts DATE NOT NULL,
    date_de_retour_prevue DATE NOT NULL,
    date_de_rendu_reel DATE,
    id_lecteur INT NOT NULL,
    id_ouvrage INT NOT NULL,
    FOREIGN KEY (id_lecteur) REFERENCES lecteur(id_lecteur),
    FOREIGN KEY (id_ouvrage) REFERENCES ouvrage(id_ouvrage)
);

CREATE TABLE personnel (
    id_personnel INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100),
    email VARCHAR(150),
    mot_de_pass VARCHAR(255),
    id_supervisor INT,
    FOREIGN KEY (id_supervisor) REFERENCES personnel(id_personnel)
);

CREATE DATABASE bibliotheque;
USE bibliotheque;

CREATE TABLE rayon (
    id_rayon INT AUTO_INCREMENT PRIMARY KEY,
    nom_rayon VARCHAR(100) NOT NULL,
    localisation VARCHAR(200) NOT NULL
);
INSERT INTO rayon (nom_rayon, localisation) VALUES
('Informatique', 'Étage 1 - Salle A - Rayon A3'),
('Mathématiques', 'Étage 1 - Salle B - Rayon B1'),
('Philosophie', 'Étage 2 - Salle C - Rayon C2');

CREATE TABLE ouvrage (
    id_ouvrage INT AUTO_INCREMENT PRIMARY KEY,
    titre VARCHAR(150) NOT NULL,
    date_pub DATE,
    id_rayon INT NOT NULL,
    FOREIGN KEY (id_rayon) REFERENCES rayon(id_rayon)
);
INSERT INTO ouvrage (titre, date_pub, id_rayon) VALUES
('Introduction à SQL', '2020-05-10', 1),
('Algèbre Linéaire', '2018-09-01', 2),
('Critique de la raison pure', '1781-01-01', 3);

CREATE TABLE auteur (
    id_auteur INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100)
);
INSERT INTO auteur (nom, prenom) VALUES
('alae', 'maghchich'),
('monir', 'batal'),
('brahim', 'first batal');

CREATE TABLE ouvrage_auteur (
    id_ouvrage INT NOT NULL,
    id_auteur INT NOT NULL,
    PRIMARY KEY (id_ouvrage, id_auteur),
    FOREIGN KEY (id_ouvrage) REFERENCES ouvrage(id_ouvrage),
    FOREIGN KEY (id_auteur) REFERENCES auteur(id_auteur)
);
INSERT INTO ouvrage_auteur (id_ouvrage, id_auteur) VALUES
(1, 1),
(2, 2),
(3, 3);

CREATE TABLE lecteur (
    id_lecteur INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100),
    email VARCHAR(150)  UNIQUE,
    tele VARCHAR(20) NOT NULL,
    cin VARCHAR(20) NOT NULL
);
INSERT INTO lecteur (nom, prenom, email, tele, cin) VALUES
('maghchich', 'alae', 'alaemaghchich@gmail.com', '0612345678', 'AB000001'),
('maimouni', 'mounir', 'mounirmaimouni@gmail.com', '069876543', 'BC000002'),
('medkour', 'brahim', 'brahimmedkour@gmail.com', '0623456789', 'CD000003');

CREATE TABLE emprunts (
    id_emprunts INT AUTO_INCREMENT PRIMARY KEY,
    date_de_emprunts DATE NOT NULL,
    date_de_retour_prevue DATE,
    date_de_rendu_reel DATE NOT NULL,
    id_lecteur INT NOT NULL,
    id_ouvrage INT NOT NULL,
    FOREIGN KEY (id_lecteur) REFERENCES lecteur(id_lecteur),
    FOREIGN KEY (id_ouvrage) REFERENCES ouvrage(id_ouvrage)
);
INSERT INTO emprunts (date_de_emprunts, date_de_retour_prevue, date_de_rendu_reel, id_lecteur, id_ouvrage) VALUES
('2025-01-01', NULL, '2025-01-15', 1, 1),
('2025-01-03', '2025-01-17', '2025-01-16', 2, 2),
('2025-01-05', NULL, '2025-01-18', 3, 3);

CREATE TABLE personnel (
    id_personnel INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100),
    email VARCHAR(150),
    mot_de_pass VARCHAR(255),
    id_supervisor INT,
    FOREIGN KEY (id_supervisor) REFERENCES personnel(id_personnel)
);
INSERT INTO personnel (nom, prenom, email, mot_de_pass, id_supervisor) VALUES
('Alae', 'maghchich', 'maghchich@biblio.com', 'alae123', 1),
('Admin', 'Principal', 'admin@biblio.com', 'admin123', NULL),
('brahim', 'hero', 'batal@biblio.com', 'brahim123', 2)

DROP DATABASE IF EXISTS mini_projet_football;
CREATE DATABASE mini_projet_football;
USE mini_projet_football;

CREATE TABLE Edition (
    id_edition INT NOT NULL,
    saison VARCHAR(20) NOT NULL,
    PRIMARY KEY (id_edition)
);

CREATE TABLE Phase (
    id_phase INT NOT NULL,
    nom_phase VARCHAR(50) NOT NULL,
    ordre_phase INT NOT NULL,
    id_edition INT NOT NULL,
    PRIMARY KEY (id_phase)
);

CREATE TABLE Groupe (
    id_groupe INT NOT NULL,
    code_groupe CHAR(1) NOT NULL,
    id_phase INT NOT NULL,
    PRIMARY KEY (id_groupe)
);

CREATE TABLE Equipe (
    id_equipe INT NOT NULL,
    nom_equipe VARCHAR(100) NOT NULL,
    pays_equipe VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_equipe)
);

CREATE TABLE Joueur (
    id_joueur INT NOT NULL,
    nom_joueur VARCHAR(100) NOT NULL,
    poste VARCHAR(30) NOT NULL,
    numero_joueur INT NOT NULL,
    id_equipe INT NOT NULL,
    PRIMARY KEY (id_joueur)
);

CREATE TABLE Stade (
    id_stade INT NOT NULL,
    nom_stade VARCHAR(100) NOT NULL,
    ville_stade VARCHAR(50) NOT NULL,
    capacite_stade INT NOT NULL,
    PRIMARY KEY (id_stade)
);

CREATE TABLE Rencontre (
    id_match INT NOT NULL,
    date_match DATE NOT NULL,
    heure_match TIME NOT NULL,
    statut_match VARCHAR(20) NOT NULL,
    score_dom INT,
    score_ext INT,
    id_stade INT NOT NULL,
    id_phase INT NOT NULL,
    id_equipe_dom INT NOT NULL,
    id_equipe_ext INT NOT NULL,
    PRIMARY KEY (id_match)
);

CREATE TABLE Inscrit (
    id_edition INT NOT NULL,
    id_equipe INT NOT NULL,
    PRIMARY KEY (id_edition, id_equipe)
);

CREATE TABLE Affecte (
    id_groupe INT NOT NULL,
    id_equipe INT NOT NULL,
    PRIMARY KEY (id_groupe, id_equipe)
);

CREATE TABLE Joue (
    id_joueur INT NOT NULL,
    id_match INT NOT NULL,
    PRIMARY KEY (id_joueur, id_match)
);

CREATE TABLE Capitaine (
    id_equipe INT NOT NULL,
    id_joueur INT NOT NULL,
    PRIMARY KEY (id_equipe, id_joueur)
);

ALTER TABLE Phase
ADD CONSTRAINT fk_phase_edition
FOREIGN KEY (id_edition)
REFERENCES Edition(id_edition)
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER TABLE Groupe
ADD CONSTRAINT fk_groupe_phase
FOREIGN KEY (id_phase)
REFERENCES Phase(id_phase)
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER TABLE Joueur
ADD CONSTRAINT fk_joueur_equipe
FOREIGN KEY (id_equipe)
REFERENCES Equipe(id_equipe)
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER TABLE Rencontre
ADD CONSTRAINT fk_rencontre_stade
FOREIGN KEY (id_stade)
REFERENCES Stade(id_stade)
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER TABLE Rencontre
ADD CONSTRAINT fk_rencontre_phase
FOREIGN KEY (id_phase)
REFERENCES Phase(id_phase)
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER TABLE Rencontre
ADD CONSTRAINT fk_rencontre_equipe_dom
FOREIGN KEY (id_equipe_dom)
REFERENCES Equipe(id_equipe)
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER TABLE Rencontre
ADD CONSTRAINT fk_rencontre_equipe_ext
FOREIGN KEY (id_equipe_ext)
REFERENCES Equipe(id_equipe)
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER TABLE Inscrit
ADD CONSTRAINT fk_inscrit_edition
FOREIGN KEY (id_edition)
REFERENCES Edition(id_edition)
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER TABLE Inscrit
ADD CONSTRAINT fk_inscrit_equipe
FOREIGN KEY (id_equipe)
REFERENCES Equipe(id_equipe)
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER TABLE Affecte
ADD CONSTRAINT fk_affecte_groupe
FOREIGN KEY (id_groupe)
REFERENCES Groupe(id_groupe)
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER TABLE Affecte
ADD CONSTRAINT fk_affecte_equipe
FOREIGN KEY (id_equipe)
REFERENCES Equipe(id_equipe)
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER TABLE Joue
ADD CONSTRAINT fk_joue_joueur
FOREIGN KEY (id_joueur)
REFERENCES Joueur(id_joueur)
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER TABLE Joue
ADD CONSTRAINT fk_joue_match
FOREIGN KEY (id_match)
REFERENCES Rencontre(id_match)
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER TABLE Capitaine
ADD CONSTRAINT fk_capitaine_equipe
FOREIGN KEY (id_equipe)
REFERENCES Equipe(id_equipe)
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER TABLE Capitaine
ADD CONSTRAINT fk_capitaine_joueur
FOREIGN KEY (id_joueur)
REFERENCES Joueur(id_joueur)
ON UPDATE CASCADE
ON DELETE CASCADE;

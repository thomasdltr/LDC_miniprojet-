USE mini_projet_football;

ALTER TABLE Edition
ADD CONSTRAINT uq_edition_saison UNIQUE (saison);

ALTER TABLE Phase
ADD CONSTRAINT uq_phase_ordre UNIQUE (id_edition, ordre_phase);

ALTER TABLE Groupe
ADD CONSTRAINT uq_groupe_code UNIQUE (id_phase, code_groupe);

ALTER TABLE Equipe
ADD CONSTRAINT uq_equipe_nom UNIQUE (nom_equipe);

ALTER TABLE Stade
ADD CONSTRAINT uq_stade_nom_ville UNIQUE (nom_stade, ville_stade);

ALTER TABLE Joueur
ADD CONSTRAINT uq_joueur_numero UNIQUE (id_equipe, numero_joueur);

ALTER TABLE Capitaine
ADD CONSTRAINT uq_capitaine_joueur UNIQUE (id_joueur);

ALTER TABLE Phase
ADD CONSTRAINT ck_phase_ordre
CHECK (ordre_phase > 0);

ALTER TABLE Stade
ADD CONSTRAINT ck_stade_capacite
CHECK (capacite_stade > 0);

ALTER TABLE Joueur
ADD CONSTRAINT ck_joueur_numero
CHECK (numero_joueur >= 1 AND numero_joueur <= 99);

ALTER TABLE Joueur
ADD CONSTRAINT ck_joueur_poste
CHECK (poste IN ('Gardien', 'Defenseur', 'Milieu', 'Attaquant'));

ALTER TABLE Rencontre
ADD CONSTRAINT ck_rencontre_scores
CHECK (score_dom >= 0 AND score_ext >= 0);


ALTER TABLE Rencontre
ADD CONSTRAINT ck_rencontre_statut
CHECK (statut_match IN ('prevu', 'en cours', 'termine', 'reporte', 'annule'));
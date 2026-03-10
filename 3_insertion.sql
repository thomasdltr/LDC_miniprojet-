USE mini_projet_football;

-- EDITION
INSERT INTO Edition VALUES (1,'2024-2025');

-- PHASE
INSERT INTO Phase VALUES (1,'Phase de groupes',1,1);
INSERT INTO Phase VALUES (2,'Phase finale',2,1);

-- GROUPES
INSERT INTO Groupe VALUES (1,'A',1);
INSERT INTO Groupe VALUES (2,'B',1);

-- EQUIPES
INSERT INTO Equipe VALUES (1,'PSG','France');
INSERT INTO Equipe VALUES (2,'Real Madrid','Espagne');
INSERT INTO Equipe VALUES (3,'Manchester City','Angleterre');
INSERT INTO Equipe VALUES (4,'Bayern Munich','Allemagne');
INSERT INTO Equipe VALUES (5,'Juventus','Italie');
INSERT INTO Equipe VALUES (6,'FC Barcelone','Espagne');

-- INSCRIPTIONS
INSERT INTO Inscrit VALUES (1,1);
INSERT INTO Inscrit VALUES (1,2);
INSERT INTO Inscrit VALUES (1,3);
INSERT INTO Inscrit VALUES (1,4);
INSERT INTO Inscrit VALUES (1,5);
INSERT INTO Inscrit VALUES (1,6);

-- GROUPES / EQUIPES
INSERT INTO Affecte VALUES (1,1);
INSERT INTO Affecte VALUES (1,2);
INSERT INTO Affecte VALUES (1,3);
INSERT INTO Affecte VALUES (2,4);
INSERT INTO Affecte VALUES (2,5);
INSERT INTO Affecte VALUES (2,6);

-- STADES
INSERT INTO Stade VALUES (1,'Parc des Princes','Paris',48000);
INSERT INTO Stade VALUES (2,'Santiago Bernabeu','Madrid',81000);
INSERT INTO Stade VALUES (3,'Allianz Arena','Munich',75000);
INSERT INTO Stade VALUES (4,'Camp Nou','Barcelone',99000);

-- JOUEURS
INSERT INTO Joueur VALUES (1,'Kylian Mbappe','Attaquant',7,1);
INSERT INTO Joueur VALUES (2,'Achraf Hakimi','Defenseur',2,1);
INSERT INTO Joueur VALUES (3,'Luka Modric','Milieu',10,2);
INSERT INTO Joueur VALUES (4,'Vinicius Junior','Attaquant',7,2);
INSERT INTO Joueur VALUES (5,'Erling Haaland','Attaquant',9,3);
INSERT INTO Joueur VALUES (6,'Kevin De Bruyne','Milieu',17,3);
INSERT INTO Joueur VALUES (7,'Harry Kane','Attaquant',9,4);
INSERT INTO Joueur VALUES (8,'Joshua Kimmich','Milieu',6,4);
INSERT INTO Joueur VALUES (9,'Dusan Vlahovic','Attaquant',9,5);
INSERT INTO Joueur VALUES (10,'Federico Chiesa','Attaquant',7,5);
INSERT INTO Joueur VALUES (11,'Robert Lewandowski','Attaquant',9,6);
INSERT INTO Joueur VALUES (12,'Pedri','Milieu',8,6);

-- CAPITAINES
INSERT INTO Capitaine VALUES (1,1);
INSERT INTO Capitaine VALUES (2,3);
INSERT INTO Capitaine VALUES (3,6);
INSERT INTO Capitaine VALUES (4,8);
INSERT INTO Capitaine VALUES (5,10);
INSERT INTO Capitaine VALUES (6,11);

-- MATCHS
INSERT INTO Rencontre VALUES (1,'2025-05-10','20:45','termine',2,1,1,1,1,2);
INSERT INTO Rencontre VALUES (2,'2025-05-11','20:45','termine',1,1,2,1,3,1);
INSERT INTO Rencontre VALUES (3,'2025-05-12','21:00','prevu',0,0,3,1,4,5);
INSERT INTO Rencontre VALUES (4,'2025-05-13','21:00','prevu',0,0,4,1,6,4);

-- PARTICIPATION JOUEURS
INSERT INTO Joue VALUES (1,1);
INSERT INTO Joue VALUES (2,1);
INSERT INTO Joue VALUES (3,1);
INSERT INTO Joue VALUES (4,1);
INSERT INTO Joue VALUES (5,2);
INSERT INTO Joue VALUES (6,2);
INSERT INTO Joue VALUES (7,3);
INSERT INTO Joue VALUES (8,3);
INSERT INTO Joue VALUES (9,4);
INSERT INTO Joue VALUES (10,4);
INSERT INTO Joue VALUES (11,4);
INSERT INTO Joue VALUES (12,4);
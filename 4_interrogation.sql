USE mini_projet_football;

-- =========================================================
-- 1) PROJECTIONS / SELECTIONS / TRI / DISTINCT / LIKE / IN / BETWEEN
-- =========================================================

-- 1. Afficher le nom et le pays de toutes les équipes, triées par nom
SELECT nom_equipe, pays_equipe
FROM Equipe
ORDER BY nom_equipe ASC;

-- 2. Afficher les pays distincts des équipes participantes
SELECT DISTINCT pays_equipe
FROM Equipe
ORDER BY pays_equipe;

-- 3. Afficher les joueurs dont le nom commence par la lettre K
SELECT nom_joueur, poste, numero_joueur
FROM Joueur
WHERE nom_joueur LIKE 'K%';

-- 4. Afficher les matchs prévus ou terminés
SELECT id_match, date_match, heure_match, statut_match
FROM Rencontre
WHERE statut_match IN ('prevu', 'termine')
ORDER BY date_match, heure_match;

-- 5. Afficher les matchs joués entre le 10 mai 2025 et le 13 mai 2025
SELECT id_match, date_match, heure_match, statut_match
FROM Rencontre
WHERE date_match BETWEEN '2025-05-10' AND '2025-05-13'
ORDER BY date_match;

-- 6. Afficher les stades ayant une capacité comprise entre 50000 et 90000
SELECT nom_stade, ville_stade, capacite_stade
FROM Stade
WHERE capacite_stade BETWEEN 50000 AND 90000
ORDER BY capacite_stade DESC;


-- =========================================================
-- 2) AGREGATIONS / GROUP BY / HAVING
-- =========================================================

-- 7. Compter le nombre d’équipes inscrites dans chaque édition
SELECT id_edition, COUNT(id_equipe) AS nb_equipes
FROM Inscrit
GROUP BY id_edition;

-- 8. Compter le nombre de joueurs par équipe
SELECT id_equipe, COUNT(id_joueur) AS nb_joueurs
FROM Joueur
GROUP BY id_equipe;

-- 9. Calculer la capacité moyenne des stades
SELECT AVG(capacite_stade) AS capacite_moyenne
FROM Stade;

-- 10. Compter le nombre de matchs par phase
SELECT id_phase, COUNT(id_match) AS nb_matchs
FROM Rencontre
GROUP BY id_phase;

-- 11. Afficher les équipes qui ont plus d’un joueur enregistré
SELECT id_equipe, COUNT(id_joueur) AS nb_joueurs
FROM Joueur
GROUP BY id_equipe
HAVING COUNT(id_joueur) > 1;

-- 12. Afficher les stades dont la capacité moyenne est supérieure à 60000
SELECT ville_stade, AVG(capacite_stade) AS moyenne_capacite
FROM Stade
GROUP BY ville_stade
HAVING AVG(capacite_stade) > 60000;


-- =========================================================
-- 3) JOINTURES (simples, multiples, internes, externes)
-- =========================================================

-- 13. Afficher les joueurs avec le nom de leur équipe
SELECT j.nom_joueur, j.poste, e.nom_equipe
FROM Joueur j
INNER JOIN Equipe e ON j.id_equipe = e.id_equipe
ORDER BY e.nom_equipe, j.nom_joueur;

-- 14. Afficher les matchs avec le nom du stade
SELECT r.id_match, r.date_match, r.heure_match, s.nom_stade
FROM Rencontre r
INNER JOIN Stade s ON r.id_stade = s.id_stade
ORDER BY r.date_match;

-- 15. Afficher les groupes avec la phase correspondante
SELECT g.code_groupe, p.nom_phase
FROM Groupe g
INNER JOIN Phase p ON g.id_phase = p.id_phase;

-- 16. Afficher les équipes et leur capitaine
SELECT e.nom_equipe, j.nom_joueur AS capitaine
FROM Capitaine c
INNER JOIN Equipe e ON c.id_equipe = e.id_equipe
INNER JOIN Joueur j ON c.id_joueur = j.id_joueur
ORDER BY e.nom_equipe;

-- 17. Afficher les matchs avec la phase, le stade et les deux équipes
SELECT r.id_match,
       r.date_match,
       p.nom_phase,
       s.nom_stade,
       ed.nom_equipe AS equipe_domicile,
       ee.nom_equipe AS equipe_exterieur
FROM Rencontre r
INNER JOIN Phase p ON r.id_phase = p.id_phase
INNER JOIN Stade s ON r.id_stade = s.id_stade
INNER JOIN Equipe ed ON r.id_equipe_dom = ed.id_equipe
INNER JOIN Equipe ee ON r.id_equipe_ext = ee.id_equipe
ORDER BY r.date_match;

-- 18. Afficher toutes les équipes et éventuellement leur capitaine (jointure externe)
SELECT e.nom_equipe, j.nom_joueur AS capitaine
FROM Equipe e
LEFT JOIN Capitaine c ON e.id_equipe = c.id_equipe
LEFT JOIN Joueur j ON c.id_joueur = j.id_joueur
ORDER BY e.nom_equipe;


-- =========================================================
-- 4) REQUETES IMBRIQUEES : IN / NOT IN / EXISTS / NOT EXISTS / ANY / ALL
-- =========================================================

-- 19. Afficher les équipes inscrites à l’édition 1
SELECT nom_equipe
FROM Equipe
WHERE id_equipe IN (
    SELECT id_equipe
    FROM Inscrit
    WHERE id_edition = 1
);

-- 20. Afficher les équipes non affectées à un groupe
SELECT nom_equipe
FROM Equipe
WHERE id_equipe NOT IN (
    SELECT id_equipe
    FROM Affecte
);

-- 21. Afficher les équipes ayant au moins un joueur capitaine
SELECT nom_equipe
FROM Equipe e
WHERE EXISTS (
    SELECT *
    FROM Capitaine c
    WHERE c.id_equipe = e.id_equipe
);

-- 22. Afficher les équipes n’ayant aucun joueur capitaine
SELECT nom_equipe
FROM Equipe e
WHERE NOT EXISTS (
    SELECT *
    FROM Capitaine c
    WHERE c.id_equipe = e.id_equipe
);

-- 23. Afficher les joueurs ayant un numéro supérieur à au moins un autre joueur
SELECT nom_joueur, numero_joueur
FROM Joueur
WHERE numero_joueur > ANY (
    SELECT numero_joueur
    FROM Joueur
);

-- 24. Afficher le ou les stades dont la capacité est supérieure ou égale à toutes les autres
SELECT nom_stade, capacite_stade
FROM Stade
WHERE capacite_stade >= ALL (
    SELECT capacite_stade
    FROM Stade
);

-- 25. Afficher les matchs ayant un score domicile égal au score domicile maximal
SELECT id_match, score_dom
FROM Rencontre
WHERE score_dom = (
    SELECT MAX(score_dom)
    FROM Rencontre
);

-- 26. Afficher les joueurs appartenant aux équipes inscrites à l’édition 1
SELECT nom_joueur
FROM Joueur
WHERE id_equipe IN (
    SELECT id_equipe
    FROM Inscrit
    WHERE id_edition = 1
);
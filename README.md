RÈGLES DE GESTION 

L’organisation gère des compétitions de football structurées par éditions.
Une édition est identifiée par un identifiant unique et une saison (ex : 2025-2026).
Chaque édition contient une ou plusieurs phases.
Une phase appartient obligatoirement à une seule édition et possède un nom ainsi qu’un ordre dans l’édition (phase 1, 2, etc.).
Une phase peut comprendre zéro ou plusieurs groupes.
Un groupe est rattaché à une seule phase et possède un code (A, B, C…).
Les équipes s’inscrivent aux éditions.
Une équipe peut participer à plusieurs éditions différentes, mais ne peut être inscrite qu’une seule fois à une même édition.
Dans le cas d’une phase de groupes, une équipe peut être affectée à un seul groupe pour une édition donnée.
Un groupe contient plusieurs équipes.
Une phase planifie plusieurs matchs.
Chaque match appartient obligatoirement à une seule phase.
Un match :
se joue à une date et une heure,
possède un statut (programmé, joué, reporté…),
enregistre un score domicile et un score extérieur,
est accueilli dans un seul stade.
Un stade peut accueillir plusieurs matchs au fil du temps.
Un match oppose exactement deux équipes :
une équipe à domicile,
une équipe à l’extérieur.
Une équipe peut jouer plusieurs matchs en tant que domicile ou extérieur.
Une équipe possède plusieurs joueurs.
Un joueur appartient obligatoirement à une seule équipe à un instant donné.
Un joueur est identifié par un identifiant unique, possède un nom, un poste et un numéro.
Chaque équipe doit avoir un capitaine.
Un capitaine est un joueur.
Un joueur peut être capitaine (relation spécifique entre Joueur et Equipe selon ton MCD).
Les données doivent permettre :
la planification du calendrier,
l’enregistrement des résultats,
la production des classements,
la consultation historique des éditions, phases, groupes, matchs et effectifs.

Pour le choix du capitaine, c'est une idée non donnée par l'IA générative, nous l'avons rajouté car cet type d'association a été vu en cours, et nous trouvions cette idée intéressante et appropriée. 


DICTIONNAIRE DE DONNÉES BRUTES 


| Signification de la donnée           | Type   | Taille        |
| ------------------------------------ | ------ | ------------- |
| Identifiant du stade                 | Entier | 10 chiffres   |
| Nom du stade                         | Texte  | 80 caractères |
| Ville du stade                       | Texte  | 60 caractères |
| Capacité du stade                    | Entier | 6 chiffres    |
| Identifiant du match                 | Entier | 10 chiffres   |
| Date du match                        | Date   | 10            |
| Heure du match                       | Heure  | 5             |
| Statut du match                      | Texte  | 20 caractères |
| Score équipe domicile                | Entier | 2 chiffres    |
| Score équipe extérieure              | Entier | 2 chiffres    |
| Identifiant de la phase              | Entier | 10 chiffres   |
| Nom de la phase                      | Texte  | 60 caractères |
| Ordre de la phase                    | Entier | 2 chiffres    |
| Identifiant de l’édition             | Entier | 10 chiffres   |
| Saison de l’édition (ex : 2025-2026) | Texte  | 9 caractères  |
| Identifiant du groupe                | Entier | 10 chiffres   |
| Code du groupe (A, B, C…)            | Texte  | 2 caractères  |
| Identifiant de l’équipe              | Entier | 10 chiffres   |
| Nom de l’équipe                      | Texte  | 80 caractères |
| Pays de l’équipe                     | Texte  | 40 caractères |
| Identifiant du joueur                | Entier | 10 chiffres   |
| Nom du joueur                        | Texte  | 80 caractères |
| Poste du joueur                      | Texte  | 20 caractères |
| Numéro du joueur                     | Entier | 2 chiffres    |


<img width="955" height="1305" alt="image" src="https://github.com/user-attachments/assets/8ac2109b-a068-4d4d-95c4-a6c464de0ecf" />





Le modèle logique de données obtenu à partir du MCD est le suivant :

- Edition(id_edition, saison)
- Phase(id_phase, nom_phase, ordre_phase, #id_edition)
- Groupe(id_groupe, code_groupe, #id_phase)
- Equipe(id_equipe, nom_equipe, pays_equipe)
- Joueur(id_joueur, nom_joueur, poste, numero_joueur, #id_equipe)
- Stade(id_stade, nom_stade, ville_stade, capacite_stade)
- Match(id_match, date_match, heure_match, statut_match, score_dom, score_ext, #id_stade, #id_phase, #id_equipe_dom, #id_equipe_ext)
- Inscrit(#id_edition, #id_equipe)
- Affecte(#id_groupe, #id_equipe)
- Joue(#id_joueur, #id_match)
- Capitaine(#id_equipe, #id_joueur)












Question partie 2 5ème étape 


La base de données est utilisée par un responsable de compétition dans une organisation qui gère un tournoi de 
football de type Ligue des Champions.
Son rôle est de suivre les équipes inscrites, les joueurs, les stades, les matchs programmés ou joués, ainsi que 
les groupes et les phases de la compétition.
Les informations qu’il souhaite extraire sont par exemple :

la liste des équipes participantes et leur pays ;
les joueurs d’une équipe donnée, avec leur poste et leur numéro ;
les matchs prévus ou terminés, classés par date ;
les stades ayant une capacité importante ;
les statistiques par équipe, par phase ou par stade ;
les équipes inscrites mais non encore affectées à un groupe ;
les équipes ayant joué au moins un match ;
les joueurs capitaines ;
les matchs ayant le plus ou le moins de buts ;
les phases, groupes et éditions concernées par les rencontres.
Les requêtes SQL ci-dessous correspondent donc à un usage concret de consultation et d’analyse de la compétition 
par un gestionnaire sportif.











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

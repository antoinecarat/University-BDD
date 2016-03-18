# University-BDD
Database representing University of Nantes behaviour.

## Database Composition :

###Tables :
- Etudiant
- ResultatEtudiant
- Matiere
- CM
- TD
- TP
- ResponsableMatiere
- MatiereTdTp
- NoteMatiere
- GroupeCours
- NoteEtu
- GroupeEtu

###Vues : 
- Notes pour chaque étudiant
- Liste des étudiants par prof et par cours
- Liste des cours par étudiant
- Nombre d’heure (CM, TD, TP et total) pour chaque cours
- Bulletin de chaque étudiant.

###Triggers :
- Mise à jour des moyennes à l'ajout et à l'insertion d'une note
- Vérification de l'inscription d'un étudiant à un cours auquel on veut lui ajouter une note.


###Fonctions / Procédure :
- insertion d’un étudiant
- insertion d'un enseignant (CC, TD et TP)
- insertion d'une noteCC / noteExam
- bulletin annuel / semestriel de l’étudiant avec moyenne
- calcul la moyenne du semestre d'un étudiant
- calcul de la moyenne de la promo sur une matiere
- calcul de la moyenne de la promo sur un semestre

###Rôles/Droits : 
- Univ-Enseignant :
  - insérer des notes
  - consulter la liste des élèves suivant un cours
- Univ-Etudiant :
  - consulter les cours ou l'on est inscrit
  - consulter les notes et les bulletins

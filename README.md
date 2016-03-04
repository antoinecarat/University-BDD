# University-BDD
Database representing University of Nantes behaviour.

## To-Do List

###Triggers : 
- [x] mettre à jour les moyennes en fonction des notes de cc et exam *à l'insertion et à la mise à jour*
- [ ] vérifier que les notes soit comprises entre 0 et 20 *à l'insertion et à la mise à jour*
- [ ] affectation des matieres pour un étudiant en fonction du groupe *à l'insertion et à la mise à jour*
- [ ] vérifier que le prof qui entre les notes est bien responsable de la matière *à l'insertion et à la mise à jour*

###Vues : 
- [x] aperçu des notes pour chaque étudiant 
- [x] aperçu de la liste des élèves pour un cours d’un prof
- [x] aperçu du nombre d’heures d’un cours
- [ ] aperçu du bulletin de chaque étudiant

###Fonctions / Procédure :
- [ ] insertion d’un étudiant (noEtu, nom, prenom, groupe)
- [ ] insertion d'une noteCC / noteExam
- [ ] bulletin annuel / semestriel de l’étudiant avec moyenne (reporting SQLPlus ?)
- [x] calcul la moyenne du semestre d'un étudiant
- [ ] calcul de la moyenne de la promo sur une matiere
- [ ] calcul de la moyenne de la promo pour le semestre

### Rôles/Droits : 
- [x] Univ-Admin : Il peut tout faire
- [x] Univ-Enseignant :
  - [x] insérer des notes dans une matière ou l'on est responsable (CC, TD ou TP) (Séparation des copies pour les corrigés)
  - [x] consultation des élèves inscrit à un cours dont on est responsable (CC, TD ou TP)
- [x] Univ-Etudiant :
  - [x] consultation des cours ou l'on est inscrit
  - [x] consultation des notes

###Index :
- [ ] index sur les id responsables
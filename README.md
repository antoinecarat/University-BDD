# University-BDD
Database representing University of Nantes behaviour.

## To-Do List

###Triggers : 
- [x] mettre à jour les moyennes en fonction des notes de cc et exam à l'insertion et à la mise à jour
- [ ] vérifier que les notes soit comprises entre 0 et 20 à l'insertion et à la mise à jour

###Vues : 
- [ ] aperçu des notes pour chaque étudiant 
- [x] aperçu de la liste des élèves pour un cours d’un prof
- [x] aperçu du nombre d’heures d’un cours
- [ ] aperçu du bulletin de chaque étudiant

###Fonctions / Procédure :
- [ ] insertion d’un étudiant
- [ ] insertion d'une noteCC / noteExam
- [ ] bulletin de l’étudiant / avec moyenne / reporting SQL/PLUS / annuel et semestriel
- [ ] calcul la moyenne du semestre d'un étudiant

### Rôles/Droits : 
- [ ] Admin : Il peut tout faire
- [ ] Prof :
  - [ ] insérer des notes dans une matière ou l'on est responsable (CC, TD ou TP) -> Séparation des copies pour les corrigés
  - [ ] consultation des élèves inscrit à un cours dont on est responsable (CC, TD ou TP)
- [ ] Etudiant :
  - [ ] consultation des cours ou l'on est inscrit
  - [ ] consultation des notes

###Index :
- [ ] index sur les id responsables

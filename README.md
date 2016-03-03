# University-BDD
Database representing University of Nantes behaviour.

## To-Do List

###Triggers : 
- [x] mettre à jour les moyennes en fonction des notes de cc et exam et tp

###Vues : 
- [x] aperçu des notes pour chaque étudiant 
- [x] aperçu de la liste des élèves pour un cours d’un prof
- [x] aperçu du nombre d’heures d’un cours

###Fonctions / Procédure : 
- [ ] insertion d’un étudiant
- [ ] insertion d'une noteCC / noteExam
- [ ] Bulletin de l’étudiant / avec moyenne / Reporting SQL/PLUS / Annuel et semestriel

### Rôles/Droits : 
- [ ] Admin : Il peut tout faire
- [ ] Prof :
  - [ ] insérer des notes dans une matiere ou l'on est responsable (CC, TD ou TP) -> Séparation des copies pour les corrigés
  - [ ] consultation des élèves inscrit à un cours dont on est responsable (CC, TD ou TP)
- [ ] Etudiant :
  - [ ] consultation des cours ou l'on est inscrit
  - [ ] consultation des notes

###Index :
- [ ] index sur les id responsables

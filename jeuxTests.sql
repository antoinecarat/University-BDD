-- On essaie d'insérer une note négative :
EXEC insertNoteCC('134727s', 2015, 'X6I0010', -4);


-- On essaie d'insérer une note supérieure à 20 :
EXEC insertNoteCC('133501k', 2015, 'X6I0010', 25);

-- On essaie d'insérer une note à un étudiant dans une matiere qu'il ne suis pas.
insert into Matiere values('X6IM010', 1, 11, 12, 9);
EXEC insertNoteCC('112771c',2015,'X6IM010', 12);
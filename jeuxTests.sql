-------------
-- Etudiants --
---------------


EXEC insertEtudiant('129010d','Carat','Antoine','502D',2015);
EXEC insertEtudiant('112771c','Turrado','Léo','502D',2015);
EXEC insertEtudiant('133501k','Grondin', 'Mathieu','501A',2015);
EXEC insertEtudiant('133641M','Maestracci','Damien','501B',2015);
EXEC insertEtudiant('134727s','Quémard','Maël','502C',2015);

EXEC insertEtudiant('129010d','Carat','Antoine','601B',2015);
EXEC insertEtudiant('112771c','Turrado','Léo','601B',2015);
EXEC insertEtudiant('133501k','Grondin', 'Mathieu','601B',2015);
EXEC insertEtudiant('133641M','Maestracci','Damien','601B',2015);
EXEC insertEtudiant('134727s','Quémard','Maël','601B',2015);



-----------
-- Notes --
-----------

EXEC insertNoteCC('129010d', 2015, 'X5I0010', 13.88);
EXEC insertNoteExam('129010d', 2015, 'X5I0010', 14.5);
EXEC insertNoteCC('129010d', 2015, 'X5I0020', 5);
EXEC insertNoteCC('129010d', 2015, 'X5I0030', 11.6);
EXEC insertNoteExam('129010d', 2015, 'X5I0030', 6.5);
EXEC insertNoteCC('129010d', 2015, 'X5I0040', 12.6);
EXEC insertNoteExam('129010d', 2015, 'X5I0040', 10.5);
EXEC insertNoteCC('129010d', 2015, 'X5I0050', 11.80);
EXEC insertNoteExam('129010d', 2015, 'X5I0050', 8);
EXEC insertNoteCC('129010d', 2015, 'X5A0010', 14);
EXEC insertNoteExam('129010d', 2015, 'X5A0010', 17);
EXEC insertNoteCC('129010d', 2015, 'X5T0280', 10);

-- EXEC insertNoteCC('133501k', 2015, 'X5I0030', 14);
-- EXEC insertNoteExam('133501k', 2015, 'X5I0030', 17);
-- EXEC insertNoteCC('133501k', 2015, 'X6I0010', 16);
-- EXEC insertNoteExam('133501k', 2015, 'X6I0010', 16);
-- EXEC insertNoteCC('129010d', 2015, 'X6I0050', 14);
-- EXEC insertNoteExam('129010d', 2015, 'X6I0050', 18);
-- EXEC insertNoteCC('134727s', 2015, 'X6I0050', 11);
-- EXEC insertNoteExam('134727s', 2015, 'X6I0050', 10);
-- EXEC insertNoteCC('133641M', 2015, 'X6I0050', 12);
-- EXEC insertNoteExam('133641M', 2015, 'X6I0050', 17);
-- EXEC insertNoteCC('112771c', 2015, 'X6I0050', 14);
-- EXEC insertNoteExam('112771c', 2015, 'X6I0050', 14);

insert into ResultatEtudiant values('129010d',5,2015, calcul_moyenneSem('129010d', 5, 2015));

-- insert into ResultatEtudiant values('112771c',5,2015, calcul_moyenneSem('112771c', 5));
-- insert into ResultatEtudiant values('133501k',5,2015, calcul_moyenneSem('133501k', 5));
-- insert into ResultatEtudiant values('133641M',5,2015, calcul_moyenneSem('133641M', 5));
-- insert into ResultatEtudiant values('134727s',5,2015, calcul_moyenneSem('134727s', 5));
-- insert into ResultatEtudiant values('133501k',6,2015, calcul_moyenneSem('133501k', 6));
-- insert into ResultatEtudiant values('129010d',6,2015, calcul_moyenneSem('129010d', 6));
-- insert into ResultatEtudiant values('112771c',6,2015, calcul_moyenneSem('112771c', 6));
-- insert into ResultatEtudiant values('133641M',6,2015, calcul_moyenneSem('133641M', 6));
-- insert into ResultatEtudiant values('134727s',6,2015, calcul_moyenneSem('134727s', 6));





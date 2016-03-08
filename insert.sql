EXEC insertCM('Serrano', 'Patricia');
EXEC insertCM('Thoraval', 'René');
EXEC insertCM('Goualard', 'Fréderick');

EXEC insertTD('Serrano', 'Patricia');
EXEC insertTD('Thoraval', 'René');
EXEC insertTD('Goualard', 'Fréderick');
EXEC insertTD('Fertin', 'Guillaume');
EXEC insertTD('Monfroy', 'Eric');

EXEC insertTP('Piscetelli', 'David');
EXEC insertTP('Thoraval', 'René');
EXEC insertTP('Li', 'Jing');

insert into Matiere values('X6I0050', 1, 12, 10, 11);
insert into Matiere values('X6I0010', 1, 11, 12, 9);
insert into Matiere values('X5I0030', 1, 14.5, 13, 8);
insert into Matiere values('X6IM020', 1, 13, 9, 15);

insert into ResponsableMatiere values('X6I0050', 2015, 'pSerrano');
insert into ResponsableMatiere values('X6I0010', 2015, 'rThoraval');
insert into ResponsableMatiere values('X5I0030', 2015, 'fGoualard');
-- insert into ResponsableMatiere values('X6IM020', 2014, 'aLarhlimi');

insert into MatiereTdTp values('X6I0050', 2015, '601B', 'pSerrano', 'dPiscetelli');
insert into MatiereTdTp values('X6I0010', 2015, '601B', 'rThoraval', 'rThoraval');
insert into MatiereTdTp values('X5I0030', 2015, '502C', 'eMonfroy', 'jLi');
-- insert into MatiereTdTp values('X6IM020', 2014, '609G', 'aLarhlimi', 'aLarhlimi');

insert into GroupeCours values('501A', 5, 'L3-Info', 'Informatique');
insert into GroupeCours values('501B', 5, 'L3-Info', 'Informatique');
insert into GroupeCours values('502C', 5, 'L3-Info', 'Informatique');
insert into GroupeCours values('502D', 5, 'L3-Info', 'Informatique');
insert into GroupeCours values('601A', 6, 'L3-Info', 'Informatique');
insert into GroupeCours values('601B', 6, 'L3-Info', 'Informatique');
insert into GroupeCours values('602C', 6, 'L3-Info', 'Informatique');
insert into GroupeCours values('602D', 6, 'L3-Info', 'Informatique');
-- insert into GroupeCours values('608E', 6, 'L3-Miage', 'Informatique');
-- insert into GroupeCours values('608F', 6, 'L3-Miage', 'Informatique');
-- insert into GroupeCours values('609G', 6, 'L3-Miage', 'Informatique');
-- insert into GroupeCours values('609H', 6, 'L3-Miage', 'Informatique');

EXEC insertEtudiant('129010d','Carat','Antoine','601B',2015);
EXEC insertEtudiant('112771c','Turrado','Léo','601B',2015);
EXEC insertEtudiant('133501k','Grondin', 'Mathieu','601B',2015);
EXEC insertEtudiant('133641M','Maestracci','Damien','601B',2015);
EXEC insertEtudiant('134727s','Quémard','Maël','601B',2015);

insert into ResultatEtudiant values('129010d',5,2015,10.39);
insert into ResultatEtudiant values('112771c',5,2015,10.17);
insert into ResultatEtudiant values('133501k',5,2015,10.7);
insert into ResultatEtudiant values('133641M',5,2015,9.98);
insert into ResultatEtudiant values('134727s',5,2015,10.46);
insert into ResultatEtudiant values('133501k',6,2015,11.7);
insert into ResultatEtudiant values('129010d',6,2015,14.5);
insert into ResultatEtudiant values('112771c',6,2015,12.7);
insert into ResultatEtudiant values('133641M',6,2015,13.7);
insert into ResultatEtudiant values('134727s',6,2015,12.9);

insert into NoteEtu values('133501k', 2015, 'X5I0030', 14, 17);
insert into NoteEtu values('133501k', 2015, 'X6I0010', 16, 16);
insert into NoteEtu values('129010d', 2015, 'X6I0050', 14, 18);
insert into NoteEtu values('134727s', 2015, 'X6I0050', 11, 10);
insert into NoteEtu values('133641M', 2015, 'X6I0050', 12, 17);
insert into NoteEtu values('112771c', 2015, 'X6I0050', 14, 14);


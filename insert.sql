insert into CM values('pSerranno', 'Serrano', 'Patricia');
insert into CM values('rThoraval', 'Thoraval', 'René');
insert into CM values('fGoualard', 'Goualard', 'Fréderick');
insert into CM values('aLarhlimi', 'Larhlimi', 'Abdelhalim');

insert into TD values('pSerranno', 'Serrano', 'Patricia');
insert into TD values('rThoraval', 'Thoraval', 'René');
insert into TD values('gFertin', 'Fertin', 'Guillaume');
insert into TD values('fGoualard', 'Goualard', 'Fréderick');
insert into TD values('eMonfroy', 'Monfroy', 'Eric');
insert into TD values('aLarhlimi', 'Larhlimi', 'Abdelhalim');

insert into TP values('dPiscetelli', 'Piscetelli', 'David');
insert into TP values('rThoraval', 'Thoraval', 'René');
insert into TP values('lJing', 'Li', 'Jing');
insert into TP values('aLarhlimi', 'Larhlimi', 'Abdelhalim');

insert into Matiere values('X6I0050', 1, 12, 10, 11);
insert into Matiere values('X6I0010', 1, 11, 12, 9);
insert into Matiere values('X5I0030', 1, 14.5, 13, 8);
insert into Matiere values('X6IM020', 1, 13, 9, 15);

insert into ResponsableMatiere values('X6I0050', 2015, 'pSerranno');
insert into ResponsableMatiere values('X6I0010', 2015, 'rThoraval');
insert into ResponsableMatiere values('X5I0030', 2015, 'fGoualard');
-- insert into ResponsableMatiere values('X6IM020', 2014, 'aLarhlimi');

insert into MatiereTdTp values('X6I0050', 2015, '601B', 'pSerranno', 'dPiscetelli');
insert into MatiereTdTp values('X6I0010', 2015, '601B', 'rThoraval', 'rThoraval');
insert into MatiereTdTp values('X5I0030', 2015, '502C', 'eMonfroy', 'lJing');
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



-- A EFFACER QUAND LES TRIGGERS / PROCEDURES / FONCTIONS SERONT TERMINEES

insert into Etudiant values('112771c', 'Turrado', 'Léo');
insert into Etudiant values('129010d', 'Carat', 'Antoine');
insert into Etudiant values('133501k', 'Grondin', 'Mathieu');
insert into Etudiant values('133641M', 'Maestracci', 'Damien');
insert into Etudiant values('134727s', 'Quémard', 'Maël');

insert into ResultatEtudiant values('129010d',5,2015,10.39);
insert into ResultatEtudiant values('112771c',5,2015,10.17);
insert into ResultatEtudiant values('133501k',5,2015,10.7);
insert into ResultatEtudiant values('133641M',5,2015,9.98);
insert into ResultatEtudiant values('134727s',5,2015,10.46);

insert into GroupeEtu values('133501k', '501A', 'X5I0030', 2015);
insert into GroupeEtu values('133641M', '501A', 'X5I0030', 2015);
insert into GroupeEtu values('134727s', '502C', 'X5I0030', 2015);
insert into GroupeEtu values('129010d', '502D', 'X5I0030', 2015);
insert into GroupeEtu values('112771c', '502D', 'X5I0030', 2015);
insert into GroupeEtu values('112771c', '601B', 'X6I0010', 2015);
insert into GroupeEtu values('129010d', '601B', 'X6I0010', 2015);
insert into GroupeEtu values('133501k', '601B', 'X6I0010', 2015);
insert into GroupeEtu values('133641M', '601B', 'X6I0010', 2015);
insert into GroupeEtu values('134727s', '601B', 'X6I0010', 2015);

insert into NoteEtu values('133501k', 2015, 'X5I0030', 14, 17);
insert into NoteEtu values('133501k', 2015, 'X6I0010', 15, 16);
insert into NoteEtu values('129010d', 2015, 'X6I0050', 14, 18);
insert into NoteEtu values('134727s', 2015, 'X6I0050', 11, 10);
insert into NoteEtu values('133641M', 2015, 'X6I0050', 12, 17);
insert into NoteEtu values('112771c', 2015, 'X6I0050', 14, 14);

insert into NoteMatiere values(14, 17, 15.5);
insert into NoteMatiere values(15, 16, 15.5);
insert into NoteMatiere values(14, 18, 16);
insert into NoteMatiere values(11, 10, 10.5);
insert into NoteMatiere values(12, 17, 14.5);
insert into NoteMatiere values(14, 14, 14);


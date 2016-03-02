-- n'insert pas de valeur pour les tables NoteEtu, NoteMatiere et ResultatEtudiant

insert into Etudiant values ('112771c', 'Turrado', 'Léo');
insert into Etudiant values('129010d', 'Carat', 'Antoine');
insert into Etudiant values('133501k', 'Grondin', 'Mathieu');
insert into Etudiant values('133641M', 'Maestracci', 'Damien');
insert into Etudiant values('134727s', 'Quémard', 'Maël');
insert into Etudiant values('122530L', 'Ouara', 'Bernard');

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
insert into ResponsableMatiere values('X6IM020', 2014, 'aLarhlimi');

insert into MatiereTdTp values('X6I0050', 2015, '601B', 'pSerranno', 'dPiscetelli');
insert into MatiereTdTp values('X6I0010', 2015, '601B', 'rThoraval', 'rThoraval');
insert into MatiereTdTp values('X5I0030', 2015, '502C', 'eMonfroy', 'lJing');
insert into MatiereTdTp values('X6IM020', 2014, '609G', 'aLarhlimi', 'aLarhlimi');

insert into GroupeCours values('601B', 6, 'L3-Info', 'Informatique');
insert into GroupeCours values('502D', 5, 'L3-Info', 'Informatique');
insert into GroupeCours values('501A', 5, 'L3-Info', 'Informatique');
insert into GroupeCours values('502C', 5, 'L3-Info', 'Informatique');
insert into GroupeCours values('609G', 6, 'L3-Miage', 'Informatique');

insert into GroupeEtu values('112771c', '601B', 'X6I0050', 2015);
insert into GroupeEtu values('129010d', '601B', 'X6I0050', 2015);
insert into GroupeEtu values('133501k', '601B', 'X6I0050', 2015);
insert into GroupeEtu values('133641M', '601B', 'X6I0050', 2015);
insert into GroupeEtu values('134727s', '601B', 'X6I0050', 2015);
insert into GroupeEtu values('112771c', '601B', 'X6I0010', 2015);
insert into GroupeEtu values('129010d', '601B', 'X6I0010', 2015);
insert into GroupeEtu values('133501k', '601B', 'X6I0010', 2015);
insert into GroupeEtu values('133641M', '601B', 'X6I0010', 2015);
insert into GroupeEtu values('134727s', '601B', 'X6I0010', 2015);
insert into GroupeEtu values('112771c', '502D', 'X5I0030', 2015);
insert into GroupeEtu values('129010d', '502D', 'X5I0030', 2015);
insert into GroupeEtu values('133501k', '501A', 'X5I0030', 2015);
insert into GroupeEtu values('133641M', '501A', 'X5I0030', 2015);
insert into GroupeEtu values('134727s', '502C', 'X5I0030', 2015);
insert into GroupeEtu values('122530L', '609G', 'X6IM020', 2014);



--------------
-- Matieres --
--------------

insert into Matiere values('X5I0010', 1, 14.5, 13, 8); --ODA
insert into Matiere values('X5I0020', 1, 14.5, 13, 8); --EtudesAlgo
insert into Matiere values('X5I0030', 1, 14.5, 13, 8); --Archi
insert into Matiere values('X5I0040', 1, 14.5, 13, 8); --Algo
insert into Matiere values('X5I0050', 1, 14.5, 13, 8); --L&A
insert into Matiere values('X5A0010', 0.5, 14.5, 13, 8); --Anglais
insert into Matiere values('X5T0280', 0.3, 14.5, 13, 8); --OP

insert into Matiere values('X6I0010', 1, 11, 12, 9); --PF
insert into Matiere values('X6I0020', 1, 11, 12, 9); --Fondement
insert into Matiere values('X6I0030', 1, 11, 12, 9); --RO
insert into Matiere values('X6I0040', 1, 11, 12, 9); --R&T
insert into Matiere values('X6I0050', 1, 12, 10, 11); --BDD
insert into Matiere values('X6A0010', 0.3, 13, 9, 15); --Anglais
insert into Matiere values('X6I0100', 0.5, 11, 12, 9); --Stage

-----------------
-- Enseignants --
-----------------

-- S5
EXEC insertEnseignant('Richoux', 'Florian');
EXEC insertEnseignant('Bechet', 'Denis');
EXEC insertEnseignant('Rampon', 'Jean-Xavier');
EXEC insertEnseignant('Rusu-Robini', 'Irena');
EXEC insertEnseignant('Goualard', 'Frederick');
EXEC insertEnseignant('Jeffreys', 'Brendon');
EXEC insertEnseignant('Guinness', 'Frazer');
EXEC insertEnseignant('Gurevsky', 'Evgeny');
EXEC insertEnseignant('Fertin', 'Guillaume');
EXEC insertEnseignant('Berger', 'Sandra');
EXEC insertEnseignant('Monfroy', 'Eric');
EXEC insertEnseignant('Li', 'Jing');


--S6
EXEC insertEnseignant('Serrano', 'Patricia');
EXEC insertEnseignant('Thoraval', 'Rene');
EXEC insertEnseignant('Przybylski', 'Anthony');
EXEC insertEnseignant('Enguehard', 'Chantal');
EXEC insertEnseignant('Jard', 'Claude');
EXEC insertEnseignant('Le Reste', 'Marie-Cecile');
EXEC insertEnseignant('Vincent', 'Emmanuel');
EXEC insertEnseignant('Delahaye', 'Benoit');
EXEC insertEnseignant('Piscetelli', 'David');
EXEC insertEnseignant('Moizeau', 'Isabelle');
EXEC insertEnseignant('Passard', 'Pierick');


------------------------------------
-- Affectation Enseignant-Matiere --
------------------------------------

--S5
insert into ResponsableMatiere values('X5I0010', 2015, 'fRichoux');
insert into ResponsableMatiere values('X5I0020', 2015, 'jRampon');
insert into ResponsableMatiere values('X5I0030', 2015, 'fGoualard');
insert into ResponsableMatiere values('X5I0040', 2015, 'iRusu-Robini');
insert into ResponsableMatiere values('X5I0050', 2015, 'dBechet');

insert into MatiereTdTp values('X5I0010', 2015, '501A', 'fRichoux', 'fRichoux');
insert into MatiereTdTp values('X5I0010', 2015, '501B', 'fRichoux', 'fRichoux');
insert into MatiereTdTp values('X5I0010', 2015, '502C', 'fRichoux', 'fRichoux');
insert into MatiereTdTp values('X5I0010', 2015, '502D', 'fRichoux', 'fRichoux');

insert into MatiereTdTp values('X5I0020', 2015, '501A', 'jRampon', 'jRampon');
insert into MatiereTdTp values('X5I0020', 2015, '501B', 'jRampon', 'jRampon');
insert into MatiereTdTp values('X5I0020', 2015, '502C', 'jRampon', 'jRampon');
insert into MatiereTdTp values('X5I0020', 2015, '502D', 'jRampon', 'jRampon');

insert into MatiereTdTp values('X5I0030', 2015, '501A', 'fGoualard', 'fGoualard');
insert into MatiereTdTp values('X5I0030', 2015, '501B', 'eMonfroy', 'eMonfroy');
insert into MatiereTdTp values('X5I0030', 2015, '502C', 'eMonfroy', 'eMonfroy');
insert into MatiereTdTp values('X5I0030', 2015, '502D', 'gFertin', 'gFertin');

insert into MatiereTdTp values('X5I0040', 2015, '501A', 'iRusu-Robini', 'iRusu-Robini');
insert into MatiereTdTp values('X5I0040', 2015, '501B', 'iRusu-Robini', 'iRusu-Robini');
insert into MatiereTdTp values('X5I0040', 2015, '502C', 'eGurevsky', 'eGurevsky');
insert into MatiereTdTp values('X5I0040', 2015, '502D', 'eGurevsky', 'eGurevsky');

insert into MatiereTdTp values('X5I0050', 2015, '501A', 'dBechet', 'eMonfroy');
insert into MatiereTdTp values('X5I0050', 2015, '501B', 'dBechet', 'eMonfroy');
insert into MatiereTdTp values('X5I0050', 2015, '502C', 'dBechet', 'eMonfroy');
insert into MatiereTdTp values('X5I0050', 2015, '502D', 'eMonfroy', 'eMonfroy');



--S6
insert into ResponsableMatiere values('X6I0010', 2015, 'rThoraval');
insert into ResponsableMatiere values('X6I0020', 2015, 'cEnguehard');
insert into ResponsableMatiere values('X6I0030', 2015, 'aPrzybylski');
insert into ResponsableMatiere values('X6I0040', 2015, 'cJard');
insert into ResponsableMatiere values('X6I0050', 2015, 'pSerrano');

insert into MatiereTdTp values('X6I0010', 2015, '601A', 'rThoraval', 'rThoraval');
insert into MatiereTdTp values('X6I0010', 2015, '601B', 'rThoraval', 'rThoraval');
insert into MatiereTdTp values('X6I0010', 2015, '602C', 'rThoraval', 'rThoraval');
insert into MatiereTdTp values('X6I0010', 2015, '602D', 'rThoraval', 'rThoraval');

insert into MatiereTdTp values('X6I0020', 2015, '601A', 'eMonfroy', 'eMonfroy');
insert into MatiereTdTp values('X6I0020', 2015, '601B', 'cEnguehard', 'cEnguehard');
insert into MatiereTdTp values('X6I0020', 2015, '602C', 'eMonfroy', 'eMonfroy');
insert into MatiereTdTp values('X6I0020', 2015, '602D', 'eMonfroy', 'eMonfroy');

insert into MatiereTdTp values('X6I0030', 2015, '601A', 'aPrzybylski', 'aPrzybylski');
insert into MatiereTdTp values('X6I0030', 2015, '601B', 'fRichoux', 'fRichoux');
insert into MatiereTdTp values('X6I0030', 2015, '602C', 'aPrzybylski', 'aPrzybylski');
insert into MatiereTdTp values('X6I0030', 2015, '602D', 'aPrzybylski', 'aPrzybylski');

insert into MatiereTdTp values('X6I0040', 2015, '601A', 'cJard', 'pPassard');
insert into MatiereTdTp values('X6I0040', 2015, '601B', 'bDelahaye', 'bDelahaye');
insert into MatiereTdTp values('X6I0040', 2015, '602C', 'cJard', 'pPassard');
insert into MatiereTdTp values('X6I0040', 2015, '602D', 'cJard', 'pPassard');

insert into MatiereTdTp values('X6I0050', 2015, '601A', 'pSerrano', 'iMoizeau');
insert into MatiereTdTp values('X6I0050', 2015, '601B', 'pSerrano', 'dPiscetelli');
insert into MatiereTdTp values('X6I0050', 2015, '602C', 'pSerrano', 'dPiscetelli');
insert into MatiereTdTp values('X6I0050', 2015, '602D', 'pSerrano', 'dPiscetelli');

-------------
-- Groupes --
-------------

insert into GroupeCours values('501A', 5, 'L3-Info', 'Informatique');
insert into GroupeCours values('501B', 5, 'L3-Info', 'Informatique');
insert into GroupeCours values('502C', 5, 'L3-Info', 'Informatique');
insert into GroupeCours values('502D', 5, 'L3-Info', 'Informatique');

insert into GroupeCours values('601A', 6, 'L3-Info', 'Informatique');
insert into GroupeCours values('601B', 6, 'L3-Info', 'Informatique');
insert into GroupeCours values('602C', 6, 'L3-Info', 'Informatique');
insert into GroupeCours values('602D', 6, 'L3-Info', 'Informatique');
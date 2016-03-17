-----------------------------------------------------
-- 					PROCEDURES					   --
-----------------------------------------------------


create or replace procedure insertEtudiant(
	noEtu_u Etudiant.noEtu%type,
	nomEtu Etudiant.nomEtu%type,
	preEtu Etudiant.preEtu%type,
	groupe_u GroupeEtu.groupe%type,
	annee GroupeEtu.annee%type) as
cursor listeMatiere is select matiere from MatiereTdTp where MatiereTdTp.groupe = groupe_u;
nbLigne number;
begin
	SELECT count(*) into nbLigne FROM Etudiant WHERE noEtu=noEtu_u;
	IF nbLigne = 0 THEN
		insert into Etudiant values (noEtu_u, nomEtu, preEtu);
	END IF;
	for courant in listeMatiere loop
		insert into GroupeEtu values (noEtu_u, groupe_u, courant.matiere, annee);
	end loop;
end;
/


CREATE OR REPLACE PROCEDURE insertEnseignant(
	nomResp CM.nomResp_CM%type,
	preResp CM.preResp_CM%type) as
begin
	insert into CM values(CONCAT(LOWER(SUBSTR(preResp,1,1)),nomResp), nomResp, preResp);
	insert into TD values(CONCAT(LOWER(SUBSTR(preResp,1,1)),nomResp), nomResp, preResp);
	insert into TP values(CONCAT(LOWER(SUBSTR(preResp,1,1)),nomResp), nomResp, preResp);
end;
/

-- create or replace procedure insertCM(
-- 	nomResp_CM CM.nomResp_CM%type,
-- 	preResp_CM CM.preResp_CM%type) as
-- begin
-- 	insert into CM values(CONCAT(LOWER(SUBSTR(preResp_CM,1,1)),nomResp_CM), nomResp_CM, preResp_CM);
-- end;
-- /

-- create or replace procedure insertTD(
-- 	nomResp_TD TD.nomResp_TD%type,
-- 	preResp_TD TD.preResp_TD%type) as
-- begin
-- 	insert into TD values(CONCAT(LOWER(SUBSTR(preResp_TD,1,1)),nomResp_TD), nomResp_TD, preResp_TD);
-- end;
-- /

-- create or replace procedure insertTP(
-- 	nomResp_TP TP.nomResp_TP%type,
-- 	preResp_TP TP.preResp_TP%type) as
-- begin
-- 	insert into TP values(CONCAT(LOWER(SUBSTR(preResp_TP,1,1)),nomResp_TP), nomResp_TP, preResp_TP);
-- end;
-- /

create or replace procedure insertNoteCC(
	noEtu_u Etudiant.noEtu%type,
	annee_u NoteEtu.annee%type,
	matiere_u NoteEtu.matiere%type,
	note NoteEtu.noteCC%type) as
	nbLigne number;
	noteE NoteEtu.noteExam%type;
begin
	SELECT count(*) into nbLigne FROM NoteEtu WHERE noEtu=noEtu_u and annee=annee_u and matiere=matiere_u;
	IF nbLigne > 0 THEN 
		SELECT noteExam into noteE FROM NoteEtu WHERE noEtu=noEtu_u and annee=annee_u and matiere=matiere_u;
		IF (noteE IS NULL) THEN
			UPDATE NoteEtu SET noteCC = note, noteExam = note WHERE noEtu=noEtu_u and annee=annee_u and matiere=matiere_u;
		ELSE
			UPDATE NoteEtu SET noteCC = note WHERE noEtu=noEtu_u and annee=annee_u and matiere=matiere_u;
		END IF;
	ELSE
		insert into NoteEtu values (noEtu_u, annee_u, matiere_u, note, note);
	END IF;
end;
/

create or replace procedure insertNoteExam(
	noEtu_u Etudiant.noEtu%type,
	annee_u NoteEtu.annee%type,
	matiere_u NoteEtu.matiere%type,
	note NoteEtu.noteExam%type) as
	nbLigne number;
	noteC NoteEtu.noteCC%type;
begin
	SELECT count(*) into nbLigne FROM NoteEtu WHERE noEtu=noEtu_u and annee=annee_u and matiere=matiere_u;
	IF nbLigne > 0 THEN 
		SELECT noteCC into noteC FROM NoteEtu WHERE noEtu=noEtu_u and annee=annee_u and matiere=matiere_u;
		IF (noteC IS NULL) THEN
			UPDATE NoteEtu SET noteCC = note, noteExam = note WHERE noEtu=noEtu_u and annee=annee_u and matiere=matiere_u;
		ELSE
			UPDATE NoteEtu SET noteExam = note WHERE noEtu=noEtu_u and annee=annee_u and matiere=matiere_u;
		END IF;
	ELSE
		insert into NoteEtu values (noEtu_u, annee_u, matiere_u, note, note);
	END IF;
end;
/

SET SERVEROUTPUT ON
create or replace procedure bulletin_semestriel_etu(
	semestre_etu  ResultatEtudiant.semestre%type,
	annee_etu  ResultatEtudiant.annee%type,
	noEtudiant  ResultatEtudiant.noEtu%type) as
cursor bulletin is select * from bulletins_etu where noEtu = noEtudiant and semestre = semestre_etu and annee = annee_etu;
begin
	for ligne IN bulletin LOOP
		dbms_output.put_line('annee | semestre | noEtudiant | nomEtu | prenomEtu | matiere | moyenneMat');
		dbms_output.put_line(ligne.annee || ' | ' || ligne.semestre || ' | ' || ligne.noEtu || ' | ' || ligne.nomEtu || ' | ' || ligne.preEtu || ' | ' || ligne.matiere || ' | ' || ligne.moyenneMat);
		dbms_output.put_line('moyenneMatPromo | moyenneSem | moyenneSemPromo');
		dbms_output.put_line(ligne.moyenneMatPromo || ' | ' || ligne.moyenneSem || ' | ' || ligne.moyenneSemPromo);
	end loop;
end;
/


create or replace procedure bulletin_annuel_etu(
	annee_etu  ResultatEtudiant.annee%type,
	noEtudiant  ResultatEtudiant.noEtu%type) as
cursor bulletin is select * from bulletins_etu where noEtu = noEtudiant and annee = annee_etu;
begin
	for ligne IN bulletin LOOP
		dbms_output.put_line('annee | semestre | noEtudiant | nomEtu | prenomEtu | matiere | moyenneMat');
		dbms_output.put_line(ligne.annee || ' | ' || ligne.semestre || ' | E' || ligne.noEtu || ' | ' || ligne.nomEtu || ' | ' || ligne.preEtu || ' | ' || ligne.matiere || ' | ' || ligne.moyenneMat);
		dbms_output.put_line('moyenneMatPromo | moyenneSem | moyenneSemPromo');
		dbms_output.put_line(ligne.moyenneMatPromo || ' | ' || ligne.moyenneSem || ' | ' || ligne.moyenneSemPromo);
	end loop;
end;
/

-----------------------------------------------------
-- 					FUNCTIONS					   --
-----------------------------------------------------


create or replace function calcul_moyenneSem(
	noEtudiant IN ResultatEtudiant.noEtu%type,
	semestre_etu IN ResultatEtudiant.semestre%type,
	annee_u IN ResultatEtudiant.annee%type
	)
	return ResultatEtudiant.moyenneSem%type as

	CURSOR li IS select moyenneMat, coeffMat
				from ((NoteEtu NATURAL JOIN NoteMatiere) NATURAL JOIN Matiere) 
				where noEtu = noEtudiant and SUBSTR(matiere, 2, 1) = semestre_etu and annee = annee_u;
	calcul number(4,2) := 0;
	sum_coeff number(4,2):= 0;
begin
	for ligne IN li LOOP
		calcul := calcul + (ligne.moyenneMat * ligne.coeffMat);
		sum_coeff := sum_coeff + ligne.coeffMat;
	END LOOP;
	IF sum_coeff = 0 THEN
		return 0;
	ELSE
		calcul := (calcul / sum_coeff);
		return calcul;
	END IF;
end;
/

create or replace function calcul_moyenneSemPromo(
	semestre_etu IN ResultatEtudiant.semestre%type,
	annee_etu IN ResultatEtudiant.annee%type
	)
	return ResultatEtudiant.moyenneSem%type as

	CURSOR li IS (select moyenneSem
				from ResultatEtudiant
				where semestre = semestre_etu and annee = annee_etu);
	somme number(4,2) := 0;
	moy number(4,2):= 0;
	cmp number(6):=0;
begin

	for ligne IN li LOOP
		somme := somme + ligne.moyenneSem;
		cmp := cmp+1;
	END LOOP;
		moy := (somme / cmp);
end;
/
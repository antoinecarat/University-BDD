-----------------------------------------------------
-- 					PROCEDURES					   --
-----------------------------------------------------


create or replace procedure insertEtudiant(
	noEtu Etudiant.noEtu%type,
	nomEtu Etudiant.nomEtu%type,
	preEtu Etudiant.preEtu%type,
	groupe GroupeEtu.groupe%type,
	annee GroupeEtu.annee%type) as
cursor listeMatiere is select matiere from MatiereTdTp where MatiereTdTp.groupe = groupe;
nbLigne number;
begin
	SELECT count(*) into nbLigne FROM Etudiant WHERE Etudiant.noEtu=noEtu;
	IF nbLigne = 0 THEN
		insert into Etudiant values (noEtu, nomEtu, preEtu);
	ELSE
		for courant in listeMatiere loop
			insert into GroupeEtu values (noEtu, groupe, courant.matiere, annee);
		end loop;
	END IF;
end;
/

create or replace procedure insertCM(
	nomResp_CM CM.nomResp_CM%type,
	preResp_CM CM.preResp_CM%type) as
begin
	insert into CM values(CONCAT(LOWER(SUBSTR(preResp_CM,1,1)),nomResp_CM), nomResp_CM, preResp_CM);
end;
/

create or replace procedure insertTD(
	nomResp_TD TD.nomResp_TD%type,
	preResp_TD TD.preResp_TD%type) as
begin
	insert into TD values(CONCAT(LOWER(SUBSTR(preResp_TD,1,1)),nomResp_TD), nomResp_TD, preResp_TD);
end;
/

create or replace procedure insertTP(
	nomResp_TP TP.nomResp_TP%type,
	preResp_TP TP.preResp_TP%type) as
begin
	insert into TP values(CONCAT(LOWER(SUBSTR(preResp_TP,1,1)),nomResp_TP), nomResp_TP, preResp_TP);
end;
/

create or replace procedure insertNoteCC(
	noEtu_u Etudiant.noEtu%type,
	annee_u NoteEtu.annee%type,
	matiere_u NoteEtu.matiere%type,
	note NoteEtu.noteCC%type) as
	nbLigne number;
begin
	SELECT count(*) into nbLigne FROM NoteEtu WHERE noEtu=noEtu_u and annee=annee_u and matiere=matiere_u;
	IF nbLigne > 0 THEN 
		UPDATE NoteEtu SET noteCC = note WHERE noEtu=noEtu_u and annee=annee_u and matiere=matiere_u;
	ELSE
		insert into NoteEtu (noEtu,annee,matiere,noteCC) values (noEtu_u, annee_u, matiere_u, note);
	END IF;
end;
/

create or replace procedure insertNoteExam(
	noEtu_u Etudiant.noEtu%type,
	annee_u NoteEtu.annee%type,
	matiere_u NoteEtu.matiere%type,
	note NoteEtu.noteExam%type) as
	nbLigne number;
begin
	SELECT count(*) into nbLigne FROM NoteEtu WHERE noEtu=noEtu_u and annee=annee_u and matiere=matiere_u;
	IF nbLigne > 0 THEN 
		UPDATE NoteEtu SET noteExam = note WHERE noEtu=noEtu_u and annee=annee_u and matiere=matiere_u;
	ELSE
		insert into NoteEtu (noEtu,annee,matiere,noteExam) values (noEtu_u, annee_u, matiere_u, note);
	end if;
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

SET SERVEROUTPUT ON
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
		return moy;
end;
/

-- create or replace procedure bulletin_semestriel_etu(
-- 	semestre_etu IN ResultatEtudiant.semestre%type,
-- 	annee_etu IN ResultatEtudiant.annee%type,
-- 	noEtudiant IN ResultatEtudiant.noEtu%type) as
-- cursor bulletin is select * from bulletins_etu where noEtu = noEtudiant and semestre = semestre_etu and annee = annee_etu;
-- v_filehandle utl_file.file_type;
-- begin
-- 	v_filehandle := utl_file.fopen('/comptes/E134727S/Documents/Semestre_6/','out.txt','w');--Opening a file
--     utl_file.putf(v_filehandle,'Bulletin d un etudiant : fait le %s\n',SYSDATE);
--     utl_file.new_line(v_filehandle);
--     for ligne in bulletin loop
--     	utl_file.putf(v_filehandle,'noEtu %s nom %s prenom %s\n',ligne.noEtu, ligne.nomEtu, ligne.preEtu);
--     end loop;
--     utl_file.put_line(v_filehandle,'***END OF REPORT***');
--     UTL_FILE.fclose(v_filehandle);
-- end;
-- /





create or replace procedure insertEtudiant(
	noEtu Etudiant.noEtu%type,
	nomEtu Etudiant.nomEtu%type,
	preEtu Etudiant.preEtu%type,
	groupe GroupeEtu.groupe%type,
	annee GroupeEtu.annee%type) as
cursor listeMatiere is select matiere from MatiereTdTp where MatiereTdTp.groupe = groupe;
begin
	insert into Etudiant values (noEtu, nomEtu, preEtu);
	for courant in listeMatiere loop
		insert into GroupeEtu values (noEtu, groupe, courant.matiere, annee);
	end loop;
end;
/

create or replace procedure insertCM(
	idResp_CM CM.idResp_CM%type,
	nomResp_CM CM.nomResp_CM%type,
	preResp_CM CM.preResp_CM%type) as
begin
	insert into CM values(idResp_CM, nomResp_CM, preResp_CM);
end;
/

create or replace procedure insertTD(
	idResp_TD TD.idResp_TD%type,
	nomResp_TD TD.nomResp_TD%type,
	preResp_TD TD.preResp_TD%type) as
begin
	insert into TD values(idResp_TD, nomResp_TD, preResp_TD);
end;
/

create or replace procedure insertTP(
	idResp_TP TP.idResp_TP%type,
	nomResp_TP TP.nomResp_TP%type,
	preResp_TP TP.preResp_TP%type) as
begin
	insert into TP values(idResp_TP, nomResp_TP, preResp_TP);
end;
/

create or replace function calcul_moyenneSem(
	noEtudiant IN ResultatEtudiant.noEtu%type,
	semestre_etu IN ResultatEtudiant.semestre%type
	)
	return ResultatEtudiant.moyenneSem%type as

	CURSOR li IS select moyenneMat, coeffMat
				from ((NoteEtu NATURAL JOIN NoteMatiere) NATURAL JOIN Matiere) 
				where noEtu = noEtudiant and SUBSTR(matiere, 2, 1) = semestre_etu;
	calcul number(4,2) := 0;
	sum_coeff number(4,2):= 0;
begin
	for ligne IN li LOOP
		calcul := calcul + (ligne.moyenneMat * ligne.coeffMat);
		sum_coeff := sum_coeff + ligne.coeffMat;
	END LOOP;	
		calcul := (calcul / sum_coeff);
		return calcul;
end;
/

create or replace function calcul_moyenneMatPromo(
	matiere_etu IN NoteEtu.matiere%type,
	annee_etu IN NoteEtu.annee%type
	)
	return NoteMatiere.moyenneMat%type as

	CURSOR li IS (select moyenneMat
				from Note_etu_globale
				where matiere = matiere_etu and annee = annee_etu);
	somme number(4,2) := 0;
	moy number(4,2):= 0;
	cmp number(6):=0;
begin

	for ligne IN li LOOP
		somme := somme + ligne.moyenneMat;
		cmp := cmp+1;
	END LOOP;	
		moy := (somme / cmp);
		return moy;
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

create or replace procedure bulletin_semestriel_etu(
	semestre_etu IN ResultatEtudiant.semestre%type,
	annee_etu IN ResultatEtudiant.annee%type,
	noEtudiant IN ResultatEtudiant.noEtu%type) as
--cursor bulletin is select * from bulletins_etu where noEtu = noEtudiant and semestre = semestre_etu and annee = annee_etu;
begin
	SET ECHO OFF
	SPOOL 'bulletin_' || noEtudiant.lst
	SET ECHO OFF
	SET FEEDBACK OFF
	SET HEADING ON
	SET PAGESIZE 100
	ttitle col 6 'Bulletin de '|| noEtudiant skip 2
	select * from bulletins_etu where noEtu = noEtudiant and semestre = semestre_etu and annee = annee_etu;
	SPOOL OFF
	SET ECHO ON
end;
/











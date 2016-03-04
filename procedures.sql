create or replace procedure insertEtudiant(
	noEtu Etudiant.noEtu%type,
	nomEtu Etudiant.nomEtu%type,
	preEtu Etudiant.preEtu%type,
	groupe GroupeEtu.groupe%type,
	annee GroupeEtu.annee%type) as
begin
	insert into Etudiant values (noEtu, nomEtu, preEtu);
	insert into GroupeEtu values (noEtu, groupe, null, annee);
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

DECLARE
	CURSOR li IS select moyenneMat, coeffMat
				from ((NoteEtu NATURAL JOIN NoteMatiere) NATURAL JOIN Matiere) 
				where noEtu = noEtudiant and SUBSTRING(matiere, 2, 1) = semestre_etu;
	calcul number(4,2);
	sum_coeff number(4,2);
function calcul_moyenneSem(
	noEtudiant IN ResultatEtudiant.noEtu%type,
	semestre_etu IN ResultatEtudiant.semestre%type
	)
	return number(4,2)
	begin
		for ligne IN li LOOP
			calcul := calcul + li.moyenneMat * li.coeffMat;
			sum_coeff := sum_coeff + li.coeffMat;
 		END LOOP;	
 		return calcul := calcul / sum_coeff;
end calcul_moyenneSem;
/








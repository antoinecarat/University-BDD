create or replace procedure insetEtudiant(
	noEtu Etudiant.noEtu%type,
	nomEtu Etudiant.nomEtu%type,
	preEtu Etudiant.preEtu%type,
	groupe GroupeEtu.groupe%type,
	annee GroupeEtu.annee%type) as
begin
	insert into Etudiant values (noEtu, nomEtu, preEtu);
	insert into GroupeEtu values (noEtu, roupe, null, annee);
end;
/
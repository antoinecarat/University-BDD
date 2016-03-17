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
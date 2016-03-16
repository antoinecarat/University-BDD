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
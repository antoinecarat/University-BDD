  
CREATE OR REPLACE VIEW Bulletins_etu AS
	SELECT ne.annee, re.semestre, e.noEtu, e.nomEtu, e.preEtu, ne.matiere, nm.moyenneMat, calcul_moyenneMatPromo(ne.matiere, ne.annee) as MoyenneMatPromo, re.moyenneSem, calcul_moyenneSemPromo(re.semestre, ne.annee) as MoyenneSemPromo
	FROM Etudiant e, NoteEtu ne, NoteMatiere nm, ResultatEtudiant re
	WHERE ne.noEtu = e.noEtu and e.noEtu = re.noEtu
	--AND ne.annee = re.annee
	AND	ne.noteCC = nm.noteCC and  ne.noteExam = nm.noteExam
	AND re.semestre = (SUBSTR(ne.matiere,2,1))
	GROUP BY ne.annee, re.semestre, e.noEtu, e.nomEtu, e.preEtu, ne.matiere, nm.moyenneMat, re.moyenneSem 
	ORDER BY ne.annee ASC, re.semestre ASC, e.nomEtu ASC;
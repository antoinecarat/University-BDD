CREATE OR REPLACE VIEW Note_etu_globale AS 
	SELECT ne.noEtu, nomEtu, preEtu, matiere, ne.noteCC, ne.noteExam, moyenneMat 
	FROM (NoteEtu NATURAL JOIN Etudiant) ne INNER JOIN NoteMatiere nm ON ne.noteCC = nm.noteCC and  ne.noteExam = nm.noteExam ORDER BY nomEtu ASC;
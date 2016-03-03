-- CREATE OR REPLACE VIEW Note_etu_globale AS 
-- 	SELECT ne.noEtu, ne.nomEtu, ne.preEtu, ne.matiere, ne.noteCC, ne.noteExam, nm.moyenneMat 
-- 	FROM (NoteEtu NATURAL JOIN Etudiant) as ne INNER JOIN NoteMatiere nm ON ne.noteCC = nm.noteCC and  ne.noteExam = nm.noteExam ORDER BY nomEtu ASC;

CREATE OR REPLACE VIEW Nb_h_matiere AS
	SELECT matiere, nbH_CM, nbH_TD, nbH_TP, (nbH_CM + nbH_TD + nbH_TP) AS nbH_total
	FROM Matiere;

CREATE OR REPLACE VIEW Liste_etu_matiere AS
	SELECT DISTINCT g.annee, rm.idResp_CM, mt.idresp_TD, mt.idResp_TP, g.matiere, g.groupe, g.noEtu
	FROM ResponsableMatiere rm , MatiereTdTp mt, GroupeEtu g
	WHERE g.annee = rm.annee and g.annee = mt.annee 
	AND g.matiere = rm.matiere and g.matiere = mt.matiere
  	ORDER BY g.annee ASC;
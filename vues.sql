--Vue qui présenste les notes d'examen, de cc et la moyenne des étudiants pour une matière 
CREATE OR REPLACE VIEW Note_etu_globale AS 
	SELECT ne.annee, ne.noEtu, e.nomEtu, e.preEtu, ne.matiere, ne.noteExam, ne.noteCC, nm.moyenneMat 
	FROM NoteEtu ne, Etudiant e, NoteMatiere nm
	WHERE ne.noEtu = e.noEtu
	AND	ne.noteCC = nm.noteCC and  ne.noteExam = nm.noteExam 
	ORDER BY ne.annee ASC, e.nomEtu ASC;

--Vue qui regroupe le nombre d'heure d'une matière en calculant le nombre d'heure total
CREATE OR REPLACE VIEW Nb_h_matiere AS
	SELECT matiere, nbH_CM, nbH_TD, nbH_TP, (nbH_CM + nbH_TD + nbH_TP) AS nbH_total
	FROM Matiere;

--Vue qui regroupe les étudiants qui assistent à une matière
CREATE OR REPLACE VIEW Liste_etu_matiere AS
	SELECT DISTINCT g.annee, rm.idResp_CM, mt.idresp_TD, mt.idResp_TP, g.matiere, g.groupe, g.noEtu, e.nomEtu, e.preEtu
	FROM ResponsableMatiere rm , MatiereTdTp mt, GroupeEtu g, Etudiant e
	WHERE g.annee = rm.annee and g.annee = mt.annee 
	AND g.matiere = rm.matiere and g.matiere = mt.matiere
	AND g.noEtu = e.noEtu
  	ORDER BY g.annee ASC, rm.idResp_CM ASC, mt.idresp_TD ASC, mt.idResp_TP ASC, g.matiere ASC, g.groupe ASC, e.nomEtu ASC;
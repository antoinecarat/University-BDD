CREATE ROLE Univ_Enseignant;
CREATE ROLE Univ_Etudiant;

GRANT Univ_Enseignant TO L3_34;
GRANT Univ_Enseignant TO L3_29;
GRANT Univ_Etudiant TO L3_32;
GRANT Univ_Etudiant TO L3_26;

GRANT SELECT, INSERT, UPDATE ON NoteEtu TO Univ_Enseignant;
GRANT SELECT ON Note_etu_globale TO Univ_Enseignant;
GRANT SELECT ON Nb_h_matiere TO Univ_Enseignant;
GRANT SELECT ON Liste_etu_matiere TO Univ_Enseignant;

GRANT SELECT ON Nb_h_matiere TO Univ_Etudiant;
GRANT SELECT ON Bulletins_etu TO Univ_Etudiant;
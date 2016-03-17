CREATE OR REPLACE TRIGGER moyenneMatiere AFTER INSERT OR UPDATE ON NoteEtu
FOR EACH ROW
Declare
	moy number(4,2);
BEGIN	
	IF (:new.noteCC <> :old.noteCC) OR (:new.noteExam <> :old.noteExam) THEN
		moy := (:new.noteCC + :new.noteExam)/2;
		IF moy NOT IN (SELECT moyenneMat FROM NoteMatiere) THEN
			INSERT into NoteMatiere values (:new.noteCC, :new.noteExam, moy );
		END IF;
	END IF;
END;
/


CREATE OR REPLACE TRIGGER verifInscriptionEtuCours BEFORE INSERT OR UPDATE ON NoteEtu
FOR EACH ROW
Declare
	etudiant_non_inscrit EXCEPTION;
	nbLigne number;
BEGIN
	SELECT COUNT(*) into nbLigne FROM GroupeEtu WHERE :new.noEtu = GroupeEtu.noEtu;
	IF nbLigne = 0 THEN
		RAISE etudiant_non_inscrit;
	END IF;
	EXCEPTION
		WHEN etudiant_non_inscrit THEN RAISE_APPLICATION_ERROR (-20002, 'L etudiant ne suit pas ce cours.');
END;
/
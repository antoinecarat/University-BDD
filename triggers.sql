CREATE OR REPLACE TRIGGER moyenneMatiereIns AFTER INSERT ON NoteEtu 
FOR EACH ROW 
Declare
	moy number(4,2);
	pas_de_note Exception;
BEGIN
	if :new.noteCC is not null or :new.noteExam is not null then
		moy := (:new.noteCC + :new.noteExam)/2; 
		INSERT into NoteMatiere values (:new.noteExam, :new.noteCC, moy );
	end if;
END;
/

CREATE OR REPLACE TRIGGER moyenneMatiereUp AFTER UPDATE ON NoteEtu 
FOR EACH ROW 
Declare
	moy number(4,2);
	pas_de_note Exception;
BEGIN
	if :new.noteCC <> :old.noteCC or :new.noteExam <> :old.noteExam then
		moy := (:new.noteCC + :new.noteExam)/2; 
		INSERT into NoteMatiere values (:new.noteExam, :new.noteCC, moy );
	end if;
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
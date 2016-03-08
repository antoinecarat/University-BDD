CREATE OR REPLACE TRIGGER moyenneMatiereIns AFTER INSERT ON NoteEtu 
FOR EACH ROW 
Declare
	moy number(4,2);
	pas_de_note Exception;
BEGIN
	if :new.noteCC is not null and :new.noteExam is not null then
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

CREATE OR REPLACE TRIGGER verifNotes AFTER INSERT OR UPDATE ON NoteEtu 
FOR EACH ROW 
Declare
	note_non_valide EXCEPTION;
BEGIN
	if (:new.noteCC NOT BETWEEN 0 and 20) or (:new.noteExam NOT BETWEEN 0 and 20) then
		RAISE note_non_valide;
	end if;
	EXCEPTION
		WHEN note_non_valide THEN RAISE_APPLICATION_ERROR (-20001, 'La/Les notes ne sont pas valides (comprises entre 0 et 20)');
END;
/
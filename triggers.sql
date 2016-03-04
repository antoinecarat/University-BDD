CREATE TRIGGER moyenneMatiereIns AFTER INSERT ON NoteEtu 
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

CREATE TRIGGER moyenneMatiereUp AFTER UPDATE ON NoteEtu 
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

CREATE TRIGGER verifNotes AFTER INSERT ON NoteEtu 
FOR EACH ROW 
BEGIN
	if (:new.noteCC BETWEEN 0 and 20) or (:new.noteExam  BETWEEN 0 and 20) then
		INSERT into NoteMatiere values (:new.noteExam, :new.noteCC, moy );
	end if;
END;
/

CREATE TRIGGER verifNotes AFTER UPDATE ON NoteEtu 
FOR EACH ROW 
BEGIN
	if (:new.noteCC BETWEEN 0 and 20) or (:new.noteExam  BETWEEN 0 and 20) then
		INSERT into NoteMatiere values (:new.noteExam, :new.noteCC, moy );
	end if;
END;
/
CREATE TABLE Etudiant(
	noEtu varchar2(7),
	nomEtu varchar2(20),
	preEtu varchar2(20),
	CONSTRAINT pk_Etudiant PRIMARY KEY (noEtu)
	);

CREATE TABLE ResultatEtudiant(
	noEtu varchar2(7),
	semestre number(2),
	annee number(4),
	moyenneSem number(4,2),
	CONSTRAINT pk_ResultatEtudiant PRIMARY KEY (noEtu, semestre, annee)
	);

CREATE TABLE Matiere(
	matiere varchar2(10),
	coeffMat number(4,2),
	nbH_CM number(4,2),
	nbH_TD number(4,2),
	nbH_TP number(4,2),
	CONSTRAINT pk_Matiere PRIMARY KEY (matiere)
	);

CREATE TABLE CM(
	idResp_CM varchar2(20),
	nomResp_CM varchar2(20),
	preResp_CM varchar2(20),
	CONSTRAINT pk_CM PRIMARY KEY (idResp_CM)
	);

CREATE TABLE TD(
	idResp_TD varchar2(20),
	nomResp_TD varchar2(20),
	preResp_TD varchar2(20),
	CONSTRAINT pk_TD PRIMARY KEY (idResp_TD)
	);

CREATE TABLE TP(
	idResp_TP varchar2(20),
	nomResp_TP varchar2(20),
	preResp_TP varchar2(20),
	CONSTRAINT pk_TP PRIMARY KEY (idResp_TP)
	);

CREATE TABLE ResponsableMatiere(
	matiere varchar2(10),
	annee number(20),
	idResp_CM varchar2(20),
	CONSTRAINT pk_ResponsableMatiere PRIMARY KEY (matiere, annee),
	CONSTRAINT fk_respCM FOREIGN KEY (idResp_CM) REFERENCES CM(idResp_CM)
	);

CREATE TABLE MatiereTdTp(
	matiere varchar2(10),
	annee number(4),
	groupe varchar2(20),
	idResp_TD varchar2(20),
	idResp_TP varchar2(20),
	CONSTRAINT pk_MatiereTdTp PRIMARY KEY (matiere, annee, groupe),
	CONSTRAINT fk_respTD FOREIGN KEY (idResp_TD) REFERENCES TD(idResp_TD),
	CONSTRAINT fk_respTP FOREIGN KEY (idResp_TP) REFERENCES TP(idResp_TP)
	);

CREATE TABLE NoteMatiere(
	noteExam number(4,2),
	noteCC number(4,2),
	moyenneMat number(4,2),
	CONSTRAINT pk_NoteMatiere PRIMARY KEY (noteExam, noteCC)
	);

CREATE TABLE GroupeCours(
	groupe varchar2(20),
	semestre number(2),
	promo varchar2(40),
	departement varchar2(20),
	CONSTRAINT pk_GroupeCours PRIMARY KEY (groupe)
	);

CREATE TABLE NoteEtu(
	noEtu varchar2(7),
	annee number(4),
	matiere varchar2(10),
	noteExam number(4,2),
	noteCC number(4,2),
	CONSTRAINT pk_NoteEtu PRIMARY KEY (noEtu, annee, matiere)
	);

CREATE TABLE GroupeEtu(
	noEtu varchar2(7),
	groupe varchar2(20),
	matiere varchar2(10),
	annee number(4),
	CONSTRAINT pk_GroupeEtu PRIMARY KEY (noEtu, groupe, matiere, annee),
	CONSTRAINT fk_noEtu FOREIGN KEY (noEtu) REFERENCES Etudiant(noEtu)
	);
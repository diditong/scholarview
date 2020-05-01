CREATE TABLE scholars (
    scId INT NOT NULL AUTO_INCREMENT,
    biography LONGTEXT,
    scName VARCHAR(255),
    bsSchool VARCHAR(255),
    bsYear INT,
    msSchool VARCHAR(255),
    msYear INT,
    phdSchool VARCHAR(255),
    phdYear INT,
    interest1 VARCHAR(255),
    interest2 VARCHAR(255),
    interest3 VARCHAR(255),
    teaching1 VARCHAR(255),
    teaching2 VARCHAR(255),
    teaching3 VARCHAR(255),
    PRIMARY KEY (scId)
);

INSERT INTO scholars(scId,scName,biography,bsSchool,bsYear,msSchool,msYear,phdSchool,phdYear,interest1,interest2,interest3,teaching1,teaching2,teaching3) VALUES (1,'Abdussalam Alawini','I am a teaching assistant professor in the Department of Computer Science at The University of Illinois at Urbana-Champaign. My research interests are broadly in the field of databases, with a focus on data management. I am particularly interested in applying machine learning methods to various problems of modern data management systems. I am also interested in CS education research.','University of Tripoli',2002,'Portland State University',2011,'Portland State University',2016,'Data Provenance','Data Citation','Computers and Education','CS411: Database Systems',NULL,NULL);
INSERT INTO scholars(scId,scName,biography,bsSchool,bsYear,msSchool,msYear,phdSchool,phdYear,interest1,interest2,interest3,teaching1,teaching2,teaching3) VALUES (2,'Jeff Erickson','I''m a computational geometer/topologist/graphophile with more general interests in algorithms, data structures, and lower bounds. I have the lowest undergraduate GPA (2.4/4.0) of any professor I''ve ever met, although some of my colleagues came close, and a few others never finished college at all. (I really shouldn''t be proud of that.) Only three other professors have been in my department longer than I have. (I really shouldn''t be proud of that, either.) I teach mostly large algorithms classes; you might find my free textbook and other course materials useful. From 2013 to 2016, I was an associate department head and chair of the faculty recruiting committee. I am a SafeTOC advocate.','Rice University',1987,'University of California, Irvine',1992,'University of California, Berkeley',1996,'Algorithms','Data Structures','Computational Geometry','CS374: Algorithms and Model of Computation','CS473: Algorithms',NULL);
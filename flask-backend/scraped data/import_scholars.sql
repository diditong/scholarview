CREATE TABLE scholars (
    scId INT NOT NULL AUTO_INCREMENT,
    scName VARCHAR(255),
    bsSchool VARCHAR(255),
    msSchool VARCHAR(255),
    phdSchool VARCHAR(255),
    bsGradYear INT,
    msGradYear INT,
    phdGradYear INT,
    hIndex INT,
    researchInterest1 VARCHAR(255),
    researchInterest2 VARCHAR(255),
    researchInterest3 VARCHAR(255),
    PRIMARY KEY (scId)
);

INSERT INTO scholars(scId,scName,bsSchool,msSchool,phdSchool,bsGradYear,msGradYear,phdGradYear,hIndex,researchInterest1,researchInterest2,researchInterest3) VALUES (1,'Abdussalam Alawini','University of Tripoli','Portland State University','Portland State University',2002,2011,2016,6,'Data Provenance','Database Systems','Computer Science Education');
INSERT INTO scholars(scId,scName,bsSchool,msSchool,phdSchool,bsGradYear,msGradYear,phdGradYear,hIndex,researchInterest1,researchInterest2,researchInterest3) VALUES (2,'Jeff Erickson','Rice University','University of California, Irvine','University of California, Berkeley',1987,1992,1996,37,'Algorithms','Data Structures','Computational Geometry');
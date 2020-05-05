CREATE TABLE ratings (
    usrname VARCHAR(255) NOT NULL,
    scName VARCHAR(255) NOT NULL,
    courseIdx INT NOT NULL,
    rating VARCHAR(255),
    PRIMARY KEY (usrname, scName, courseIdx),
    FOREIGN KEY (usrname) REFERENCES users(usrname) ON UPDATE CASCADE
);

INSERT INTO ratings (usrname, scName, courseIdx, rating) VALUES ('jtong8','Abdussalam Alawini',1,'55555');
INSERT INTO ratings (usrname, scName, courseIdx, rating) VALUES ('jtong8','Jeff Erickson',2,'55555');
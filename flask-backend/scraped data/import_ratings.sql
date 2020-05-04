CREATE TABLE ratings (
    usrname VARCHAR(255) NOT NULL,
    scName VARCHAR(255) NOT NULL,  
    rating1 INT,
    rating2 INT,
    rating3 INT,
    rating4 INT,
    rating5 INT,
    PRIMARY KEY (usrname, scName),
    FOREIGN KEY (usrname) REFERENCES users(usrname) ON UPDATE CASCADE
);

INSERT INTO ratings (usrname, scName, rating1, rating2, rating3, rating4, rating5) VALUES ('jtong8','Abdussalam Alawini',5,5,5,5,5);
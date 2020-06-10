CREATE TABLE Suppliers(
    sid int,
    sname Varchar(255),
    address Varchar(255),
    constraint pk_dept primary key (sid)
);

CREATE TABLE parts(
    pid int,
    pname Varchar(100),
    color Varchar(1000),
    sid int,
    constraint fk_dept foreign key (sid) references Suppliers(sid));

A.
SELECT DISTINCT sname, s.sid
FROM S_uppliers s, p_arts t
WHERE s.sid=t.sid and t.color='red';

select * from S_uppliers
select * from p_arts

B.
SELECT distinct s.sid
FROM S_uppliers s, p_arts  t
WHERE s.sid=t.sid and s.address='chennai'

or 

SELECT distinct sid,sname,address FROM P_ARTS NATURAL JOIN S_UPPLIERS NATURAL JOIN CATALOG WHERE address = 'chennai' order by sid
SELECT s.sid
FROM S_uppliers s, p_arts  t
WHERE s.sid=t.sid and s.address='chennai';


where color != red

CREATE TABLE CATALOG AS
SELECT S_UPPLIERS.SID, P_ARTS.PID FROM S_UPPLIERS, P_ARTS
WHERE S_UPPLIERS.SID=P_ARTS.SID

ALTER TABLE CATALOG
    ADD PRICE INT;

UPDATE CATALOG
SET PRICE = 10
WHERE SID=1

UPDATE CATALOG
SET PRICE = 20
WHERE SID=2

UPDATE CATALOG
SET PRICE = 30
WHERE SID=3

UPDATE CATALOG
SET PRICE = 40
WHERE SID=4 AND PID=4

UPDATE CATALOG
SET PRICE = 35
WHERE SID=4 AND PID=6

UPDATE CATALOG
SET PRICE = 5
WHERE SID=4 AND PID=7

UPDATE CATALOG
SET PRICE = 25
WHERE SID=5 AND PID=8

UPDATE CATALOG
SET PRICE = 32
WHERE SID=5 AND PID=5

UPDATE CATALOG
SET PRICE = 22
WHERE SID=5 AND PID=9

C.
SELECT AVG(PRICE) FROM CATALOG, P_ARTS
WHERE CATALOG.PID=P_ARTS.PID AND P_ARTS.color='red'




SELECT * FROM S_UPPLIERS, P_ARTS
WHERE S_UPPLIERS.SID=P_ARTS.SID
ORDER BY S_UPPLIERS.SID ASC

INSERT INTO S_UPPLIERS
VALUES(6,'rum','chennai')

INSERT INTO P_ARTS
VALUES(10,'book','black',6)

SELECT SNAME,COUNT(SNAME)
FROM S_UPPLIERS, P_ARTS
WHERE (S_UPPLIERS.SID=P_ARTS.SID)
GROUP BY SNAME

D.
SELECT SNAME, C 
FROM(
    SELECT SNAME, COUNT(SNAME) AS C 
    FROM P_ARTS NATURAL JOIN S_UPPLIERS 
    GROUP BY SNAME)
WHERE C = (SELECT MAX(C)
           FROM (SELECT COUNT(SNAME) AS C 
                 FROM P_ARTS NATURAL JOIN S_UPPLIERS
                 GROUP BY SNAME))
OR

SELECT *
FROM (SELECT SNAME, COUNT(SNAME) AS C 
FROM P_ARTS NATURAL JOIN S_UPPLIERS 
GROUP BY SNAME ORDER BY C DESC)
WHERE ROWNUM=1


E.
SELECT SID
FROM(
    SELECT SNAME, COUNT(SNAME) AS C 
    FROM P_ARTS NATURAL JOIN S_UPPLIERS 
    GROUP BY SNAME)
WHERE C=(SELECT COUNT(DISTINCT PNAME) FROM P_ARTS)


ADDITIONAL(CHECK PREVIOUS QUERIES)
F.
SELECT SNAME
FROM(
    SELECT SNAME, COUNT(SNAME) AS C 
    FROM P_ARTS NATURAL JOIN S_UPPLIERS
    where color='red'
    GROUP BY SNAME)
WHERE C=(SELECT COUNT(DISTINCT PNAME) FROM P_ARTS WHERE COLOR='red')

G.
SELECT COLOR, count(SID) AS NUMBER_OF_SUPPLIERS FROM P_ARTS NATURAL JOIN S_UPPLIERS GROUP BY COLOR
OR 
SELECT COLOR, count(P_ARTS.SID) AS NUMBER_OF_SUPPLIERS FROM P_ARTS, S_UPPLIERS WHERE S_UPPLIERS.SID=P_ARTS.SID GROUP BY COLOR
--NOT USING NATURAL JOIN BECAUSE QUALIFIER(PARTS.SID) IS USED, SO NATURAL JOINS WILL USE COMMON ATTRIBUTES

h.
SELECT SNAME, ADDRESS, PRICE, COLOR
FROM P_ARTS NATURAL JOIN S_UPPLIERS NATURAL JOIN CATALOG
WHERE PRICE = (SELECT MIN(PRICE) FROM P_ARTS NATURAL JOIN S_UPPLIERS NATURAL JOIN CATALOG WHERE COLOR='red')
i.
SELECT COLOR, MIN(PRICE) FROM P_ARTS natural join CATALOG GROUP BY COLOR
j.
SELECT SNAME, COUNT(PNAME) FROM S_UPPLIERS natural join P_ARTS group by SNAME
K.
SELECT SNAME, ADDRESS, PRICE 
FROM P_ARTS NATURAL JOIN S_UPPLIERS NATURAL JOIN CATALOG
WHERE PRICE = (SELECT MAX(PRICE) FROM CATALOG)
L.
SELECT SNAME, COUNT(SNAME) AS NUMBER_OF_PARTS FROM P_ARTS NATURAL JOIN S_UPPLIERS GROUP BY SNAME HAVING COUNT(SNAME)>=2

UPDATE P_ARTS 
SET SID = 5
WHERE PNAME='book'

UPDATE P_ARTS 
SET PNAME='plate'
WHERE pid=4

Delete from S_UPPLIERS WHERE SID =6

SELECT * FROM P_ARTS NATURAL JOIN S_UPPLIERS NATURAL JOIN CATALOG ORDER BY SID
SELECT * FROM P_ARTS ORDER BY sid
SELECT * FROM S_UPPLIERS ORDER BY SID
SELECT * FROM CATALOG NATURAL JOIN P_ARTS ORDER BY SID

UPDATE P_ARTS 
SET SID = 5
WHERE PNAME='book'

UPDATE P_ARTS 
SET PNAME='plate'
WHERE pid=4

Delete from S_UPPLIERS WHERE SID =6

INSERT INTO P_ARTS
VALUES(2,'door','red',5),
INSERT INTO P_ARTS
VALUES(1,'wheel','black',5),
INSERT INTO P_ARTS
VALUES
(4,'plate','red',5),
INSERT INTO P_ARTS
VALUES
(6,'eraser','red',5),
INSERT INTO P_ARTS
VALUES(7,'pen','blue',5),
INSERT INTO P_ARTS
VALUES(3,'chair','red',5);






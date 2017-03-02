/******* TASK 1: INSERT YOUR CODE TO CREATE THE FOUR TABLES HERE (IN THE RIGHT ORDER) ***********/
CREATE TABLE SHOP
(SHOPID CHAR(4) NOT NULL,
ADDRESS VARCHAR2(40),
CITY VARCHAR2(15),
"STATE" VARCHAR2(3),
CONTACTNO CHAR(10),
CONSTRAINT SHOP_PK PRIMARY KEY (SHOPID));

CREATE TABLE APPLIANCE
(APPLIANCEID CHAR(4) NOT NULL,
MODELID CHAR(4) NOT NULL,
APPLIANCENAME VARCHAR2(25),
MANUFACTUREYEAR NUMBER(4),
PRICE NUMBER (6,2),
CONSTRAINT APPLIANCE_PK PRIMARY KEY (APPLIANCEID,MODELID));

CREATE TABLE WHOLESALER
(WHOLESALERID CHAR(4) NOT NULL,
BUSINESSNAME VARCHAR2(25),
ADDRESS VARCHAR2(40),
CITY VARCHAR2(15),
"STATE" VARCHAR2(3),
CONTACTNO CHAR(10),
CONSTRAINT WHOLESALER_PK PRIMARY KEY (WHOLESALERID));

CREATE TABLE DELIVERY
(DELIVERYID CHAR(5) NOT NULL,
SHOPID CHAR(4) NOT NULL,
APPLIANCEID CHAR(4) NOT NULL,
MODELID CHAR(4) NOT NULL,
WHOLESALERID CHAR(4) NOT NULL,
DELIVERYDATE DATE,
QUANTITY NUMBER(2),
PRICEPERUNIT NUMBER(6,2),
CONSTRAINT DELIVERY_PK PRIMARY KEY (DELIVERYID),
CONSTRAINT DELIVERY_FK1 FOREIGN KEY (SHOPID) REFERENCES SHOP (SHOPID),
CONSTRAINT DELIVERY_FK2 FOREIGN KEY (APPLIANCEID,MODELID) REFERENCES APPLIANCE (APPLIANCEID,MODELID),
CONSTRAINT DELIVERY_FK4 FOREIGN KEY (WHOLESALERID) REFERENCES WHOLESALER (WHOLESALERID));


/******* TASK 2: INSERT YOUR CODE TO POPULATE THE DATA FOR THE FOUR TABLES HERE ***********/
/*SHOP*/
INSERT INTO SHOP(SHOPID,ADDRESS,CITY,"STATE",CONTACTNO)
VALUES('S001','23 BROADWAY','SYDNEY','NSW','0298762234')
;
INSERT INTO SHOP(SHOPID,ADDRESS,CITY,"STATE",CONTACTNO)
VALUES('S002','39 AUBURN','SYDNEY','NSW','0290224533')
;
INSERT INTO SHOP(SHOPID,ADDRESS,CITY,"STATE",CONTACTNO)
VALUES('S003','486 PHILLIP','CANBERRA','ACT','0278923455')
;
INSERT INTO SHOP(SHOPID,ADDRESS,CITY,"STATE",CONTACTNO)
VALUES('S004','56 TORQUAY','GEELONG','VIC','0357788990')
;
INSERT INTO SHOP(SHOPID,ADDRESS,CITY,"STATE",CONTACTNO)
VALUES('S005','99 ST KILDA','MELBOURNE','VIC','0344556611')
;
INSERT INTO SHOP(SHOPID,ADDRESS,CITY,"STATE",CONTACTNO)
VALUES('S006','30 RIVERSIDE','LAUNCESTON','TAS','0344556611')
;
INSERT INTO SHOP(SHOPID,ADDRESS,CITY,"STATE",CONTACTNO)
VALUES('S007','7 CAIRNS ST','CAIRNS','QLD','0756112098')
;
INSERT INTO SHOP(SHOPID,ADDRESS,CITY,"STATE",CONTACTNO)
VALUES('S008','19 CLARE','ADELAIDE','SA','0834553555')
;
INSERT INTO SHOP(SHOPID,ADDRESS,CITY,"STATE",CONTACTNO)
VALUES('S009','903 HERBERT','DARWIN','NT','0855667788')
;
INSERT INTO SHOP(SHOPID,ADDRESS,CITY,"STATE",CONTACTNO)
VALUES('S010','19 YOKINE','PERTH','WA','0823451122')
;
/*APPLIANCE*/
INSERT INTO APPLIANCE(APPLIANCEID,MODELID,APPLIANCENAME,MANUFACTUREYEAR,PRICE)
VALUES('F001','M001','2 DOOR FRIDGE','2015','2344.67')
;
INSERT INTO APPLIANCE(APPLIANCEID,MODELID,APPLIANCENAME,MANUFACTUREYEAR,PRICE)
VALUES('F001','M034','SMART FRIDGE','2014','8899.09')
;
INSERT INTO APPLIANCE(APPLIANCEID,MODELID,APPLIANCENAME,MANUFACTUREYEAR,PRICE)
VALUES('F001','M099','1 DOOR FRIDGE','2013','777.99')
;
INSERT INTO APPLIANCE(APPLIANCEID,MODELID,APPLIANCENAME,MANUFACTUREYEAR,PRICE)
VALUES('TV01','M001','SMART LED TV','2015','6778.93')
;
INSERT INTO APPLIANCE(APPLIANCEID,MODELID,APPLIANCENAME,MANUFACTUREYEAR,PRICE)
VALUES('TV01','M003','LCD TV','2012','2211.12')
;
INSERT INTO APPLIANCE(APPLIANCEID,MODELID,APPLIANCENAME,MANUFACTUREYEAR,PRICE)
VALUES('TV01','M015','3D SMART LCD TV','2014','3446.78')
;
INSERT INTO APPLIANCE(APPLIANCEID,MODELID,APPLIANCENAME,MANUFACTUREYEAR,PRICE)
VALUES('W001','M001','WASHING MACHINE TL','2014','904.83')
;
INSERT INTO APPLIANCE(APPLIANCEID,MODELID,APPLIANCENAME,MANUFACTUREYEAR,PRICE)
VALUES('W001','M099','WASHING MACHINE FL','2015','1988.29')
;
INSERT INTO APPLIANCE(APPLIANCEID,MODELID,APPLIANCENAME,MANUFACTUREYEAR,PRICE)
VALUES('W001','M321','WASHING MACHINE NODRYER','2010','655.21')
;
INSERT INTO APPLIANCE(APPLIANCEID,MODELID,APPLIANCENAME,MANUFACTUREYEAR,PRICE)
VALUES('K001','M001','KETTLE-1L','2013','88.50')
;
INSERT INTO APPLIANCE(APPLIANCEID,MODELID,APPLIANCENAME,MANUFACTUREYEAR,PRICE)
VALUES('K001','M089','KETTLE-5L','2015','121.90')
;
INSERT INTO APPLIANCE(APPLIANCEID,MODELID,APPLIANCENAME,MANUFACTUREYEAR,PRICE)
VALUES('MI01','M034','MICROWAVE-20L','2012','200.00')
;
INSERT INTO APPLIANCE(APPLIANCEID,MODELID,APPLIANCENAME,MANUFACTUREYEAR,PRICE)
VALUES('MI01','M009','MICROWAVE-34L','2013','300.00')
;

/*WHOLESALER*/
INSERT INTO WHOLESALER(WHOLESALERID,BUSINESSNAME,ADDRESS,CITY,"STATE",CONTACTNO)
VALUES('W001','GOT WHOLESALERS','24 LANECOVE RD','SYDNEY','NSW','0298999099')
;
INSERT INTO WHOLESALER(WHOLESALERID,BUSINESSNAME,ADDRESS,CITY,"STATE",CONTACTNO)
VALUES('W002','SUITS WHOLESALERS','562 PRINCESS ST','CANBERRA','ACT','0290009000')
;
INSERT INTO WHOLESALER(WHOLESALERID,BUSINESSNAME,ADDRESS,CITY,"STATE",CONTACTNO)
VALUES('W003','RING WHOLESALERS','435 REASON RD','PERTH','WA','0844445555')
;
INSERT INTO WHOLESALER(WHOLESALERID,BUSINESSNAME,ADDRESS,CITY,"STATE",CONTACTNO)
VALUES('W004','BARRY WHOLESALERS','11 SYMPHONY DRIVE','DARWIN','NT','0811112222')
;
INSERT INTO WHOLESALER(WHOLESALERID,BUSINESSNAME,ADDRESS,CITY,"STATE",CONTACTNO)
VALUES('W005','MURPHY WHOLESALERS','77 PILOT ST','HOBART','TAS','0355567778')
;
INSERT INTO WHOLESALER(WHOLESALERID,BUSINESSNAME,ADDRESS,CITY,"STATE",CONTACTNO)
VALUES('W006','PABLO WHOLESALERS','49 COGNO RD','ADELAIDE','SA','0899990000')
;
INSERT INTO WHOLESALER(WHOLESALERID,BUSINESSNAME,ADDRESS,CITY,"STATE",CONTACTNO)
VALUES('W007','ELLIS WHOLESALERS','133 PARTNER DRIVE','MELBOURNE','VIC','0344556622')
;

/*DELIVERY*/
INSERT INTO DELIVERY(DELIVERYID,SHOPID,APPLIANCEID,MODELID,WHOLESALERID,DELIVERYDATE,QUANTITY,PRICEPERUNIT)
VALUES('D001','S001','F001','M001','W001','01/AUG/15','45','2000.9')
;
INSERT INTO DELIVERY(DELIVERYID,SHOPID,APPLIANCEID,MODELID,WHOLESALERID,DELIVERYDATE,QUANTITY,PRICEPERUNIT)
VALUES('D001','S001','F001','M001','W001','01/AUG/15','45','2000.9')
;
INSERT INTO DELIVERY(DELIVERYID,SHOPID,APPLIANCEID,MODELID,WHOLESALERID,DELIVERYDATE,QUANTITY,PRICEPERUNIT)
VALUES('D002','S001','TV01','M015','W003','03/AUG/15','23','3000.7')
;
INSERT INTO DELIVERY(DELIVERYID,SHOPID,APPLIANCEID,MODELID,WHOLESALERID,DELIVERYDATE,QUANTITY,PRICEPERUNIT)
VALUES('D003','S003','TV01','M001','W005','11/AUG/15','21','6000.4')
;
INSERT INTO DELIVERY(DELIVERYID,SHOPID,APPLIANCEID,MODELID,WHOLESALERID,DELIVERYDATE,QUANTITY,PRICEPERUNIT)
VALUES('D004','S004','F001','M034','W002','19/AUG/15','18','8000.9')
;
INSERT INTO DELIVERY(DELIVERYID,SHOPID,APPLIANCEID,MODELID,WHOLESALERID,DELIVERYDATE,QUANTITY,PRICEPERUNIT)
VALUES('D005','S004','W001','M099','W003','16/AUG/15','10','1500')
;
INSERT INTO DELIVERY(DELIVERYID,SHOPID,APPLIANCEID,MODELID,WHOLESALERID,DELIVERYDATE,QUANTITY,PRICEPERUNIT)
VALUES('D006',',S005','TV01','M001','W002','10/AUG/15	21','6000')
;
INSERT INTO DELIVERY(DELIVERYID,SHOPID,APPLIANCEID,MODELID,WHOLESALERID,DELIVERYDATE,QUANTITY,PRICEPERUNIT)
VALUES('D007','S007','W001','M099','W002','21/AUG/15','34','1500')
;
INSERT INTO DELIVERY(DELIVERYID,SHOPID,APPLIANCEID,MODELID,WHOLESALERID,DELIVERYDATE,QUANTITY,PRICEPERUNIT)
VALUES('D008','S002','F001','M001','W007','21/AUG/15','45','2000.9')
;
INSERT INTO DELIVERY(DELIVERYID,SHOPID,APPLIANCEID,MODELID,WHOLESALERID,DELIVERYDATE,QUANTITY,PRICEPERUNIT)
VALUES('D009','S006','W001','M001','W006','11/AUG/15','41','800.55')
;
INSERT INTO DELIVERY(DELIVERYID,SHOPID,APPLIANCEID,MODELID,WHOLESALERID,DELIVERYDATE,QUANTITY,PRICEPERUNIT)
VALUES('D010','S010','W001','M001','W003','10/AUG/15','26','800.55')
;
INSERT INTO DELIVERY(DELIVERYID,SHOPID,APPLIANCEID,MODELID,WHOLESALERID,DELIVERYDATE,QUANTITY,PRICEPERUNIT)
VALUES('D011','S008','F001','M034','W001','29/AUG/15','50','8000')
;
INSERT INTO DELIVERY(DELIVERYID,SHOPID,APPLIANCEID,MODELID,WHOLESALERID,DELIVERYDATE,QUANTITY,PRICEPERUNIT)
VALUES('D012','S009','TV01','M015','W003','22/AUG/15','10','3000.7')
;
INSERT INTO DELIVERY(DELIVERYID,SHOPID,APPLIANCEID,MODELID,WHOLESALERID,DELIVERYDATE,QUANTITY,PRICEPERUNIT)
VALUES('D013','S009','MI01','M034','W004','29/AUG/15','70','150')
;
INSERT INTO DELIVERY(DELIVERYID,SHOPID,APPLIANCEID,MODELID,WHOLESALERID,DELIVERYDATE,QUANTITY,PRICEPERUNIT)
VALUES('D014','S007','K001','M001','W005','20/AUG/15','23','50.3')
;
INSERT INTO DELIVERY(DELIVERYID,SHOPID,APPLIANCEID,MODELID,WHOLESALERID,DELIVERYDATE,QUANTITY,PRICEPERUNIT)
VALUES('D015','S002','MI01','M009','W002','07/AUG/15','40','200')
;

/******* TASK 3: INSERT YOUR QUERY HERE ***********/
SELECT BUSINESSNAME,CITY 
FROM WHOLESALER
;

/******* TASK 4: INSERT YOUR QUERY HERE ***********/
SELECT ADDRESS,CITY,"STATE",SUBSTR(CONTACTNO,3,8)
FROM SHOP
;

/******* TASK 5: INSERT YOUR QUERY HERE ***********/
SELECT APPLIANCENAME,MANUFACTUREYEAR, '$' || PRICE AS PRICE
FROM APPLIANCE
ORDER BY MANUFACTUREYEAR DESC,PRICE ASC
;

/******* TASK 6: INSERT YOUR QUERY HERE ***********/
SELECT * FROM SHOP
WHERE "STATE" IN ('VIC','NSW')
AND ADDRESS LIKE '%O%'
;

/******* TASK 7: INSERT YOUR QUERY HERE ***********/
SELECT DELIVERY.DELIVERYID, SHOP.CITY, SHOP."STATE", DELIVERY.PRICEPERUNIT*DELIVERY.QUANTITY AS "TOTAL COST"
FROM DELIVERY, SHOP
WHERE DELIVERY.SHOPID = SHOP.SHOPID
AND
DELIVERYDATE >='20/AUG/15'
;

/******* TASK 8: INSERT YOUR QUERY HERE ***********/
SELECT SHOPID, SUM(QUANTITY)
FROM DELIVERY
GROUP BY SHOPID
ORDER BY SHOPID ASC
;

/******* TASK 9: INSERT YOUR QUERY HERE ***********/
SELECT *
FROM DELIVERY
INNER JOIN WHOLESALER
ON DELIVERY.WHOLESALERID = WHOLESALER.WHOLESALERID
;

/******* TASK 10: INSERT YOUR QUERY HERE ***********/
SELECT DELIVERYID,DELIVERYDATE,QUANTITY
FROM DELIVERY
WHERE (QUANTITY <20 OR QUANTITY >30)
AND DELIVERYDATE > '15/AUG/15'
ORDER BY DELIVERYDATE ASC
;

/******* TASK 11: INSERT YOUR QUERY HERE ***********/
SELECT SHOP.ADDRESS, SHOP.CITY, SHOP."STATE"
FROM SHOP,WHOLESALER,DELIVERY
WHERE SHOP.SHOPID = DELIVERY.SHOPID
AND WHOLESALER.WHOLESALERID = DELIVERY.WHOLESALERID
AND SHOP."STATE" IN ('TAS','NSW','NT','WA')
;

/******* TASK 12: INSERT YOUR QUERY HERE ***********/
SELECT SHOP."STATE", COUNT(DELIVERYID)
FROM SHOP,DELIVERY
WHERE SHOP.SHOPID = DELIVERY.SHOPID
;

/******* TASK 13: INSERT YOUR QUERY HERE ***********/
SELECT APPLIANCE.*
FROM APPLIANCE, DELIVERY
WHERE APPLIANCE.APPLIANCEID = DELIVERY.APPLIANCEID
AND APPLIANCE.MODELID = DELIVERY.MODELID
AND DELIVERYDATE IN ('21-AUG-2015','29-AUG-2015')
;

/******* TASK 14: INSERT YOUR QUERY HERE ***********/
SELECT BUSINESSNAME, AVG(QUANTITY) AS A_Q
FROM WHOLESALER,DELIVERY
WHERE WHOLESALER.WHOLESALERID = DELIVERY.WHOLESALERID AND ROWNUM <= 3
GROUP BY BUSINESSNAME
ORDER BY A_Q DESC
;

/******* ANY ASSUMPTIONS/COMMENTS ***********/
/*TASK 10 - ASSUMED THAT THE TASK SPECIFIED "LESS THAN 20 OR OVER 30 [,] AND DATE..."
TASK 11 - ASSUMED REDUNDANT DATA MEANT DATA THAT DOES NOT INCL SHOP ADDRESSES, CITY, AND STATE


*/





/* USE CASE PROJECT
ADMISSION SYSTEM FOR PURSUING MASTERS ABROAD*/

/* Creating Tables and Imputing Data */ 
 
CREATE TABLE student_admission_data.ACCOMODATION
(ADDRESS_ID CHAR(4) NOT NULL PRIMARY KEY,
ADDRESS VARCHAR(40),
ACCOMODATION_TYPE VARCHAR(40),
RENT_USD INT,
DISTANCE_FROM_UNI_MILES INT
);
INSERT INTO ACCOMODATION(ADDRESS_ID,ADDRESS,ACCOMODATION_TYPE,RENT_USD,DISTANCE_FROM_UNI_MILES) VALUES
('A12R', '433 MELNEA CASS BLVD', '2 BHK 1 BATH APARTMENT','3500','0.7'),
('U34L', '628  W 28TH ST', '4 BHK 2 BATH APARTMENT','4000','2'),
('G89D', '3733 11TH AVE', '3 BHK 1.5 BATH APARTMENT','2800','2.5'),
('S76H', '2628 EB DELFT' , '4 BHK 3 BATH INDEPENDENT HOUSE','4500','1.7'),
('P43G', '200 BALLBRIDGE' , '2 BHK 1.5 BATH','1800','2.2'),
('UT56','110 BELLVIEW','2 BHK 1.5 BATH','3200','2.5'),
('GH78','3455 DUROCHER','3 BHK 2 BATH','2800','3.0'),
('PO56','314 E 14TH ST','2 BHK 2 BATH','1700','4'),
('TP89','219 WESTERN AVE','2 BHK 2 BATH', '1900','0.9'),
('KU07','LS2 LEADS','3BHK,2 BATH','2500','0.2'),
('DS23','130 CLAYTON','4 BHK 2 BATH','3900','1.2'),
('RE28', '400 BOLYSTON ST','2 BED 1.5 BATH','1500','1.7'),
('GH56', '230 PARK DRIVE' ,'3 BED 3 BATH','2700','0.4'),
('US09','134 PIERCE ST','2 BED 2 BATH','1900','1.8'),
('ZX32','278 ST PAUL','2 BHK 1.5 BATH','1600','2.5');
select * from ACCOMODATION;

CREATE TABLE student_admission_data.STUDENT
(STUDENT_ID INT(3) NOT NULL PRIMARY KEY,
FIRST_NAME VARCHAR(40),
LAST_NAME VARCHAR(40),
GRE INT(3),
TOEFL INT(3),
LOR VARCHAR(20),
GPA FLOAT(10),
COUNTRY VARCHAR(30),
ADDRESS_ID CHAR(4), 
foreign key (ADDRESS_ID) references ACCOMODATION(ADDRESS_ID)
ON delete cascade ON update cascade,
WORK_EX VARCHAR(20));
INSERT INTO STUDENT(STUDENT_ID,FIRST_NAME,LAST_NAME,GRE,TOEFL,LOR,GPA,WORK_EX,COUNTRY,ADDRESS_ID) VALUES
('326', 'VAIBHAV', 'IYER','302','93','Moderate','3.56','2 YEARS','INDIA','A12R'),
('763', 'AKSHITA', 'RAVI','312','117','Good','3.95','2.5 YEARS','INDIA','U34L'),
('103', 'ANUSHKA' , 'SHARMA','301','103','Moderate','3.6','1 YEAR','INDIA','G89D'),
('536', 'MANAS' , 'SINGH','297','96','Good','3.2','1.5 YEARS','INDIA','S76H'),
('651', 'NEHA' , 'PRABHU' , '330','119','Good','3.97','4 YEARS','INDIA','P43G'),
('222', 'STEVEN' , 'ROBIN' , '313','115','Moderate','3.73','7 MONTHS','UAE','UT56'),
('878', 'DANIEL', 'PETER' , '308','116','Good','3.88','1.5 YEAR','FRANCE','GH78'),
('905', 'REBECCA', 'BROWN' , '314' ,'106','Good','3.45','5 YEARS','NETHERLANDS','PO56'),
('111','ALICE', 'JOHN' , '298','113','Moderate','3.33','2.8 YEARS','FINLAND','TP89'),
('400', 'AMELIA','JOSEPH','338','120','Good','3.97','4.5 YEARS','GERMANY','KU07'),
('525' , 'CHUN' ,'FEN' ,'300','92','Good','3.34','2.6 YEARS','CHINA','DS23'),
('611','CHANG','YING','295','100','Moderate','3.76','0 YEARS','CHINA','RE28'),
('911' ,'ARADHYA','BHAT','314','114','Good','3.88','6 YEARS','AUSTRALIA','GH56'),
('888' ,'RAGINI' ,'HEGDE','316','108','Good','3.77','4.5 YEARS','ITALY','US09'),
('899', 'NIKHIL','SHENOY', '306','111','Moderate','3.58','1.4 YEARS','SINGAPORE','ZX32')
;
select * from STUDENT;

CREATE TABLE student_admission_data.VACCINATION
(VACCINE_ID INT(3) NOT NULL PRIMARY KEY,
VACCINE_NAME VARCHAR(40) NOT NULL);
INSERT INTO VACCINATION(VACCINE_ID,VACCINE_NAME) VALUES
('134','HEPATITIS-B'),
('111','MENINGOCOCCAL'),
('167','MMR'),
('278','TDaP'),
('390','VARICELLA');
select * from VACCINATION;

CREATE TABLE student_admission_data.STUDENT_VACCINE
(STUDENT_ID INT(3) NOT NULL,
VACCINE_ID INT(3) NOT NULL,
PRIMARY KEY(STUDENT_ID,VACCINE_ID),
VACCINE_DATE date,
NUMBER_DOSES INT,
foreign key (STUDENT_ID) references STUDENT(STUDENT_ID)
ON delete cascade ON update cascade,
foreign key (VACCINE_ID) references VACCINATION (VACCINE_ID)
ON delete cascade ON update cascade
);
INSERT INTO STUDENT_VACCINE(STUDENT_ID,VACCINE_ID,VACCINE_DATE,NUMBER_DOSES) VALUES
('326','134','2017-05-04','2'),
('326','111','2016-12-12','1'),
('763','167','2017-12-21','2'),
('763' ,'278', '2017-04-02','1'),
('103', '390' , '2015-08-08','2'),
('763' ,'134' , '2000-09-09','2'),
('103' , '278','2012-06-06','1'),
('536','390', '2017-01-03' ,'2'),
('651', '134','2011-09-07','1'),
('222' ,'111','2013-06-09','1'),
('878', '134' ,'2012-11-28','1'),
('905','278', '2010-10-10','1'),
('111', '167' ,'2011-12-12','1'),
('400','134' , '2018-08-15','1'),
('525' ,'390', '2014-03-07','1'),
('899','390', '2015-04-05','2');

select * from STUDENT_VACCINE;

CREATE TABLE student_admission_data.VISA_INTERVIEW
(INTERVIEW_ID CHAR(4) NOT NULL PRIMARY KEY,
STUDENT_ID INT(3) NOT NULL,
foreign key (STUDENT_ID) references STUDENT(STUDENT_ID)
ON delete cascade ON update cascade,
INTERVIEW_DATE DATE,
LOCATION VARCHAR(40),
RESULT BOOLEAN
);

INSERT INTO VISA_INTERVIEW(INTERVIEW_ID,STUDENT_ID,INTERVIEW_DATE,LOCATION,RESULT) VALUES
('V467', '326', '2018-02-02','CHENNAI','1'),
('RN34', '763', '2019-01-21','HYDERABAD','0'),
('G567', '763', '2019-04-14','MUMBAI','1'),
('F678', '103' , '2016-06-06','DELHI','1'),
('YV34', '536' , '2015-05-27','CHENNAI','1'),
('GH78','651','2015-02-02','HYDERABAD','1'),
('C289','222','2018-01-10','DUBAI','0'),
('RF45','222','2018-05-12','DUBAI','1'),
('TR45','878','2013-10-15','PARIS','1'),
('FG67','905','2013-02-02','AMSTERDAM','1'),
('DF34','111', '2011-08-09','HELSINKI','1'),
('SX56','400', '2019-01-28', 'BERLIN','1'),
('JK44','525','2015-03-09','BEJING','1'),
('UJ90','611','2013-03-03','SHANGHAI','1'),
('CVT8','911','2010-07-09','SYDNEY','1'),
('PO78','888','2011-02-10', 'VENICE','1'),
('ST53','899','2016-02-29', 'SINGAPORE','1');

select *  from VISA_INTERVIEW;

CREATE TABLE student_admission_data.UNIVERSITIES
(UNIVERSITYID CHAR(5) NOT NULL,
COURSEID CHAR(10) NOT NULL,
PRIMARY KEY(UNIVERSITYID,COURSEID),
UNIVERSITYNAME VARCHAR(40),
COURSENAME VARCHAR(40),
COUNTRY VARCHAR(40)
);
INSERT INTO UNIVERSITIES(UNIVERSITYID,COURSEID,UNIVERSITYNAME,COURSENAME,COUNTRY) VALUES
('NU251','DAE11' ,'Northeastern University', 'Data Analytics Engineering','United States'),
('USC73','CS11', 'University of Southern California', 'Computer Science','United States'),
('UBC49','DS11', 'University of British Columbia', 'Data Science','Canada'),
('DTU95','ESY11','Delft Institute of Technology' , 'Embedded Systems','Netherlands'),
('UCD30','ME11' ,'University College Dublin', 'Mechanical Engineering','Ireland'),
('TU226','EE11', 'Trinity University' , 'Electrical Electronics','Ireland'),
('MGU53','MIS11', 'McGill University', 'Management Information Systems','Canada'),
('ASU14','CS12', 'Arizona State University', 'Computer Science','United States'),
('UC591','CE11','University of Cambridge' , 'Civil Engineering','England'),
('UL333','EE12', 'University of Leeds' , 'Electrical Electronics','England'),
('MU476','MIS12' ,'Monash University', 'Management Information Systems','Australia'),
('NTU27','CS13', 'Nanyang Technological University', 'Computer Science','Singapore'),
('UM775','ESY12', 'University of Melbourne', 'Embedded Systems','Australia'),
('PU881','ME12','Purdue University' , 'Mechanical Engineering','United States'),
('CU309','DAE12' ,'Concordia University' , 'Data Analytics Engineering','Canada');
select * from UNIVERSITIES;

CREATE TABLE student_admission_data.STUDENT_UNIVERSITY
(STUDENT_ID INT NOT NULL,
UNIVERSITYID CHAR(5) NOT NULL,
COURSEID CHAR(10) NOT NULL,
PRIMARY KEY(UNIVERSITYID,COURSEID,STUDENT_ID),
ADMIT BOOLEAN,
FINALIZED BOOLEAN,
APPLICATION_TIME VARCHAR(30),
Foreign key(universityid,courseid) references universities(universityid, courseid)
ON delete cascade ON update cascade,
foreign key(STUDENT_ID) references STUDENT(STUDENT_ID)
ON delete cascade ON update cascade);

INSERT INTO STUDENT_UNIVERSITY(STUDENT_ID,UNIVERSITYID,COURSEID,ADMIT,FINALIZED,APPLICATION_TIME) VALUES
('326', 'NTU27', 'CS13','1','1','FALL 2018'),
('326', 'TU226', 'EE11','0','0','FALL 2018'),
('763', 'USC73', 'CS11','1','1','FALL 2019'),
('763', 'NU251', 'DAE11','0','0','FALL 2019'),
('763', 'CU309', 'DAE12','0','0','FALL 2019'),
('103', 'UBC49', 'DS11','1','1','SPRING 2017'),
('103', 'NU251', 'DAE11','1','0','SPRING 2017'),
('536', 'DTU95', 'ESY11','1','1','SPRING 2016'),
('536', 'ASU14', 'CS12','1','0','SPRING 2016'),
('536', 'NU251', 'DAE11','0','0','SPRING 2016'),
('651', 'UCD30', 'ME11','1','1','FALL 2015'),
('651', 'TU226', 'EE11','1','0','FALL 2015'),
('222', 'TU226', 'EE11','1','1','FALL 2018'),
('878', 'MGU53', 'MIS11','1','1','SPRING 2014'),
('878', 'NU251', 'DAE11','1','0','SPRING 2014'),
('878', 'TU226', 'EE11','0','0','SPRING 2014'),
('905', 'ASU14', 'CS12','1','1','FALL 2013'),
('905', 'NTU27', 'CS13','1','0','FALL 2013'),
('111', 'UC591', 'CE11','1','1','SPRING 2012'),
('111', 'NTU27', 'CS13','1','0','SPRING 2012'),
('111', 'PU881', 'ME12','0','0','SPRING 2012'),
('400', 'UL333', 'EE12','1','1','FALL 2019'),
('400', 'MU476', 'MIS12','1','0','FALL 2019'),
('525', 'MU476', 'MIS12','1','1','SPRING 2015'),
('525', 'UM775', 'ESY12','1','0','SPRING 2015'),
('525', 'CU309', 'DAE12','0','0','SPRING 2015'),
('611', 'NU251', 'DAE11','1','1','FALL 2013'),
('611', 'UBC49', 'DS11','1','0','FALL 2013'),
('911', 'NU251', 'DAE11','1','1','SPRING 2011'),
('911', 'UC591', 'CE11','1','0','SPRING 2011'),
('911', 'ASU14', 'CS12','0','0','SPRING 2011'),
('888', 'PU881', 'ME12','1','1','FALL 2011'),
('888', 'UL333', 'EE12','1','0','FALL 2011'),
('899', 'UC591', 'CE11','1','1','FALL 2016'),
('899', 'UL333', 'EE12','1','0','FALL 2016')
;
select * from STUDENT_UNIVERSITY;

CREATE TABLE student_admission_data.EXTRA_CURRICULAR
(STUDENT_ID INT NOT NULL,
EXTRA_CURRICULAR VARCHAR(50) NOT NULL,
PRIMARY KEY(STUDENT_ID,EXTRA_CURRICULAR),
foreign key(STUDENT_ID) references STUDENT(STUDENT_ID)
ON delete cascade ON update cascade);

INSERT INTO EXTRA_CURRICULAR(STUDENT_ID,EXTRA_CURRICULAR) VALUES
('326', 'District Level Football Player'),
('326', 'Community Service'),
('763', 'Volunteer Work'),
('103', 'Gold medal in athletics'),
('103', 'Lead Guitarist'),
('536', 'Volunteer Work'),
('651', 'Community Service'),
('651', 'District level player in Badminton'),
('222', 'President of Student Club'),
('878', 'Drummer'),
('878', 'Event head in technical fest'),
('905','District level player in Football'),
('111', 'Lead Guitarist'),
('111', 'Community Service'),
('400', 'Singer'),
('525', 'Singer'),
('525', 'Event head in technical fest'),
('525', 'Community Service'),
('611', 'President of Student Government'),
('611', 'Lead Guitarist'),
('911', 'District level Cricket player'),
('888', 'Silver medal in Long Jump'),
('899', 'Community Service'),
('899', 'Volunteer Work')
;
select * from EXTRA_CURRICULAR;

/* Queries */

CREATE TABLE UNIVERSITY_ADMIT(
SELECT U.UNIVERSITYNAME,U.COURSENAME, SU.ADMIT, SU.STUDENT_ID 
FROM UNIVERSITIES AS U
INNER JOIN STUDENT_UNIVERSITY AS SU ON U.UNIVERSITYID = SU.UNIVERSITYID);

CREATE TABLE STUDENT_ADMIT_UNIVERSITY(
SELECT UA.UNIVERSITYNAME,UA.COURSENAME,UA.ADMIT,S.GPA,S.GRE,S.LOR,S.WORK_EX,S.COUNTRY
FROM  (UNIVERSITY_ADMIT AS UA
INNER JOIN STUDENT AS S ON UA.STUDENT_ID = S.STUDENT_ID));

CREATE TABLE STUDENT_VISA_ACCEPTANCE(
SELECT SU.APPLICATION_TIME,V.LOCATION,V.RESULT
FROM  (STUDENT_UNIVERSITY AS SU
INNER JOIN VISA_INTERVIEW AS V ON SU.STUDENT_ID = V.STUDENT_ID));

/* 1) Computing the average GPA ,average WORK EXPERIENCE and minimum GRE required for every University */
SELECT COURSENAME,UNIVERSITYNAME,round(AVG(GPA),2) AS MEAN_GPA, MIN(GRE) AS MINIMUM_GRE , round(AVG(WORK_EX),2) AS AVG_WORK_EXP FROM STUDENT_ADMIT_UNIVERSITY
WHERE ADMIT = 1
GROUP BY UNIVERSITYNAME,COURSENAME;

/* 2) Computing the share of admits given by Universities based on student's origin */
SELECT UNIVERSITYNAME, COUNTRY AS STUDENT_ORIGIN, COUNT(COUNTRY) AS NUMBER_OF_STUDENTS FROM STUDENT_ADMIT_UNIVERSITY
GROUP BY UNIVERSITYNAME, COUNTRY;

/* 3) Computing average GRE score acceptance for different programs offered by Universities */
SELECT COURSENAME,round(AVG(GRE),0) AS AVG_GRE FROM STUDENT_ADMIT_UNIVERSITY
WHERE ADMIT = 1
GROUP BY COURSENAME
ORDER BY AVG_GRE DESC;

/* 4) Determining the acceptance rate of Universities */
SELECT UNIVERSITYNAME,(round(SUM(ADMIT)/count(ADMIT),2))*100 ACCEPTANCE_RATE FROM UNIVERSITY_ADMIT
GROUP BY UNIVERSITYNAME
ORDER BY ACCEPTANCE_RATE ASC;

/* 5) Computing the number of VISA interview acceptances based on Location */
SELECT LOCATION,SUM(RESULT) AS VISA_ACCEPTANCES_LOCATION FROM STUDENT_VISA_ACCEPTANCE
GROUP BY LOCATION
ORDER BY VISA_ACCEPTANCES_LOCATION DESC;

/* 6) Computing number of VISA interview acceptances based on application time */
SELECT APPLICATION_TIME,SUM(RESULT) AS NUMBER_OF_VISA_ACCEPTANCES FROM STUDENT_VISA_ACCEPTANCE
GROUP BY APPLICATION_TIME
ORDER BY NUMBER_OF_VISA_ACCEPTANCES DESC;








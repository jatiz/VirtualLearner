/*=======================================
| * Written and Composed By LittleBird~ 	 |
========================================= 
*************** This Code is Proudly present to you by LittleBird ~
*********You may make any modification as to your own need ~
*********** There are no Copyright implemented in this source Code ~
*******************/

/******************************************************************
*******************************************************************
THIS CODE IS UNDER DEV TESTING .
DATE OF TESTING : [25/2/2017]
SCRIPT TESTED BY : Littlebird~
*******************************************************************
******************************************************************/



USE virtual_learner;

/*SETUP THE ACCOUNT TABLE*/
DROP TABLE IF EXISTS Account;
CREATE TABLE Account(
	account_id INT NOT NULL UNIQUE, /* Account id must be iqnue and will be set by admin upon creation */
	account_user VARCHAR(30) UNIQUE, 
	account_password VARCHAR(30)UNIQUE, /* password will be encrypted into code datas before inserted in database*/

CONSTRAINT PRIMARY KEY (account_id)	
);


/*SETUP THE PARENT DETAILS TABLE*/
DROP TABLE IF EXISTS Parent;
CREATE TABLE Parent(
	ID INT NOT NULL UNIQUE AUTO_INCREMENT, /* USED AS ITERATOR*/
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30)NOT NULL,
	age INT(100)NOT NULL,
	country VARCHAR(20) NOT NULL,
	email VARCHAR(50),
	phone_number VARCHAR(20)NOT NULL,
	Account_account_id INT,

CONSTRAINT PRIMARY KEY (ID),
CONSTRAINT fk_parent_account FOREIGN KEY (Account_account_id) REFERENCES Account (account_id)
);


/*SETUP THE LEVEL GRADE TABLE */
DROP TABLE IF EXISTS Level_grade;
CREATE TABLE Level_grade(
	ID INT NOT NULL UNIQUE AUTO_INCREMENT,
	grade_title VARCHAR(30),
	grade_desc VARCHAR(2000),

CONSTRAINT PRIMARY KEY (ID)
);


/*SETUP THE STUDENT TABLE*/
DROP TABLE IF EXISTS Student;
CREATE TABLE Student(
	ID INT NOT NULL UNIQUE AUTO_INCREMENT, /* STUDENT ID MUST BE SET BY ADMIN, DO NOT USE AUTO-INCREMENT */ 
	student_name VARCHAR(30) NOT NULL,
	student_age INT(50),
	phone_number VARCHAR(30),
	mac_address VARCHAR(100) UNIQUE,
	Student_parent_id INT NOT NULL,
	level_grade_id INT, /* STUDENT CAN ASSIGN TO NO LEVEL GRADE , THUS CAN BE SET TO NULL */

CONSTRAINT PRIMARY KEY (ID),
CONSTRAINT fk_parent FOREIGN KEY (student_parent_id) REFERENCES Parent(parent_id),
CONSTRAINT fk_student_level_grade FOREIGN KEY(level_grade_id) REFERENCES Level_grade(level_grade_id)
);

/*-------------------------------CODE ABOVE ARE CHECKED ------------------------------------*/

/*SETUP THE SUBJECT TABLE */
DROP TABLE IF EXISTS Subject;
CREATE TABLE Subject(
	ID INT NOT NULL AUTO_INCREMENT,
	subject_name VARCHAR(45),
	subject_desc VARCHAR(1000),

CONSTRAINT PRIMARY KEY (ID) 
);

/*SETUP THE SUBJECT MODULE TABLE */
DROP TABLE IF EXISTS Subject_module;
CREATE TABLE Subject_module(
	ID INT NOT NULL AUTO_INCREMENT, /* USING THIS TO ITERATE TABLE ROWS */
	module_name VARCHAR(45) NOT NULL,
	module_desc VARCHAR(1000),
	subject_subject_id INT NOT NULL,
	module_level_grade_id INT NOT NULL,

CONSTRAINT PRIMARY KEY (ID),
CONSTRAINT fk_module_subject FOREIGN KEY (Subject_subject_id) REFERENCES Subject(subject_id),
CONSTRAINT fk_module_level_grade FOREIGN KEY (module_level_grade_id) REFERENCES Level_grade(level_grade_id)
);


/* SETUP THE QUESTIONNAIRE TABLE */
DROP TABLE IF EXISTS Questionnaire;
CREATE TABLE Questionnaire(
	question_id INT NOT NULL UNIQUE, /* ID SETUP BY ADMIN IN PROCESS */
	question_desc VARCHAR(1000),
	question_ans VARCHAR(1000),
	question_module_id INT,

CONSTRAINT PRIMARY KEY (question_id),
CONSTRAINT fk_question_module FOREIGN KEY (question_module_id) REFERENCES Subject_module(module_id)
);

DROP TABLE IF EXISTS Attempt_log;
CREATE TABLE Attempt_log(
	attempt_id INT NOT NULL UNIQUE, /*MUST BE SETUP BY ADMIN, NO AUTOINCREMENT USED */
	date_of_attempt TIMESTAMP,
	attempt_question_id INT NOT NULL,
	attempt_student_id INT NOT NULL,
	
CONSTRAINT PRIMARY KEY (attempt_id),
CONSTRAINT fk_attempt_student FOREIGN KEY (attempt_student_id) REFERENCES Student(student_id),
CONSTRAINT fk_attempt_question FOREIGN KEY (attempt_question_id) REFERENCES Questionnaire (question_id)
);
























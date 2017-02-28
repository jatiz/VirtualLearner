/*=======================================
| * Written and Composed By LittleBird~ 	 |
========================================= 
*************** This Code is Proudly present to you by LittleBird ~
*********You may make any modification as to your own need ~
*********** There are no Copyright implemented in this source Code ~
*******************/

/* ------------------------TO INSERT ACCOUNT DETAILS-------------------------------------*/
DELIMITER //
CREATE PROCEDURE insertAccountDetail (IN acc_id INT, IN acc_username VARCHAR(30), IN acc_password VARCHAR(30))
BEGIN	
	INSERT INTO Account 
	(account_id, account_user, account_password)
	VALUES (acc_id, acc_username, acc_password);
END //



/* -------------------------TO INSERT PARENT DETAILS-----------------------------------------*/
CREATE PROCEDURE insertParentDetail (IN firstname VARCHAR(100), IN lastname VARCHAR(100)
	, IN age INT, IN country VARCHAR(30), IN email VARCHAR(50), 
	IN phoneNumber VARCHAR(45), IN acc_id_fk INT)

BEGIN
	INSERT INTO Parent (first_name, last_name, age, country, email, phone_number, Account_account_id)
	VALUES (firstname, lastname, age, country, email, phoneNumber, acc_id_fk);
END //	




/* -------------------------TO INSERT STUDENT DETAILS-----------------------------------------*/
CREATE PROCEDURE insertStudent(IN S_NAME VARCHAR(30), IN S_AGE INT(50), IN P_NUMBER VARCHAR(30),IN MAC_ADDRESS VARCHAR(100),
IN PARENT_ID INT, IN LEVEL_GRADE_ID INT)
BEGIN
	INSERT INTO Student(student_name, student_age, phone_number, mac_address, Student_parent_id, level_grade_id)
	VALUES (S_NAME, S_AGE, P_NUMBER, MAC_ADDRESS, PARENT_ID, LEVEL_GRADE_ID);
END //




/* ------------------------- TO INSERT QUESTION -------------------*/ 
CREATE PROCEDURE insertQuestion(IN QUESTION_ID INT, IN QUESTION_DESC VARCHAR(1000), IN QUESTION_ANS VARCHAR(1000), 
IN QUESTION_MODULE_ID INT)
BEGIN
	INSERT INTO Questionaire(question_id, question_desc, question_ans, question_module_id)
	VALUES (QUESTION_ID, QUESTION_DESC, QUESTION_ANS, QUESTION_MODULE_ID);
END //


/*-----------------------TO INSERT SUBJECT MODULES ----------------------*/
CREATE PROCEDURE insertSubjectModule(IN MOUDLE_ID INT, IN MODULE_NAME VARCHAR(45), IN MODULE_DESC VARCHAR(1000),
IN SUBJECT_SUBJECT_ID INT, IN MODULE_LEVEL_GRADE_ID INT)
BEGIN
	INSERT INTO Subject_module(module_id, module_name, module_desc, subject_subject_id, module_level_grade_id)
	VALUES (MODULE_ID, MODULE_NAME, MODULE_DESC, SUBJECT_SUBJECT_ID, MODULE_LEVEL_GRADE_ID);
END //



/*-----------------------TO INSERT SUBJECT ----------------------*/
CREATE PROCEDURE insertSubject(IN SUBJECT_ID INT, IN SUBJECT_NAME VARCHAR(45), IN SUBJECT_DESC VARCHAR(1000))
BEGIN
	INSERT INTO Subject (subject_id, subject_name, subject_desc) VALUES (SUBJECT_ID, SUBJECT_NAME, SUBJECT_DESC);
END //



/*-----------------------TO INSERT LEVEL GRADE ----------------------*/
CREATE PROCEDURE insertLevelGrade(IN LEVEL_GRADE_ID INT, IN GRADE_TITLE VARCHAR(45), IN GRADE_DESC VARCHAR(2000))
BEGIN
	INSERT INTO Level_grade (level_grade, grade_title, grade_desc) VALUES (LEVEL_GRADE_ID, GRADE_TITLE, GRADE_DESC);
END //




/*-----------------------TO INSERT LEVEL ATTEMPT LOG ----------------------*/
CREATE PROCEDURE insertAttemptLog(IN ATTEMPT_ID INT, IN DATE_OF_ATTEMPT TIMESTAMP,IN ANSWER_GIVEN VARCHAR(1000), 
IN STUDENT_STUDENT_ID INT, IN QUESTIONNAIRE_QUESTION_ID INT)
BEGIN
	INSERT INTO Attempt_log (attempt_id, date_of_attempt, answer_given, Student_student_id, Questionnaire_question_id)
	VALUES( ATTEMPT_ID, DATE_OF_ATTEMPT, ANSWER_GIVEN, STUDENT_STUDENT_ID, QUESTIONNAIRE_QUESTION_ID);
END //




DELIMITER ;
























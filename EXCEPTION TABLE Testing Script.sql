#Simple JOIN print example between LDAP and Training
SELECT COURSE_ID, USERNAME
FROM ldap.t_temp_orait_ggc_ldap l JOIN ldap.t_temp_orait_ggc_training_export t
ON l.FIRST_NAME = t.FIRST_NAME;

#Quick TRUNCATE script to empty table
TRUNCATE exception_table;

#Insert into Exception Table example
Insert into exception_table (URID, COURSE_ID, COURSE_TITLE, DATE_COURSE_COMPLETED, EMAIL, FIRST_NAME, LAST_NAME, MEMBER_ID, PPID, USERNAME, TRAINING_SOURCE, TRAINING_REC_ID, EMPLOYEE_ID_NUMBER, Exception_Reason) values (1234567890, 'ITEC3870', 'Software Development II', '05-29-21 12.00.00.00000000 AM', 'nporter1@ggc.edu', 'Nicholas', 'Porter', 'Z010Z10', 'P2048392', 'NIPORTER1', 'GGC', 9281732, '43190293', 'FIRST_NAME mismatch');
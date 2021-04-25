#Query Function: Inserts all Pass Table variables from Training into Pass Table (no exceptions)
INSERT INTO pass_table (URID, COURSE_ID, COURSE_TITLE, DATE_COURSE_COMPLETED, EMAIL, FIRST_NAME, LAST_NAME, MEMBER_ID, PPID, USERNAME, TRAINING_SOURCE, TRAINING_REC_ID, EMPLOYEE_ID_NUMBER, Exception_Reason)
SELECT rand(0) * rand(0), T.COURSE_ID, T.COURSE_TITLE, T.DATE_COURSE_COMPLETED, T.EMAIL, T.FIRST_NAME, T.LAST_NAME, T.MEMBER_ID, T.PPID, T.USERNAME, T.TRAINING_SOURCE, T.TRAINING_REC_ID, T.EMPLOYEE_ID_NUMBER, 'No exceptions found'
FROM ldap.t_temp_orait_ggc_training_export AS T
INNER JOIN ldap.t_temp_orait_ggc_ldap AS L
WHERE L.PPID = T.PPID AND (L.FIRST_NAME = T.FIRST_NAME AND L.LAST_NAME = T.LAST_NAME AND L.EMAIL = T.EMAIL AND L.NETID = T.USERNAME);
#Inserts about 733 Records into pass_table

#Query Function: Inserts all Pass Table variables from LDAP into Pass Table (any exceptions, including PPID with all other passed variables)
INSERT INTO pass_table (URID, COURSE_ID, COURSE_TITLE, DATE_COURSE_COMPLETED, EMAIL, FIRST_NAME, LAST_NAME, MEMBER_ID, PPID, USERNAME, TRAINING_SOURCE, TRAINING_REC_ID, EMPLOYEE_ID_NUMBER, Exception_Reason)
SELECT rand(0) * rand(0) * rand(0), T.COURSE_ID, T.COURSE_TITLE, T.DATE_COURSE_COMPLETED, L.EMAIL, L.FIRST_NAME, L.LAST_NAME, T.MEMBER_ID, L.PPID, L.NETID, T.TRAINING_SOURCE, T.TRAINING_REC_ID, T.EMPLOYEE_ID_NUMBER, 'An exception was found'
FROM ldap.t_temp_orait_ggc_training_export AS T
INNER JOIN ldap.t_temp_orait_ggc_ldap AS L
WHERE L.PPID = T.PPID AND (L.FIRST_NAME != T.FIRST_NAME OR L.NETID != T.USERNAME OR L.LAST_NAME != T.LAST_NAME OR L.EMAIL != T.EMAIL) OR (L.FIRST_NAME = T.FIRST_NAME AND L.LAST_NAME = T.LAST_NAME AND L.EMAIL = T.EMAIL AND L.NETID = T.USERNAME AND L.PPID != T.PPID);
#Inserts about 291 Records into pass_table

#Query Function: Inserts all Exception Table variables from Training into Exception Table (any exceptions)
INSERT INTO exception_table (URID, COURSE_ID, COURSE_TITLE, DATE_COURSE_COMPLETED, EMAIL, FIRST_NAME, LAST_NAME, MEMBER_ID, PPID, USERNAME, TRAINING_SOURCE, TRAINING_REC_ID, EMPLOYEE_ID_NUMBER, Exception_Reason)
SELECT rand(0) * rand(0), T.COURSE_ID, T.COURSE_TITLE, T.DATE_COURSE_COMPLETED, T.EMAIL, T.FIRST_NAME, T.LAST_NAME, T.MEMBER_ID, T.PPID, T.USERNAME, T.TRAINING_SOURCE, T.TRAINING_REC_ID, T.EMPLOYEE_ID_NUMBER, 'An exception was found'
FROM ldap.t_temp_orait_ggc_training_export AS T
INNER JOIN ldap.t_temp_orait_ggc_ldap AS L
WHERE L.PPID = T.PPID AND (L.FIRST_NAME != T.FIRST_NAME OR L.NETID != T.USERNAME OR L.LAST_NAME != T.LAST_NAME OR L.EMAIL != T.EMAIL);
#Inserts about 210 Records into exception_table

#Query Function: Inserts all Exception Table variables from Training into Exception Table (First Name exceptions)
#INSERT INTO exception_table (URID, COURSE_ID, COURSE_TITLE, DATE_COURSE_COMPLETED, EMAIL, FIRST_NAME, LAST_NAME, MEMBER_ID, PPID, USERNAME, TRAINING_SOURCE, TRAINING_REC_ID, EMPLOYEE_ID_NUMBER, Exception_Reason)
#SELECT rand(0) * rand(0) * rand(0), T.COURSE_ID, T.COURSE_TITLE, T.DATE_COURSE_COMPLETED, T.EMAIL, T.FIRST_NAME, T.LAST_NAME, T.MEMBER_ID, T.PPID, T.USERNAME, T.TRAINING_SOURCE, T.TRAINING_REC_ID, T.EMPLOYEE_ID_NUMBER, 'FIRST_NAME mismatch'
#FROM ldap.t_temp_orait_ggc_training_export AS T
#INNER JOIN ldap.t_temp_orait_ggc_ldap AS L
#WHERE L.PPID = T.PPID AND (L.FIRST_NAME != T.FIRST_NAME);
#Inserts no Records into exception_table

#Query Function: Inserts all Exception Table variables from Training into Exception Table (Last Name exceptions)
#INSERT INTO exception_table (URID, COURSE_ID, COURSE_TITLE, DATE_COURSE_COMPLETED, EMAIL, FIRST_NAME, LAST_NAME, MEMBER_ID, PPID, USERNAME, TRAINING_SOURCE, TRAINING_REC_ID, EMPLOYEE_ID_NUMBER, Exception_Reason)
#SELECT rand(0) * rand(0) * rand(0) * rand(0), T.COURSE_ID, T.COURSE_TITLE, T.DATE_COURSE_COMPLETED, T.EMAIL, T.FIRST_NAME, T.LAST_NAME, T.MEMBER_ID, T.PPID, T.USERNAME, T.TRAINING_SOURCE, T.TRAINING_REC_ID, T.EMPLOYEE_ID_NUMBER, 'LAST_NAME mismatch'
#FROM ldap.t_temp_orait_ggc_training_export AS T
#INNER JOIN ldap.t_temp_orait_ggc_ldap AS L
#WHERE L.PPID = T.PPID AND (L.LAST_NAME != T.LAST_NAME);
#Inserts about 68 Records into exception_table

#Query Function: Inserts all Exception Table variables from Training into Exception Table (NETID/USERNAME exceptions)
#INSERT INTO exception_table (URID, COURSE_ID, COURSE_TITLE, DATE_COURSE_COMPLETED, EMAIL, FIRST_NAME, LAST_NAME, MEMBER_ID, PPID, USERNAME, TRAINING_SOURCE, TRAINING_REC_ID, EMPLOYEE_ID_NUMBER, Exception_Reason)
#SELECT rand(0) * rand(0) * rand(0) * rand(0) * rand(0), T.COURSE_ID, T.COURSE_TITLE, T.DATE_COURSE_COMPLETED, T.EMAIL, T.FIRST_NAME, T.LAST_NAME, T.MEMBER_ID, T.PPID, T.USERNAME, T.TRAINING_SOURCE, T.TRAINING_REC_ID, T.EMPLOYEE_ID_NUMBER, 'USERNAME mismatch'
#FROM ldap.t_temp_orait_ggc_training_export AS T
#INNER JOIN ldap.t_temp_orait_ggc_ldap AS L
#WHERE L.PPID = T.PPID AND (L.NETID != T.USERNAME);
#Inserts about 59 Records into exception_table

#Query Function: Inserts all Exception Table variables from Training into Exception Table (Email exceptions)
#INSERT INTO exception_table (URID, COURSE_ID, COURSE_TITLE, DATE_COURSE_COMPLETED, EMAIL, FIRST_NAME, LAST_NAME, MEMBER_ID, PPID, USERNAME, TRAINING_SOURCE, TRAINING_REC_ID, EMPLOYEE_ID_NUMBER, Exception_Reason)
#SELECT rand(0) * rand(0) * rand(0) * rand(0) * rand(0) * rand(0), T.COURSE_ID, T.COURSE_TITLE, T.DATE_COURSE_COMPLETED, T.EMAIL, T.FIRST_NAME, T.LAST_NAME, T.MEMBER_ID, T.PPID, T.USERNAME, T.TRAINING_SOURCE, T.TRAINING_REC_ID, T.EMPLOYEE_ID_NUMBER, 'EMAIL mismatch'
#FROM ldap.t_temp_orait_ggc_training_export AS T
#INNER JOIN ldap.t_temp_orait_ggc_ldap AS L
#WHERE L.PPID = T.PPID AND (L.EMAIL != T.EMAIL);
#Inserts about 115 Records into exception_table

#Query Function: Inserts all Exception Table bariables from Training into Exception Table (PPID exceptions where *all* other variables pass)
INSERT INTO exception_table (URID, COURSE_ID, COURSE_TITLE, DATE_COURSE_COMPLETED, EMAIL, FIRST_NAME, LAST_NAME, MEMBER_ID, PPID, USERNAME, TRAINING_SOURCE, TRAINING_REC_ID, EMPLOYEE_ID_NUMBER, Exception_Reason)
SELECT rand(0) * rand(0) * rand(0) * rand(0) * rand(0) * rand(0) * rand(0), T.COURSE_ID, T.COURSE_TITLE, T.DATE_COURSE_COMPLETED, T.EMAIL, T.FIRST_NAME, T.LAST_NAME, T.MEMBER_ID, T.PPID, T.USERNAME, T.TRAINING_SOURCE, T.TRAINING_REC_ID, T.EMPLOYEE_ID_NUMBER, 'PPID mismatch'
FROM ldap.t_temp_orait_ggc_training_export AS T
INNER JOIN ldap.t_temp_orait_ggc_ldap AS L
WHERE L.PPID != T.PPID AND (L.FIRST_NAME = T.FIRST_NAME AND L.LAST_NAME = T.LAST_NAME AND L.NETID = T.USERNAME AND L.EMAIL = T.EMAIL);
#Inserts about 81 Records into exception_table
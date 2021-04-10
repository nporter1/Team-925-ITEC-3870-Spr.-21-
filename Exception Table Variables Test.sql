#Query Function: Grab necessary Exception Table variables from Training Table, where PPIDs between LDAP and Training match up
SELECT T.COURSE_ID, T.COURSE_TITLE, T.DATE_COURSE_COMPLETED, T.EMAIL, T.FIRST_NAME, T.LAST_NAME, T.MEMBER_ID, T.PPID, T.USERNAME, T.TRAINING_SOURCE, T.TRAINING_REC_ID, T.EMPLOYEE_ID_NUMBER
FROM ldap.t_temp_orait_ggc_ldap AS L
INNER JOIN ldap.t_temp_orait_ggc_training_export AS T
ON L.PPID = T.PPID;
#Returns about 943 Records

#Query Function: Grab PPID (both), NETID (LDAP)/USERNAME (Training); return records where NETID and USERNAME don't match
SELECT L.PPID, T.PPID, L.NETID, T.USERNAME #, L.FIRST_NAME, T.FIRST_NAME, L.LAST_NAME, T.LAST_NAME
FROM ldap.t_temp_orait_ggc_ldap AS L
INNER JOIN ldap.t_temp_orait_ggc_training_export AS T
ON L.PPID = T.PPID AND L.NETID != T.USERNAME;
#Returns about 59 Records; Exceptions seem to be zeros at the end of Training's USERNAME

#Query Function: Grab PPID (both) and FIRST_NAME (both); return records where FIRST_NAME don't match
SELECT L.PPID, T.PPID, L.FIRST_NAME, T.FIRST_NAME
FROM ldap.t_temp_orait_ggc_ldap AS L
INNER JOIN ldap.t_temp_orait_ggc_training_export AS T
ON L.PPID = T.PPID AND L.FIRST_NAME != T.FIRST_NAME;
#Returns no Records

#Query Function: Grab PPID (both) and LAST_NAME (both); return records where LAST_NAME don't match
SELECT L.PPID, T.PPID, L.LAST_NAME, T.LAST_NAME
FROM ldap.t_temp_orait_ggc_ldap AS L
INNER JOIN ldap.t_temp_orait_ggc_training_export AS T
ON L.PPID = T.PPID AND L.LAST_NAME != T.LAST_NAME;
#Returns about 68 Records; Exceptions seem to be "Z"s at the end of Training's LAST_NAME

#Query Function: Grab PPID (both) and EMAIL (both); return records where EMAIL don't match
SELECT L.PPID, T.PPID, L.EMAIL, T.EMAIL
FROM ldap.t_temp_orait_ggc_ldap AS L
INNER JOIN ldap.t_temp_orait_ggc_training_export AS T
ON L.PPID = T.PPID AND L.EMAIL != T.EMAIL;
#Returns about 115 Records; Exceptions seem to be missing underscores and numbers in Training's EMAIL

#Query Function: Grab FIRST_NAME (both) and PPID (both); return records where PPID don't match
SELECT L.FIRST_NAME, L.LAST_NAME, T.FIRST_NAME, T.LAST_NAME, L.PPID, T.PPID
FROM ldap.t_temp_orait_ggc_ldap AS L
INNER JOIN ldap.t_temp_orait_ggc_training_export AS T
ON L.FIRST_NAME = T.FIRST_NAME AND L.LAST_NAME = T.LAST_NAME AND L.PPID != T.PPID;
#Returns about 81 Records; Exceptions seem to be zeros at the end of Training's PPID

#Query Function: Grab and PPID (both); return records where PPID don't match
#SELECT L.FIRST_NAME, L.LAST_NAME, T.FIRST_NAME, T.LAST_NAME, L.PPID, T.PPID
#FROM ldap.t_temp_orait_ggc_ldap AS L
#INNER JOIN ldap.t_temp_orait_ggc_training_export AS T
#ON L.PPID != T.PPID;
#Unecessary query; returns too many records
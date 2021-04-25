#Query Function: Update all FIRST_NAME exceptions in Exception Table
UPDATE exception_table
JOIN ldap.t_temp_orait_ggc_ldap AS L
SET exception_table.FIRST_NAME = concat("FAILED=", exception_table.FIRST_NAME)
WHERE L.PPID = exception_table.PPID AND L.FIRST_NAME != exception_table.FIRST_NAME;

#Query Function: Update all LAST_NAME exceptions in Exception Table
UPDATE exception_table
JOIN ldap.t_temp_orait_ggc_ldap AS L
SET exception_table.LAST_NAME = concat("FAILED=", exception_table.LAST_NAME)
WHERE L.PPID = exception_table.PPID AND L.LAST_NAME != exception_table.LAST_NAME;

#Query FUnction: Update all EMAIL exceptions in Exception Table
UPDATE exception_table
JOIN ldap.t_temp_orait_ggc_ldap AS L
SET exception_table.EMAIL = concat("FAILED=", exception_table.EMAIL)
WHERE L.PPID = exception_table.PPID AND L.EMAIL != exception_table.EMAIL;

#Query FUnction: Update all NETID/USERNAME exceptions in Exception Table
UPDATE exception_table
JOIN ldap.t_temp_orait_ggc_ldap AS L
SET exception_table.USERNAME = concat("FAILED=", exception_table.USERNAME)
WHERE L.PPID = exception_table.PPID AND L.NETID != exception_table.USERNAME;

#Query FUnction: Update all PPID exceptions in Exception Table
UPDATE exception_table
JOIN ldap.t_temp_orait_ggc_ldap AS L
SET exception_table.PPID = concat("FAILED=", exception_table.PPID)
WHERE L.PPID != exception_table.PPID AND (L.FIRST_NAME = exception_table.FIRST_NAME AND L.LAST_NAME = exception_table.LAST_NAME AND L.NETID = exception_table.USERNAME AND L.EMAIL = exception_table.EMAIL);
-- MYSQL LEARNING

/* DATA TYPES IN MYSQL
1. Numeric Data type:
TINYINT, SMALLINT, MEDIUMINT, INT, BIGINT
FLOAT(b,d), DOUBLE(m,d), DECIMAL(m,d), BIT(m), BOOL, BOOLEAN
2. Data and Time Data Type:
YEAR[(2|4)], DATE, TIME, DATETIME, TIMESTAMP(m)
3. String Data Type:
CHAR(SIZE), VARCHAR(SIZE)
TINYTEXT(SIZE), TEXT(SIZE), MEDIUMTEXT(SIZE),LONGTEXT(SIZE), BINARY(SIZE), VARBINARY(size)
ENUM, SET
4. Binary Large Object Data Type(BLOB):
TINYBLOB, BLOB(SIZE), MEDIUM(BLOB), LONGBLOB 
5. Spatial Data Types:
GEOMATRY, POINT, POLYGON, LINESTRING, GEOMETRYCOLLECTION, MULTILINESTRING, MULTIPOINT, MULTIPLYGON
6. JSON Date Type:
-- Used to store json object
/*

/* VARIABLES IN MYSQL
1. User Defined Variables 
-- SET @var_name=value; or SET @var_name:=value;
-- SELECT @var_name will give the value
2. Local Variable 
-- DECLARE var_name DATA_TYPE(SIZE) DEFUALT default_value;
Local varibale is mostly used in stored procedure.
3. System Variable 
Special class to all program units which contain predefined variables, we can change the variable using SET command.
-- SHOW VARIABLES;
-- SELECT @@var_name;
-- SHOW VARIABLES LIKE '%wait_timeout%';
*/
SET @myname = "Vishal Kathpalia";
SELECT @myname;
SHOW VARIABLES;

-- ------------------------------------------------------------------------------------------------------------------------------------------------------------ 
-- CONTROL USER TABLE 
/* CREATE User
-- CREATE USER[IF NOT EXISTS] acc_name IDENTIFIED BY 'password';
acc_name = user_name@hostname
user_name@% --  User can be able to connect to any host.
By Default user will get all the permissions use GRANT Privilage to restrict the control on user.
--  GRANT PRIVILAGES TO THE USER
1. ALL PRIVILAGES 2. CREATE 3. DROP 4. DELETE 5. INSERT 6. SELECT 7. UPDATE
-- GRANT ALL PRIVILAGES ON *.* TO peter@localhost 
Note: To FLush the Privilages Use the command
-- FLUSH PRIVILEGES;   
*/

SELECT user from mysql.user;
CREATE user peter@localhost IDENTIFIED BY 'peter123';
CREATE USER IF NOT EXISTS adam@localhost IDENTIFIED BY 'adam123';
GRANT ALL PRIVILEGES ON *.* TO peter@localhost;
SHOW GRANTS FOR peter@localhost;
GRANT SELECT, INSERT, UPDATE ON *.* TO adam@localhost;
SHOW GRANTS FOR adam@localhost;
FLUSH PRIVILEGES;

/* DROP User
-- DROP USER acc_name; can also drop multiple users
*/

DROP USER adam@localhost, peter@localhost; 
SELECT user FROM mysql.user;

/* SHOW User
mysql is the database which stores the information of the users in USER table;
-- SELECT user FROM mysql.user;
We can get the current user information as well
-- SELECT user(); or SELECT current_user(); 
We can list the currently logged in user using the command
SELECT user, host, db, command FROM information_schema.processlist;  
*/

DROP USER adam@localhost, peter@localhost; 
SELECT user FROM mysql.user;
USE mysql;
DESC user;
SELECT user, host, account_locked, password_expired FROM user;  
Select user();  
Select current_user();  
SELECT user, host, db, command FROM information_schema.processlist;


/* CHANGE User Password
1. using UPDATE user command
-- UPDATE user SET password = PASSWORD('jtp12345') WHERE user = 'peter' AND host = 'localhost'; 
Flush the privileges of the user after using an update command
-- FLUSH PRIVILEGES;   
2. using SET password Query
-- SET PASSWORD FOR 'peter'@'localhost' = PASSWORD('jtp12345');  
3. using ALTER User Query
-- ALTER USER peter@localhost IDENTIFIED BY 'jtp123';   
*/
USE mysql;
DESC user;
SELECT user, authentication_string FROM mysql.user;
UPDATE user SET authentication_string = 'jtp12345' WHERE user = 'peter' AND host = 'localhost';
FLUSH PRIVILEGES;  
SET PASSWORD FOR 'peter'@'localhost' = 'jtp1234';
ALTER USER peter@localhost IDENTIFIED BY 'jtp123';

-- -------------------------------------------------------------------------------------------------------------------------------------------------------- 
-- Databases
/* CREATE Database, SELECT database, SHOW databases, DROP database, COPY database
-- CREATE DATABASE dbName;
-- USE dbName;
-- SHOW databases; or SHOW SCHEMAS;
information_schema is the schema which stores all the database info.
-- DROP database[IF EXISTS] db_name; or DROP SCHEMA db_name;
COPY DATABASE using mysql dump tool
-- CREATE DATABASE testdb_copy; 
Take a dump of testdb database
-- mysqldump -u root -p testdb > .\testdb.sql
COPY back the dump into the db
-- mysqldump -u root -p testdb > D:\Database_backup\testdb.sql  
*/
CREATE DATABASE employeeDB; 
SHOW CREATE DATABASE employeeDB;
SHOW databases;
SHOW schemas;
USE employeeDB; 
SHOW databases like '%emp';
SELECT schema_name FROM information_schema.schemata;
USE information_schema;
SHOW TABLES;
SELECT * FROM information_schema.schemata;
SELECT schema_name FROM information_schema.schemata WHERE schema_name LIKE 'e%'; 
DROP DATABASE employeeDB;
DROP SCHEMA employeeDB;
-- --------------------------------------------------------------------------------------------------------------------------------------------------------- 
-- TABLES & VIEWS
/* CREATE Table

*/






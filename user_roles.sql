-- create a new user justus@localhost 
CREATE USER 'justus'@'localhost'
IDENTIFIED BY '22224';
-- granting privileges to justus@localhost
GRANT ALL ON bookstoredb.* TO justus@localhost;

-- create a new user eliza@localhost
CREATE USER 'eliza'@'localhost'
IDENTIFIED BY '33336';
-- granting privileges to eliza@localhost
GRANT ALL ON bookstoredb.* TO eliza@localhost;



-- create roles
CREATE ROLE databaseAdm , systemAdm;

GRANT ALL ON bookstoredb.* TO databaseAdm;
GRANT SELECT, UPDATE ON bookstoredb.* TO systemAdm;

-- assiging roles to users
GRANT databaseAdm TO justus@localhost;
GRANT systemAdm TO eliza@localhost;

-- display the roles assigned to each user
SHOW GRANTS FOR justus@localhost USING databaseAdm;
SHOW GRANTS FOR eliza@localhost USING systemAdm;
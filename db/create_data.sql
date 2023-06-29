DELIMITER $$

CREATE FUNCTION `initcap`(x char(30)) RETURNS char(30) CHARSET utf8
READS SQL DATA
DETERMINISTIC
BEGIN
SET @str='';
SET @l_str='';
WHILE x REGEXP ' ' DO
SELECT SUBSTRING_INDEX(x, ' ', 1) INTO @l_str;
SELECT SUBSTRING(x, LOCATE(' ', x)+1) INTO x;
SELECT CONCAT(@str, ' ', CONCAT(UPPER(SUBSTRING(@l_str,1,1)),LOWER(SUBSTRING(@l_str,2)))) INTO @str;
END WHILE;
RETURN LTRIM(CONCAT(@str, ' ', CONCAT(UPPER(SUBSTRING(x,1,1)),LOWER(SUBSTRING(x,2)))));
END$$

DELIMITER ;


DELIMITER $$


CREATE FUNCTION `TO_CAMEL`(str varchar(255)) RETURNS varchar(255) CHARSET utf8
READS SQL DATA
DETERMINISTIC
BEGIN
RETURN substr(replace(initcap(concat('1',replace(str,'_',' '))),' ',''),2);
END$$

DELIMITER ;


CREATE VIEW V_TABLE_INFO
AS
SELECT  TABLE_NAME
     ,CONCAT(', #{',CAMEL_NAME,'}') AS INST_COL
     ,CONCAT(',',COLUMN_NAME) AS SEL_COL
     ,CONCAT('= #{',CAMEL_NAME,'}') AS UPDATE_COL
     ,CONCAT('private ',JAVA_VAR_TYPE,' ',CAMEL_NAME,';') AS JAVA_VAR
     ,CONCAT('// ',COLUMN_COMMENT) AS JAVA_COMMENT
FROM (
         SELECT	TABLE_NAME
              ,COLUMN_NAME
              ,TO_CAMEL(COLUMN_NAME) AS CAMEL_NAME
              ,COLUMN_TYPE
              ,CASE
                   WHEN INSTR(COLUMN_TYPE,'longtext') > 0 THEN
                       'String'
                   WHEN INSTR(COLUMN_TYPE,'int') > 0 THEN
                       'Integer'
                   WHEN INSTR(COLUMN_TYPE,'datetime') > 0 THEN
                       'Timestamp'
                   ELSE
                       'String'
             END AS JAVA_VAR_TYPE
              ,COLUMN_KEY
              ,COLUMN_COMMENT
         FROM	  information_schema.COLUMNS
         WHERE   TABLE_NAME IN(
             SELECT	TABLE_NAME
             FROM	information_schema.TABLES
             WHERE	TABLE_SCHEMA !='information_schema'
     )
    ) A;

DROP TABLE IF EXISTS `sys_code`;

CREATE TABLE `sys_code` (
                            `code_idx` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'codeIdx[PK]',
                            `pre_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'CodeGroup',
                            `code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Code',
                            `code_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Code Name',
                            `sort` int(11) DEFAULT NULL COMMENT 'Sort',
                            PRIMARY KEY (`code_idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
                        `user_idx` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'User Idx(PK)',
                        `user_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'User ID',
                        `user_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'User Name',
                        `salt_key` int(255) DEFAULT NULL COMMENT 'SaltKey',
                        `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Password',
                        `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Mobile',
                        `email` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Email',
                        `birth_date` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Birth Date',
                        `gender_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Gender Code',
                        `dept_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'DeptCode',
                        `rank_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'RankCode',
                        `bank_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'BankCode',
                        `bank_account` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Bank Account',
                        `owner_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'OwnerName',
                        `zip_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ZipCode',
                        `address1` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Address1',
                        `address2` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Address2',
                        PRIMARY KEY (`user_idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `users_career`;

CREATE TABLE `users_career` (
                                `user_career_idx` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'UserCareerIdx[PK]',
                                `user_idx` int(11) unsigned NOT NULL COMMENT 'UserIdx[FK]',
                                `company` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'CompanyName',
                                `employee_state_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'EmployeeStateCode',
                                `rank` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Rank',
                                `career_start_date` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'CareerStartDate',
                                `career_end_date` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'CareerEndDate',
                                PRIMARY KEY (`user_career_idx`),
                                KEY `users_career_FK` (`user_idx`),
                                CONSTRAINT `users_career_FK` FOREIGN KEY (`user_idx`) REFERENCES `user` (`user_idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `users_education`;

CREATE TABLE `users_education` (
                                   `user_education_idx` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Idx',
                                   `user_idx` int(11) unsigned NOT NULL COMMENT 'UserIdx',
                                   `institution` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Institution',
                                   `major` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Major',
                                   `degree_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Degree Code',
                                   `graduation_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'GraduationCode',
                                   `year_of_graduation` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'YearOfGraduation',
                                   PRIMARY KEY (`user_education_idx`),
                                   KEY `users_education_FK` (`user_idx`),
                                   CONSTRAINT `users_education_FK` FOREIGN KEY (`user_idx`) REFERENCES `user` (`user_idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



LOCK TABLES `sys_code` WRITE;
/*!40000 ALTER TABLE `sys_code` DISABLE KEYS */;

INSERT INTO `sys_code` (`code_idx`, `pre_code`, `code`, `code_name`, `sort`)
VALUES
    (1,'BANK_CODE','A10','JP Morgan',NULL),
    (2,'BANK_CODE','A11','Standard Charted',NULL),
    (3,'BANK_CODE','A13','Citi Bank',NULL),
    (4,'BANK_CODE','A14','HSBC',NULL),
    (5,'DEGREE_CODE','D100','Associate',NULL),
    (6,'DEGREE_CODE','D200','Bachelor',NULL),
    (7,'DEGREE_CODE','D300','Master',NULL),
    (8,'DEGREE_CODE','D400','Doctor',NULL),
    (9,'DEPT_CODE','A1000','Service R&D',NULL),
    (10,'DEPT_CODE','A1001','Platform R&D',NULL),
    (11,'DEPT_CODE','A1002','UI Design',NULL),
    (12,'EMPLOYEE_STATE_CODE','E100','Enrolled',NULL),
    (13,'EMPLOYEE_STATE_CODE','E200','Leave',NULL),
    (14,'EMPLOYEE_STATE_CODE','E400','Resigned',NULL),
    (15,'GENDER_CODE','MALE','Male',NULL),
    (16,'GENDER_CODE','FEMALE','Female',NULL),
    (17,'GRADUATION_CODE','G100','Enrolled',NULL),
    (18,'GRADUATION_CODE','G200','Leave',NULL),
    (19,'GRADUATION_CODE','G300','Graduated',NULL),
    (20,'RANK_CODE','R100','Staff',NULL),
    (21,'RANK_CODE','R200','Manager',NULL),
    (22,'RANK_CODE','R300','Director',NULL),
    (23,'RANK_CODE','R400','VP',NULL),
    (24,'RANK_CODE','R500','Executive',NULL);

/*!40000 ALTER TABLE `sys_code` ENABLE KEYS */;
UNLOCK TABLES;


LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;

INSERT INTO `user` (`user_idx`, `user_id`, `user_name`, `salt_key`, `password`, `mobile`, `email`, `birth_date`, `gender_code`, `dept_code`, `rank_code`, `bank_code`, `bank_account`, `owner_name`, `zip_code`, `address1`, `address2`)
VALUES
    (1,'test1','Dani Lowery',NULL,NULL,'1011112222','test1@asdf.com','19880802','MALE','A1000','R300','A10','123456789','Dani Lowery\r',NULL,NULL,NULL),
    (2,'test2','Mina Tang',NULL,NULL,'1022223333','test2@asdf.com','19990504','FEMALE','A1000','R400','A11','2345678901','Mina Tang\r',NULL,NULL,NULL),
    (3,'test3','Frankie Harwood',NULL,NULL,'1044445555','test3@asdf.com','19850214','MALE','A1001','R100','A13','3456789012','Frankie Harwood\r',NULL,NULL,NULL),
    (4,'test4','Elena Peterson',NULL,NULL,'1066667777','test4@asdf.com','19941205','FEMALE','A1002','R100','A14','4567890123','Elena Peterson',NULL,NULL,NULL);

/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `users_career` WRITE;
/*!40000 ALTER TABLE `users_career` DISABLE KEYS */;

INSERT INTO `users_career` (`user_career_idx`, `user_idx`, `company`, `employee_state_code`, `rank`, `career_start_date`, `career_end_date`)
VALUES
    (1,1,'A Company','E400','Staff','20220514','20230612'),
    (2,1,'B Company','E100','Manager','20230801',''),
    (3,2,'A Company','E400','Staff','20070201','20080301'),
    (4,2,'B Company','E400','Manager','20080412','20100912'),
    (5,2,'C Company','E100','Manager','20190913','');

/*!40000 ALTER TABLE `users_career` ENABLE KEYS */;
UNLOCK TABLES;


INSERT INTO `users_education` (`user_education_idx`, `user_idx`, `institution`, `major`, `degree_code`, `graduation_code`, `year_of_graduation`)
VALUES
    (1, 1, 'A University', 'Computer Engineering', 'D200', 'G300', ''),
    (2, 1, 'A University', 'Computer Engineering', 'D300', 'G100', ''),
    (3, 2, 'B University', 'Social Welfare', 'D200', 'G300', ''),
    (4, 3, 'C University', 'Electronics', 'D200', 'G300', ''),
    (5, 3, 'C University', 'Electronics', 'D300', 'G300', ''),
    (6, 4, 'D University', 'Materials engineering', 'D200', 'G300', ''),
    (7, 4, 'D University', 'Materials engineering', 'D300', 'G300', ''),
    (8, 4, 'D University', 'Materials', 'D400', 'G300', '');
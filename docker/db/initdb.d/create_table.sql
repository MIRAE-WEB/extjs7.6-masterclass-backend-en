DELIMITER $$

DROP FUNCTION IF EXISTS `schema`.`initcap`$$

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

DROP FUNCTION IF EXISTS `schema`.`TO_CAMEL`$$

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
                                `company` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'CompanyName',
                                `employee_state_code` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'EmployeeStateCode',
                                `rank` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Rank',
                                `career_start_date` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'CareerStartDate',
                                `career_end_date` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'CareerEndDate',
                                PRIMARY KEY (`user_career_idx`),
                                KEY `users_career_FK` (`user_idx`),
                                CONSTRAINT `users_career_FK` FOREIGN KEY (`user_idx`) REFERENCES `user` (`user_idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `users_education`;

CREATE TABLE `users_education` (
                                   `user_education_idx` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Idx',
                                   `user_idx` int(11) unsigned NOT NULL COMMENT 'UserIdx',
                                   `institution` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Institution',
                                   `major` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Major',
                                   `degree_code` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Degree Code',
                                   `graduation_code` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'GraduationCode',
                                   `year_of_graduation` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'YearOfGraduation',
                                   PRIMARY KEY (`user_education_idx`),
                                   KEY `users_education_FK` (`user_idx`),
                                   CONSTRAINT `users_education_FK` FOREIGN KEY (`user_idx`) REFERENCES `user` (`user_idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


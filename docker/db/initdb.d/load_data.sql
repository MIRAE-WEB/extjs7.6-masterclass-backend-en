

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
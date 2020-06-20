-- MySQL dump 10.13  Distrib 8.0.19, for macos10.15 (x86_64)
--
-- Host: 127.0.0.1    Database: ApiArtistSample
-- ------------------------------------------------------
-- Server version	8.0.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `DBSettings`
--

DROP TABLE IF EXISTS `DBSettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DBSettings` (
  `id` int NOT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `port` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `note` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DBSettings`
--

LOCK TABLES `DBSettings` WRITE;
/*!40000 ALTER TABLE `DBSettings` DISABLE KEYS */;
INSERT INTO `DBSettings` VALUES (1,'localhost','3306','Tui','root','123456',NULL),(2,'localhost','3306','ApiArtistSample','root','123456',NULL),(3,'xx.xx.xxx.xxx','3306','Tui','root','123456',NULL),(4,'localhost','3306','TuiTestData','root','123456',NULL);
/*!40000 ALTER TABLE `DBSettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EnvironmentSettings`
--

DROP TABLE IF EXISTS `EnvironmentSettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EnvironmentSettings` (
  `id` int NOT NULL,
  `api_base_url` varchar(45) DEFAULT NULL,
  `testDataDB_id` int DEFAULT NULL,
  `backEndData_id` int DEFAULT NULL,
  `note` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EnvironmentSettings`
--

LOCK TABLES `EnvironmentSettings` WRITE;
/*!40000 ALTER TABLE `EnvironmentSettings` DISABLE KEYS */;
INSERT INTO `EnvironmentSettings` VALUES (1,'http://localhost:8080',2,1,'local test data, local backend'),(2,'http://13.55.117.177:8080',4,3,NULL),(3,'http://13.55.117.177:8080',2,3,'local test data, remote backend');
/*!40000 ALTER TABLE `EnvironmentSettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TestCases`
--

DROP TABLE IF EXISTS `TestCases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TestCases` (
  `id` varchar(10) NOT NULL,
  `httpMethod` varchar(10) DEFAULT NULL,
  `path` varchar(100) DEFAULT NULL,
  `param` varchar(45) DEFAULT NULL,
  `jsonBody` varchar(500) DEFAULT NULL,
  `expectedCode` int DEFAULT NULL,
  `v_type` varchar(20) DEFAULT NULL,
  `v_value` varchar(200) DEFAULT NULL,
  `note` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TestCases`
--

LOCK TABLES `TestCases` WRITE;
/*!40000 ALTER TABLE `TestCases` DISABLE KEYS */;
INSERT INTO `TestCases` VALUES ('0101001','post','/Account/Login',NULL,'{     \"email\": \"root_root_root@test.com\",     \"password\": \"tesT@123\",     \"rememberMe\": true }',200,NULL,NULL,'#root user# Remain for TestUtils.rootLogin()'),('0101002','post','/Account/Login',NULL,'{\n    \"email\": \"admin_admin_amdin@test.com\",\n    \"password\": \"tesT@123\",\n    \"rememberMe\": true\n}',200,NULL,NULL,'#admin user# Retain for TestUtils.adminLogin()'),('0101003','post','/Account/Login',NULL,'{     \"email\": \"normal_normal_normal@test.com\",     \"password\": \"tesT@123\",     \"rememberMe\": true }',200,NULL,NULL,'#normal user# Remain for TestUtils.normalLogin()'),('0101004','post','/Account/Login',NULL,'{     \"email\": \"111@111.com\",     \"password\": \"tesT@123\",     \"rememberMe\": true }',400,'text','email not confirmed',NULL),('0101005','post','/Account/Login',NULL,'{     \"email\": \"1@wdd.com\",     \"password\": \"tesT@123\",     \"rememberMe\": true }',404,'text','mail \"1@wdd.com\" was not found',NULL),('0101006','post','/Account/Login',NULL,'{     \"email\": \"wdd@wdd.com\",     \"password\": \"\",     \"rememberMe\": true }',400,'text','The Password field is required',NULL),('0101007','post','/Account/Login',NULL,'{     \"email\": \"@wdd.com\",     \"password\": \"\",     \"rememberMe\": true }',400,'text','not a valid e-mail',NULL),('0102001','post','/Account/Logout',NULL,NULL,200,'text','Logged out',NULL),('0103001','post','/Account/ForgotPassword',NULL,'{   \"email\": \"wendingdai3@gmail.com\" }',200,'text','\"resetPasswordToken\"','Depended on by test id 4001-4003'),('0103002','post','/Account/ForgotPassword',NULL,'{   \"email\": \"\" }',400,'text','Email field is required',NULL),('0103003','post','/Account/ForgotPassword',NULL,'{   \"email\": \"3@gmail.com\" }',400,'text','does not exist or has not been confirmed',NULL),('0104001','post','/Account/ResetPassword',NULL,'{     \"email\": \"wendingdai3@gmail.com\",     \"encryptedEmail\": \"\",     \"resetPasswordToken\": \"\",     \"newPassword\": \"12345\" }',200,'text','reset successfully','denpending on table test id 3001'),('0104002','post','/Account/ResetPassword',NULL,'{     \"email\": \"3@gmail.com\",     \"encryptedEmail\": \"\",     \"resetPasswordToken\": \"\",     \"newPassword\": \"12345\" }',400,'text','Invalid email address','denpending on table test id 3001'),('0104003','post','/Account/ResetPassword',NULL,'{     \"email\": \"wendingdai3@gmail.com\",     \"encryptedEmail\": \"\",     \"resetPasswordToken\": \"\",     \"newPassword\": \"\" }',400,'text','NewPassword field is required','denpending on table test id 3001'),('0105001','post','/Account/Register',NULL,'  {     \"email\": \"test1@sample.com\",     \"password\": \"tesT@123\"   }',200,'json','{\"respPath\": \"$.newMember.email\", \"inputPath\": \"$.email\"}',NULL),('0105002','post','/Account/Register',NULL,'  {     \"email\": \"test1@sample.com\",     \"password\": \"tesT@123\"   }',400,'text','already taken','depending on test id 5001'),('0105003','post','/Account/Register',NULL,'  {     \"email\": \"\",     \"password\": \"tesT@123\"   }',400,'text','Email field is required',NULL),('0105004','post','/Account/Register',NULL,'  {     \"email\": \"sample.com\",     \"password\": \"tesT@123\"   }',400,'text','not a valid e-mail',NULL),('0105005','post','/Account/Register',NULL,'  {     \"email\": \"1@sample.com\",     \"password\": \"123\"   }',400,'text','password is too simple',NULL),('0106001','get','/Account/GetUserProfile',NULL,NULL,200,'text','\"firstName\":',NULL),('0107001','put','/Account/EditMemberProfile',NULL,'{   \"email\": \"tttttttest@111.com\",   \"firstName\": \"ttttttest\",   \"lastName\": \"\",   \"middleName\": \"test\",   \"preferredName\": \"\",   \"gender\": \"1\",   \"phoneNumber\": \"\",   \"currentPosition\": \"\",   \"latestEducation\": \"\",   \"visa\": \"\",   \"bio\": \"\",   \"fullAddress\": \"\",   \"addressDpid\": \"\" }',200,'text','updated successfully',NULL),('0201001','get','/Administration/ListRoles',NULL,NULL,200,'text','\"name\":','Request loging in as #root user#'),('0201002','get','/Administration/ListRoles',NULL,NULL,200,'text','\"name\":','Request loging in as #admin user#'),('0201003','get','/Administration/ListRoles',NULL,NULL,403,NULL,'unauthorized','Request loging in as #normal user#'),('0202001','get','/Administration/ListMembers',NULL,NULL,200,'text','\"firstName\":','Request loging in as #root user#'),('0202002','get','/Administration/ListMembers',NULL,NULL,200,'text','\"firstName\":','Request loging in as #admin user#'),('0202003','get','/Administration/ListMembers',NULL,NULL,403,NULL,'unauthorized','Request loging in as #normal user#'),('0301001','post','/Job/Post',NULL,'{\n    \"jobTitle\": \"developer 2\",\n    \"jobDescription\": \"javascript 1\",\n    \"skills\": \"c# 2\",\n    \"employerName\": \"smattesting 3\",\n    \"employerVisible\": true,\n    \"employerId\": 1\n}',200,NULL,NULL,'Request loging in as #normal user#'),('0401001','post','/JobSeeker/AddFavoriteJob','{\"jobId\": \"25\"}',NULL,200,NULL,NULL,'Request loging in as #normal user#'),('0401002','post','/JobSeeker/AddFavoriteJob','{\"jobId\": \"25\"}',NULL,400,'text','already','Request loging in as #normal user#; already added'),('0402001','get','/JobSeeker/ListFavoriteJobs',NULL,NULL,200,NULL,NULL,'Request loging in as #normal user#'),('0403001','get','/JobSeeker/SearchJobs','{\"keyWord\": \"developer\"}',NULL,200,'text','\"jobId\":',NULL),('0404001','delete','/JobSeeker/RemoveFavoriteJob','{\"jobId\": \"25\"}',NULL,200,NULL,NULL,'Request loging in as #normal user#'),('0405001','post','/JobSeeker/ApplyJob',NULL,'{\n  \"jobId\": 2,\n  \"coverLetterText\": \"string\",\n  \"coverLetterId\": 8,\n  \"cvId\": 27\n}',200,'text','successfully',NULL);
/*!40000 ALTER TABLE `TestCases` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-20 20:34:59

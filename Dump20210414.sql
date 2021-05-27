-- MySQL dump 10.13  Distrib 8.0.19, for macos10.15 (x86_64)
--
-- Host: localhost    Database: macula
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `ai_agent`
--

DROP TABLE IF EXISTS `ai_agent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ai_agent` (
  `id` int NOT NULL AUTO_INCREMENT,
  `updated_on` datetime NOT NULL,
  `agent_name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `project` varchar(255) DEFAULT NULL,
  `session` varchar(255) DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  `inference_path` varchar(255) DEFAULT NULL,
  `runtime` int DEFAULT NULL,
  `agent_namespace` varchar(255) DEFAULT NULL,
  `device_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ai_agent`
--

LOCK TABLES `ai_agent` WRITE;
/*!40000 ALTER TABLE `ai_agent` DISABLE KEYS */;
INSERT INTO `ai_agent` VALUES (1,'2020-01-01 00:00:00','Agent 1',NULL,NULL,NULL,'mictorsh',NULL,NULL,'agent_1','edge'),(2,'2020-01-01 00:00:00','Agent 2',NULL,NULL,NULL,'mictorsh',NULL,NULL,'agent_2','cloud'),(3,'2020-01-01 00:00:00','Agent 3',NULL,NULL,NULL,'mictorsh_100',NULL,NULL,'agent_3','cloud');
/*!40000 ALTER TABLE `ai_agent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ai_annotation`
--

DROP TABLE IF EXISTS `ai_annotation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ai_annotation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `updated_on` datetime NOT NULL,
  `image_id` int NOT NULL,
  `category_id` int NOT NULL,
  `segmentation` text NOT NULL,
  `bbox` varchar(255) NOT NULL,
  `ignore` tinyint(1) NOT NULL,
  `iscrowd` tinyint(1) NOT NULL,
  `area` int NOT NULL,
  `dataset_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `image_id` (`image_id`),
  KEY `dataset_id` (`dataset_id`),
  CONSTRAINT `ai_annotation_ibfk_1` FOREIGN KEY (`image_id`) REFERENCES `sys_image` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `ai_annotation_ibfk_2` FOREIGN KEY (`dataset_id`) REFERENCES `ai_dataset` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `ai_annotation_chk_1` CHECK ((`ignore` in (0,1))),
  CONSTRAINT `ai_annotation_chk_2` CHECK ((`iscrowd` in (0,1)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ai_annotation`
--

LOCK TABLES `ai_annotation` WRITE;
/*!40000 ALTER TABLE `ai_annotation` DISABLE KEYS */;
/*!40000 ALTER TABLE `ai_annotation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ai_attribute`
--

DROP TABLE IF EXISTS `ai_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ai_attribute` (
  `id` int NOT NULL AUTO_INCREMENT,
  `updated_on` datetime NOT NULL,
  `attribute_name` varchar(255) NOT NULL,
  `value` int NOT NULL,
  `description` varchar(255) NOT NULL,
  `dataset_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attribute_name` (`attribute_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ai_attribute`
--

LOCK TABLES `ai_attribute` WRITE;
/*!40000 ALTER TABLE `ai_attribute` DISABLE KEYS */;
INSERT INTO `ai_attribute` VALUES (1,'2020-01-01 00:00:00','Scratch',1,'Scratch',1),(2,'2020-01-01 00:00:00','Crack',2,'Crack',1),(3,'2020-01-01 00:00:00','Broken-Leg',3,'Broken-Leg',1),(4,'2020-01-01 00:00:00','Combined',4,'Combined',1),(5,'2020-01-01 00:00:00','Good',5,'Good',1),(6,'2020-01-01 00:00:00','NG',6,'NG',1);
/*!40000 ALTER TABLE `ai_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ai_category`
--

DROP TABLE IF EXISTS `ai_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ai_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `updated_on` datetime NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `value` int NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `color` varchar(255) NOT NULL,
  `dataset_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_name` (`category_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ai_category`
--

LOCK TABLES `ai_category` WRITE;
/*!40000 ALTER TABLE `ai_category` DISABLE KEYS */;
INSERT INTO `ai_category` VALUES (1,'2020-01-01 00:00:00','Scratch',1,'Scratch','#8ED60F',1),(2,'2020-01-01 00:00:00','Crack',2,'Crack','#17B69E',1),(3,'2020-01-01 00:00:00','Broken-Leg',3,'Broken-Leg','#D1237D',1),(4,'2020-01-01 00:00:00','Combined',4,'Combined','#514205',1);
/*!40000 ALTER TABLE `ai_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ai_dataset`
--

DROP TABLE IF EXISTS `ai_dataset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ai_dataset` (
  `id` int NOT NULL AUTO_INCREMENT,
  `updated_on` datetime NOT NULL,
  `dataset` varchar(255) DEFAULT NULL,
  `version` varchar(255) DEFAULT NULL,
  `year` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `contributor` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `date_created` varchar(255) NOT NULL,
  `license_id` int DEFAULT NULL,
  `attributes_id` int DEFAULT NULL,
  `categories_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `license_id` (`license_id`),
  KEY `attributes_id` (`attributes_id`),
  KEY `categories_id` (`categories_id`),
  CONSTRAINT `ai_dataset_ibfk_1` FOREIGN KEY (`license_id`) REFERENCES `ai_license` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ai_dataset_ibfk_2` FOREIGN KEY (`attributes_id`) REFERENCES `ai_attribute` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ai_dataset_ibfk_3` FOREIGN KEY (`categories_id`) REFERENCES `ai_category` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ai_dataset`
--

LOCK TABLES `ai_dataset` WRITE;
/*!40000 ALTER TABLE `ai_dataset` DISABLE KEYS */;
INSERT INTO `ai_dataset` VALUES (1,'2020-01-01 00:00:00','Semi-conductor dataset',NULL,NULL,NULL,NULL,NULL,'2020-01-01 00:00:00',1,1,1);
/*!40000 ALTER TABLE `ai_dataset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ai_inference`
--

DROP TABLE IF EXISTS `ai_inference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ai_inference` (
  `id` int NOT NULL AUTO_INCREMENT,
  `updated_on` datetime NOT NULL,
  `agent_id` int DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `confidence` float DEFAULT NULL,
  `count_perc` float DEFAULT NULL,
  `attributes` varchar(255) DEFAULT NULL,
  `categories` varchar(255) DEFAULT NULL,
  `result` varchar(255) DEFAULT NULL,
  `good` tinyint(1) DEFAULT NULL,
  `task` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `agent_id` (`agent_id`),
  KEY `task` (`task`),
  CONSTRAINT `ai_inference_ibfk_1` FOREIGN KEY (`agent_id`) REFERENCES `ai_agent` (`id`),
  CONSTRAINT `ai_inference_ibfk_2` FOREIGN KEY (`task`) REFERENCES `sys_task` (`id`),
  CONSTRAINT `ai_inference_chk_1` CHECK ((`good` in (0,1)))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ai_inference`
--

LOCK TABLES `ai_inference` WRITE;
/*!40000 ALTER TABLE `ai_inference` DISABLE KEYS */;
INSERT INTO `ai_inference` VALUES (1,'2020-01-01 00:00:00',NULL,'Image1','/home/ubuntu/Image1',1,NULL,NULL,NULL,NULL,NULL,NULL),(2,'2020-01-01 00:00:00',NULL,'Image1','/home/ubuntu/Image1',1,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `ai_inference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ai_license`
--

DROP TABLE IF EXISTS `ai_license`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ai_license` (
  `id` int NOT NULL AUTO_INCREMENT,
  `updated_on` datetime NOT NULL,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `dataset_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ai_license`
--

LOCK TABLES `ai_license` WRITE;
/*!40000 ALTER TABLE `ai_license` DISABLE KEYS */;
INSERT INTO `ai_license` VALUES (1,'2020-01-01 00:00:00','Canada','Canada',NULL);
/*!40000 ALTER TABLE `ai_license` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ai_models`
--

DROP TABLE IF EXISTS `ai_models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ai_models` (
  `id` int NOT NULL AUTO_INCREMENT,
  `updated_on` datetime DEFAULT NULL,
  `model_name` varchar(255) DEFAULT NULL,
  `model_path` varchar(255) DEFAULT NULL,
  `camera_id` varchar(255) DEFAULT NULL,
  `dataset` varchar(255) DEFAULT NULL,
  `model_type` varchar(255) DEFAULT NULL,
  `save_best_model` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ai_models`
--

LOCK TABLES `ai_models` WRITE;
/*!40000 ALTER TABLE `ai_models` DISABLE KEYS */;
INSERT INTO `ai_models` VALUES (1,'2020-01-01 00:00:00','vgg16','/data/macula/data','1','This is a test','classfication',NULL),(2,'2020-01-01 00:00:00','vgg16','/data/macula/data','2','This is a test','anamoly',NULL);
/*!40000 ALTER TABLE `ai_models` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ai_project`
--

DROP TABLE IF EXISTS `ai_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ai_project` (
  `id` int NOT NULL AUTO_INCREMENT,
  `updated_on` datetime NOT NULL,
  `project` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `dataset_id` int DEFAULT NULL,
  `agent_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dataset_id` (`dataset_id`),
  KEY `agent_id` (`agent_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `ai_project_ibfk_1` FOREIGN KEY (`dataset_id`) REFERENCES `ai_dataset` (`id`),
  CONSTRAINT `ai_project_ibfk_2` FOREIGN KEY (`agent_id`) REFERENCES `ai_agent` (`id`),
  CONSTRAINT `ai_project_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `auth_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ai_project`
--

LOCK TABLES `ai_project` WRITE;
/*!40000 ALTER TABLE `ai_project` DISABLE KEYS */;
INSERT INTO `ai_project` VALUES (1,'2020-01-01 00:00:00','Semi-Conductor','This is the demo on the semi-conductor dataset',1,1,1);
/*!40000 ALTER TABLE `ai_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ai_training`
--

DROP TABLE IF EXISTS `ai_training`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ai_training` (
  `id` int NOT NULL AUTO_INCREMENT,
  `updated_on` datetime NOT NULL,
  `agent` int DEFAULT NULL,
  `training_id` int DEFAULT NULL,
  `gpu` int DEFAULT NULL,
  `epoch` int DEFAULT NULL,
  `batch_size` int DEFAULT NULL,
  `input_shape` varchar(255) DEFAULT NULL,
  `learning_rate` float DEFAULT NULL,
  `last_layer_activation` varchar(255) DEFAULT NULL,
  `train_verbose` int DEFAULT NULL,
  `images_data_dir` varchar(255) DEFAULT NULL,
  `data_json` varchar(255) DEFAULT NULL,
  `split_index` varchar(255) DEFAULT NULL,
  `img_ext` varchar(255) DEFAULT NULL,
  `random_flip` tinyint(1) DEFAULT NULL,
  `random_brightness` tinyint(1) DEFAULT NULL,
  `random_rotate` tinyint(1) DEFAULT NULL,
  `random_crop` tinyint(1) DEFAULT NULL,
  `model_id` int DEFAULT NULL,
  `loss_list` varchar(255) DEFAULT NULL,
  `optimizer_id` varchar(255) DEFAULT NULL,
  `metrics` varchar(255) DEFAULT NULL,
  `callbacks` varchar(255) DEFAULT NULL,
  `weight_dir` varchar(255) DEFAULT NULL,
  `log_dir` varchar(255) DEFAULT NULL,
  `save_best_model` tinyint(1) DEFAULT NULL,
  `normalize_confusion_matrix` tinyint(1) DEFAULT NULL,
  `pretrained` tinyint(1) DEFAULT NULL,
  `init_epoch` int DEFAULT NULL,
  `samples_per_epoch` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `agent` (`agent`),
  KEY `model_id` (`model_id`),
  CONSTRAINT `ai_training_ibfk_1` FOREIGN KEY (`agent`) REFERENCES `ai_agent` (`id`),
  CONSTRAINT `ai_training_ibfk_2` FOREIGN KEY (`model_id`) REFERENCES `ai_models` (`id`),
  CONSTRAINT `ai_training_chk_1` CHECK ((`random_flip` in (0,1))),
  CONSTRAINT `ai_training_chk_2` CHECK ((`random_brightness` in (0,1))),
  CONSTRAINT `ai_training_chk_3` CHECK ((`random_rotate` in (0,1))),
  CONSTRAINT `ai_training_chk_4` CHECK ((`random_crop` in (0,1))),
  CONSTRAINT `ai_training_chk_5` CHECK ((`save_best_model` in (0,1))),
  CONSTRAINT `ai_training_chk_6` CHECK ((`normalize_confusion_matrix` in (0,1))),
  CONSTRAINT `ai_training_chk_7` CHECK ((`pretrained` in (0,1)))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ai_training`
--

LOCK TABLES `ai_training` WRITE;
/*!40000 ALTER TABLE `ai_training` DISABLE KEYS */;
INSERT INTO `ai_training` VALUES (1,'2020-01-01 00:00:00',1,8,-1,5,64,'128, 128, 3',0.0001,'sigmoid',1,'./data/dataset/Friday_Semiconductor_v0.0.0/image','./data/dataset/Friday_Semiconductor_v0.0.0/Semiconductor_v0.0.0_128X128_1000_images.json','0.7, 0.3','jpg',1,0,1,0,1,'bce','Adam','accuracy , precision, recall, confusionmatrix','weightcheckpoint, confusionmatrix, jsonlogger','./data/weights','./data/logs',NULL,0,1,0,'2021-01-01 00:00:00');
/*!40000 ALTER TABLE `ai_training` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alembic_version`
--

DROP TABLE IF EXISTS `alembic_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alembic_version` (
  `version_num` varchar(32) NOT NULL,
  PRIMARY KEY (`version_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alembic_version`
--

LOCK TABLES `alembic_version` WRITE;
/*!40000 ALTER TABLE `alembic_version` DISABLE KEYS */;
INSERT INTO `alembic_version` VALUES ('7adb6fe117ed');
/*!40000 ALTER TABLE `alembic_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_locations`
--

DROP TABLE IF EXISTS `auth_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_locations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `location` enum('Canada','United States','Japan') DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `location` (`location`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_locations`
--

LOCK TABLES `auth_locations` WRITE;
/*!40000 ALTER TABLE `auth_locations` DISABLE KEYS */;
INSERT INTO `auth_locations` VALUES (1,'Canada'),(2,'United States'),(3,'Japan');
/*!40000 ALTER TABLE `auth_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_roles`
--

DROP TABLE IF EXISTS `auth_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` enum('ADMIN','VIEWER','ANNOTATOR') DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_roles`
--

LOCK TABLES `auth_roles` WRITE;
/*!40000 ALTER TABLE `auth_roles` DISABLE KEYS */;
INSERT INTO `auth_roles` VALUES (1,'ADMIN'),(2,'VIEWER'),(3,'ANNOTATOR');
/*!40000 ALTER TABLE `auth_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_users`
--

DROP TABLE IF EXISTS `auth_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `first_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `registered_on` datetime NOT NULL,
  `confirmed` tinyint(1) NOT NULL,
  `confirmed_on` datetime DEFAULT NULL,
  `last_login_at` datetime DEFAULT NULL,
  `current_login_at` datetime DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `language` varchar(255) NOT NULL,
  `admin_validation` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  CONSTRAINT `auth_users_chk_1` CHECK ((`confirmed` in (0,1))),
  CONSTRAINT `auth_users_chk_2` CHECK ((`admin_validation` in (0,1)))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_users`
--

LOCK TABLES `auth_users` WRITE;
/*!40000 ALTER TABLE `auth_users` DISABLE KEYS */;
INSERT INTO `auth_users` VALUES (1,'mictorsh','test@localhost.com','$2b$04$joYTHYMno44p2HCoN5LRguLDZ6KhHFnr2PMfev8ZTQgvmSfNM.NO6','Test','User','2020-01-01 00:00:00',1,'2020-01-01 00:00:00',NULL,NULL,NULL,'Chief Technology Officer','en',1),(2,'mictorsh_100','test_100@localhost.com','$2b$04$joYTHYMno44p2HCoN5LRguLDZ6KhHFnr2PMfev8ZTQgvmSfNM.NO6','Test','User_100','2020-01-01 00:00:00',1,'2020-01-01 00:00:00',NULL,NULL,NULL,'Chief Technology Officer','en',1);
/*!40000 ALTER TABLE `auth_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blacklist_tokens`
--

DROP TABLE IF EXISTS `blacklist_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blacklist_tokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` varchar(500) NOT NULL,
  `blacklisted_on` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blacklist_tokens`
--

LOCK TABLES `blacklist_tokens` WRITE;
/*!40000 ALTER TABLE `blacklist_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `blacklist_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_users`
--

DROP TABLE IF EXISTS `roles_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles_users` (
  `user_id` int DEFAULT NULL,
  `role_id` int DEFAULT NULL,
  KEY `user_id` (`user_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `roles_users_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `auth_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `roles_users_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `auth_roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_users`
--

LOCK TABLES `roles_users` WRITE;
/*!40000 ALTER TABLE `roles_users` DISABLE KEYS */;
INSERT INTO `roles_users` VALUES (1,1);
/*!40000 ALTER TABLE `roles_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_camera`
--

DROP TABLE IF EXISTS `sys_camera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_camera` (
  `id` int NOT NULL AUTO_INCREMENT,
  `camera_id` varchar(255) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `camera_type` varchar(255) DEFAULT NULL,
  `frame_rate` varchar(255) DEFAULT NULL,
  `resolution` float DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `shutter_speed` tinyint(1) DEFAULT NULL,
  `exposure` varchar(255) DEFAULT NULL,
  `image_size_H` tinyint(1) DEFAULT NULL,
  `image_size_W` varchar(255) DEFAULT NULL,
  `image_size_C` varchar(255) DEFAULT NULL,
  `spot_name` varchar(255) DEFAULT NULL,
  `weight_file` varchar(255) DEFAULT NULL,
  `threshold` varchar(255) DEFAULT NULL,
  `orientation` varchar(255) DEFAULT NULL,
  `current_status` tinyint(1) DEFAULT NULL,
  `agent_id` int DEFAULT NULL,
  `models_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `agent_id` (`agent_id`),
  KEY `models_id` (`models_id`),
  CONSTRAINT `sys_camera_ibfk_1` FOREIGN KEY (`agent_id`) REFERENCES `ai_agent` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sys_camera_ibfk_2` FOREIGN KEY (`models_id`) REFERENCES `ai_models` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sys_camera_chk_1` CHECK ((`shutter_speed` in (0,1))),
  CONSTRAINT `sys_camera_chk_2` CHECK ((`image_size_H` in (0,1))),
  CONSTRAINT `sys_camera_chk_3` CHECK ((`current_status` in (0,1)))
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_camera`
--

LOCK TABLES `sys_camera` WRITE;
/*!40000 ALTER TABLE `sys_camera` DISABLE KEYS */;
INSERT INTO `sys_camera` VALUES (1,'CAM1','2020-01-01 00:00:00','This is a test',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'CAM2','2020-01-01 00:00:00','This is a test',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'CAM3','2020-01-01 00:00:00','This is a test',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'CAM4','2020-01-01 00:00:00','This is a test',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,'CAM5','2020-01-01 00:00:00','This is a test',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,'CAM6','2020-01-01 00:00:00','This is a test',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sys_camera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_image`
--

DROP TABLE IF EXISTS `sys_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_image` (
  `id` int NOT NULL AUTO_INCREMENT,
  `updated_on` datetime NOT NULL,
  `date_captured` datetime DEFAULT NULL,
  `image_path` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `dataset_id` int DEFAULT NULL,
  `annotation_path` varchar(255) DEFAULT NULL,
  `license` varchar(255) DEFAULT NULL,
  `width` float DEFAULT NULL,
  `height` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `image_path` (`image_path`),
  KEY `dataset_id` (`dataset_id`),
  CONSTRAINT `sys_image_ibfk_1` FOREIGN KEY (`dataset_id`) REFERENCES `ai_dataset` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_image`
--

LOCK TABLES `sys_image` WRITE;
/*!40000 ALTER TABLE `sys_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_image_attribute`
--

DROP TABLE IF EXISTS `sys_image_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_image_attribute` (
  `id` int NOT NULL AUTO_INCREMENT,
  `attribute_id` int NOT NULL,
  `image_id` int NOT NULL,
  `updated_on` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `attribute_id` (`attribute_id`),
  KEY `image_id` (`image_id`),
  CONSTRAINT `sys_image_attribute_ibfk_1` FOREIGN KEY (`attribute_id`) REFERENCES `ai_attribute` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sys_image_attribute_ibfk_2` FOREIGN KEY (`image_id`) REFERENCES `sys_image` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_image_attribute`
--

LOCK TABLES `sys_image_attribute` WRITE;
/*!40000 ALTER TABLE `sys_image_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_image_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_task`
--

DROP TABLE IF EXISTS `sys_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_task` (
  `id` varchar(255) NOT NULL,
  `updated_on` datetime NOT NULL,
  `namespace` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `agent` int DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `stop_time` datetime DEFAULT NULL,
  `total_processed` int DEFAULT NULL,
  `runtime` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `agent` (`agent`),
  KEY `ix_sys_task_namespace` (`namespace`),
  CONSTRAINT `sys_task_ibfk_1` FOREIGN KEY (`agent`) REFERENCES `ai_agent` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_task`
--

LOCK TABLES `sys_task` WRITE;
/*!40000 ALTER TABLE `sys_task` DISABLE KEYS */;
INSERT INTO `sys_task` VALUES ('e773c226-dd74-407e-9fcb-6fcd2bab1ca1','2020-01-01 00:00:00','agent_2',NULL,2,'stopped','2021-04-14 01:13:51','2021-04-14 01:13:51',NULL,NULL),('e773c226-dd74-407e-9fcb-6fcd2bab1ca2','2020-01-01 00:00:00','agent_3',NULL,3,'stopped','2021-04-14 01:13:51','2021-04-14 01:13:51',NULL,NULL),('e773c226-dd74-407e-9fcb-6fcd2bab1cab','2020-01-01 00:00:00','agent_1',NULL,1,'stopped','2021-04-14 01:13:51','2021-04-14 01:13:51',NULL,NULL);
/*!40000 ALTER TABLE `sys_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_locations`
--

DROP TABLE IF EXISTS `user_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_locations` (
  `user_id` int DEFAULT NULL,
  `location_id` int DEFAULT NULL,
  KEY `user_id` (`user_id`),
  KEY `location_id` (`location_id`),
  CONSTRAINT `user_locations_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `auth_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_locations_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `auth_locations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_locations`
--

LOCK TABLES `user_locations` WRITE;
/*!40000 ALTER TABLE `user_locations` DISABLE KEYS */;
INSERT INTO `user_locations` VALUES (1,1);
/*!40000 ALTER TABLE `user_locations` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-14  1:32:56

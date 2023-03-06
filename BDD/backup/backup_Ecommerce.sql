-- MariaDB dump 10.19  Distrib 10.6.12-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: Ecommerce
-- ------------------------------------------------------
-- Server version	10.6.12-MariaDB-0ubuntu0.22.10.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Bon_de_livraison`
--

DROP TABLE IF EXISTS `Bon_de_livraison`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Bon_de_livraison` (
  `liv_id` int(11) NOT NULL AUTO_INCREMENT,
  `cmd_id` int(11) DEFAULT NULL,
  `pro_id` int(11) NOT NULL,
  `liv_date` date NOT NULL,
  `liv_qte` int(11) NOT NULL,
  PRIMARY KEY (`liv_id`,`pro_id`),
  KEY `pro_id` (`pro_id`),
  KEY `cmd_id` (`cmd_id`),
  CONSTRAINT `Bon_de_livraison_ibfk_1` FOREIGN KEY (`pro_id`) REFERENCES `Produit` (`pro_id`),
  CONSTRAINT `Bon_de_livraison_ibfk_2` FOREIGN KEY (`cmd_id`) REFERENCES `Commande` (`cmd_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Bon_de_livraison`
--

LOCK TABLES `Bon_de_livraison` WRITE;
/*!40000 ALTER TABLE `Bon_de_livraison` DISABLE KEYS */;
INSERT INTO `Bon_de_livraison` VALUES (1,1,2,'2023-05-16',2),(2,1,2,'2023-07-27',1),(2,1,5,'2023-07-27',5),(3,2,1,'2023-08-05',1),(4,3,3,'2023-09-18',2),(4,3,4,'2023-09-18',1);
/*!40000 ALTER TABLE `Bon_de_livraison` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Client`
--

DROP TABLE IF EXISTS `Client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Client` (
  `cli_id` int(11) NOT NULL AUTO_INCREMENT,
  `cli_nom` varchar(50) NOT NULL,
  `cli_prenom` varchar(50) NOT NULL,
  `cli_adr` varchar(50) NOT NULL,
  `cli_vil` varchar(50) NOT NULL,
  `cli_cp` varchar(50) NOT NULL,
  `cli_pays` varchar(50) NOT NULL,
  `cli_tel` varchar(10) DEFAULT NULL,
  `cli_mail` varchar(50) NOT NULL,
  `cli_type` tinyint(1) DEFAULT NULL,
  `cli_coef` decimal(4,2) NOT NULL,
  `emp_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`cli_id`),
  KEY `emp_id` (`emp_id`),
  CONSTRAINT `Client_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `Employé` (`emp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Client`
--

LOCK TABLES `Client` WRITE;
/*!40000 ALTER TABLE `Client` DISABLE KEYS */;
INSERT INTO `Client` VALUES (1,'Christophe','Brody','52474 Eagle Crest Alley','Lyon','69464','France','5509213300','bchristophe0@usda.gov',0,72.00,1),(2,'Daffern','Lorna','4455 Sage Street','Grenoble','38030','France','3554927729','ldaffern1@t.co',1,66.00,2),(3,'Peirazzi','Evangeline','48916 Kedzie Plaza','Berlin','12103','Germany','7679073058','epeirazzi2@google.nl',1,13.00,3),(4,'Doidge','Michel','77 Bartelt Pass','Paris 14','75675','France','6927069676','mdoidge3@quantcast.com',0,73.00,4),(5,'Whyler','Madelyn','0553 Old Gate Place','La Roche-sur-Yon','85009','France','4257263378','mwhyler4@techcrunch.com',1,43.00,5);
/*!40000 ALTER TABLE `Client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Commande`
--

DROP TABLE IF EXISTS `Commande`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Commande` (
  `cmd_id` int(11) NOT NULL AUTO_INCREMENT,
  `pro_id` int(11) NOT NULL,
  `cli_id` int(11) DEFAULT NULL,
  `cmd_adr_liv` varchar(100) NOT NULL,
  `cmd_adr_fac` varchar(100) NOT NULL,
  `cmd_date` date NOT NULL,
  `cmd_qte` int(11) NOT NULL,
  `com_red` int(11) DEFAULT NULL,
  PRIMARY KEY (`cmd_id`,`pro_id`),
  KEY `cli_id` (`cli_id`),
  KEY `pro_id` (`pro_id`),
  CONSTRAINT `Commande_ibfk_1` FOREIGN KEY (`cli_id`) REFERENCES `Client` (`cli_id`),
  CONSTRAINT `Commande_ibfk_2` FOREIGN KEY (`pro_id`) REFERENCES `Produit` (`pro_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Commande`
--

LOCK TABLES `Commande` WRITE;
/*!40000 ALTER TABLE `Commande` DISABLE KEYS */;
INSERT INTO `Commande` VALUES (1,2,1,'808 Graedel Place','808 Graedel Place','2023-03-12',3,NULL),(1,5,1,'808 Graedel Place','808 Graedel Place','2023-03-12',5,NULL),(2,1,5,'7600 Fremont Parkway','7600 Fremont Parkway','2023-04-26',1,NULL),(3,3,4,'41 Mayer Way','9 Moulton Parkway','2023-05-14',2,NULL),(3,4,4,'41 Mayer Way','9 Moulton Parkway','2023-05-14',1,NULL);
/*!40000 ALTER TABLE `Commande` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employé`
--

DROP TABLE IF EXISTS `Employé`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Employé` (
  `emp_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_nom` varchar(50) NOT NULL,
  `emp_pre` varchar(50) NOT NULL,
  `emp_adr` varchar(50) NOT NULL,
  `emp_vil` varchar(50) NOT NULL,
  `emp_cp` varchar(50) NOT NULL,
  PRIMARY KEY (`emp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employé`
--

LOCK TABLES `Employé` WRITE;
/*!40000 ALTER TABLE `Employé` DISABLE KEYS */;
INSERT INTO `Employé` VALUES (1,'Creaven','Anica','9543 Hudson Way','Saint-Étienne','42963'),(2,'Clues','Jilleen','4 Erie Street','Villeurbanne','69624'),(3,'Fielden','Carolyne','2650 Monica Crossing','Orléans','45957'),(4,'Lethley','Aggie','3 Sloan Avenue','Cosne-Cours-sur-Loire','58209'),(5,'Folker','Donetta','7580 Haas Circle','Paris 19','75171');
/*!40000 ALTER TABLE `Employé` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Facture`
--

DROP TABLE IF EXISTS `Facture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Facture` (
  `fac_id` int(11) NOT NULL AUTO_INCREMENT,
  `fac_date` date NOT NULL,
  `cmd_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`fac_id`),
  KEY `cmd_id` (`cmd_id`),
  CONSTRAINT `Facture_ibfk_1` FOREIGN KEY (`cmd_id`) REFERENCES `Commande` (`cmd_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Facture`
--

LOCK TABLES `Facture` WRITE;
/*!40000 ALTER TABLE `Facture` DISABLE KEYS */;
INSERT INTO `Facture` VALUES (1,'2023-03-13',1),(2,'2023-04-27',2),(3,'2023-05-15',3);
/*!40000 ALTER TABLE `Facture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Fournisseur`
--

DROP TABLE IF EXISTS `Fournisseur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Fournisseur` (
  `fou_id` int(11) NOT NULL AUTO_INCREMENT,
  `fou_nom` varchar(50) NOT NULL,
  `fou_adr` varchar(50) NOT NULL,
  `fou_vil` varchar(50) NOT NULL,
  `fou_cp` varchar(10) NOT NULL,
  `fou_pays` varchar(50) NOT NULL,
  PRIMARY KEY (`fou_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Fournisseur`
--

LOCK TABLES `Fournisseur` WRITE;
/*!40000 ALTER TABLE `Fournisseur` DISABLE KEYS */;
INSERT INTO `Fournisseur` VALUES (1,'Dynabox','4413 Graceland Crossing','Tournon-sur-Rhône','07309','France'),(2,'Yabox','25 International Street','Saverne','67704','France'),(3,'Skipstorm','300 Oak Road','Aix-en-Provence','13858','France'),(4,'Kazio','876 Basil Junction','Mulhouse','68092','France'),(5,'Yodoo','60202 6th Terrace','Paris 11','75547','France');
/*!40000 ALTER TABLE `Fournisseur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Produit`
--

DROP TABLE IF EXISTS `Produit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Produit` (
  `pro_id` int(11) NOT NULL AUTO_INCREMENT,
  `pro_nom` varchar(50) NOT NULL,
  `pro_desc` varchar(255) DEFAULT NULL,
  `pro_prixht` decimal(4,2) NOT NULL,
  `pro_pic` varchar(255) NOT NULL,
  `pro_stock` int(11) NOT NULL,
  `prod_act` tinyint(1) DEFAULT NULL,
  `srub_id` int(11) DEFAULT NULL,
  `fou_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`pro_id`),
  KEY `srub_id` (`srub_id`),
  KEY `fou_id` (`fou_id`),
  CONSTRAINT `Produit_ibfk_1` FOREIGN KEY (`srub_id`) REFERENCES `Sous_Rubrique` (`srub_id`),
  CONSTRAINT `Produit_ibfk_2` FOREIGN KEY (`fou_id`) REFERENCES `Fournisseur` (`fou_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Produit`
--

LOCK TABLES `Produit` WRITE;
/*!40000 ALTER TABLE `Produit` DISABLE KEYS */;
INSERT INTO `Produit` VALUES (1,'Produit1','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus aliquet erat vel mattis facilisis. Sed pulvinar vestibulum sapien id sagittis.',19.99,'pic1.jpg',500,1,4,2),(2,'Produit2','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus aliquet erat vel mattis facilisis. Sed pulvinar vestibulum sapien id sagittis.',39.99,'pic2.jpg',1000,1,5,3),(3,'Produit3','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus aliquet erat vel mattis facilisis. Sed pulvinar vestibulum sapien id sagittis.',16.50,'pic3.jpg',250,1,3,5),(4,'Produit4','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus aliquet erat vel mattis facilisis. Sed pulvinar vestibulum sapien id sagittis.',69.99,'pic4.jpg',600,1,1,4),(5,'Produit5','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus aliquet erat vel mattis facilisis. Sed pulvinar vestibulum sapien id sagittis.',44.99,'pic5.jpg',150,1,2,1);
/*!40000 ALTER TABLE `Produit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Rubrique`
--

DROP TABLE IF EXISTS `Rubrique`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Rubrique` (
  `rub_id` int(11) NOT NULL AUTO_INCREMENT,
  `rub_nom` varchar(50) NOT NULL,
  PRIMARY KEY (`rub_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Rubrique`
--

LOCK TABLES `Rubrique` WRITE;
/*!40000 ALTER TABLE `Rubrique` DISABLE KEYS */;
INSERT INTO `Rubrique` VALUES (1,'Rubrique1'),(2,'Rubrique2'),(3,'Rubrique3');
/*!40000 ALTER TABLE `Rubrique` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sous_Rubrique`
--

DROP TABLE IF EXISTS `Sous_Rubrique`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Sous_Rubrique` (
  `srub_id` int(11) NOT NULL AUTO_INCREMENT,
  `srub_nom` varchar(50) NOT NULL,
  `rub_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`srub_id`),
  KEY `rub_id` (`rub_id`),
  CONSTRAINT `Sous_Rubrique_ibfk_1` FOREIGN KEY (`rub_id`) REFERENCES `Rubrique` (`rub_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sous_Rubrique`
--

LOCK TABLES `Sous_Rubrique` WRITE;
/*!40000 ALTER TABLE `Sous_Rubrique` DISABLE KEYS */;
INSERT INTO `Sous_Rubrique` VALUES (1,'Sous-rubrique1',1),(2,'Sous-rubrique2',1),(3,'Sous-rubrique3',2),(4,'Sous-rubrique4',2),(5,'Sous-rubrique5',3);
/*!40000 ALTER TABLE `Sous_Rubrique` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-02  8:48:34

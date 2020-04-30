
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP SCHEMA IF EXISTS `ZtaAzterketa` ;
CREATE SCHEMA IF NOT EXISTS `ZtaAzterketa` DEFAULT CHARACTER SET latin1 ;
USE `ZtaAzterketa` ;

GRANT ALL PRIVILEGES ON ZtaAzterketa.* TO 'ikasle'@'localhost' IDENTIFIED BY 'zta';
--
-- Table structure for table `Taldea`
--

DROP TABLE IF EXISTS `Taldea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Taldea` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `izena` varchar(45) NOT NULL,
  `maila` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Taldea`
--

LOCK TABLES `Taldea` WRITE;
/*!40000 ALTER TABLE `Taldea` DISABLE KEYS */;
INSERT INTO `Taldea` VALUES (3,'C. P. BADALONA',1),(4,'C. P. y B. COMPLUTENSE',1),(5,'C. P. PINO MONTANO',1),(6,'C. P. BARQUEROS',1),(7,'C. P. SABINANIGO',2),(8,'D. B. C. P. EL CARMEN DE ARGUINEGUIN',2),(9,'C. P. DO LUME',2),(10,'C. P. BARAKALDO',2),(11,'C. P. OYONESA',2),(12,'C. P. PETANQUERO',2),(13,'A. D. EL ROBLE',3),(14,'C. P. EL CID',3),(15,'C. P. ROSALES',3),(16,'C. P. ALBORÁN',3);
/*!40000 ALTER TABLE `Taldea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Partida`
--

DROP TABLE IF EXISTS `Partida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Partida` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taldea1` int(11) NOT NULL,
  `taldea2` int(11) NOT NULL,
  `urtea` int(11) NOT NULL,
  `astea` int(11) NOT NULL,
  `emaitza` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Partida_taldea1_idx` (`taldea1`),
  KEY `fk_Partida_taldea2_idx` (`taldea2`),
  CONSTRAINT `fk_Partida_taldea1` FOREIGN KEY (`taldea1`) REFERENCES `Taldea` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Partida_taldea2` FOREIGN KEY (`taldea2`) REFERENCES `Taldea` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Partida`
--

LOCK TABLES `Partida` WRITE;
/*!40000 ALTER TABLE `Partida` DISABLE KEYS */;
INSERT INTO `Partida` VALUES (24,7,9,2015,9,'2'),(27,4,13,2015,12,'X'),(28,4,15,2015,12,'X'),(29,4,9,2015,12,'1'),(30,3,5,2015,12,'1'),(31,3,10,2015,12,'X');
/*!40000 ALTER TABLE `Partida` ENABLE KEYS */;
UNLOCK TABLES;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

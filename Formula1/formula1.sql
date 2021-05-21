-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: jogos
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `tb_circuito`
--

DROP TABLE IF EXISTS `tb_circuito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_circuito` (
  `ID_CIRCUITO` tinyint NOT NULL AUTO_INCREMENT,
  `NM_CIRCUITO` varchar(25) NOT NULL,
  `NR_EXTENSAO` int NOT NULL,
  `ID_PAIS` tinyint DEFAULT NULL,
  PRIMARY KEY (`ID_CIRCUITO`),
  KEY `fk_ID_PAIS_idx` (`ID_PAIS`),
  CONSTRAINT `fk_ID_PAIS` FOREIGN KEY (`ID_PAIS`) REFERENCES `tb_pais` (`ID_PAIS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_circuito`
--

LOCK TABLES `tb_circuito` WRITE;
/*!40000 ALTER TABLE `tb_circuito` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_circuito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_equipe`
--

DROP TABLE IF EXISTS `tb_equipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_equipe` (
  `ID_EQUIPE` tinyint NOT NULL AUTO_INCREMENT,
  `NM_EQUIPE` varchar(25) NOT NULL,
  `ID_PAIS` tinyint NOT NULL,
  PRIMARY KEY (`ID_EQUIPE`),
  KEY `fk_ID_PAIS2_idx` (`ID_PAIS`),
  CONSTRAINT `fk_ID_PAIS2` FOREIGN KEY (`ID_PAIS`) REFERENCES `tb_pais` (`ID_PAIS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_equipe`
--

LOCK TABLES `tb_equipe` WRITE;
/*!40000 ALTER TABLE `tb_equipe` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_equipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_pais`
--

DROP TABLE IF EXISTS `tb_pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_pais` (
  `ID_PAIS` tinyint NOT NULL AUTO_INCREMENT,
  `NM_PAIS` varchar(25) NOT NULL,
  `NR_POPULACAO` int NOT NULL,
  PRIMARY KEY (`ID_PAIS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_pais`
--

LOCK TABLES `tb_pais` WRITE;
/*!40000 ALTER TABLE `tb_pais` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_piloto`
--

DROP TABLE IF EXISTS `tb_piloto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_piloto` (
  `ID_PILOTO` tinyint NOT NULL AUTO_INCREMENT,
  `NM_PILOTO` varchar(25) NOT NULL,
  `DT_NASCIMENTO` date NOT NULL,
  `ID_PAIS` tinyint NOT NULL,
  `ID_EQUIPE` tinyint NOT NULL,
  PRIMARY KEY (`ID_PILOTO`),
  KEY `fk_ID_PAIS3_idx` (`ID_PAIS`),
  KEY `fk_ID_EQUIPE_idx` (`ID_EQUIPE`),
  CONSTRAINT `fk_ID_EQUIPE` FOREIGN KEY (`ID_EQUIPE`) REFERENCES `tb_equipe` (`ID_EQUIPE`),
  CONSTRAINT `fk_ID_PAIS3` FOREIGN KEY (`ID_PAIS`) REFERENCES `tb_pais` (`ID_PAIS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_piloto`
--

LOCK TABLES `tb_piloto` WRITE;
/*!40000 ALTER TABLE `tb_piloto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_piloto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_prova`
--

DROP TABLE IF EXISTS `tb_prova`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_prova` (
  `ID_PROVA` tinyint NOT NULL AUTO_INCREMENT,
  `DT_PROVA` date NOT NULL,
  `NM_SITUACAO` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ID_CIRCUITO` tinyint NOT NULL,
  PRIMARY KEY (`ID_PROVA`),
  KEY `fk_ID_CIRCUITO_idx` (`ID_CIRCUITO`),
  CONSTRAINT `fk_ID_CIRCUITO` FOREIGN KEY (`ID_CIRCUITO`) REFERENCES `tb_circuito` (`ID_CIRCUITO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_prova`
--

LOCK TABLES `tb_prova` WRITE;
/*!40000 ALTER TABLE `tb_prova` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_prova` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_resultado`
--

DROP TABLE IF EXISTS `tb_resultado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_resultado` (
  `ID_PROVA` tinyint NOT NULL,
  `ID_PILOTO` tinyint NOT NULL,
  `NR_TEMPO_PROVA` time NOT NULL,
  `NR_COLOC_FINAL` tinyint NOT NULL,
  `NR_POSICAO_GRID` tinyint NOT NULL,
  `NR_MELHOR_VOLTA` tinyint NOT NULL,
  PRIMARY KEY (`ID_PROVA`,`ID_PILOTO`),
  KEY `FK_ID_PROVA_idx` (`ID_PROVA`),
  KEY `fk_ID_PILOTO_idx` (`ID_PILOTO`),
  CONSTRAINT `fk_ID_PILOTO` FOREIGN KEY (`ID_PILOTO`) REFERENCES `tb_piloto` (`ID_PILOTO`),
  CONSTRAINT `fk_ID_PROVA` FOREIGN KEY (`ID_PROVA`) REFERENCES `tb_prova` (`ID_PROVA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_resultado`
--

LOCK TABLES `tb_resultado` WRITE;
/*!40000 ALTER TABLE `tb_resultado` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_resultado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'jogos'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-10 17:13:02

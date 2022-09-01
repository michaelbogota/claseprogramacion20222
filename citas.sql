CREATE DATABASE  IF NOT EXISTS `citas_eps` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `citas_eps`;
-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: citas_eps
-- ------------------------------------------------------
-- Server version	5.7.30

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
-- Table structure for table `afiliados`
--

DROP TABLE IF EXISTS `afiliados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `afiliados` (
  `DOCUMENTO` varchar(20) NOT NULL,
  `TIP_DOC_CODIGO` int(11) DEFAULT NULL,
  `FECHA_NACIMIENTO` datetime DEFAULT NULL,
  `PRIMER_NOMBRE` varchar(100) DEFAULT NULL,
  `SEGUNDO_NOMBRE` varchar(100) DEFAULT NULL,
  `PRIMER_APELLIDO` varchar(100) DEFAULT NULL,
  `SEGUNDO_APELLIDO` varchar(100) DEFAULT NULL,
  `DIRECCION` varchar(100) DEFAULT NULL,
  `TELEFONO` int(11) DEFAULT NULL,
  `CORREO` varchar(100) DEFAULT NULL,
  `TIP_SAN_RH` varchar(5) DEFAULT NULL,
  `GENER_CODIGO` int(11) DEFAULT NULL,
  `ESTRA_CODIGO` int(11) DEFAULT NULL,
  `CATEG_CODIGO` int(11) DEFAULT NULL,
  `TIP_AFI_CODIGO` int(11) DEFAULT NULL,
  `CIU_DIREC_CODIGO` int(11) DEFAULT NULL,
  PRIMARY KEY (`DOCUMENTO`),
  KEY `TIP_DOC_CODIGO_idx` (`TIP_DOC_CODIGO`),
  KEY `TIP_SAN_RH_idx` (`TIP_SAN_RH`),
  KEY `GENER_CODIGO_idx` (`GENER_CODIGO`),
  KEY `ESTRA_CODIGO_idx` (`ESTRA_CODIGO`),
  KEY `CATEG_CODIGO_idx` (`CATEG_CODIGO`),
  KEY `TIP_AFI_CODIGO_idx` (`TIP_AFI_CODIGO`),
  CONSTRAINT `CATEG_CODIGO` FOREIGN KEY (`CATEG_CODIGO`) REFERENCES `categorias` (`CODIGO`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ESTRA_CODIGO` FOREIGN KEY (`ESTRA_CODIGO`) REFERENCES `estratos` (`CODIGO`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `GENER_CODIGO` FOREIGN KEY (`GENER_CODIGO`) REFERENCES `generos` (`CODIGO`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `TIP_AFI_CODIGO` FOREIGN KEY (`TIP_AFI_CODIGO`) REFERENCES `tipo_afiliaciones` (`CODIGO`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `TIP_DOC_CODIGO` FOREIGN KEY (`TIP_DOC_CODIGO`) REFERENCES `tipos_documentos` (`CODIGO`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `TIP_SAN_RH` FOREIGN KEY (`TIP_SAN_RH`) REFERENCES `tipo_sangre` (`RH`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `afiliados`
--

LOCK TABLES `afiliados` WRITE;
/*!40000 ALTER TABLE `afiliados` DISABLE KEYS */;
/*!40000 ALTER TABLE `afiliados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cargos`
--

DROP TABLE IF EXISTS `cargos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cargos` (
  `CODIGO` int(11) NOT NULL,
  `NOMBRE` varchar(100) DEFAULT NULL,
  `SALARIO` int(11) DEFAULT NULL,
  PRIMARY KEY (`CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargos`
--

LOCK TABLES `cargos` WRITE;
/*!40000 ALTER TABLE `cargos` DISABLE KEYS */;
/*!40000 ALTER TABLE `cargos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `CODIGO` int(11) NOT NULL,
  `NOMBRE` varchar(100) DEFAULT NULL,
  `DESCRIPCION` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `citas`
--

DROP TABLE IF EXISTS `citas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `citas` (
  `AFIL_DOCUMENTO` varchar(20) NOT NULL,
  `FECHA` datetime NOT NULL,
  `FUNC_DOCUMENTO` varchar(20) DEFAULT NULL,
  `SEDE_CODIGO` int(11) DEFAULT NULL,
  PRIMARY KEY (`AFIL_DOCUMENTO`,`FECHA`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citas`
--

LOCK TABLES `citas` WRITE;
/*!40000 ALTER TABLE `citas` DISABLE KEYS */;
/*!40000 ALTER TABLE `citas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ciudades`
--

DROP TABLE IF EXISTS `ciudades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ciudades` (
  `CODIGO` int(11) NOT NULL,
  `NOMBRE` varchar(100) DEFAULT NULL,
  `DESCRIPCION` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciudades`
--

LOCK TABLES `ciudades` WRITE;
/*!40000 ALTER TABLE `ciudades` DISABLE KEYS */;
/*!40000 ALTER TABLE `ciudades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diagnostico`
--

DROP TABLE IF EXISTS `diagnostico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diagnostico` (
  `HIST_CLIN_CODIGO` int(11) NOT NULL,
  `MED_CODIGO` int(11) DEFAULT NULL,
  `CANTIDAD` int(11) DEFAULT NULL,
  `TIEMPO_MEDICAMENTO` varchar(100) DEFAULT NULL,
  `OBSERVACIONES` varchar(1000) DEFAULT NULL,
  `TIEMPO_PROXIMA_CITA` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`HIST_CLIN_CODIGO`),
  KEY `MED_CODIGO_idx` (`MED_CODIGO`),
  CONSTRAINT `MED_CODIGO` FOREIGN KEY (`MED_CODIGO`) REFERENCES `medicamentos` (`CODIGO`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diagnostico`
--

LOCK TABLES `diagnostico` WRITE;
/*!40000 ALTER TABLE `diagnostico` DISABLE KEYS */;
/*!40000 ALTER TABLE `diagnostico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eps`
--

DROP TABLE IF EXISTS `eps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eps` (
  `CODIGO` int(11) NOT NULL,
  `NOMBRE` varchar(100) DEFAULT NULL,
  `DIRECCION` varchar(100) DEFAULT NULL,
  `TELEFONO` int(11) DEFAULT NULL,
  `CORREO` int(11) DEFAULT NULL,
  PRIMARY KEY (`CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eps`
--

LOCK TABLES `eps` WRITE;
/*!40000 ALTER TABLE `eps` DISABLE KEYS */;
/*!40000 ALTER TABLE `eps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eps_ips`
--

DROP TABLE IF EXISTS `eps_ips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eps_ips` (
  `CODIGO` int(11) NOT NULL,
  `NOMBRE` varchar(100) DEFAULT NULL,
  `IPS_CODIGO` int(11) DEFAULT NULL,
  `EPS_CODIGO` int(11) DEFAULT NULL,
  PRIMARY KEY (`CODIGO`),
  KEY `IPS_CODIGO_idx` (`IPS_CODIGO`),
  KEY `EPS_CODIGO_idx` (`EPS_CODIGO`),
  CONSTRAINT `EPS_CODIGO` FOREIGN KEY (`EPS_CODIGO`) REFERENCES `ips` (`CODIGO`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `IPS_CODIGO` FOREIGN KEY (`IPS_CODIGO`) REFERENCES `ips` (`CODIGO`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eps_ips`
--

LOCK TABLES `eps_ips` WRITE;
/*!40000 ALTER TABLE `eps_ips` DISABLE KEYS */;
/*!40000 ALTER TABLE `eps_ips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `especialidades`
--

DROP TABLE IF EXISTS `especialidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `especialidades` (
  `CODIGO` int(11) NOT NULL,
  `NOMBRE` varchar(100) DEFAULT NULL,
  `VARCHAR` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especialidades`
--

LOCK TABLES `especialidades` WRITE;
/*!40000 ALTER TABLE `especialidades` DISABLE KEYS */;
/*!40000 ALTER TABLE `especialidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado_afiliados`
--

DROP TABLE IF EXISTS `estado_afiliados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado_afiliados` (
  `CODIGO` int(11) NOT NULL,
  `AFIL_DOCUMENTO` varchar(20) DEFAULT NULL,
  `ESTA_CODIGO` int(11) DEFAULT NULL,
  `FECHA_ESTADO` datetime DEFAULT NULL,
  `DESCRIPCION` varchar(1000) DEFAULT NULL,
  `ESTADO_AFILIADOScol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`CODIGO`),
  KEY `FK_A_ESTA_CODIGO_idx` (`ESTA_CODIGO`),
  CONSTRAINT `FK_A_ESTA_CODIGO` FOREIGN KEY (`ESTA_CODIGO`) REFERENCES `estados` (`CODIGO`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado_afiliados`
--

LOCK TABLES `estado_afiliados` WRITE;
/*!40000 ALTER TABLE `estado_afiliados` DISABLE KEYS */;
/*!40000 ALTER TABLE `estado_afiliados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estados`
--

DROP TABLE IF EXISTS `estados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estados` (
  `CODIGO` int(11) NOT NULL,
  `NOMBRE` varchar(100) DEFAULT NULL,
  `DESCRIPCION` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estados`
--

LOCK TABLES `estados` WRITE;
/*!40000 ALTER TABLE `estados` DISABLE KEYS */;
/*!40000 ALTER TABLE `estados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estratos`
--

DROP TABLE IF EXISTS `estratos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estratos` (
  `CODIGO` int(11) NOT NULL,
  `NOMBRE` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estratos`
--

LOCK TABLES `estratos` WRITE;
/*!40000 ALTER TABLE `estratos` DISABLE KEYS */;
/*!40000 ALTER TABLE `estratos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionarios`
--

DROP TABLE IF EXISTS `funcionarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionarios` (
  `DOCUMENTO` varchar(20) NOT NULL,
  `TIP_DOC_CODIGO` int(11) DEFAULT NULL,
  `FECHA_NACIMIENTO` datetime DEFAULT NULL,
  `PRIMER_NOMBRE` varchar(100) DEFAULT NULL,
  `SEGUNDO_NOMBRE` varchar(100) DEFAULT NULL,
  `PRIMER_APELLIDO` varchar(100) DEFAULT NULL,
  `SEGUNDO_APELLIDO` varchar(100) DEFAULT NULL,
  `DIRECCION` varchar(100) DEFAULT NULL,
  `TELEFONO` int(11) DEFAULT NULL,
  `CORREO` varchar(100) DEFAULT NULL,
  `CIU_DIREC_CODIGO` int(11) DEFAULT NULL,
  `CARG_CODIGO` int(11) DEFAULT NULL,
  `GENER_CODIGO` int(11) DEFAULT NULL,
  `ESTR_CODIGO` int(11) DEFAULT NULL,
  `CATEG_CODIGO` int(11) DEFAULT NULL,
  `ESPEC_CODIGO` int(11) DEFAULT NULL,
  PRIMARY KEY (`DOCUMENTO`),
  KEY `TIP_DOC_CODIGO_idx` (`TIP_DOC_CODIGO`),
  KEY `FUNC_TIP_DOC_CODIGO_idx` (`TIP_DOC_CODIGO`),
  KEY `CIU_DIREC_CODIGO_idx` (`CIU_DIREC_CODIGO`),
  KEY `CARG_CODIGO_idx` (`CARG_CODIGO`),
  KEY `GENER_CODIGO_idx` (`GENER_CODIGO`),
  KEY `ESTR_CODIGO_idx` (`ESTR_CODIGO`),
  KEY `CATEG_CODIGO_idx` (`CATEG_CODIGO`),
  KEY `ESPEC_CODIGO_idx` (`ESPEC_CODIGO`),
  CONSTRAINT `CIU_DIREC_CODIGO` FOREIGN KEY (`CIU_DIREC_CODIGO`) REFERENCES `ciudades` (`CODIGO`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_CARG_CODIGO` FOREIGN KEY (`CARG_CODIGO`) REFERENCES `cargos` (`CODIGO`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_CATEG_CODIGO` FOREIGN KEY (`CATEG_CODIGO`) REFERENCES `categorias` (`CODIGO`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_ESPEC_CODIGO` FOREIGN KEY (`ESPEC_CODIGO`) REFERENCES `especialidades` (`CODIGO`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_ESTR_CODIGO` FOREIGN KEY (`ESTR_CODIGO`) REFERENCES `estratos` (`CODIGO`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_GENER_CODIGO` FOREIGN KEY (`GENER_CODIGO`) REFERENCES `generos` (`CODIGO`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_TIP_DOC_CODIGO` FOREIGN KEY (`TIP_DOC_CODIGO`) REFERENCES `tipos_documentos` (`CODIGO`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionarios`
--

LOCK TABLES `funcionarios` WRITE;
/*!40000 ALTER TABLE `funcionarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `funcionarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `generos`
--

DROP TABLE IF EXISTS `generos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `generos` (
  `CODIGO` int(11) NOT NULL,
  `NOMBRE` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `generos`
--

LOCK TABLES `generos` WRITE;
/*!40000 ALTER TABLE `generos` DISABLE KEYS */;
/*!40000 ALTER TABLE `generos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historia_clinica`
--

DROP TABLE IF EXISTS `historia_clinica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historia_clinica` (
  `CODIGO` int(11) NOT NULL,
  `AFIL_DOCUMENTO` varchar(20) DEFAULT NULL,
  `FECHA` datetime DEFAULT NULL,
  `FUNC_DOCUMENTO` varchar(20) DEFAULT NULL,
  `PATOL_CODIGO` int(11) DEFAULT NULL,
  PRIMARY KEY (`CODIGO`),
  KEY `FK_AFIL_DOCUMENTO_idx` (`AFIL_DOCUMENTO`),
  KEY `FK_FUNC_DOCUMENTO_idx` (`FUNC_DOCUMENTO`),
  KEY `PATOL_CODIGO_idx` (`PATOL_CODIGO`),
  CONSTRAINT `FK_AFIL_DOCUMENTO` FOREIGN KEY (`AFIL_DOCUMENTO`) REFERENCES `afiliados` (`DOCUMENTO`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_FUNC_DOCUMENTO` FOREIGN KEY (`FUNC_DOCUMENTO`) REFERENCES `funcionarios` (`DOCUMENTO`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `PATOL_CODIGO` FOREIGN KEY (`PATOL_CODIGO`) REFERENCES `patologias` (`CODIGO`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historia_clinica`
--

LOCK TABLES `historia_clinica` WRITE;
/*!40000 ALTER TABLE `historia_clinica` DISABLE KEYS */;
/*!40000 ALTER TABLE `historia_clinica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ips`
--

DROP TABLE IF EXISTS `ips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ips` (
  `CODIGO` int(11) NOT NULL,
  `NOMBRE` varchar(100) DEFAULT NULL,
  `DIRECCION` varchar(100) DEFAULT NULL,
  `TELEFONO` int(11) DEFAULT NULL,
  `CORREO` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ips`
--

LOCK TABLES `ips` WRITE;
/*!40000 ALTER TABLE `ips` DISABLE KEYS */;
/*!40000 ALTER TABLE `ips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicamentos`
--

DROP TABLE IF EXISTS `medicamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicamentos` (
  `CODIGO` int(11) NOT NULL,
  `NOMBRE` varchar(100) DEFAULT NULL,
  `DESCRIPCION` varchar(1000) DEFAULT NULL,
  `PRES_CODIGO` int(11) DEFAULT NULL,
  `ESTA_CODIGO` int(11) DEFAULT NULL,
  PRIMARY KEY (`CODIGO`),
  KEY `PRES_CODIGO_idx` (`PRES_CODIGO`),
  KEY `ESTA_CODIGO_idx` (`ESTA_CODIGO`),
  CONSTRAINT `ESTA_CODIGO` FOREIGN KEY (`ESTA_CODIGO`) REFERENCES `estados` (`CODIGO`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `PRES_CODIGO` FOREIGN KEY (`PRES_CODIGO`) REFERENCES `presentacion_medicamentos` (`CODIGO`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicamentos`
--

LOCK TABLES `medicamentos` WRITE;
/*!40000 ALTER TABLE `medicamentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `medicamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patologias`
--

DROP TABLE IF EXISTS `patologias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patologias` (
  `CODIGO` int(11) NOT NULL,
  `NOMBRE` varchar(100) DEFAULT NULL,
  `DESCRIPCION` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patologias`
--

LOCK TABLES `patologias` WRITE;
/*!40000 ALTER TABLE `patologias` DISABLE KEYS */;
/*!40000 ALTER TABLE `patologias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `presentacion_medicamentos`
--

DROP TABLE IF EXISTS `presentacion_medicamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `presentacion_medicamentos` (
  `CODIGO` int(11) NOT NULL,
  `NOMBRE` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `presentacion_medicamentos`
--

LOCK TABLES `presentacion_medicamentos` WRITE;
/*!40000 ALTER TABLE `presentacion_medicamentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `presentacion_medicamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sedes`
--

DROP TABLE IF EXISTS `sedes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sedes` (
  `CODIGO` int(11) NOT NULL,
  `NOMBRE` varchar(100) DEFAULT NULL,
  `DIRECCION` varchar(100) DEFAULT NULL,
  `TELEFONO` varchar(100) DEFAULT NULL,
  `CORREO` varchar(100) DEFAULT NULL,
  `PAGINA` varchar(100) DEFAULT NULL,
  `EPS_IPS_CODIGO` int(11) DEFAULT NULL,
  `SERV_CODIGO` int(11) DEFAULT NULL,
  `CIU_CODIGO` int(11) DEFAULT NULL,
  PRIMARY KEY (`CODIGO`),
  KEY `EPS_IPS_CODIGO_idx` (`EPS_IPS_CODIGO`),
  KEY `SERV_CODIGO_idx` (`SERV_CODIGO`),
  CONSTRAINT `EPS_IPS_CODIGO` FOREIGN KEY (`EPS_IPS_CODIGO`) REFERENCES `eps_ips` (`CODIGO`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `SERV_CODIGO` FOREIGN KEY (`SERV_CODIGO`) REFERENCES `servicios` (`CODIGO`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sedes`
--

LOCK TABLES `sedes` WRITE;
/*!40000 ALTER TABLE `sedes` DISABLE KEYS */;
/*!40000 ALTER TABLE `sedes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicios`
--

DROP TABLE IF EXISTS `servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicios` (
  `CODIGO` int(11) NOT NULL,
  `NOMBRE` varchar(100) DEFAULT NULL,
  `ESTA_CODIGO` int(11) DEFAULT NULL,
  `FECHA_ESTADO` datetime DEFAULT NULL,
  PRIMARY KEY (`CODIGO`),
  KEY `ESTA_CODIGO_idx` (`ESTA_CODIGO`),
  CONSTRAINT `FK_SER_ESTA_CODIGO` FOREIGN KEY (`ESTA_CODIGO`) REFERENCES `estados` (`CODIGO`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicios`
--

LOCK TABLES `servicios` WRITE;
/*!40000 ALTER TABLE `servicios` DISABLE KEYS */;
/*!40000 ALTER TABLE `servicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_afiliaciones`
--

DROP TABLE IF EXISTS `tipo_afiliaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_afiliaciones` (
  `CODIGO` int(11) NOT NULL,
  `NOMBRE` varchar(100) DEFAULT NULL,
  `DESCRIPCION` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_afiliaciones`
--

LOCK TABLES `tipo_afiliaciones` WRITE;
/*!40000 ALTER TABLE `tipo_afiliaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_afiliaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_sangre`
--

DROP TABLE IF EXISTS `tipo_sangre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_sangre` (
  `RH` varchar(45) NOT NULL,
  `RECIBE` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`RH`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_sangre`
--

LOCK TABLES `tipo_sangre` WRITE;
/*!40000 ALTER TABLE `tipo_sangre` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_sangre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos_documentos`
--

DROP TABLE IF EXISTS `tipos_documentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipos_documentos` (
  `CODIGO` int(11) NOT NULL,
  `NOMBRE_CORTO` varchar(10) DEFAULT NULL,
  `NOMBRE_LARGO` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_documentos`
--

LOCK TABLES `tipos_documentos` WRITE;
/*!40000 ALTER TABLE `tipos_documentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipos_documentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'citas_eps'
--

--
-- Dumping routines for database 'citas_eps'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-31 20:51:22

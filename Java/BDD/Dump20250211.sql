CREATE DATABASE  IF NOT EXISTS `eurekabank` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `eurekabank`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: eurekabank
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `asignado`
--

DROP TABLE IF EXISTS `asignado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asignado` (
  `chr_asigcodigo` char(6) NOT NULL,
  `chr_sucucodigo` char(3) NOT NULL,
  `chr_emplcodigo` char(4) NOT NULL,
  `dtt_asigfechaalta` date NOT NULL,
  `dtt_asigfechabaja` date DEFAULT NULL,
  PRIMARY KEY (`chr_asigcodigo`),
  KEY `idx_asignado01` (`chr_emplcodigo`),
  KEY `idx_asignado02` (`chr_sucucodigo`),
  CONSTRAINT `fk_asignado_empleado` FOREIGN KEY (`chr_emplcodigo`) REFERENCES `empleado` (`chr_emplcodigo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_asignado_sucursal` FOREIGN KEY (`chr_sucucodigo`) REFERENCES `sucursal` (`chr_sucucodigo`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asignado`
--

LOCK TABLES `asignado` WRITE;
/*!40000 ALTER TABLE `asignado` DISABLE KEYS */;
INSERT INTO `asignado` VALUES ('000001','001','0004','2007-11-15',NULL),('000002','002','0001','2007-11-20',NULL),('000003','003','0002','2007-11-28',NULL),('000004','004','0003','2007-12-12','2008-03-25'),('000005','005','0006','2007-12-20',NULL),('000006','006','0005','2008-01-05',NULL),('000007','004','0007','2008-01-07',NULL),('000008','005','0008','2008-01-07',NULL),('000009','001','0011','2008-01-08',NULL),('000010','002','0009','2008-01-08',NULL),('000011','006','0010','2008-01-08',NULL);
/*!40000 ALTER TABLE `asignado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cargomantenimiento`
--

DROP TABLE IF EXISTS `cargomantenimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cargomantenimiento` (
  `chr_monecodigo` char(2) NOT NULL,
  `dec_cargMontoMaximo` decimal(12,2) NOT NULL,
  `dec_cargImporte` decimal(12,2) NOT NULL,
  PRIMARY KEY (`chr_monecodigo`),
  KEY `idx_cargomantenimiento01` (`chr_monecodigo`),
  CONSTRAINT `fk_cargomantenimiento_moneda` FOREIGN KEY (`chr_monecodigo`) REFERENCES `moneda` (`chr_monecodigo`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargomantenimiento`
--

LOCK TABLES `cargomantenimiento` WRITE;
/*!40000 ALTER TABLE `cargomantenimiento` DISABLE KEYS */;
INSERT INTO `cargomantenimiento` VALUES ('01',3500.00,7.00),('02',1200.00,2.50);
/*!40000 ALTER TABLE `cargomantenimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `chr_cliecodigo` char(5) NOT NULL,
  `vch_cliepaterno` varchar(25) NOT NULL,
  `vch_cliematerno` varchar(25) NOT NULL,
  `vch_clienombre` varchar(30) NOT NULL,
  `chr_cliedni` varchar(8) NOT NULL,
  `vch_clieciudad` varchar(30) NOT NULL,
  `vch_cliedireccion` varchar(50) NOT NULL,
  `vch_clietelefono` varchar(20) DEFAULT NULL,
  `vch_clieemail` varchar(50) NOT NULL,
  `vch_clipassword` varchar(300) NOT NULL DEFAULT 'None',
  `vch_disabled` int NOT NULL,
  PRIMARY KEY (`chr_cliecodigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES ('00001','CORONEL','CASTILLO','ERIC GUSTAVO','06914897','LIMA','LOS OLIVOS','996-664-457','gcoronelc@gmail.com','143866653d26b094b53b76d36a5ff15dbd85436bafbebb7fa4797043ce55d053',1),('00002','VALENCIA','MORALES','PEDRO HUGO','01576173','LIMA','MAGDALENA','924-7834','pvalencia@terra.com.pe','None',1),('00003','MARCELO','VILLALOBOS','RICARDO','10762367','LIMA','LINCE','993-62966','ricardomarcelo@hotmail.com','None',1),('00004','ROMERO','CASTILLO','CARLOS ALBERTO','06531983','LIMA','LOS OLIVOS','865-84762','c.romero@hotmail.com','None',1),('00005','ARANDA','LUNA','ALAN ALBERTO','10875611','LIMA','SAN ISIDRO','834-67125','a.aranda@hotmail.com','None',1),('00006','AYALA','PAZ','JORGE LUIS','10679245','LIMA','SAN BORJA','963-34769','j.ayala@yahoo.com','None',1),('00007','CHAVEZ','CANALES','EDGAR RAFAEL','10145693','LIMA','MIRAFLORES','999-96673','e.chavez@gmail.com','None',1),('00008','FLORES','CHAFLOQUE','ROSA LIZET','10773456','LIMA','LA MOLINA','966-87567','r.florez@hotmail.com','None',1),('00009','FLORES','CASTILLO','CRISTIAN RAFAEL','10346723','LIMA','LOS OLIVOS','978-43768','c.flores@hotmail.com','None',1),('00010','GONZALES','GARCIA','GABRIEL ALEJANDRO','10192376','LIMA','SAN MIGUEL','945-56782','g.gonzales@yahoo.es','None',1),('00011','LAY','VALLEJOS','JUAN CARLOS','10942287','LIMA','LINCE','956-12657','j.lay@peru.com','None',1),('00012','MONTALVO','SOTO','DEYSI LIDIA','10612376','LIMA','SURCO','965-67235','d.montalvo@hotmail.com','None',1),('00013','RICALDE','RAMIREZ','ROSARIO ESMERALDA','10761324','LIMA','MIRAFLORES','991-23546','r.ricalde@gmail.com','None',1),('00014','RODRIGUEZ','FLORES','ENRIQUE MANUEL','10773345','LIMA','LINCE','976-82838','e.rodriguez@gmail.com','None',1),('00015','ROJAS','OSCANOA','FELIX NINO','10238943','LIMA','LIMA','962-32158','f.rojas@yahoo.com','None',1),('00016','TEJADA','DEL AGUILA','TANIA LORENA','10446791','LIMA','PUEBLO LIBRE','966-23854','t.tejada@hotmail.com','None',1),('00017','VALDEVIESO','LEYVA','LIDIA ROXANA','10452682','LIMA','SURCO','956-78951','r.valdivieso@terra.com.pe','None',1),('00018','VALENTIN','COTRINA','JUAN DIEGO','10398247','LIMA','LA MOLINA','921-12456','j.valentin@terra.com.pe','None',1),('00019','YAURICASA','BAUTISTA','YESABETH','10934584','LIMA','MAGDALENA','977-75777','y.yauricasa@terra.com.pe','None',1),('00020','ZEGARRA','GARCIA','FERNANDO MOISES','10772365','LIMA','SAN ISIDRO','936-45876','f.zegarra@hotmail.com','None',1),('00021','Perez','Gomez','Juan','12345678','Quito','Av. Amazonias 123','0999999999','juan@example.com','ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f',1);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contador`
--

DROP TABLE IF EXISTS `contador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contador` (
  `vch_conttabla` varchar(30) NOT NULL,
  `int_contitem` int NOT NULL,
  `int_contlongitud` int NOT NULL,
  PRIMARY KEY (`vch_conttabla`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contador`
--

LOCK TABLES `contador` WRITE;
/*!40000 ALTER TABLE `contador` DISABLE KEYS */;
INSERT INTO `contador` VALUES ('Asignado',11,6),('Cliente',20,5),('Empleado',14,4),('Moneda',2,2),('Parametro',2,3),('Sucursal',7,3),('TipoMovimiento',10,3);
/*!40000 ALTER TABLE `contador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `costomovimiento`
--

DROP TABLE IF EXISTS `costomovimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `costomovimiento` (
  `chr_monecodigo` char(2) NOT NULL,
  `dec_costimporte` decimal(12,2) NOT NULL,
  PRIMARY KEY (`chr_monecodigo`),
  KEY `idx_costomovimiento` (`chr_monecodigo`),
  CONSTRAINT `fk_costomovimiento_moneda` FOREIGN KEY (`chr_monecodigo`) REFERENCES `moneda` (`chr_monecodigo`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `costomovimiento`
--

LOCK TABLES `costomovimiento` WRITE;
/*!40000 ALTER TABLE `costomovimiento` DISABLE KEYS */;
INSERT INTO `costomovimiento` VALUES ('01',2.00),('02',0.60);
/*!40000 ALTER TABLE `costomovimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuenta`
--

DROP TABLE IF EXISTS `cuenta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuenta` (
  `chr_cuencodigo` char(8) NOT NULL,
  `chr_monecodigo` char(2) NOT NULL,
  `chr_sucucodigo` char(3) NOT NULL,
  `chr_emplcreacuenta` char(4) NOT NULL,
  `chr_cliecodigo` char(5) NOT NULL,
  `dec_cuensaldo` decimal(12,2) NOT NULL,
  `dtt_cuenfechacreacion` date NOT NULL,
  `vch_cuenestado` varchar(15) NOT NULL DEFAULT 'ACTIVO',
  `int_cuencontmov` int NOT NULL,
  `chr_cuenclave` char(6) NOT NULL,
  PRIMARY KEY (`chr_cuencodigo`),
  KEY `idx_cuenta01` (`chr_cliecodigo`),
  KEY `idx_cuenta02` (`chr_emplcreacuenta`),
  KEY `idx_cuenta03` (`chr_sucucodigo`),
  KEY `idx_cuenta04` (`chr_monecodigo`),
  CONSTRAINT `fk_cuenta_cliente` FOREIGN KEY (`chr_cliecodigo`) REFERENCES `cliente` (`chr_cliecodigo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cuenta_moneda` FOREIGN KEY (`chr_monecodigo`) REFERENCES `moneda` (`chr_monecodigo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cuenta_sucursal` FOREIGN KEY (`chr_sucucodigo`) REFERENCES `sucursal` (`chr_sucucodigo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cuente_empleado` FOREIGN KEY (`chr_emplcreacuenta`) REFERENCES `empleado` (`chr_emplcodigo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `chk_cuenta_chr_cuenestado` CHECK ((`vch_cuenestado` in (_utf8mb3'ACTIVO',_utf8mb3'ANULADO',_utf8mb3'CANCELADO')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuenta`
--

LOCK TABLES `cuenta` WRITE;
/*!40000 ALTER TABLE `cuenta` DISABLE KEYS */;
INSERT INTO `cuenta` VALUES ('00100001','01','001','0004','00005',11560.99,'2008-01-06','ACTIVO',22,'123456'),('00100002','02','001','0004','00005',17432.20,'2008-01-08','ACTIVO',16,'123456'),('00200001','01','002','0001','00008',7000.00,'2008-01-05','ACTIVO',15,'123456'),('00200002','01','002','0001','00001',6800.00,'2008-01-09','ACTIVO',3,'123456'),('00200003','02','002','0001','00007',6000.00,'2008-01-11','ACTIVO',6,'123456'),('00300001','01','003','0002','00010',0.00,'2008-01-07','CANCELADO',3,'123456');
/*!40000 ALTER TABLE `cuenta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `chr_emplcodigo` char(4) NOT NULL,
  `vch_emplpaterno` varchar(25) NOT NULL,
  `vch_emplmaterno` varchar(25) NOT NULL,
  `vch_emplnombre` varchar(30) NOT NULL,
  `vch_emplciudad` varchar(30) NOT NULL,
  `vch_empldireccion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`chr_emplcodigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES ('0001','Romero','Castillo','Carlos Alberto','Trujillo','Call1 1 Nro. 456'),('0002','Castro','Vargas','Lidia','Lima','Federico Villarreal 456 - SMP'),('0003','Reyes','Ortiz','Claudia','Lima','Av. Aviación 3456 - San Borja'),('0004','Ramos','Garibay','Angelica','Chiclayo','Calle Barcelona 345'),('0005','Ruiz','Zabaleta','Claudia','Cusco','Calle Cruz Verde 364'),('0006','Cruz','Tarazona','Ricardo','Areguipa','Calle La Gruta 304'),('0007','Diaz','Flores','Edith','Lima','Av. Pardo 546'),('0008','Sarmiento','Bellido','Claudia Rocio','Areguipa','Calle Alfonso Ugarte 1567'),('0009','Pachas','Sifuentes','Luis Alberto','Trujillo','Francisco Pizarro 1263'),('0010','Tello','Alarcon','Hugo Valentin','Cusco','Los Angeles 865'),('0011','Carrasco','Vargas','Pedro Hugo','Chiclayo','Av. Balta 1265'),('0012','Mendoza','Jara','Monica Valeria','Lima','Calle Las Toronjas 450'),('0013','Espinoza','Melgar','Victor Eduardo','Huancayo','Av. San Martin 6734 Dpto. 508 '),('0014','Hidalgo','Sandoval','Milagros Leonor','Chiclayo','Av. Luis Gonzales 1230'),('9999','Internet','Internet','internet','Internet','internet');
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interesmensual`
--

DROP TABLE IF EXISTS `interesmensual`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `interesmensual` (
  `chr_monecodigo` char(2) NOT NULL,
  `dec_inteimporte` decimal(12,2) NOT NULL,
  PRIMARY KEY (`chr_monecodigo`),
  KEY `idx_interesmensual01` (`chr_monecodigo`),
  CONSTRAINT `fk_interesmensual_moneda` FOREIGN KEY (`chr_monecodigo`) REFERENCES `moneda` (`chr_monecodigo`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interesmensual`
--

LOCK TABLES `interesmensual` WRITE;
/*!40000 ALTER TABLE `interesmensual` DISABLE KEYS */;
INSERT INTO `interesmensual` VALUES ('01',0.70),('02',0.60);
/*!40000 ALTER TABLE `interesmensual` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logsession`
--

DROP TABLE IF EXISTS `logsession`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logsession` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `chr_emplcodigo` char(4) NOT NULL,
  `fec_ingreso` datetime NOT NULL,
  `fec_salida` datetime DEFAULT NULL,
  `ip` varchar(20) NOT NULL DEFAULT 'NONE',
  `hostname` varchar(100) NOT NULL DEFAULT 'NONE',
  PRIMARY KEY (`ID`),
  KEY `fk_log_session_empleado` (`chr_emplcodigo`),
  CONSTRAINT `fk_log_session_empleado` FOREIGN KEY (`chr_emplcodigo`) REFERENCES `empleado` (`chr_emplcodigo`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logsession`
--

LOCK TABLES `logsession` WRITE;
/*!40000 ALTER TABLE `logsession` DISABLE KEYS */;
/*!40000 ALTER TABLE `logsession` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modulo`
--

DROP TABLE IF EXISTS `modulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modulo` (
  `int_moducodigo` int NOT NULL,
  `vch_modunombre` varchar(50) DEFAULT NULL,
  `vch_moduestado` varchar(15) NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`int_moducodigo`),
  CONSTRAINT `modulo_chk_1` CHECK ((`vch_moduestado` in (_utf8mb3'ACTIVO',_utf8mb3'ANULADO',_utf8mb3'CANCELADO')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modulo`
--

LOCK TABLES `modulo` WRITE;
/*!40000 ALTER TABLE `modulo` DISABLE KEYS */;
INSERT INTO `modulo` VALUES (1,'Procesos','ACTIVO'),(2,'Tablas','ACTIVO'),(3,'Consultas','ACTIVO'),(4,'Reportes','ACTIVO'),(5,'Util','ACTIVO'),(6,'Seguridad','ACTIVO');
/*!40000 ALTER TABLE `modulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `moneda`
--

DROP TABLE IF EXISTS `moneda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `moneda` (
  `chr_monecodigo` char(2) NOT NULL,
  `vch_monedescripcion` varchar(20) NOT NULL,
  PRIMARY KEY (`chr_monecodigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moneda`
--

LOCK TABLES `moneda` WRITE;
/*!40000 ALTER TABLE `moneda` DISABLE KEYS */;
INSERT INTO `moneda` VALUES ('01','Soles'),('02','Dolares');
/*!40000 ALTER TABLE `moneda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimiento`
--

DROP TABLE IF EXISTS `movimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movimiento` (
  `chr_cuencodigo` char(8) NOT NULL,
  `int_movinumero` int NOT NULL,
  `dtt_movifecha` date NOT NULL,
  `chr_emplcodigo` char(4) NOT NULL,
  `chr_tipocodigo` char(3) NOT NULL,
  `dec_moviimporte` decimal(12,2) NOT NULL,
  `chr_cuenreferencia` char(8) DEFAULT NULL,
  PRIMARY KEY (`chr_cuencodigo`,`int_movinumero`),
  KEY `idx_movimiento01` (`chr_tipocodigo`),
  KEY `idx_movimiento02` (`chr_emplcodigo`),
  KEY `idx_movimiento03` (`chr_cuencodigo`),
  CONSTRAINT `fk_movimiento_cuenta` FOREIGN KEY (`chr_cuencodigo`) REFERENCES `cuenta` (`chr_cuencodigo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_movimiento_empleado` FOREIGN KEY (`chr_emplcodigo`) REFERENCES `empleado` (`chr_emplcodigo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_movimiento_tipomovimiento` FOREIGN KEY (`chr_tipocodigo`) REFERENCES `tipomovimiento` (`chr_tipocodigo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `chk_Movimiento_importe4` CHECK ((`dec_moviimporte` >= 0.0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimiento`
--

LOCK TABLES `movimiento` WRITE;
/*!40000 ALTER TABLE `movimiento` DISABLE KEYS */;
INSERT INTO `movimiento` VALUES ('00100001',1,'2008-01-06','0004','001',2800.00,NULL),('00100001',2,'2008-01-15','0004','003',3200.00,NULL),('00100001',3,'2008-01-20','0004','004',800.00,NULL),('00100001',4,'2008-02-14','0004','003',2000.00,NULL),('00100001',5,'2008-02-25','0004','004',500.00,NULL),('00100001',6,'2008-03-03','0004','004',800.00,NULL),('00100001',7,'2008-03-15','0004','003',1000.00,NULL),('00100001',8,'2024-12-03','0001','003',200.00,NULL),('00100001',9,'2024-12-07','0001','003',123.90,NULL),('00100001',10,'2024-12-07','0001','003',123.00,NULL),('00100001',11,'2024-12-07','0001','003',123.54,NULL),('00100001',12,'2024-12-07','0001','003',123.90,NULL),('00100001',13,'2024-12-07','0001','003',12.45,NULL),('00100001',14,'2024-12-07','0001','003',12.65,NULL),('00100001',15,'2024-12-07','0001','003',12.55,NULL),('00100001',16,'2024-12-09','0001','009',12.00,NULL),('00100001',17,'2024-12-09','0001','009',12.00,NULL),('00100001',18,'2024-12-09','0001','004',12.00,NULL),('00100001',19,'2024-12-09','0001','003',333.00,NULL),('00100001',20,'2024-12-09','0001','003',3332.00,NULL),('00100001',21,'2024-12-09','0001','008',150.00,NULL),('00100002',1,'2008-01-08','0004','001',1800.00,NULL),('00100002',2,'2008-01-25','0004','004',1000.00,NULL),('00100002',3,'2008-02-13','0004','003',2200.00,NULL),('00100002',4,'2008-03-08','0004','003',1500.00,NULL),('00100002',5,'2024-12-07','0001','003',45.85,NULL),('00100002',6,'2024-12-07','0001','003',150.00,NULL),('00100002',7,'2024-12-07','0001','003',55.66,NULL),('00100002',8,'2024-12-08','0001','003',123.70,NULL),('00100002',9,'2024-12-08','0001','003',199.99,NULL),('00100002',10,'2024-12-08','0001','003',12333.00,NULL),('00100002',11,'2024-12-08','0001','003',150.00,NULL),('00100002',12,'2024-12-08','0001','003',150.00,NULL),('00100002',13,'2024-12-09','0001','008',12.00,NULL),('00100002',14,'2024-12-09','0001','008',12.00,NULL),('00100002',15,'2024-12-09','0001','009',150.00,NULL),('00100002',16,'2024-12-09','0001','009',150.00,NULL),('00200001',1,'2008-01-05','0001','001',5000.00,NULL),('00200001',2,'2008-01-07','0001','003',4000.00,NULL),('00200001',3,'2008-01-09','0001','004',2000.00,NULL),('00200001',4,'2008-01-11','0001','003',1000.00,NULL),('00200001',5,'2008-01-13','0001','003',2000.00,NULL),('00200001',6,'2008-01-15','0001','004',4000.00,NULL),('00200001',7,'2008-01-19','0001','003',2000.00,NULL),('00200001',8,'2008-01-21','0001','004',3000.00,NULL),('00200001',9,'2008-01-23','0001','003',7000.00,NULL),('00200001',10,'2008-01-27','0001','004',1000.00,NULL),('00200001',11,'2008-01-30','0001','004',3000.00,NULL),('00200001',12,'2008-02-04','0001','003',2000.00,NULL),('00200001',13,'2008-02-08','0001','004',4000.00,NULL),('00200001',14,'2008-02-13','0001','003',2000.00,NULL),('00200001',15,'2008-02-19','0001','004',1000.00,NULL),('00200002',1,'2008-01-09','0001','001',3800.00,NULL),('00200002',2,'2008-01-20','0001','003',4200.00,NULL),('00200002',3,'2008-03-06','0001','004',1200.00,NULL),('00200003',1,'2008-01-11','0001','001',2500.00,NULL),('00200003',2,'2008-01-17','0001','003',1500.00,NULL),('00200003',3,'2008-01-20','0001','004',500.00,NULL),('00200003',4,'2008-02-09','0001','004',500.00,NULL),('00200003',5,'2008-02-25','0001','003',3500.00,NULL),('00200003',6,'2008-03-11','0001','004',500.00,NULL),('00300001',1,'2008-01-07','0002','001',5600.00,NULL),('00300001',2,'2008-01-18','0002','003',1400.00,NULL),('00300001',3,'2008-01-25','0002','002',7000.00,NULL);
/*!40000 ALTER TABLE `movimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parametro`
--

DROP TABLE IF EXISTS `parametro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parametro` (
  `chr_paracodigo` char(3) NOT NULL,
  `vch_paradescripcion` varchar(50) NOT NULL,
  `vch_paravalor` varchar(70) NOT NULL,
  `vch_paraestado` varchar(15) NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`chr_paracodigo`),
  CONSTRAINT `chk_parametro_vch_paraestado` CHECK ((`vch_paraestado` in (_utf8mb3'ACTIVO',_utf8mb3'ANULADO',_utf8mb3'CANCELADO')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parametro`
--

LOCK TABLES `parametro` WRITE;
/*!40000 ALTER TABLE `parametro` DISABLE KEYS */;
INSERT INTO `parametro` VALUES ('001','ITF - Impuesto a la Transacciones Financieras','0.08','ACTIVO'),('002','Número de Operaciones Sin Costo','15','ACTIVO');
/*!40000 ALTER TABLE `parametro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permiso`
--

DROP TABLE IF EXISTS `permiso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permiso` (
  `chr_emplcodigo` char(4) NOT NULL,
  `int_moducodigo` int NOT NULL,
  `vch_permestado` varchar(15) NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`chr_emplcodigo`,`int_moducodigo`),
  KEY `FK_Permiso_Modulo` (`int_moducodigo`),
  CONSTRAINT `permiso_ibfk_1` FOREIGN KEY (`int_moducodigo`) REFERENCES `modulo` (`int_moducodigo`),
  CONSTRAINT `permiso_ibfk_2` FOREIGN KEY (`chr_emplcodigo`) REFERENCES `usuario` (`chr_emplcodigo`),
  CONSTRAINT `permiso_chk_1` CHECK ((`vch_permestado` in (_utf8mb3'ACTIVO',_utf8mb3'ANULADO',_utf8mb3'CANCELADO')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permiso`
--

LOCK TABLES `permiso` WRITE;
/*!40000 ALTER TABLE `permiso` DISABLE KEYS */;
INSERT INTO `permiso` VALUES ('0001',1,'ACTIVO'),('0001',2,'ACTIVO'),('0001',3,'ACTIVO'),('0001',4,'ACTIVO'),('0001',5,'ACTIVO'),('0001',6,'ACTIVO'),('0002',1,'ACTIVO'),('0002',2,'ACTIVO'),('0002',3,'ACTIVO'),('0002',4,'ACTIVO'),('0002',5,'CANCELADO'),('0002',6,'CANCELADO'),('0003',1,'ACTIVO'),('0003',2,'CANCELADO'),('0003',3,'ACTIVO'),('0003',4,'ACTIVO'),('0003',5,'ACTIVO'),('0003',6,'CANCELADO'),('0004',1,'CANCELADO'),('0004',2,'ACTIVO'),('0004',3,'ACTIVO'),('0004',4,'CANCELADO'),('0004',5,'ACTIVO'),('0004',6,'CANCELADO'),('0005',1,'ACTIVO'),('0005',2,'CANCELADO'),('0005',3,'ACTIVO'),('0005',4,'ACTIVO'),('0005',5,'ACTIVO'),('0005',6,'CANCELADO'),('0006',1,'ACTIVO'),('0006',2,'ACTIVO'),('0006',3,'ACTIVO'),('0006',4,'ACTIVO'),('0006',5,'ACTIVO'),('0006',6,'ACTIVO'),('0007',1,'CANCELADO'),('0007',2,'ACTIVO'),('0007',3,'ACTIVO'),('0007',4,'CANCELADO'),('0007',5,'ACTIVO'),('0007',6,'CANCELADO');
/*!40000 ALTER TABLE `permiso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sucursal`
--

DROP TABLE IF EXISTS `sucursal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sucursal` (
  `chr_sucucodigo` char(3) NOT NULL,
  `vch_sucunombre` varchar(50) NOT NULL,
  `vch_sucuciudad` varchar(30) NOT NULL,
  `vch_sucudireccion` varchar(50) DEFAULT NULL,
  `int_sucucontcuenta` int NOT NULL,
  `vch_latitud` double DEFAULT '0',
  `vch_longitud` double DEFAULT '0',
  PRIMARY KEY (`chr_sucucodigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sucursal`
--

LOCK TABLES `sucursal` WRITE;
/*!40000 ALTER TABLE `sucursal` DISABLE KEYS */;
INSERT INTO `sucursal` VALUES ('001','Sipan','Chiclayo','Av. Balta 1456',2,1,2),('002','Chan Chan','Trujillo','Jr. Independencia 456',3,1,2),('003','Los Olivos','Lima','Av. Central 1234',0,1,2),('004','Pardo','Lima','Av. Pardo 345 - Miraflores',0,1,2),('005','Misti','Arequipa','Bolivar 546',0,1,2),('006','Machupicchu','Cusco','Calle El Sol 534',0,1,2),('007','Grau','Piura','Av. Grau 1528',0,1,2),('008','Sucursal Quito Centro','Quito','Av. Amazonas y Naciones Unidas',150,-0.1805,-78.469);
/*!40000 ALTER TABLE `sucursal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sucursal_empleado`
--

DROP TABLE IF EXISTS `sucursal_empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sucursal_empleado` (
  `chr_sucucodigo` char(3) NOT NULL,
  `chr_emplcodigo` char(4) NOT NULL,
  PRIMARY KEY (`chr_sucucodigo`,`chr_emplcodigo`),
  KEY `chr_emplcodigo` (`chr_emplcodigo`),
  CONSTRAINT `sucursal_empleado_ibfk_1` FOREIGN KEY (`chr_sucucodigo`) REFERENCES `sucursal` (`chr_sucucodigo`) ON DELETE CASCADE,
  CONSTRAINT `sucursal_empleado_ibfk_2` FOREIGN KEY (`chr_emplcodigo`) REFERENCES `empleado` (`chr_emplcodigo`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sucursal_empleado`
--

LOCK TABLES `sucursal_empleado` WRITE;
/*!40000 ALTER TABLE `sucursal_empleado` DISABLE KEYS */;
INSERT INTO `sucursal_empleado` VALUES ('001','0001');
/*!40000 ALTER TABLE `sucursal_empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipomovimiento`
--

DROP TABLE IF EXISTS `tipomovimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipomovimiento` (
  `chr_tipocodigo` char(3) NOT NULL,
  `vch_tipodescripcion` varchar(40) NOT NULL,
  `vch_tipoaccion` varchar(10) NOT NULL,
  `vch_tipoestado` varchar(15) NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`chr_tipocodigo`),
  CONSTRAINT `chk_tipomovimiento_vch_tipoaccion` CHECK ((`vch_tipoaccion` in (_utf8mb3'INGRESO',_utf8mb3'SALIDA'))),
  CONSTRAINT `chk_tipomovimiento_vch_tipoestado` CHECK ((`vch_tipoestado` in (_utf8mb3'ACTIVO',_utf8mb3'ANULADO',_utf8mb3'CANCELADO')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipomovimiento`
--

LOCK TABLES `tipomovimiento` WRITE;
/*!40000 ALTER TABLE `tipomovimiento` DISABLE KEYS */;
INSERT INTO `tipomovimiento` VALUES ('001','Apertura de Cuenta','INGRESO','ACTIVO'),('002','Cancelar Cuenta','SALIDA','ACTIVO'),('003','Deposito','INGRESO','ACTIVO'),('004','Retiro','SALIDA','ACTIVO'),('005','Interes','INGRESO','ACTIVO'),('006','Mantenimiento','SALIDA','ACTIVO'),('007','ITF','SALIDA','ACTIVO'),('008','Transferencia','INGRESO','ACTIVO'),('009','Transferencia','SALIDA','ACTIVO'),('010','Cargo por Movimiento','SALIDA','ACTIVO');
/*!40000 ALTER TABLE `tipomovimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `chr_emplcodigo` char(4) NOT NULL,
  `vch_emplusuario` varchar(20) NOT NULL,
  `vch_emplclave` varchar(300) NOT NULL,
  `vch_emplestado` varchar(15) DEFAULT 'ACTIVO',
  PRIMARY KEY (`chr_emplcodigo`),
  UNIQUE KEY `U_Usuario_vch_emplusuario` (`vch_emplusuario`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`chr_emplcodigo`) REFERENCES `empleado` (`chr_emplcodigo`),
  CONSTRAINT `usuario_chk_1` CHECK ((`vch_emplestado` in (_utf8mb4'ACTIVO',_utf8mb4'ANULADO',_utf8mb4'CANCELADO')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES ('0001','cromero','4c8b422307ac7bdf38c2c17bab533ead4fc28d6daec176b195ef8a25a20a53e2','ACTIVO'),('0002','lcastro','4c8b422307ac7bdf38c2c17bab533ead4fc28d6daec176b195ef8a25a20a53e2','ACTIVO'),('0003','creyes','4c8b422307ac7bdf38c2c17bab533ead4fc28d6daec176b195ef8a25a20a53e2','ANULADO'),('0004','aramos','4c8b422307ac7bdf38c2c17bab533ead4fc28d6daec176b195ef8a25a20a53e2','ACTIVO'),('0005','cvalencia','4c8b422307ac7bdf38c2c17bab533ead4fc28d6daec176b195ef8a25a20a53e2','ACTIVO'),('0006','rcruz','4c8b422307ac7bdf38c2c17bab533ead4fc28d6daec176b195ef8a25a20a53e2','ACTIVO'),('0007','ediaz','4c8b422307ac7bdf38c2c17bab533ead4fc28d6daec176b195ef8a25a20a53e2','ANULADO'),('0008','csarmiento','4c8b422307ac7bdf38c2c17bab533ead4fc28d6daec176b195ef8a25a20a53e2','ANULADO'),('0009','lpachas','4c8b422307ac7bdf38c2c17bab533ead4fc28d6daec176b195ef8a25a20a53e2','ACTIVO'),('0010','htello','4c8b422307ac7bdf38c2c17bab533ead4fc28d6daec176b195ef8a25a20a53e2','ACTIVO'),('0011','pcarrasco','4c8b422307ac7bdf38c2c17bab533ead4fc28d6daec176b195ef8a25a20a53e2','ACTIVO'),('9999','internet','4c8b422307ac7bdf38c2c17bab533ead4fc28d6daec176b195ef8a25a20a53e2','ACTIVO');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'eurekabank'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-11 15:15:48

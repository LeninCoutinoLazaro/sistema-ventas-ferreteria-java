-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: ferreteria
-- ------------------------------------------------------
-- Server version	8.0.43

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
-- Table structure for table `bitacora_operaciones`
--

DROP TABLE IF EXISTS `bitacora_operaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bitacora_operaciones` (
  `id_evento` int NOT NULL AUTO_INCREMENT,
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_usuario` int NOT NULL,
  `tabla_afectada` varchar(50) NOT NULL,
  `id_registro` int NOT NULL,
  `operacion` enum('ALTA','MODIFICACION','BAJA_LOGICA','CANCELACION') NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_evento`),
  KEY `fk_bitacora_usuario` (`id_usuario`),
  KEY `idx_bitacora_tabla` (`tabla_afectada`,`id_registro`),
  CONSTRAINT `fk_bitacora_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bitacora_operaciones`
--

LOCK TABLES `bitacora_operaciones` WRITE;
/*!40000 ALTER TABLE `bitacora_operaciones` DISABLE KEYS */;
INSERT INTO `bitacora_operaciones` VALUES (1,'2025-11-22 16:26:41',1,'Productos',1,'ALTA','Alta producto Martillo 16oz'),(2,'2025-11-22 16:26:41',1,'Productos',6,'ALTA','Alta producto Pintura vinílica blanca 4L'),(3,'2025-11-22 16:26:41',2,'Ventas',1,'ALTA','Venta mostrador público general'),(4,'2025-11-22 16:26:41',2,'Ventas',2,'ALTA','Venta a Constructora Alfa SA de CV'),(5,'2025-11-22 16:29:06',1,'Productos',1,'ALTA','Alta producto Martillo 16oz'),(6,'2025-11-22 16:29:06',1,'Productos',6,'ALTA','Alta producto Pintura vinílica blanca 4L'),(7,'2025-11-22 16:29:06',2,'Ventas',1,'ALTA','Venta mostrador público general'),(8,'2025-11-22 16:29:06',2,'Ventas',2,'ALTA','Venta a Constructora Alfa SA de CV'),(9,'2025-11-26 13:14:18',1,'Ventas',30,'ALTA','Venta registrada. Total: 260.0'),(10,'2025-11-26 14:59:31',1,'Ventas',31,'ALTA','Venta generada desde pedido 7. Total: 485.0'),(11,'2025-11-26 15:01:40',1,'Ventas',32,'ALTA','Venta registrada. Total: 5.0'),(12,'2025-11-26 15:54:57',1,'Ventas',33,'ALTA','Venta generada desde pedido 10. Subtotal: 20.00, IVA: 3.20, Total: 23.20'),(13,'2025-11-26 15:55:23',1,'Ventas',34,'ALTA','Venta registrada. Subtotal: 20.00, IVA: 3.20, Total: 23.20'),(14,'2025-11-26 17:33:24',1,'Ventas',35,'ALTA','Venta registrada. Subtotal: 25.00, IVA: 4.00, Total: 29.00'),(15,'2025-11-26 17:58:29',1,'Ventas',36,'ALTA','Venta generada desde pedido 11. Subtotal: 365.00, IVA: 58.40, Total: 423.40'),(16,'2025-11-29 14:21:54',1,'Ventas',37,'ALTA','Venta generada desde pedido 8. Subtotal: 25.00, IVA: 4.00, Total: 29.00'),(17,'2025-11-29 14:24:48',1,'Ventas',38,'ALTA','Venta registrada. Subtotal: 30.00, IVA: 4.80, Total: 34.80'),(18,'2025-12-03 12:40:42',1,'Ventas',39,'ALTA','Venta registrada. Subtotal: 270.00, IVA: 43.20, Total: 313.20'),(19,'2025-12-04 15:15:40',1,'Ventas',40,'ALTA','Venta generada desde pedido 14. Subtotal: 240.00, IVA: 38.40, Total: 278.40'),(20,'2025-12-09 15:58:17',1,'Ventas',41,'ALTA','Venta generada desde pedido 18. Subtotal: 15.00, IVA: 2.40, Total: 17.40'),(21,'2025-12-09 16:10:51',1,'Ventas',42,'ALTA','Venta registrada. Subtotal: 1200.00, IVA: 192.00, Total: 1392.00');
/*!40000 ALTER TABLE `bitacora_operaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(80) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Tornillería','Tornillos, tuercas, arandelas',1),(2,'Herramientas manuales','Martillos, llaves, desarmadores',1),(3,'Pinturas','Pinturas, barnices y solventes',1),(4,'Herramientas eléctricas','Taladros, esmeriles, sierras',1),(5,'Plomería','Tubos, conexiones, válvulas, accesorios',1);
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(120) NOT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `correo` varchar(120) DEFAULT NULL,
  `tipo_cliente` enum('PUBLICO_GENERAL','CONTRATISTA','MAYORISTA') DEFAULT 'PUBLICO_GENERAL',
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `fecha_creacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_baja` datetime DEFAULT NULL,
  `id_usuario_baja` int DEFAULT NULL,
  PRIMARY KEY (`id_cliente`),
  KEY `fk_clientes_baja` (`id_usuario_baja`),
  CONSTRAINT `fk_clientes_baja` FOREIGN KEY (`id_usuario_baja`) REFERENCES `usuarios` (`id_usuario`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Público general','N/A','0000000000','na@example.com','PUBLICO_GENERAL',1,'2025-11-19 15:03:33',NULL,NULL),(2,'Constructora Ejemplo SA de CV','Zona Centro #123','9611112233','contacto@constructora.com','MAYORISTA',1,'2025-11-19 15:03:33',NULL,NULL),(3,'Constructora Alfa SA de CV','Av. Central #123','9611112233','contacto@alfa.com','MAYORISTA',1,'2025-11-20 13:45:59',NULL,NULL),(4,'Ferromateriales El Amigo','Calle 5 de Mayo #45','9612223344','ventas@elamigo.com','CONTRATISTA',1,'2025-11-20 13:45:59',NULL,NULL),(5,'Mayatiza SA DE CV','decima sur entre cuarta y quinta poniente','9681064499','mayate@mampo.com','MAYORISTA',1,'2025-11-23 22:02:30',NULL,NULL);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compras`
--

DROP TABLE IF EXISTS `compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compras` (
  `id_compra` int NOT NULL AUTO_INCREMENT,
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_proveedor` int NOT NULL,
  `id_usuario` int NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `estado` enum('REGISTRADA','CANCELADA') NOT NULL DEFAULT 'REGISTRADA',
  `observaciones` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_compra`),
  KEY `fk_compras_usuario` (`id_usuario`),
  KEY `idx_compras_fecha` (`fecha`),
  KEY `idx_compras_proveedor` (`id_proveedor`),
  CONSTRAINT `fk_compras_proveedor` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id_proveedor`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_compras_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compras`
--

LOCK TABLES `compras` WRITE;
/*!40000 ALTER TABLE `compras` DISABLE KEYS */;
INSERT INTO `compras` VALUES (1,'2025-11-22 16:28:18',1,1,2000.00,'REGISTRADA','Compra inicial de tornillería'),(2,'2025-11-22 16:28:18',2,1,1500.00,'REGISTRADA','Compra inicial de pinturas');
/*!40000 ALTER TABLE `compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_compra`
--

DROP TABLE IF EXISTS `detalle_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_compra` (
  `id_detalle` int NOT NULL AUTO_INCREMENT,
  `id_compra` int NOT NULL,
  `id_producto` int NOT NULL,
  `cantidad` int NOT NULL,
  `costo_unitario` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_detalle`),
  KEY `idx_detalle_compra_compra` (`id_compra`),
  KEY `idx_detalle_compra_prod` (`id_producto`),
  CONSTRAINT `fk_detalle_compra_compra` FOREIGN KEY (`id_compra`) REFERENCES `compras` (`id_compra`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_detalle_compra_producto` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_compra`
--

LOCK TABLES `detalle_compra` WRITE;
/*!40000 ALTER TABLE `detalle_compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_pedido`
--

DROP TABLE IF EXISTS `detalle_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_pedido` (
  `id_detalle` int NOT NULL AUTO_INCREMENT,
  `id_pedido` int NOT NULL,
  `id_producto` int NOT NULL,
  `cantidad` int NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_detalle`),
  KEY `fk_det_pedido_pedido` (`id_pedido`),
  KEY `fk_det_pedido_producto` (`id_producto`),
  CONSTRAINT `fk_det_pedido_pedido` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_det_pedido_producto` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_pedido`
--

LOCK TABLES `detalle_pedido` WRITE;
/*!40000 ALTER TABLE `detalle_pedido` DISABLE KEYS */;
INSERT INTO `detalle_pedido` VALUES (1,1,1,1,120.00,120.00),(2,2,1,2,120.00,240.00),(3,2,3,1,260.00,260.00),(4,3,3,5,260.00,1300.00),(5,4,2,1,85.00,85.00),(6,5,1,1,120.00,120.00),(7,5,3,1,260.00,260.00),(8,6,3,2,260.00,520.00),(9,6,8,1,5.00,5.00),(10,6,1,1,120.00,120.00),(11,7,8,1,5.00,5.00),(12,7,1,4,120.00,480.00),(13,8,8,5,5.00,25.00),(14,9,8,3,5.00,15.00),(15,10,8,4,5.00,20.00),(16,11,1,3,120.00,360.00),(17,11,8,1,5.00,5.00),(18,12,8,2,5.00,10.00),(19,12,1,1,120.00,120.00),(20,13,2,2,85.00,170.00),(21,13,8,1,5.00,5.00),(22,14,1,2,120.00,240.00),(23,15,8,2,5.00,10.00),(24,16,1,1,120.00,120.00),(25,16,12,1,15.00,15.00),(26,17,1,1,120.00,120.00),(27,18,8,3,5.00,15.00);
/*!40000 ALTER TABLE `detalle_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_venta`
--

DROP TABLE IF EXISTS `detalle_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_venta` (
  `id_detalle` int NOT NULL AUTO_INCREMENT,
  `id_venta` int NOT NULL,
  `id_producto` int NOT NULL,
  `cantidad` int NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  `descuento` decimal(10,2) NOT NULL DEFAULT '0.00',
  `subtotal` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_detalle`),
  KEY `idx_detalle_venta_venta` (`id_venta`),
  KEY `idx_detalle_venta_prod` (`id_producto`),
  CONSTRAINT `fk_detalle_venta_producto` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_detalle_venta_venta` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id_venta`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_venta`
--

LOCK TABLES `detalle_venta` WRITE;
/*!40000 ALTER TABLE `detalle_venta` DISABLE KEYS */;
INSERT INTO `detalle_venta` VALUES (28,22,3,1,260.00,0.00,260.00),(29,23,3,1,260.00,0.00,260.00),(30,23,3,1,260.00,0.00,260.00),(31,23,3,1,260.00,0.00,260.00),(32,23,3,1,260.00,0.00,260.00),(33,23,3,1,260.00,0.00,260.00),(34,23,3,1,260.00,0.00,260.00),(35,24,3,5,260.00,0.00,1300.00),(36,25,2,1,85.00,0.00,85.00),(37,26,2,1,85.00,0.00,85.00),(38,27,8,1,5.00,0.00,5.00),(39,27,8,1,5.00,0.00,5.00),(40,28,1,1,120.00,0.00,120.00),(41,28,3,1,260.00,0.00,260.00),(42,29,8,1,5.00,0.00,5.00),(43,29,8,1,5.00,0.00,5.00),(44,29,8,1,5.00,0.00,5.00),(45,29,8,1,5.00,0.00,5.00),(46,29,8,1,5.00,0.00,5.00),(47,30,3,1,260.00,0.00,260.00),(48,31,8,1,5.00,0.00,5.00),(49,31,1,4,120.00,0.00,480.00),(50,32,8,1,5.00,0.00,5.00),(51,33,8,4,5.00,0.00,20.00),(52,34,8,1,5.00,0.00,5.00),(53,34,8,1,5.00,0.00,5.00),(54,34,8,1,5.00,0.00,5.00),(55,34,8,1,5.00,0.00,5.00),(56,35,8,1,5.00,0.00,5.00),(57,35,8,1,5.00,0.00,5.00),(58,35,8,1,5.00,0.00,5.00),(59,35,8,1,5.00,0.00,5.00),(60,35,8,1,5.00,0.00,5.00),(61,36,1,3,120.00,0.00,360.00),(62,36,8,1,5.00,0.00,5.00),(63,37,8,5,5.00,0.00,25.00),(64,38,8,1,5.00,0.00,5.00),(65,38,8,1,5.00,0.00,5.00),(66,38,8,1,5.00,0.00,5.00),(67,38,8,1,5.00,0.00,5.00),(68,38,8,1,5.00,0.00,5.00),(69,38,8,1,5.00,0.00,5.00),(70,39,3,1,260.00,0.00,260.00),(71,39,8,1,5.00,0.00,5.00),(72,39,8,1,5.00,0.00,5.00),(73,40,1,2,120.00,0.00,240.00),(74,41,8,3,5.00,0.00,15.00),(75,42,15,1,120.00,0.00,120.00),(76,42,15,1,120.00,0.00,120.00),(77,42,15,1,120.00,0.00,120.00),(78,42,15,1,120.00,0.00,120.00),(79,42,15,1,120.00,0.00,120.00),(80,42,15,1,120.00,0.00,120.00),(81,42,15,1,120.00,0.00,120.00),(82,42,15,1,120.00,0.00,120.00),(83,42,15,1,120.00,0.00,120.00),(84,42,15,1,120.00,0.00,120.00);
/*!40000 ALTER TABLE `detalle_venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimientos_inventario`
--

DROP TABLE IF EXISTS `movimientos_inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movimientos_inventario` (
  `id_movimiento` int NOT NULL AUTO_INCREMENT,
  `id_producto` int NOT NULL,
  `tipo` enum('VENTA','COMPRA','AJUSTE','DEVOLUCION') NOT NULL,
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cantidad` int NOT NULL,
  `stock_anterior` int NOT NULL,
  `stock_nuevo` int NOT NULL,
  `referencia` varchar(50) DEFAULT NULL,
  `id_usuario` int NOT NULL,
  PRIMARY KEY (`id_movimiento`),
  KEY `fk_movinv_usuario` (`id_usuario`),
  KEY `idx_movinv_producto` (`id_producto`),
  KEY `idx_movinv_fecha` (`fecha`),
  CONSTRAINT `fk_movinv_producto` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_movinv_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimientos_inventario`
--

LOCK TABLES `movimientos_inventario` WRITE;
/*!40000 ALTER TABLE `movimientos_inventario` DISABLE KEYS */;
INSERT INTO `movimientos_inventario` VALUES (9,3,'VENTA','2025-11-22 19:12:49',-1,20,19,'V22',1),(10,3,'VENTA','2025-11-22 19:13:33',-1,19,18,'V23',2),(11,3,'VENTA','2025-11-22 19:13:33',-1,18,17,'V23',2),(12,3,'VENTA','2025-11-22 19:13:33',-1,17,16,'V23',2),(13,3,'VENTA','2025-11-22 19:13:33',-1,16,15,'V23',2),(14,3,'VENTA','2025-11-22 19:13:33',-1,15,14,'V23',2),(15,3,'VENTA','2025-11-22 19:13:33',-1,14,13,'V23',2),(16,3,'VENTA','2025-11-23 19:12:06',-5,13,8,'P3->V24',1),(17,2,'VENTA','2025-11-23 19:15:36',-1,30,29,'P4->V25',1),(18,2,'VENTA','2025-11-23 19:16:16',-1,29,28,'V26',1),(19,8,'VENTA','2025-11-23 22:04:01',-1,200,199,'V27',1),(20,8,'VENTA','2025-11-23 22:04:01',-1,199,198,'V27',1),(21,1,'VENTA','2025-11-24 16:30:36',-1,50,49,'P5->V28',1),(22,3,'VENTA','2025-11-24 16:30:36',-1,8,7,'P5->V28',1),(23,8,'VENTA','2025-11-24 16:31:15',-1,198,197,'V29',1),(24,8,'VENTA','2025-11-24 16:31:15',-1,197,196,'V29',1),(25,8,'VENTA','2025-11-24 16:31:15',-1,196,195,'V29',1),(26,8,'VENTA','2025-11-24 16:31:15',-1,195,194,'V29',1),(27,8,'VENTA','2025-11-24 16:31:15',-1,194,193,'V29',1),(28,3,'VENTA','2025-11-26 13:14:18',-1,7,6,'V30',1),(29,8,'VENTA','2025-11-26 14:59:31',-1,193,192,'P7->V31',1),(30,1,'VENTA','2025-11-26 14:59:31',-4,49,45,'P7->V31',1),(31,8,'VENTA','2025-11-26 15:01:40',-1,192,191,'V32',1),(32,8,'VENTA','2025-11-26 15:54:57',-4,191,187,'P10->V33',1),(33,8,'VENTA','2025-11-26 15:55:22',-1,187,186,'V34',1),(34,8,'VENTA','2025-11-26 15:55:22',-1,186,185,'V34',1),(35,8,'VENTA','2025-11-26 15:55:22',-1,185,184,'V34',1),(36,8,'VENTA','2025-11-26 15:55:22',-1,184,183,'V34',1),(37,8,'VENTA','2025-11-26 17:33:24',-1,183,182,'V35',1),(38,8,'VENTA','2025-11-26 17:33:24',-1,182,181,'V35',1),(39,8,'VENTA','2025-11-26 17:33:24',-1,181,180,'V35',1),(40,8,'VENTA','2025-11-26 17:33:24',-1,180,179,'V35',1),(41,8,'VENTA','2025-11-26 17:33:24',-1,179,178,'V35',1),(42,1,'VENTA','2025-11-26 17:58:29',-3,45,42,'P11->V36',1),(43,8,'VENTA','2025-11-26 17:58:29',-1,178,177,'P11->V36',1),(44,8,'VENTA','2025-11-29 14:21:54',-5,177,172,'P8->V37',1),(45,8,'VENTA','2025-11-29 14:24:48',-1,172,171,'V38',1),(46,8,'VENTA','2025-11-29 14:24:48',-1,171,170,'V38',1),(47,8,'VENTA','2025-11-29 14:24:48',-1,170,169,'V38',1),(48,8,'VENTA','2025-11-29 14:24:48',-1,169,168,'V38',1),(49,8,'VENTA','2025-11-29 14:24:48',-1,168,167,'V38',1),(50,8,'VENTA','2025-11-29 14:24:48',-1,167,166,'V38',1),(51,3,'VENTA','2025-12-03 12:40:42',-1,6,5,'V39',1),(52,8,'VENTA','2025-12-03 12:40:42',-1,166,165,'V39',1),(53,8,'VENTA','2025-12-03 12:40:42',-1,165,164,'V39',1),(54,1,'VENTA','2025-12-04 15:15:40',-2,42,40,'P14->V40',1),(55,8,'VENTA','2025-12-09 15:58:17',-3,164,161,'P18->V41',1),(56,15,'VENTA','2025-12-09 16:10:51',-1,40,39,'V42',1),(57,15,'VENTA','2025-12-09 16:10:51',-1,39,38,'V42',1),(58,15,'VENTA','2025-12-09 16:10:51',-1,38,37,'V42',1),(59,15,'VENTA','2025-12-09 16:10:51',-1,37,36,'V42',1),(60,15,'VENTA','2025-12-09 16:10:51',-1,36,35,'V42',1),(61,15,'VENTA','2025-12-09 16:10:51',-1,35,34,'V42',1),(62,15,'VENTA','2025-12-09 16:10:51',-1,34,33,'V42',1),(63,15,'VENTA','2025-12-09 16:10:51',-1,33,32,'V42',1),(64,15,'VENTA','2025-12-09 16:10:51',-1,32,31,'V42',1),(65,15,'VENTA','2025-12-09 16:10:51',-1,31,30,'V42',1);
/*!40000 ALTER TABLE `movimientos_inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `id_pedido` int NOT NULL AUTO_INCREMENT,
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_cliente` int DEFAULT NULL,
  `nombre_cliente` varchar(150) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `estado` enum('PENDIENTE','ATENDIDO','CANCELADO') NOT NULL DEFAULT 'PENDIENTE',
  `observaciones` varchar(255) DEFAULT NULL,
  `id_usuario_creacion` int DEFAULT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `fk_pedidos_cliente` (`id_cliente`),
  KEY `fk_pedidos_usuario_crea` (`id_usuario_creacion`),
  CONSTRAINT `fk_pedidos_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_pedidos_usuario_crea` FOREIGN KEY (`id_usuario_creacion`) REFERENCES `usuarios` (`id_usuario`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (1,'2025-11-20 14:14:35',NULL,'Tribilin555',120.00,'CANCELADO','Pedido generado desde modo cliente',NULL),(2,'2025-11-20 14:43:22',NULL,'alan rosales',500.00,'CANCELADO','Pedido generado desde modo cliente',NULL),(3,'2025-11-22 16:33:17',NULL,'Andres Manuel Lopez Obrador',1300.00,'ATENDIDO','Pedido generado desde modo cliente',NULL),(4,'2025-11-22 18:11:15',NULL,'Benemerito',85.00,'ATENDIDO','Pedido generado desde modo cliente',NULL),(5,'2025-11-24 16:29:35',NULL,'Angel',380.00,'ATENDIDO','Pedido generado desde modo cliente',NULL),(6,'2025-11-26 13:33:31',NULL,'Jose jose',645.00,'PENDIENTE','Pedido generado desde modo cliente',NULL),(7,'2025-11-26 13:50:43',NULL,'Tontin',485.00,'ATENDIDO','Pedido generado desde modo cliente',NULL),(8,'2025-11-26 14:58:23',NULL,'tralalero',25.00,'ATENDIDO','Pedido generado desde modo cliente',NULL),(9,'2025-11-26 15:42:49',NULL,'mampo',15.00,'PENDIENTE','Pedido generado desde modo cliente',NULL),(10,'2025-11-26 15:54:39',NULL,'mayatiro',20.00,'ATENDIDO','Pedido generado desde modo cliente',NULL),(11,'2025-11-26 17:32:15',NULL,'ñoño',365.00,'ATENDIDO','Pedido generado desde modo cliente',NULL),(12,'2025-11-26 17:56:25',NULL,'añoña',130.00,'CANCELADO','Pedido generado desde modo cliente',NULL),(13,'2025-11-29 14:25:32',NULL,'sorete',175.00,'CANCELADO','Pedido generado desde modo cliente',NULL),(14,'2025-12-03 12:42:33',NULL,'Público general',240.00,'ATENDIDO','Pedido generado desde modo cliente',NULL),(15,'2025-12-04 15:18:08',NULL,'Nino',10.00,'PENDIENTE','Pedido generado desde modo cliente',NULL),(16,'2025-12-09 15:39:52',NULL,'parralito',135.00,'PENDIENTE','Pedido generado desde modo cliente',NULL),(17,'2025-12-09 15:40:21',NULL,'parral1',120.00,'PENDIENTE','Pedido generado desde modo cliente',NULL),(18,'2025-12-09 15:57:24',NULL,'cabron',15.00,'ATENDIDO','Pedido generado desde modo cliente',NULL);
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id_producto` int NOT NULL AUTO_INCREMENT,
  `codigo_barras` varchar(50) DEFAULT NULL,
  `nombre` varchar(120) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `id_categoria` int NOT NULL,
  `precio_compra` decimal(10,2) NOT NULL DEFAULT '0.00',
  `precio_venta` decimal(10,2) NOT NULL DEFAULT '0.00',
  `existencia_actual` int NOT NULL DEFAULT '0',
  `existencia_minima` int NOT NULL DEFAULT '0',
  `unidad_medida` varchar(20) DEFAULT 'pieza',
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_producto`),
  UNIQUE KEY `codigo_barras` (`codigo_barras`),
  KEY `idx_productos_nombre` (`nombre`),
  KEY `idx_productos_categoria` (`id_categoria`),
  KEY `idx_productos_activo` (`activo`),
  CONSTRAINT `fk_productos_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'750000000001','Martillo 16oz','Martillo de acero con mango de madera',2,80.00,120.00,40,5,'pieza',1),(2,'750000000002','Caja de clavos 2\"','Clavos para madera, caja de 1kg',1,50.00,85.00,28,5,'caja',1),(3,'750000000003','Pintura blanca 4L','Pintura vinílica blanca mate 4 litros',3,180.00,260.00,30,3,'bote',1),(8,NULL,'Tubo pbc','Tubo pbc',5,0.00,5.00,161,0,'pieza',1),(11,NULL,'Serrucho','',2,0.00,100.00,50,0,'pieza',1),(12,NULL,'Cutter','Herramienta para corte pequeña',2,0.00,15.00,200,0,'pieza',1),(13,NULL,'Pico','Herramienta para escarvar en la tierra',2,0.00,120.00,20,0,'pieza',1),(14,NULL,'cable inalambrico','',4,0.00,50.00,10,0,'pieza',1),(15,NULL,'papa aluminio','',5,0.00,120.00,30,0,'pieza',1);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `id_proveedor` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(120) NOT NULL,
  `contacto` varchar(120) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `correo` varchar(120) DEFAULT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `fecha_creacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_baja` datetime DEFAULT NULL,
  `id_usuario_baja` int DEFAULT NULL,
  PRIMARY KEY (`id_proveedor`),
  KEY `fk_proveedores_baja` (`id_usuario_baja`),
  CONSTRAINT `fk_proveedores_baja` FOREIGN KEY (`id_usuario_baja`) REFERENCES `usuarios` (`id_usuario`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'Proveedor Tornillos SA','Carlos Pérez','9612223344','ventas@tornillos.com',1,'2025-11-19 15:03:33',NULL,NULL),(2,'Pinturas del Sur','Ana López','9613334455','ventas@pinturassur.com',1,'2025-11-19 15:03:33',NULL,NULL),(3,'Tornillos del Sur SA','Carlos Pérez','9613334455','ventas@tornillosur.com',1,'2025-11-20 13:45:59',NULL,NULL),(4,'Pinturas Chiapas','Ana López','9614445566','ventas@pinturaschiapas.com',1,'2025-11-20 13:45:59',NULL,NULL),(5,'Herramientas MX','Luis Gómez','9615556677','ventas@herramx.com',1,'2025-11-20 13:45:59',NULL,NULL);
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `rol` enum('ADMIN','CAJERO','INVITADO') NOT NULL DEFAULT 'CAJERO',
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `fecha_creacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_baja` datetime DEFAULT NULL,
  `id_usuario_baja` int DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `usuario` (`usuario`),
  KEY `fk_usuarios_baja` (`id_usuario_baja`),
  CONSTRAINT `fk_usuarios_baja` FOREIGN KEY (`id_usuario_baja`) REFERENCES `usuarios` (`id_usuario`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Administrador General','admin','1234','ADMIN',1,'2025-11-19 15:01:38',NULL,NULL),(2,'Cerillito','Chamako Marrokin','4321','CAJERO',0,'2025-11-20 00:31:41','2025-11-30 21:22:26',NULL),(3,'Principal','principal','1234','CAJERO',1,'2025-11-20 13:45:59','2025-11-23 22:18:46',NULL),(4,'Usuario deseado','invitado1','9876','INVITADO',0,'2025-11-20 13:45:59','2025-11-30 21:22:22',NULL),(6,'Angel Francisco Silva Cortés','Angel','098765','CAJERO',1,'2025-11-30 21:22:09',NULL,NULL),(7,'José Manuel Cruz Martinez','Manuel','56789','CAJERO',1,'2025-11-30 21:24:12',NULL,NULL),(8,'Heber Gabriel Mancilla López','Heber','12345','CAJERO',1,'2025-11-30 21:24:48',NULL,NULL),(9,'Lenin Coutiño Lázaro','Lenin','3008','ADMIN',1,'2025-11-30 21:26:40',NULL,NULL);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `id_venta` int NOT NULL AUTO_INCREMENT,
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_cliente` int DEFAULT NULL,
  `id_usuario` int NOT NULL DEFAULT '1',
  `tipo_pago` enum('EFECTIVO','TARJETA','TRANSFERENCIA','OTRO') NOT NULL DEFAULT 'EFECTIVO',
  `total` decimal(10,2) NOT NULL,
  `descuento_total` decimal(10,2) NOT NULL DEFAULT '0.00',
  `estado` enum('COMPLETADA','CANCELADA') NOT NULL DEFAULT 'COMPLETADA',
  `observaciones` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_venta`),
  KEY `fk_ventas_usuario` (`id_usuario`),
  KEY `idx_ventas_fecha` (`fecha`),
  KEY `idx_ventas_cliente` (`id_cliente`),
  CONSTRAINT `fk_ventas_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_ventas_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (1,'2025-11-22 16:28:28',1,2,'EFECTIVO',260.00,0.00,'COMPLETADA','Venta mostrador'),(2,'2025-11-22 16:28:28',2,2,'TRANSFERENCIA',1500.00,100.00,'COMPLETADA','Material para obra'),(3,'2025-11-22 16:28:28',1,2,'TARJETA',300.00,0.00,'CANCELADA','Venta varias piezas'),(20,'2025-11-22 18:58:47',NULL,1,'EFECTIVO',100.00,0.00,'COMPLETADA','Prueba directa en MySQL'),(22,'2025-11-22 19:12:49',NULL,1,'EFECTIVO',260.00,0.00,'COMPLETADA','Venta registrada en módulo usuario'),(23,'2025-11-22 19:13:33',3,2,'EFECTIVO',1560.00,0.00,'COMPLETADA','Venta registrada en módulo usuario'),(24,'2025-11-23 19:12:06',NULL,1,'EFECTIVO',1300.00,0.00,'COMPLETADA','Venta generada desde pedido 3'),(25,'2025-11-23 19:15:36',NULL,1,'EFECTIVO',85.00,0.00,'COMPLETADA','Venta generada desde pedido 4'),(26,'2025-11-23 19:16:16',NULL,1,'EFECTIVO',85.00,0.00,'COMPLETADA','Venta registrada en módulo usuario'),(27,'2025-11-23 22:04:01',NULL,1,'EFECTIVO',10.00,0.00,'COMPLETADA','Venta registrada en módulo usuario'),(28,'2025-11-24 16:30:36',NULL,1,'EFECTIVO',380.00,0.00,'COMPLETADA','Venta generada desde pedido 5'),(29,'2025-11-24 16:31:15',NULL,1,'EFECTIVO',25.00,0.00,'COMPLETADA','Venta registrada en módulo usuario'),(30,'2025-11-26 13:14:18',NULL,1,'EFECTIVO',260.00,0.00,'COMPLETADA','Venta registrada en módulo usuario'),(31,'2025-11-26 14:59:31',NULL,1,'EFECTIVO',485.00,0.00,'COMPLETADA','Venta generada desde pedido 7'),(32,'2025-11-26 15:01:40',NULL,1,'EFECTIVO',5.00,0.00,'COMPLETADA','Venta registrada en módulo usuario'),(33,'2025-11-26 15:54:57',NULL,1,'EFECTIVO',23.20,0.00,'COMPLETADA','Venta generada desde pedido 10. Subtotal: 20.00, IVA: 3.20, Total: 23.20'),(34,'2025-11-26 15:55:22',NULL,1,'EFECTIVO',23.20,0.00,'COMPLETADA','Venta registrada en módulo usuario'),(35,'2025-11-26 17:33:24',NULL,1,'EFECTIVO',29.00,0.00,'COMPLETADA','Venta registrada en módulo usuario'),(36,'2025-11-26 17:58:29',NULL,1,'EFECTIVO',423.40,0.00,'COMPLETADA','Venta generada desde pedido 11. Subtotal: 365.00, IVA: 58.40, Total: 423.40'),(37,'2025-11-29 14:21:54',NULL,1,'EFECTIVO',29.00,0.00,'COMPLETADA','Venta generada desde pedido 8. Subtotal: 25.00, IVA: 4.00, Total: 29.00'),(38,'2025-11-29 14:24:48',NULL,1,'EFECTIVO',34.80,0.00,'COMPLETADA','Venta registrada en módulo usuario'),(39,'2025-12-03 12:40:42',NULL,1,'TRANSFERENCIA',313.20,0.00,'COMPLETADA','Venta registrada en módulo usuario'),(40,'2025-12-04 15:15:40',NULL,1,'EFECTIVO',278.40,0.00,'COMPLETADA','Venta generada desde pedido 14. Subtotal: 240.00, IVA: 38.40, Total: 278.40'),(41,'2025-12-09 15:58:16',NULL,1,'EFECTIVO',17.40,0.00,'COMPLETADA','Venta generada desde pedido 18. Subtotal: 15.00, IVA: 2.40, Total: 17.40'),(42,'2025-12-09 16:10:51',NULL,1,'TARJETA',1392.00,0.00,'COMPLETADA','Venta registrada en módulo usuario');
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-07 23:48:36

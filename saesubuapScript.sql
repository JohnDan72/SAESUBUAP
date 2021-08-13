-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.1.34-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win32
-- HeidiSQL Versión:             9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para saesubuap
DROP DATABASE IF EXISTS `saesubuap`;
CREATE DATABASE IF NOT EXISTS `saesubuap` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `saesubuap`;

-- Volcando estructura para tabla saesubuap.acceso
DROP TABLE IF EXISTS `acceso`;
CREATE TABLE IF NOT EXISTS `acceso` (
  `Id_Acceso` int(11) NOT NULL,
  `Nombre_A` varchar(50) NOT NULL,
  `Ubicacion` varchar(50) NOT NULL,
  `Tipo_A` int(2) DEFAULT NULL,
  `Clave` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`Id_Acceso`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla saesubuap.acceso: ~4 rows (aproximadamente)
DELETE FROM `acceso`;
/*!40000 ALTER TABLE `acceso` DISABLE KEYS */;
INSERT INTO `acceso` (`Id_Acceso`, `Nombre_A`, `Ubicacion`, `Tipo_A`, `Clave`) VALUES
	(10001, 'Acceso A', 'San Claudio', 1, 'Ž¼Â}~EÖùŸ{dµÉ'),
	(10002, 'Acceso B', 'San Claudio', 1, ' \'…àÆ9˜Ìõªºþªöh'),
	(201503728, 'Admin2', '', 2, 'ÓW×Ò¯Åf8#c®8LX1'),
	(201504691, 'Admin1', '', 2, 'ÓW×Ò¯Åf8#c®8LX1');
/*!40000 ALTER TABLE `acceso` ENABLE KEYS */;

-- Volcando estructura para tabla saesubuap.alumno
DROP TABLE IF EXISTS `alumno`;
CREATE TABLE IF NOT EXISTS `alumno` (
  `Id_A` int(11) DEFAULT NULL,
  `Carrera` varchar(300) DEFAULT NULL,
  `Facultad` varchar(200) DEFAULT NULL,
  KEY `Id_A` (`Id_A`),
  CONSTRAINT `alumno_ibfk_1` FOREIGN KEY (`Id_A`) REFERENCES `persona` (`Id_Persona`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla saesubuap.alumno: ~26 rows (aproximadamente)
DELETE FROM `alumno`;
/*!40000 ALTER TABLE `alumno` DISABLE KEYS */;
INSERT INTO `alumno` (`Id_A`, `Carrera`, `Facultad`) VALUES
	(201304006, 'Diseño Grafico', 'Arquitectura'),
	(201536247, 'Diseño Grafico', 'Arquitectura'),
	(201536518, 'Diseño Grafico', 'Arquitectura'),
	(201536598, 'Diseño Grafico', 'Arquitectura'),
	(201441304, 'Matemáticas', 'Fisicomatematicas'),
	(201110493, 'Matemáticas', 'Fisicomatematicas'),
	(201504691, 'Ingenieria en Computacion', 'Computacion'),
	(201540034, 'Arquitectura', 'Arquitectura'),
	(201521328, 'Arquitectura', 'Arquitectura'),
	(201431764, 'Arquitectura', 'Arquitectura'),
	(201230403, 'Ingenieria en Computacion', 'Computacion'),
	(201518098, 'Ingenieria en Computacion', 'Computacion'),
	(201507326, 'Ingenieria en Computacion', 'Computacion'),
	(201559691, 'Matemáticas', 'Fisicomatematicas'),
	(201514450, 'Matemáticas', 'Fisicomatematicas'),
	(201433242, 'Matemáticas', 'Fisicomatematicas'),
	(201544569, 'Matemáticas', 'Fisicomatematicas'),
	(201512921, 'Fisica Aplicada', 'Fisicomatematicas'),
	(201502524, 'Fisica Aplicada', 'Fisicomatematicas'),
	(201447402, 'Fisica Aplicada', 'Fisicomatematicas'),
	(201522701, 'Fisica Aplicada', 'Fisicomatematicas'),
	(201426788, 'Fisica Aplicada', 'Fisicomatematicas'),
	(201230403, 'Ingenieria en Computacion', 'Computacion'),
	(201561414, 'Ingenieria en Computacion', 'Computacion'),
	(201549508, 'Ingenieria Industrial', 'Ingenierias'),
	(201523578, 'Ingenieria Industrial', 'Ingenierias');
/*!40000 ALTER TABLE `alumno` ENABLE KEYS */;

-- Volcando estructura para tabla saesubuap.bici
DROP TABLE IF EXISTS `bici`;
CREATE TABLE IF NOT EXISTS `bici` (
  `Id_Bici` int(11) NOT NULL,
  `Color` varchar(30) DEFAULT NULL,
  `Marca` varchar(25) DEFAULT NULL,
  `Rodada` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`Id_Bici`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla saesubuap.bici: ~4 rows (aproximadamente)
DELETE FROM `bici`;
/*!40000 ALTER TABLE `bici` DISABLE KEYS */;
INSERT INTO `bici` (`Id_Bici`, `Color`, `Marca`, `Rodada`) VALUES
	(0, 'Auxiliar', '', ''),
	(1001, 'Azul', 'Marca 1', '28'),
	(1002, 'Rojo', 'Marca 2', '30'),
	(1003, 'Amarillo', 'Marca 1', '32'),
	(1004, 'Gris', 'Marca 3', '33');
/*!40000 ALTER TABLE `bici` ENABLE KEYS */;

-- Volcando estructura para tabla saesubuap.docente
DROP TABLE IF EXISTS `docente`;
CREATE TABLE IF NOT EXISTS `docente` (
  `Id_D` int(11) DEFAULT NULL,
  `Grado_Estudios` varchar(300) DEFAULT NULL,
  `Facultad` varchar(200) DEFAULT NULL,
  KEY `Id_D` (`Id_D`),
  CONSTRAINT `docente_ibfk_1` FOREIGN KEY (`Id_D`) REFERENCES `persona` (`Id_Persona`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla saesubuap.docente: ~2 rows (aproximadamente)
DELETE FROM `docente`;
/*!40000 ALTER TABLE `docente` DISABLE KEYS */;
INSERT INTO `docente` (`Id_D`, `Grado_Estudios`, `Facultad`) VALUES
	(100041000, 'Doctorado', 'Ciencias de la Computacion'),
	(100041001, 'Maestría', 'Arquitectura');
/*!40000 ALTER TABLE `docente` ENABLE KEYS */;

-- Volcando estructura para tabla saesubuap.historial
DROP TABLE IF EXISTS `historial`;
CREATE TABLE IF NOT EXISTS `historial` (
  `Id_H` int(11) NOT NULL AUTO_INCREMENT,
  `Id_Persona` int(11) DEFAULT NULL,
  `Id_Acceso` int(11) DEFAULT NULL,
  `Id_Bici` int(11) DEFAULT NULL,
  `Accion` char(1) DEFAULT NULL,
  `Fecha_Hora` datetime DEFAULT NULL,
  PRIMARY KEY (`Id_H`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla saesubuap.historial: ~8 rows (aproximadamente)
DELETE FROM `historial`;
/*!40000 ALTER TABLE `historial` DISABLE KEYS */;
INSERT INTO `historial` (`Id_H`, `Id_Persona`, `Id_Acceso`, `Id_Bici`, `Accion`, `Fecha_Hora`) VALUES
	(1, 201504691, 10001, 0, 'E', '2020-02-17 19:35:53'),
	(2, 201503728, 10001, 0, 'E', '2020-02-17 19:36:45'),
	(3, 201504691, 10001, 0, 'S', '2020-02-17 19:37:19'),
	(4, 201504691, 10001, 1001, 'E', '2020-02-17 19:54:16'),
	(5, 201504691, 10001, 1001, 'S', '2020-02-17 19:54:59'),
	(6, 201504691, 10001, 0, 'E', '2020-02-17 20:52:56'),
	(7, 201504691, 10001, 0, 'S', '2020-02-17 20:53:04'),
	(8, 201503728, 10001, 0, 'S', '2020-02-17 21:50:12'),
	(9, 201503728, 10001, 0, 'E', '2020-02-17 21:52:33'),
	(10, 201503728, 10001, 0, 'S', '2020-02-17 21:52:45'),
	(11, 201504691, 201504691, 0, 'E', '2020-05-26 13:23:04'),
	(12, 201504691, 201504691, 0, 'S', '2020-05-26 13:23:11'),
	(13, 201441304, 201504691, 0, 'E', '2021-08-12 23:57:43'),
	(14, 201441304, 201504691, 0, 'S', '2021-08-12 23:57:49');
/*!40000 ALTER TABLE `historial` ENABLE KEYS */;

-- Volcando estructura para tabla saesubuap.persona
DROP TABLE IF EXISTS `persona`;
CREATE TABLE IF NOT EXISTS `persona` (
  `Id_Persona` int(11) NOT NULL,
  `Nombre` varchar(70) NOT NULL,
  `Ap_Paterno` varchar(70) NOT NULL,
  `Ap_Materno` varchar(70) NOT NULL,
  `Correo` varchar(100) DEFAULT NULL,
  `Telefono` varchar(11) DEFAULT NULL,
  `Tipo_P` int(2) DEFAULT NULL,
  `Dentro` bit(1) DEFAULT NULL,
  PRIMARY KEY (`Id_Persona`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla saesubuap.persona: ~26 rows (aproximadamente)
DELETE FROM `persona`;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` (`Id_Persona`, `Nombre`, `Ap_Paterno`, `Ap_Materno`, `Correo`, `Telefono`, `Tipo_P`, `Dentro`) VALUES
	(100041000, 'Cecilio', 'Perez', 'Cortes', 'asd@gmail.com', '2221212121', 2, b'0'),
	(100041001, 'Gema', 'Garcia', 'Marquez', 'asd@gmail.com', '2221212121', 2, b'0'),
	(201110493, 'Erliss J.', 'Espejel', 'Calzada', 'asd@gmail.com', '2221212121', 1, b'0'),
	(201230403, 'Jose L.', 'Sanchez', 'Zeferino', 'asd@gmail.com', '2221212121', 1, b'0'),
	(201304006, 'Esteban', 'Castro', 'Pola', 'asd@gmail.com', '2221212121', 1, b'0'),
	(201426788, 'Edgar Y.', 'Ruiz', 'Quechol', 'asd@gmail.com', '2221212121', 1, b'0'),
	(201431764, 'Irving O.', 'Hernandez', 'Palma', 'asd@gmail.com', '2221212121', 1, b'0'),
	(201433242, 'Jose A.', 'Morales', 'Tlalolin', 'asd@gmail.com', '2221212121', 1, b'0'),
	(201441304, 'Christopher A.', 'De la Cruz', 'Ortiz', 'asd@gmail.com', '2221212121', 1, b'0'),
	(201447402, 'Noe', 'Puebla', 'Cruz', 'asd@gmail.com', '2221212121', 1, b'0'),
	(201502524, 'Wesley', 'Perez', 'Daniel', 'asd@gmail.com', '2221212121', 1, b'0'),
	(201503728, 'Luis', 'Hernandez', 'Pintor', 'asd@gmail.com', '2221212121', 1, b'0'),
	(201504691, 'Juan Daniel', 'Garcia', 'Lopez', 'asd@gmail.com', '2221212121', 1, b'0'),
	(201507326, 'Elisa', 'Lopez', 'Gamas', 'asd@gmail.com', '2221212121', 1, b'0'),
	(201512921, 'Guillermo', 'Paredes', 'Barrientos', 'asd@gmail.com', '2221212121', 1, b'0'),
	(201514450, 'Celso', 'Martinez', 'Gonzalez', 'asd@gmail.com', '2221212121', 1, b'0'),
	(201518098, 'Marisol', 'Lopez', 'Cortes', 'asd@gmail.com', '2221212121', 1, b'0'),
	(201521328, 'Diana L.', 'Hernandez', 'Mendoza', 'asd@gmail.com', '2221212121', 1, b'0'),
	(201522701, 'Andrea', 'Rojas', 'Hernandez', 'asd@gmail.com', '2221212121', 1, b'0'),
	(201523578, 'Israel', 'Zago', 'Martinez', 'asd@gmail.com', '2221212121', 1, b'0'),
	(201536247, 'Diego', 'Chagolla', 'Aparicio', 'asd@gmail.com', '2221212121', 1, b'0'),
	(201536518, 'Yair', 'Cortes', 'Vasquez', 'asd@gmail.com', '2221212121', 1, b'0'),
	(201536598, 'Cinthia', 'Cruz', 'Delgado', 'asd@gmail.com', '2221212121', 1, b'0'),
	(201540034, 'Israel', 'Guzman', 'Vasquez', 'asd@gmail.com', '2221212121', 1, b'0'),
	(201544569, 'Guadalupe', 'Ojeda', 'Posadas', 'asd@gmail.com', '2221212121', 1, b'0'),
	(201549508, 'Estefani D.', 'Valerdi', 'Islas', 'asd@gmail.com', '2221212121', 1, b'0'),
	(201559691, 'Miguel', 'Martinez', 'Garcia', 'asd@gmail.com', '2221212121', 1, b'0'),
	(201561414, 'Carlos V.', 'Serrano', 'Benitez', 'asd@gmail.com', '2221212121', 1, b'0');
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;

-- Volcando estructura para vista saesubuap.usuario
DROP VIEW IF EXISTS `usuario`;
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `usuario` (
	`Matricula` INT(11) NOT NULL,
	`Nombre` VARCHAR(300) NULL COLLATE 'latin1_swedish_ci',
	`Ap_Paterno` VARCHAR(300) NULL COLLATE 'latin1_swedish_ci',
	`Ap_Materno` VARCHAR(300) NULL COLLATE 'latin1_swedish_ci',
	`Correo` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`Facultad` VARCHAR(300) NULL COLLATE 'latin1_swedish_ci',
	`Dentro` BIT(1) NULL
) ENGINE=MyISAM;

-- Volcando estructura para vista saesubuap.usuario
DROP VIEW IF EXISTS `usuario`;
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `usuario`;
;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

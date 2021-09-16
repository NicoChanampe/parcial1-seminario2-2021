USE `parcialunodb`;

DROP TABLE IF EXISTS `curso`;

CREATE TABLE `curso` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `imagen` varchar(500) DEFAULT NULL,
  `precio` double DEFAULT NULL,
  `cant_horas` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_by` varchar(30) DEFAULT NULL,
  `updated_by` varchar(30) DEFAULT NULL,
  `deleted_by` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3;

LOCK TABLES `curso` WRITE;

INSERT INTO `curso` VALUES (1,'Social Media Marketing','Este curso de Social Media Marketing...','http://localhost:8080/img/smm.jpg',15500,160,'2021-08-17 06:00:00','2021-08-17 06:00:00',NULL,'etorrielli','etorrielli',NULL),(2,'Data Science','Este curso de Data Science...','http://localhost:8080/img/ds.jpg',25600,320,'2021-08-17 06:00:00','2021-08-17 06:00:00',NULL,'etorrielli','etorrielli',NULL);

UNLOCK TABLES;

DROP TABLE IF EXISTS `tipo_persona`;

CREATE TABLE `tipo_persona` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_by` varchar(30) DEFAULT NULL,
  `updated_by` varchar(30) DEFAULT NULL,
  `deleted_by` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3;

LOCK TABLES `tipo_persona` WRITE;

INSERT INTO `tipo_persona` VALUES (1,'ALUMNO',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'PROFESOR',NULL,NULL,NULL,NULL,NULL,NULL,NULL);

UNLOCK TABLES;

DROP TABLE IF EXISTS `persona`;

CREATE TABLE `persona` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(250) DEFAULT NULL,
  `dni` varchar(10) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `celular` varchar(30) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `tipopersonaid` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_by` varchar(30) DEFAULT NULL,
  `updated_by` varchar(30) DEFAULT NULL,
  `deleted_by` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ix_email` (`email`),
  UNIQUE KEY `ix_dni` (`dni`),
  KEY `Tipopersona_FK` (`tipopersonaid`),
  CONSTRAINT `Tipopersona_FK` FOREIGN KEY (`tipopersonaid`) REFERENCES `tipo_persona` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9;

LOCK TABLES `persona` WRITE;

INSERT INTO `persona` VALUES (1,'Emanuel Ginobili','20111222','2020-01-01',NULL,'manu@mail.com',NULL,1,NULL,NULL,'2021-09-01 07:45:05',NULL,NULL,'anonimo'),(2,'Luis Scola','20222555',NULL,NULL,'luis@mail.com',NULL,1,NULL,NULL,'2021-09-02 11:14:33',NULL,NULL,'anonimo'),(3,'Facundo Campazo','20222666',NULL,NULL,'facu@mail.com',NULL,1,'2021-09-10 16:09:47','2021-09-10 16:09:47',NULL,'anonimo','anonimo',NULL),(4,'Leandro Bolmaro','88777666','2020-05-16','3512333222','leandro@mail.com','Barcelona',1,'2021-09-01 07:10:59',NULL,NULL,'anonimo',NULL,NULL),(5,'Andrés Chapu Nocioni','22777666','1980-05-23',NULL,'andres@mail.com','Argentina',1,'2021-09-01 07:13:36','2021-09-01 07:44:11',NULL,'anonimo','anonimo',NULL),(6,'Carlos Delfino','44555888',NULL,NULL,'carlos@mail.com',NULL,2,NULL,NULL,NULL,NULL,NULL,NULL),(8,'Lebron Juan James','44555999',NULL,NULL,'lebron@mail.com','EEUU',1,'2021-09-02 11:01:34','2021-09-02 11:10:38',NULL,'anonimo','anonimo',NULL);

UNLOCK TABLES;

DROP TABLE IF EXISTS `persona_curso`;

CREATE TABLE `persona_curso` (
  `id` int NOT NULL AUTO_INCREMENT,
  `personaid` int(11) NOT NULL,
  `cursoid` int(11) NOT NULL,
  `observacion` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_by` varchar(30) DEFAULT NULL,
  `updated_by` varchar(30) DEFAULT NULL,
  `deleted_by` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Persona_FK` (`personaid`),
  KEY `Curso_FK` (`cursoid`),
  CONSTRAINT `Curso_FK` FOREIGN KEY (`cursoid`) REFERENCES `curso` (`id`),
  CONSTRAINT `Persona_FK` FOREIGN KEY (`personaid`) REFERENCES `persona` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5;

LOCK TABLES `persona_curso` WRITE;

INSERT INTO `persona_curso` VALUES (1,1,1,NULL,'2021-08-17 06:00:00','2021-08-17 06:00:00',NULL,'etorrielli','etorrielli',NULL),(2,2,1,NULL,'2021-08-17 06:00:00','2021-08-17 06:00:00',NULL,'etorrielli','etorrielli',NULL),(3,3,1,'Asignacion de prueba',NULL,NULL,NULL,NULL,NULL,NULL),(4,4,2,'Compra online','2021-09-10 16:11:33','2021-09-10 16:11:33',NULL,'anonimo','anonimo',NULL);

UNLOCK TABLES;



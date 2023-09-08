-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 06, 2023 at 04:26 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `agenda_rhelen`
--

-- --------------------------------------------------------

--
-- Table structure for table `agenda`
--

CREATE TABLE `agenda` (
  `id` int(11) NOT NULL,
  `fecha_reg` varchar(50) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `cedula` varchar(15) NOT NULL,
  `edad` int(2) NOT NULL,
  `genero` varchar(30) NOT NULL,
  `estado` varchar(50) NOT NULL,
  `ciudad` varchar(50) NOT NULL,
  `telefono` varchar(30) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `instagram` varchar(50) NOT NULL,
  `evento` varchar(50) NOT NULL,
  `equipo` varchar(50) NOT NULL,
  `categoria` varchar(50) NOT NULL,
  `estacion` varchar(50) NOT NULL,
  `fecha_cita` date NOT NULL,
  `hora_cita` time NOT NULL,
  `concluida` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `agenda`
--

INSERT INTO `agenda` (`id`, `fecha_reg`, `nombre`, `cedula`, `edad`, `genero`, `estado`, `ciudad`, `telefono`, `correo`, `instagram`, `evento`, `equipo`, `categoria`, `estacion`, `fecha_cita`, `hora_cita`, `concluida`) VALUES
(8, '7/28/2023, 10:45:41 AM', 'Oswaldo José Talavera vilela', '27680647', 2, 'Masculino', '', '', '04126594536', 'oswaldot993@gmail.com', 'Oswaldofit_ve', '', 'Barroso RUNNERS ', 'Equipos novatos', 'Canaima', '2023-07-28', '11:00:00', 1),
(9, '7/28/2023, 10:46:28 AM', 'Ivanna Da Silva ', '27391319', 23, 'Femenino', '', '', '04242804574', 'Ivannitadasilva@gmail.com', 'Ivanna_dasilva', '', 'SHIROV', 'Equipos novatos', 'Canaima', '2023-07-28', '11:30:00', 1),
(10, '7/28/2023, 1:37:55 PM', 'Pedro Benitez', '19807337', 33, 'Masculino', '', '', '04248172760', 'pjbenitez13@gmail.com', 'pjbenitez13', '', 'Monster Inc', 'Equipos novatos', 'Sierra Nevada', '2023-07-28', '16:30:00', 1),
(11, '7/28/2023, 1:38:01 PM', 'Janet Torre', '25038033', 29, 'Femenino', '', '', '04129616601', 'Torre.janet@gmail.com', 'Torrejanet', '', 'Monster INC', 'Equipos novatos', 'Yurubi', '2023-07-28', '16:30:00', 1),
(12, '7/28/2023, 1:38:30 PM', 'Ana Sierraalta ', 'V18977146', 34, 'Femenino', '', '', '04141467388', 'Anamia.sr@gmail.com', 'Anamia.sr', '', 'Monster inc', 'Equipos novatos', 'Cienagas del catatumbo', '2023-07-28', '16:30:00', 1),
(13, '7/28/2023, 3:02:14 PM', 'undefined', 'V16273353', 39, 'Masculino', '', '', '04151384622', 'wjbello@gmail.com', 'Wilbello', '', 'Toxinetas ', 'Equipos escalados', 'Canaima', '2023-07-28', '15:00:00', 1),
(14, '7/28/2023, 3:02:56 PM', 'Jorwis Montilla ', '27249230', 24, 'Masculino', '', '', 'undefined', 'Jorwism@gmail.com ', 'Jorwism', '', 'Rebel palace', 'Equipos escalados', 'Cienagas del catatumbo', '2023-07-28', '15:30:00', 1),
(15, '7/28/2023, 3:05:05 PM', 'Fernando maza', '20336984', 31, 'Masculino', '', '', '04243267839', 'Fernandomaza147@gmail.com', '_fernando147', '', 'Team CL2 trainning', 'Equipos escalados', 'Los Roques', '2023-07-29', '13:00:00', 1),
(16, '7/28/2023, 3:05:09 PM', 'Andres vidal ', '29750777', 21, 'Masculino', '', '', 'undefined', 'andresvidalcubillan11@gmail.com', 'andresvidalcubillan11@gmail.com', '', 'Rebel palace', 'Equipos escalados', 'Canaima', '2023-07-28', '15:30:00', 1),
(17, '7/28/2023, 3:08:10 PM', 'juan belandria', '25808108', 27, 'Masculino', '', '', '4143715115', 'juanchib10@gmail.com', 'juanchib10', '', 'The boys', 'Duplas HH avanzados', 'Canaima', '2023-07-28', '18:00:00', 1),
(18, '7/28/2023, 3:09:25 PM', 'Carlos corzo', 'V15865562', 41, 'Masculino', '', '', '04149799599', 'Ingeniería.medicor@gmail.com ', 'Carloscorzo82', '', 'Road to rx', 'Duplas HM supermaster', 'Los Roques', '2023-07-28', '18:00:00', 1),
(19, '7/28/2023, 3:09:59 PM', 'Juan Vargas ', 'V18698786', 34, 'Masculino', '', '', '0424-1386463 ', 'Juanf.vargasp@gmail.com ', 'Asilovepalomo', '', 'Speck pork', 'Duplas HH avanzados', 'Canaima', '2023-07-28', '16:00:00', 1),
(20, '7/28/2023, 3:25:16 PM', 'Daniel Mijares', 'V26489501', 25, 'Masculino', '', '', '04126367139', 'Danielmijaresc@gmail.com', 'Daniel_mi17', '', 'Speck Pork', 'Duplas HH avanzados', 'Wuaraira_Repano', '2023-07-28', '16:00:00', 1),
(21, '7/28/2023, 3:26:12 PM', 'Krisbelis Solórzano ', '19143991', 34, 'Femenino', '', '', '04148238181', 'Krisbelis_s@hotmail.com', 'Krissolorzano', '', 'Arv team', 'Equipos avanzados', 'Canaima', '2023-07-28', '18:30:00', 1),
(22, '7/28/2023, 3:38:15 PM', 'Mauricio Quintero', '30053601', 20, 'Masculino', '', '', '04244225928', 'Mauricioaqdl@gmail.com ', 'Mauricioaqdl ', '', 'Black Clover ', 'Equipos escalados', 'Canaima', '2023-07-28', '17:30:00', 1),
(23, '7/28/2023, 4:31:20 PM', 'Descanso Jornada', 'V17930210', 34, 'Masculino', '', '', '0412-6050059', 'inteligenciacomercial@intervit.net', 'Descanso', '', 'Descanso', 'Equipos novatos', 'Canaima', '2023-07-28', '19:00:00', 1),
(24, '7/28/2023, 4:31:21 PM', 'Paula Andrea Vielma Ricote ', '30307183', 19, 'Femenino', '', '', 'undefined', 'pavielmaricote@gmail.com', 'Pau.andrev', '', 'Blue dragon ', 'Equipos novatos', 'Canaima', '2023-07-29', '15:30:00', 1),
(25, '7/28/2023, 4:34:08 PM', 'Descanso Jornada', '24074149', 29, 'Femenino', '', '', '04143378980', 'inteligenciacomercial@intervit.net', '@trotamundos', '', 'Descanso', 'Equipos novatos', 'Canaima', '2023-07-28', '19:30:00', 1),
(26, '7/28/2023, 4:36:14 PM', 'Descanso Jornada', '24074149', 24, 'Femenino', '', '', '04143378980', 'inteligenciacomercial@intervit.net', '@trotamundos', '', 'Trotamundos', 'Equipos novatos', 'Cueva del Guacharo', '2023-07-29', '12:00:00', 1),
(27, '7/28/2023, 4:48:07 PM', 'Marzully Pineda ', '26064301', 29, 'Femenino', '', '', '04241881891', 'Pat_y_184@hotmail.com ', 'Marzully_18@hotmail.com', '', 'Indominus ', 'Equipos novatos', 'Los Roques', '2023-07-28', '17:00:00', 1),
(28, '7/28/2023, 4:58:45 PM', 'Pedro Benitez', '19807337', 33, 'Masculino', '', '', '04248172760', 'pjbenitez13@gmail.com', 'pjbenitez13', '', 'Monster Inc', 'Equipos novatos', 'Yurubi', '2023-07-29', '17:00:00', 1),
(29, '7/28/2023, 4:59:23 PM', 'Ana Sierraalta', 'V18977146', 34, 'Femenino', '', '', 'undefined', 'Anamia.sr@gmail.com', 'Anamia.sr', '', 'Monster inc', 'Equipos novatos', 'Mochima', '2023-07-29', '17:00:00', 1),
(30, '7/28/2023, 5:03:19 PM', 'Diego', '13944579', 44, 'Masculino', '', '', '04140282758', 'grandslam12.dl@gmail.com', 'diego_dominguez_degout', '', 'Vikings Masters ', 'Equipos supermaster', 'Yurubi', '2023-07-29', '12:30:00', 1),
(31, '7/28/2023, 5:08:11 PM', 'Sahia Perez', '25309825', 26, 'Femenino', '', '', '04246531049', 'sahiaperez@gmail.com', 'sahiaperez@gmail.com', '', 'Rocket', 'Equipos novatos', 'Henri Pittier', '2023-07-29', '10:00:00', 1),
(32, '7/28/2023, 5:20:02 PM', 'Carlos Trujillo ', 'V15160511', 43, 'Masculino', '', '', 'undefined', 'auditorct@hotmail.com', 'Carltruj', '', 'Indominus', 'Equipos novatos', 'Cienagas del catatumbo', '2023-07-29', '11:30:00', 1),
(33, '7/28/2023, 5:21:28 PM', 'Marzully pineda', '26064302', 29, 'Femenino', '', '', '04241881891', 'Marzully_18@hoymail.com ', 'Marzully20', '', 'Indominus', 'Equipos novatos', 'Cueva del Guacharo', '2023-07-29', '10:30:00', 1),
(34, '7/28/2023, 5:23:47 PM', 'Nicole Allueva', 'V21616118', 31, 'Femenino', '', '', 'undefined', 'allueva.nicole@gmail.com', 'Nicoallueva', '', 'Jake Mate', 'Equipos novatos', 'Los Roques', '2023-07-29', '11:30:00', 1),
(35, '7/28/2023, 5:29:01 PM', 'Carla D’Onofrio ', '27246202', 23, 'Femenino', '', '', '04122653362', 'Carlangelina1@hotmail.com', 'Carlaangelina', '', 'Shirov', 'Equipos novatos', 'Sierra Nevada', '2023-07-29', '14:30:00', 0),
(36, '7/28/2023, 5:35:22 PM', 'Jesus Angulo', 'V26371413', 25, 'Masculino', '', '', '04247449607', 'Jaap.jch@gmail.com', 'Jesusangulop', '', 'APE-HYDRA', 'Duplas HH escalados', 'Sierra Nevada', '2023-07-29', '10:30:00', 1),
(37, '7/28/2023, 5:42:09 PM', 'Karla Contreras', 'V29797273', 20, 'Femenino', '', '', '04242949581', 'karlaccontrerasg@gmail.com', 'karlaccg_', '', 'Team Legends', 'Equipos novatos', 'Los Roques', '2023-07-29', '17:00:00', 0),
(38, '7/28/2023, 5:49:14 PM', 'Constanza marambio ', 'v26063699', 27, 'Femenino', '', '', '04241483022', 'Constimarambio@gmail.com', 'Constimarambio', '', 'Looney tunes', 'Equipos novatos', 'Cienagas del catatumbo', '2023-07-29', '19:30:00', 0),
(39, '7/28/2023, 6:00:41 PM', 'Yoxiris Espitia ', '25552625', 26, 'Femenino', '', '', '04249016648', 'yoxiespitia1@gmail.com ', 'yoxiespitiag ', '', 'Specktrust ', 'Equipos novatos', 'Santos Luzardo', '2023-07-29', '15:00:00', 0),
(40, '7/28/2023, 6:13:15 PM', 'Oriana', 'V19885284', 32, 'Femenino', '', '', '04125561224', 'Orianabsanchez@gmail.com', 'Orianabsanchez', '', 'Suicide squad', 'Equipos novatos', 'Wuaraira_Repano', '2023-07-28', '18:30:00', 1),
(41, '7/28/2023, 6:14:23 PM', 'Jose Leon', 'V23854720', 28, 'Masculino', '', '', '04122388981', 'Leonrosalesjr@gmail.com', 'Joserleonr', '', 'Ludus', 'Equipos escalados', 'Henri Pittier', '2023-07-28', '18:30:00', 1),
(42, '7/28/2023, 6:16:06 PM', 'Valentina', '28428866', 22, 'Femenino', '', '', '04246372321', 'Valentinaloaizasthormes@gmail.com', 'Valentinaloaiza31', '', 'team ludus', 'Equipos escalados', 'Henri Pittier', '2023-07-28', '18:00:00', 1),
(43, '7/28/2023, 6:17:11 PM', 'makys', '16298103', 38, 'undefined', '', '', '04146328650', 'makys21112', '21md21', '', 'maracaibo', 'Equipos supermaster', 'Los Roques', '2023-07-28', '18:30:00', 1),
(44, '7/28/2023, 6:17:51 PM', 'Javier Vega', 'V18964941', 34, 'Masculino', '', '', '04147405478', 'Javiale1589@gmail.com ', 'Javiervega_ades', '', 'Vega effect by Ades', 'Equipos escalados', 'Cienagas del catatumbo', '2023-07-29', '10:00:00', 1),
(45, '7/28/2023, 6:18:43 PM', 'Carlos corzo', 'V15865562', 41, 'Masculino', '', '', '04149799599', 'Ingeniería.medicor@gmail.com ', 'Carloscorzo82', '', 'Road to rx', 'Duplas HM supermaster', 'Los Roques', '2023-07-29', '16:00:00', 0),
(46, '7/28/2023, 7:44:52 PM', 'Leo mendez', 'V19348266', 34, 'Masculino', '', '', '04144710364', 'Leomg23@gmail.com', 'Leomg23', '', 'Siee carar', 'Equipos escalados', 'Cienagas del catatumbo', '2023-07-29', '10:30:00', 1),
(47, '7/28/2023, 7:46:40 PM', 'Daniel Moreno ', '23137761', 29, 'Masculino', '', '', '04147130476', 'dnl.mrev@gmail.com', 'undefined', '', 'Be happy', 'Duplas HH avanzados', 'Cueva del Guacharo', '2023-07-29', '15:00:00', 1),
(48, '7/28/2023, 10:57:19 PM', 'Sidney Duran', '23944158', 27, 'Femenino', '', '', '04122992045', 'Sidney_0102@hotmail.com', 'Sidneyduran', '', 'Las toxinetas', 'Equipos escalados', 'Los Roques', '2023-07-29', '11:00:00', 1),
(49, '7/28/2023, 11:08:20 PM', 'Wilfredo Bello ', 'V16273353', 39, 'Masculino', '', '', '04141384622', 'wjbello@gmail.com', 'Wilbello ', '', 'Toxinetas ', 'Equipos escalados', 'Los Roques', '2023-07-29', '10:30:00', 1),
(50, '7/28/2023, 11:11:22 PM', 'Wilfredo Bello ', 'V16273353', 39, 'Masculino', '', '', '04141384622', 'wjbello@gmail.com', 'Willbello', '', 'Toxinetas ', 'Equipos escalados', 'Mochima', '2023-07-29', '11:00:00', 1),
(51, '7/28/2023, 11:15:00 PM', 'Aida', '26478456', 25, 'Femenino', '', '', '4143806634', 'aida.glub@gmail.com', '@idaguez', '', 'Las Toxinetas', 'Equipos escalados', 'Canaima', '2023-07-29', '11:00:00', 1),
(52, '7/29/2023, 6:19:28 AM', 'Daniel Prado', '19505196', 33, 'Masculino', '', '', '04122932531', 'danielprado90@gmail.com', '@danielplasticsurgery', '', 'Las Toxinetas', 'Equipos escalados', 'Cienagas del catatumbo', '2023-07-29', '11:00:00', 1),
(53, '7/29/2023, 8:24:08 AM', 'Carolina Zapata', '18578300', 34, 'Femenino', '', '', '04149051289', 'zapatacarolina807@gmail.com', 'zapatacaro', '', 'Team Legends', 'Equipos novatos', 'Los Roques', '2023-07-29', '17:30:00', 0),
(54, '7/29/2023, 8:25:15 AM', 'Erick Maurice', '17424363', 37, 'Masculino', '', '', '04129884844', 'erickmaurice88@gmail.com', 'erick_maurice', '', 'team legends', 'Equipos novatos', 'Henri Pittier', '2023-07-29', '17:30:00', 0),
(55, '7/29/2023, 8:28:13 AM', 'Franco Santiago', '26281097', 26, 'Masculino', '', '', '04123391193', 'franco.karladrokar@gmail.com', 'francosantiago97', '', 'team legends', 'Equipos novatos', 'Canaima', '2023-07-29', '17:00:00', 0),
(56, '7/29/2023, 9:46:12 AM', 'katheryne rojas ', '28.396.218', 22, 'Femenino', '', '', '04248931988', 'katherynerojas08@gmail.com', 'katherynerojas', '', 'eagles ', 'Trios mixtos', 'Los Roques', '2023-07-29', '10:00:00', 1),
(57, '7/29/2023, 9:47:13 AM', 'Francisco ', '26751874', 28, 'Masculino', '', '', '04121800622', 'vidalsalas@hotmail.es', '@fransalas0905', '', 'Eagle', 'Trios mixtos', 'Sierra Nevada', '2023-07-29', '10:00:00', 1),
(58, '7/29/2023, 9:47:19 AM', 'Oriana Barrera ', 'V19885284', 31, 'Femenino', '', '', '04125561224', 'Orianabsanchez@gmail.com', 'Oribsanchez', '', 'Suicide squad', 'Equipos novatos', 'Los Roques', '2023-07-29', '10:00:00', 1),
(59, '7/29/2023, 9:49:32 AM', 'Oswaldo José Talavera vilela', '27680647', 22, 'Masculino', '', '', '04126594536', 'oswaldot993@gmail.com', 'Oswaldofit_ve', '', 'Barroso RUNNERS ', 'Equipos novatos', 'Canaima', '2023-07-29', '09:30:00', 1),
(60, '7/29/2023, 9:50:04 AM', 'Daniel Martinez ', '31996237', 16, 'Masculino', '', '', '04146757782', 'dmmaury01@gmail.com', 'Dmmaury01 ', '', 'Equipo Rocket ', 'Equipos novatos', 'Canaima', '2023-07-29', '10:30:00', 1),
(61, '7/29/2023, 9:50:35 AM', 'Eliana Barrios', '20774154', 31, 'Femenino', '', '', '04248175357', 'Elianabarrios18@hotmail.com', 'Elianacbarrios ', '', 'Umbeaten ', 'Equipos avanzados', 'Canaima', '2023-07-29', '10:00:00', 1),
(62, '7/29/2023, 9:51:30 AM', 'Elyed caldera ', '31902706', 17, 'undefined', '', '', '04146973111', 'Elyedcaldera17@gmail.com', 'Calderaely_17', '', 'Barroso RUNNERS ', 'Equipos novatos', 'Henri Pittier', '2023-07-29', '10:30:00', 1),
(63, '7/29/2023, 9:54:19 AM', 'Victor Marval', 'V14188075', 44, 'Masculino', '', '', '04140144512', 'vmarval@hotmail.com', 'vmarval', '', 'Inverteam', 'Equipos novatos', 'Santos Luzardo', '2023-07-29', '10:30:00', 1),
(64, '7/29/2023, 10:03:16 AM', 'Erika borzellino', '30.529.402 ', 20, 'Femenino', '', '', '04262511632', 'Erikavalenborzellino@gmail.com', '@erikaborzellino', '', 'IN2U', 'Equipos avanzados', 'Yurubi', '2023-07-29', '10:00:00', 1),
(65, '7/29/2023, 10:15:51 AM', 'Ángel David Ossa', 'V28478792', 21, 'Masculino', '', '', '04166550101', 'angelxgaymer19@gmail.com', 'angelossa19', '', '¿Cuánto falta?', 'Equipos novatos', 'Wuaraira_Repano', '2023-07-29', '10:30:00', 1),
(66, '7/29/2023, 10:16:26 AM', 'Janisse muñoz ', 'V32442487', 15, 'Femenino', '', '', '04265542745', 'janissemunoz751@gmail.com', 'janissemunoz_', '', '¿Cuanto falta?', 'Equipos novatos', 'Wuaraira_Repano', '2023-07-29', '10:30:00', 1),
(67, '7/29/2023, 10:22:49 AM', 'Luis acosta ', 'V25209271', 28, 'Masculino', '', '', '04126139684', 'Luisdavid1411@gmail.com', 'Luisdavid11', '', 'Suicide squap', 'Equipos novatos', 'Yurubi', '2023-07-29', '00:00:00', 1),
(68, '7/29/2023, 10:23:11 AM', 'Nieves Martín ', 'V32252392', 17, 'Femenino', '', '', '04148842425', 'martin.nieves234@gmail.com', 'nievesmartinn', '', '4 Doritos después ', 'Equipos novatos', 'Mochima', '2023-07-29', '10:30:00', 1),
(69, '7/29/2023, 10:23:56 AM', 'Laurent Rivero ', '24774230', 28, 'Femenino', '', '', '04242106807', 'Laurcc16@gmail.com', 'Laurentrivero', '', 'Suicide squad', 'Equipos novatos', 'Santos Luzardo', '2023-07-29', '11:00:00', 1),
(70, '7/29/2023, 10:24:21 AM', 'Rosmellys', '24227207', 27, 'Femenino', '', '', '04248757120', 'Rosmellyslibra@gmail.com', 'Rosroyett', '', '4 doritos despues', 'Equipos novatos', 'Mochima', '2023-07-29', '10:30:00', 1),
(71, '7/29/2023, 10:25:26 AM', 'Hughson Reyes ', 'V16021267', 40, 'Masculino', '', '', '04166136401', 'hughsonmax07@gmail.com', 'undefined', '', 'Guatire STRONG ', 'Equipos novatos', 'Sierra Nevada', '2023-07-29', '11:30:00', 1),
(72, '7/29/2023, 10:25:48 AM', 'Richard Olivares ', '29984160', 20, 'Masculino', '', '', '0412-0664814', 'olivares.rjoc05@gmail.com', '@Richard_millie05', '', 'X force', 'Duplas HH escalados', 'Yurubi', '2023-07-29', '10:30:00', 1),
(73, '7/29/2023, 10:26:17 AM', 'Luis acosta', 'V25209271', 28, 'Masculino', '', '', '04126139684', 'Luisdavid1411@gmail.Com', 'Luisdavid11 ', '', 'Suicide squad', 'Equipos novatos', 'Yurubi', '2023-07-29', '11:00:00', 1),
(74, '7/29/2023, 10:28:16 AM', 'Luis acosta', 'V25209271', 28, 'Masculino', '', '', '04126139684', 'Luisdavid1411@gmail.com', 'Luisdavid11', '', 'Suicide squad', 'Equipos novatos', 'Sierra Nevada', '2023-07-29', '11:00:00', 1),
(75, '7/29/2023, 10:28:33 AM', 'Antonio ', '28059900', 23, 'Masculino', '', '', '04126502760', 'angelicarosales340@hotmail.com', 'Antoniojosesantiagovasquez790 ', '', 'Barroso Runners ', 'Equipos novatos', 'Mochima', '2023-07-29', '11:30:00', 1),
(76, '7/29/2023, 10:29:02 AM', 'Jose misel', '21389627', 30, 'Masculino', '', '', '04149844638', 'Jmisel69@gmail.com ', 'Jmisel', '', 'Generación fire', 'Equipos novatos', 'Santos Luzardo', '2023-07-29', '11:30:00', 1),
(77, '7/29/2023, 10:29:19 AM', 'Eliana Barrios ', '20774154', 31, 'Femenino', '', '', '04248175357', 'elianabarrios18@hotmail.com ', 'elianacbarrios', '', 'Umbeaten ', 'Equipos avanzados', 'Los Roques', '2023-07-29', '12:00:00', 1),
(78, '7/29/2023, 10:30:40 AM', 'Daniela castillo', '32746325', 15, 'Femenino', '', '', '04166809862', 'Daniv161107@gmail.com', 'Dani.castillo16_', '', 'Generación fire', 'Equipos novatos', 'Santos Luzardo', '2023-07-29', '12:00:00', 1),
(79, '7/29/2023, 10:30:44 AM', 'Ana centeno', '15416912', 42, 'Femenino', '', '', 'undefined', 'a_centeno@hotmail.com', '@a_centeno', '', 'Doble P plcbox', 'Duplas HM supermaster', 'Mochima', '2023-07-29', '12:00:00', 1),
(80, '7/29/2023, 10:32:32 AM', 'julio solis', '14190929', 43, 'Masculino', '', '', '04248778002', 'undefined', 'juliocesar_solis@hotmail.com ', '', 'los Doble p', 'Duplas HM supermaster', 'Sierra Nevada', '2023-07-29', '12:00:00', 1),
(81, '7/29/2023, 10:34:00 AM', 'Arianna castillo', '33798172', 13, 'Femenino', '', '', '04120450934', 'Aribel1406@gmail.com', 'ari.castillov_', '', 'Generación killer', 'Equipos novatos', 'Santos Luzardo', '2023-07-29', '12:30:00', 1),
(82, '7/29/2023, 10:34:52 AM', 'Katherin Flores ', '30776118', 18, 'Femenino', '', '', 'undefined', 'katecff18@gmail.com ', 'Katecff18 ', '', 'América ', 'Equipos novatos', 'Wuaraira_Repano', '2023-07-29', '15:00:00', 1),
(83, '7/29/2023, 10:35:41 AM', 'Jorge pildain', '19876728', 32, 'Masculino', '', '', '04120450955', 'Daniv161107@gmail.com', 'Dani.castillo16_', '', 'Generación killer', 'Equipos novatos', 'Santos Luzardo', '2023-07-29', '13:00:00', 1),
(84, '7/29/2023, 10:36:21 AM', 'Leonardo Marcanl', '21176643', 29, 'Masculino', '', '', 'undefined', 'katecff18@gmail.com ', 'Katecff18 ', '', 'América ', 'Equipos novatos', 'Yurubi', '2023-07-29', '15:00:00', 1),
(85, '7/29/2023, 10:37:19 AM', 'Jennyffer', 'V24527251', 28, 'Femenino', '', '', '04143977829', 'Jennyffernarvaez94@gmail.com ', 'Jennyffernn', '', 'RoadtoRX', 'Equipos novatos', 'Canaima', '2023-07-29', '11:30:00', 1),
(86, '7/29/2023, 10:39:56 AM', 'Pedro Ortega ', 'v14685459', 43, 'Masculino', '', '', '04127954606', 'peterorte@gmail.com', 'pedro0ortega', '', 'doble P pandora', 'Duplas HM supermaster', 'Sierra Nevada', '2023-07-29', '09:30:00', 1),
(87, '7/29/2023, 10:41:35 AM', 'Raphael Contreras', '30573387', 18, 'Masculino', '', '', '04121296779', 'Raphaelcontreras1911@gmail.com', 'Raphaelcontreras_', '', 'Rocket', 'Equipos novatos', 'Henri Pittier', '2023-07-29', '11:00:00', 1),
(88, '7/29/2023, 10:42:37 AM', 'Pedro Ortega ', 'v14685459', 43, 'Masculino', '', '', 'undefined', 'peterorte@gmail.com', '@pedro0ortega', '', 'doble P pandora', 'Duplas HM supermaster', 'Cueva del Guacharo', '2023-07-29', '11:00:00', 1),
(89, '7/29/2023, 10:50:22 AM', 'Marianny loaiza', '21235137', 29, 'Femenino', '', '', '04128893862', 'Mariannyloaiza7@gmail.com ', 'Mariannyloaiza', '', 'Team Complex ', 'Equipos escalados', 'Henri Pittier', '2023-07-29', '15:00:00', 1),
(90, '7/29/2023, 10:51:55 AM', 'Ricardo gil', '18454557', 34, 'Masculino', '', '', '04148444937', 'Ricardojgil89@gmail.com', 'undefined', '', 'Complex', 'Equipos escalados', 'Mochima', '2023-07-29', '15:00:00', 1),
(91, '7/29/2023, 10:53:17 AM', 'Juan Trebol ', '17734854', 36, 'Masculino', '', '', '04248468580', 'Treboltep@gmail.com', 'Jmtrebol', '', 'Team Complex ', 'Equipos escalados', 'Santos Luzardo', '2023-07-29', '15:30:00', 0),
(92, '7/29/2023, 10:54:13 AM', 'German Eduardo villamizar castillo', '20170089', 31, 'Masculino', '', '', '04126970940', 'germanvillamizarc@gmail.com', 'Germanvica', '', '4 doritos despues', 'Equipos novatos', 'Santos Luzardo', '2023-07-29', '15:30:00', 0),
(93, '7/29/2023, 11:01:48 AM', 'María sanchez', '25508159', 30, 'Femenino', '', '', '04245897854', 'maria_eu02@hotmail.com', 'Mariasanchez5074', '', 'Cuánto falta?', 'Equipos novatos', 'Wuaraira_Repano', '2023-07-29', '11:00:00', 1),
(94, '7/29/2023, 11:02:22 AM', 'diego garcia', '27261784', 23, 'Masculino', '', '', '04127959809', 'diegowagner2000@gmail.com', 'diegogarciabw', '', 'El Resuelve', 'Equipos novatos', 'Yurubi', '2023-07-29', '11:30:00', 1),
(95, '7/29/2023, 11:03:30 AM', 'Laura Gabriela ', '20701164', 30, 'Femenino', '', '', 'undefined', 'Lauragabrielaperezcarrasquero@gmail.com', 'Lauragabrielaperez', '', 'Barroso runners ', 'Equipos novatos', 'Mochima', '2023-07-29', '12:30:00', 1),
(96, '7/29/2023, 11:05:43 AM', 'Roosmayra', '20110107', 33, 'Masculino', '', '', '04127792616', 'roosmayrabarcenas@gmail.com', '@roosmybarce', '', 'Sinwinfi', 'Equipos novatos', 'Wuaraira_Repano', '2023-07-29', '11:30:00', 1),
(97, '7/29/2023, 11:06:54 AM', 'Cristian perez', '25677104', 26, 'Masculino', '', '', '04143873615', 'Cristianrpg9619', 'Cristianrpg9619', '', 'Sin wifi', 'Equipos novatos', 'Cueva del Guacharo', '2023-07-29', '11:30:00', 1),
(98, '7/29/2023, 11:07:16 AM', 'Valentina', '28428866', 22, 'Femenino', '', '', '04246372321', 'Valentinaloaizasthormes@gmail.com', 'Valentinaloaiza31', '', 'Team ludus', 'Equipos escalados', 'Los Roques', '2023-07-29', '19:00:00', 0),
(99, '7/29/2023, 11:08:03 AM', 'Elizabeth polanco ', '23490170', 29, 'Femenino', '', '', '0412742440w', 'Od.elizabethpolanco@gmail.com', 'Elizapolanco19', '', 'Sie cara', 'Equipos escalados', 'Cienagas del catatumbo', '2023-07-29', '12:00:00', 1),
(100, '7/29/2023, 11:08:27 AM', 'Makys', '16298103', 38, 'Masculino', '', '', 'undefined', 'Makys21@hotmail.com', '21md21', '', 'Maracaibo', 'Equipos supermaster', 'Los Roques', '2023-07-29', '12:30:00', 1),
(101, '7/29/2023, 11:09:03 AM', 'Elizabeth polanco ', '23490170', 29, 'Femenino', '', '', '04127424402', 'Od.elizabethpolanco@gmail.com', 'Elizapolanco19', '', 'Sie cara', 'Equipos escalados', 'Cienagas del catatumbo', '2023-07-30', '11:00:00', 1),
(102, '7/29/2023, 11:09:23 AM', 'Boby', '16281588', 40, 'Femenino', '', '', 'undefined', 'Boby@hotmail.com', 'Boby', '', 'Maracaibo', 'Equipos supermaster', 'Los Roques', '2023-07-29', '13:30:00', 1),
(103, '7/29/2023, 11:09:25 AM', 'Jennyffer Narvaez', 'V24527251', 20, 'Femenino', '', '', '04143977829', 'Jennyffernarvaez94@gmail.com ', 'Jennyffernn', '', 'RoadtoRX', 'Equipos novatos', 'Canaima', '2023-07-29', '15:00:00', 1),
(104, '7/29/2023, 11:13:38 AM', 'sophia de los angeles barrera rodriguez', '30502453', 19, 'Femenino', '', '', '04146763520', 'sophiabarrera911@gmail.com', 'sophiabarrera_', '', 'strong blackforce', 'Equipos novatos', 'Los Roques', '2023-07-29', '14:00:00', 1),
(105, '7/29/2023, 11:14:02 AM', 'Adriana Cabrera', 'V30573493', 19, 'Femenino', '', '', '4124679217', 'adrianacabreera03@gmail.com', '@adrianacabreera', '', 'Strong Blackforce', 'Equipos novatos', 'Los Roques', '2023-07-29', '14:00:00', 1),
(106, '7/29/2023, 11:14:40 AM', 'Angel Gutiérrez ', '29.570.150 ', 22, 'undefined', '', '', '04126597972', 'Angel221999gutierrez@gmail.com', 'Angeleguc', '', 'Santa Cruz ', 'Equipos novatos', 'Wuaraira_Repano', '2023-07-29', '11:30:00', 1),
(107, '7/29/2023, 11:15:40 AM', 'Vanessa coquel ', '22290478', 30, 'Femenino', '', '', '04128476077', 'Vanessacoquel_3120@hotmail.com ', '@vanessada92', '', 'Sin wifi', 'Equipos novatos', 'Mochima', '2023-07-29', '15:30:00', 0),
(108, '7/29/2023, 11:23:17 AM', 'Jerson ochoa ', 'V22914725', 29, 'Masculino', '', '', '04241518373', 'jerso8a24@gmail.com ', 'jerson8a', '', 'Meraki team ', 'Equipos novatos', 'Cienagas del catatumbo', '2023-07-29', '09:00:00', 1),
(109, '7/29/2023, 11:25:28 AM', 'Aldemar Felizzola ', 'V17530258', 36, 'Masculino', '', '', '04145150275', 'aldemarfelizzola@gmail.com', 'Aldemarfelizzola', '', 'Jake Mate', 'Equipos novatos', 'Los Roques', '2023-07-29', '18:00:00', 0),
(110, '7/29/2023, 11:26:53 AM', 'Aldemar Felizzola ', 'V17530258', 36, 'Masculino', '', '', '04145150275', 'aldemarfelizzola@gmail.com', 'Aldemarfelizzola ', '', 'Jake Mate', 'Equipos novatos', 'Los Roques', '2023-07-30', '10:30:00', 1),
(111, '7/29/2023, 11:30:14 AM', 'Gracia bastid', '20301673', 31, 'Femenino', '', '', '04242068051', 'Mariagracia1892@gmail.com', 'Mcongracia', '', 'Meraki team', 'Equipos novatos', 'Los Roques', '2023-07-29', '14:30:00', 1),
(112, '7/29/2023, 11:30:35 AM', 'Flory Fernandez', 'V28203258', 22, 'Femenino', '', '', '04124773102', 'florysaura1303@gmail.com', 'fflorysaura', '', 'Rebel Palace', 'Equipos escalados', 'Mochima', '2023-07-29', '13:00:00', 1),
(113, '7/29/2023, 11:31:07 AM', 'Maribel Villarreal ', '13245480', 45, 'Femenino', '', '', '04141098284', 'Asesormv27@gmail.com', 'Maribelvilla27', '', 'Jaque Mate', 'Equipos supermaster', 'Canaima', '2023-07-29', '18:30:00', 0),
(114, '7/29/2023, 11:32:14 AM', 'Erick', '17424363', 37, 'Masculino', '', '', '04129884844', 'erickmaurice88@gmail.com', 'Erick_maurice', '', 'Team Legends ', 'Equipos novatos', 'Mochima', '2023-07-29', '14:00:00', 1),
(115, '7/29/2023, 11:32:17 AM', 'Luis José Morales Bustillo ', 'V19516118', 33, 'Masculino', '', '', 'undefined', 'lljmbustillo@gmail.com', '@lulois_s', '', 'El Resuelve', 'Equipos novatos', 'Wuaraira_Repano', '2023-07-29', '12:00:00', 1),
(116, '7/29/2023, 11:33:03 AM', 'Susana villarroel', 'V16006181', 40, 'Femenino', '', '', '04242101495', 'Susanadvill@gmail.com', 'Su_villarroel ', '', 'Mars', 'Equipos escalados', 'Mochima', '2023-07-29', '18:30:00', 0),
(117, '7/29/2023, 11:37:05 AM', 'Relihannys Sanchez', '29906841', 21, 'Femenino', '', '', '04249108286', 'Srelihannys@gmail.con ', 'Rhhsanchez', '', 'Pegasus power ', 'Equipos avanzados', 'Mochima', '2023-07-29', '16:00:00', 0),
(118, '7/29/2023, 11:42:33 AM', 'Miguel Alejandro Díaz castillo ', '29926736', 20, 'Masculino', '', '', '0414-6192282', 'Diazmg200@gmail.com', '_migueldz', '', 'Zulia', 'Equipos escalados', 'Canaima', '2023-07-29', '12:00:00', 1),
(119, '7/29/2023, 11:44:20 AM', 'Francis Martz', 'V19427231', 31, 'Femenino', '', '', '04146793975', 'ffernandezmateran@gmail.com', '@francisffernandez', '', 'The Last Call', 'Equipos novatos', 'Los Roques', '2023-07-29', '15:00:00', 1),
(120, '7/29/2023, 11:47:34 AM', 'Daniela blasi ', '28672926', 20, 'Femenino', '', '', '04145277643', 'undefined', 'Blasicf', '', 'Team Kabod ', 'Equipos escalados', 'Canaima', '2023-07-29', '12:30:00', 0),
(121, '7/29/2023, 11:47:39 AM', 'Daniella Noguera ', 'V16813000', 40, 'Femenino', '', '', '04145633658', 'daniellanoguera@gmail.com', '@daniellanoguera08', '', 'Rookie Evolution ', 'Equipos novatos', 'Los Roques', '2023-07-29', '18:30:00', 0),
(122, '7/29/2023, 11:49:06 AM', 'Daniella Noguera ', '16813000', 40, 'Femenino', '', '', '04145633658', 'daniellanoguera@gmail.com', '@daniellanoguera08', '', 'Rookie Evolution ', 'Equipos novatos', 'Los Roques', '2023-07-30', '10:00:00', 1),
(123, '7/29/2023, 11:49:24 AM', 'Marianna Santamaria', '30114105', 20, 'Femenino', '', '', '4143664743', 'Mariannasantamaria@hotmail.com', 'S.marianna04', '', 'Kháos', 'Equipos escalados', 'Los Roques', '2023-07-29', '15:30:00', 0),
(124, '7/29/2023, 11:50:00 AM', 'Loira', 'V15019339', 42, 'Femenino', '', '', '04144274484', 'Loirabienesraices@gmail.com', '@loirazahr', '', 'El resuelve ', 'Equipos novatos', 'Canaima', '2023-07-29', '13:00:00', 1),
(125, '7/29/2023, 11:50:33 AM', 'Luzmery Serrano ', '19317752', 32, 'Femenino', '', '', '04120955669', 'Yeizuluz@gmail.com', 'Yeizuluz', '', 'Spartan', 'Equipos novatos', 'Canaima', '2023-07-29', '16:00:00', 0),
(126, '7/29/2023, 11:50:49 AM', 'Carolina zapata ', '18.578.300 ', 34, 'Femenino', '', '', '0414-905-12-89 ', 'Zapatacarolina807@gmail.com', 'Zapatacaro', '', 'Legens', 'Equipos novatos', 'Canaima', '2023-07-30', '11:00:00', 0),
(127, '7/29/2023, 11:51:13 AM', 'erick', '17424363', 38, 'Masculino', '', '', '04129884844', 'erickmaurice88@gmail.com', 'Erick_maurice', '', 'Team Legends ', 'Equipos novatos', 'Canaima', '2023-07-30', '12:00:00', 0),
(128, '7/29/2023, 11:51:21 AM', 'Luzmery Serrano ', '19317752', 33, 'Femenino', '', '', '04120955669', 'Yeizuluz@gmail.com', 'Yeizuluz', '', 'Spartan', 'Equipos novatos', 'Canaima', '2023-07-30', '10:00:00', 0),
(129, '7/29/2023, 11:52:42 AM', 'Leniad Rivas', '20792403', 31, 'Masculino', '', '', 'undefined', 'irwinrivas0514@gmail.com', 'Leniad148', '', 'team California ', 'Duplas HH avanzados', 'Canaima', '2023-07-30', '11:30:00', 1),
(130, '7/29/2023, 11:53:02 AM', 'Veronica isea', '24909528', 28, 'Femenino', '', '', '04146134588', 'mave.isea@gmail.com', '@veronicaisea', '', 'Team ludus', 'Equipos escalados', 'Henri Pittier', '2023-07-29', '08:00:00', 1),
(131, '7/29/2023, 12:08:01 PM', 'Emi villasmil', '17078280', 38, 'Femenino', '', '', '04126458624', 'Emivillasmil@gmail.com', 'Lamor_0228', '', 'Misfits', 'Equipos novatos', 'Cueva del Guacharo', '2023-07-29', '15:30:00', 0),
(132, '7/29/2023, 12:14:42 PM', 'Daniel Moreno ', 'V17692941', 35, 'Masculino', '', '', '04241091465', 'danielemorenobere@gmail.com', 'morenodaniel3 ', '', 'Monster', 'Equipos novatos', 'Santos Luzardo', '2023-07-29', '14:30:00', 1),
(133, '7/29/2023, 12:21:32 PM', 'Angie Molina', 'V16490862', 38, 'Femenino', '', '', '04248385220', 'Molinaangie84@gmail.com', '@generacionfitvenezuela', '', 'Generación Killer', 'Equipos novatos', 'Santos Luzardo', '2023-07-29', '13:30:00', 0),
(134, '7/29/2023, 12:21:56 PM', 'José Rafael Quintana ', 'V25367355', 28, 'Masculino', '', '', '04143988510', 'jrquintana77@gmail.com', 'Jrquintanagram', '', 'D-GENERATION ', 'Duplas HH escalados', 'Los Roques', '2023-07-29', '16:30:00', 0),
(135, '7/29/2023, 12:22:11 PM', 'Josseph ', '26695071', 26, 'Masculino', '', '', '04248935271', 'jossephjpc@gmail.com', 'undefined', '', 'Team balancefit', 'Duplas HH escalados', 'Canaima', '2023-07-29', '16:30:00', 0),
(136, '7/29/2023, 12:23:42 PM', 'Álvaro Ramos ', '26194988', 26, 'Prefiero no decirlo', '', '', '04146634684', 'Alvaroramos174@gmail.com', 'Alvaro_jru', '', 'Mutesbox', 'Duplas HH escalados', 'Wuaraira_Repano', '2023-07-29', '16:30:00', 0),
(137, '7/29/2023, 12:29:36 PM', 'diego rangel', '28037503', 22, 'Masculino', '', '', '04249232607', 'eangeldiego@gmail.com', 'diegorangelch', '', 'PACING Delta ', 'Equipos avanzados', 'Santos Luzardo', '2023-07-29', '17:00:00', 0),
(138, '7/29/2023, 12:29:50 PM', 'Elisa Dávila ', 'undefined', 27, 'Femenino', '', '', '04249095777', 'Elisaabigaildavila@gmail.com', '@elisaadm_', '', 'Pacing delta ', 'Equipos avanzados', 'Sierra Nevada', '2023-07-29', '17:00:00', 0),
(139, '7/29/2023, 12:30:24 PM', 'Fabiola ', '27539438', 23, 'Femenino', '', '', '04245944996', 'Fabyjn2000@gmail.com', 'Mariafjn', '', 'Sieecara ', 'Equipos escalados', 'Yurubi', '2023-07-29', '16:00:00', 0),
(140, '7/29/2023, 12:31:14 PM', 'Darwin Melendez', 'V27199059', 23, 'Masculino', '', '', '04126701067', 'Darwin.12112000@gmail.com', '@ddmm.14', '', 'Siee cara ', 'Equipos escalados', 'Sierra Nevada', '2023-07-29', '14:00:00', 0),
(141, '7/29/2023, 1:47:51 PM', 'Peter Salazar', 'V28382614', 23, 'Masculino', '', '', '04121536175', 'petscastillo20@gmail.com', '@peterjsc', '', 'Proyecto X', 'Duplas HH avanzados', 'Yurubi', '2023-07-29', '15:30:00', 0),
(142, '7/29/2023, 2:25:56 PM', 'Ariadna Castillo', 'v33798172', 13, 'Femenino', '', '', '0416-6809862', 'Aribel1406@gmail.com', '@', '', 'Generación Killer', 'Equipos novatos', 'Canaima', '2023-07-30', '07:30:00', 1),
(143, '7/29/2023, 2:38:59 PM', 'Arianna Castillo', '33798172', 13, 'Femenino', '', '', '04120450934', 'Aribel1406@gmail.com', '@generacionfitvenezuela', '', 'Generación Killer', 'Equipos novatos', 'Cienagas del catatumbo', '2023-07-29', '15:00:00', 0),
(144, '7/29/2023, 2:43:14 PM', 'Angie Molina', 'V16490862', 38, 'Femenino', '', '', '04248385220', 'Molinaangie84@gmail.com', '@generacionfitvenezuela', '', 'Generación Killer', 'Equipos novatos', 'Sierra Nevada', '2023-07-29', '15:00:00', 0),
(145, '7/29/2023, 2:44:43 PM', 'Eliana Barrios', '20774154', 31, 'Femenino', '', '', 'undefined', 'elianabarrios18@hotmail.com', 'elianacbarrios ', '', 'Umbeaten ', 'Equipos avanzados', 'Wuaraira_Repano', '2023-07-29', '17:00:00', 0),
(146, '7/29/2023, 2:46:07 PM', 'Yanira Buyones ', '7922235', 55, 'Femenino', '', '', '04164178009', 'yanirabuyones@gmail.com', '@yanirabuyones', '', 'Arnica', 'Equipos novatos', 'Mochima', '2023-07-29', '14:30:00', 0),
(147, '7/29/2023, 2:47:37 PM', 'Juan mejia', '30176607', 21, 'Masculino', '', '', '04245944621', 'Juanmejialiscano02@gmail.com', 'Juanmeejia', '', 'The madbear team', 'Equipos escalados', 'Wuaraira_Repano', '2023-07-29', '14:30:00', 0),
(148, '7/29/2023, 2:56:38 PM', 'Alberto José Alfonzo González ', '25849914', 27, 'Masculino', '', '', '04148570039', 'aalfonzogonzalez@gmail.com', 'Albertojag02', '', 'Team Masacre ', 'Duplas HH escalados', 'Sierra Nevada', '2023-07-29', '15:30:00', 0),
(149, '7/29/2023, 2:56:56 PM', 'Luis Zapata ', 'V26797170', 25, 'Masculino', '', '', '04145455399', 'zapataf2009@gmail.com', 'Luis.zapata57', '', 'Kabod', 'Equipos escalados', 'Sierra Nevada', '2023-07-29', '15:30:00', 0),
(150, '7/29/2023, 3:19:31 PM', 'Jhon Josue Peña', '28296336', 21, 'Masculino', '', '', '0412-0268496', 'Jhonjosue_2001@hotmail.com', 'Jhonjosuepm', '', 'Croptop Fitness', 'Duplas HH avanzados', 'Sierra Nevada', '2023-07-29', '16:00:00', 0),
(151, '7/29/2023, 3:20:44 PM', 'Cristóbal Felipe Adames Marcano', '27943264', 22, 'Masculino', '', '', '04248634943', 'cristobal27adames@gmail.com', 'adamescristobal', '', 'Croptop fitnes', 'Duplas HH avanzados', 'Sierra Nevada', '2023-07-29', '16:00:00', 0),
(152, '7/29/2023, 3:29:29 PM', 'Juan Martínez ', '26550643', 25, 'Masculino', '', '', '04126579187', 'juancm10997@gmail.com', '9jcm7', '', 'Santa cruz', 'Equipos novatos', 'Mochima', '2023-07-29', '16:30:00', 0),
(153, '7/29/2023, 3:35:53 PM', 'Jose Leon', '23854720', 28, 'Masculino', '', '', '04122388981', 'Leonrosalesjr@gmail.com', 'Joserleonr', '', 'Team ludus', 'Equipos escalados', 'Los Roques', '2023-07-29', '19:30:00', 0),
(154, '7/29/2023, 4:05:01 PM', 'Constanza ', 'V17423151', 36, 'Femenino', '', '', 'undefined', 'Dtbighetti.27@gmail.com', '@danytorres27', '', 'Looney tonos', 'Equipos novatos', 'Yurubi', '2023-07-29', '17:30:00', 0),
(155, '7/29/2023, 4:15:17 PM', 'Olaf Guariato ', '24666200', 29, 'Masculino', '', '', '04248270957', 'Olafjose93@gmail.com', 'Olafguariato ', '', 'Stamina ', 'Trios mixtos', 'Cueva del Guacharo', '2023-07-29', '16:00:00', 0),
(156, '7/29/2023, 4:22:17 PM', 'Mauricio Echenique ', '30483913', 20, 'Masculino', '', '', '04145526434', 'mechenique110@gmail.com', '@mauricioechenique22', '', 'Proyecto X ', 'Duplas HH avanzados', 'Mochima', '2023-07-29', '10:00:00', 0),
(157, '7/29/2023, 4:22:33 PM', 'Ronald Espinoza ', '18965359', 35, 'Masculino', '', '', '04247783754', 'ronaldespinoza22@gmail.com', '@ronaldwushu', '', 'Ape hydra', 'Duplas HH escalados', 'Yurubi', '2023-07-29', '09:30:00', 0),
(158, '7/29/2023, 5:17:22 PM', 'Francisco salas', '25751874', 28, 'Masculino', '', '', '04121800622', 'franciscosalas090595@gmail.com', '@fransalas0905', '', 'Eagle ', 'Trios mixtos', 'Santos Luzardo', '2023-07-29', '17:30:00', 0),
(159, '7/29/2023, 5:17:39 PM', 'Oscar Velazquez', '18991362', 34, 'Masculino', '', '', '04242133951', 'Oscaradolfov@outlook.com', 'Oscaradolfov', '', 'Los increíbles ', 'Equipos novatos', 'Wuaraira_Repano', '2023-07-29', '17:30:00', 0),
(160, '7/29/2023, 5:34:50 PM', 'Eliana Barrios ', '20774154', 31, 'Femenino', '', '', 'undefined', 'Elianabarrios18@hotmail.com', 'elianacbarrios ', '', 'Umbeaten ', 'Equipos avanzados', 'Wuaraira_Repano', '2023-07-29', '19:30:00', 0),
(161, '7/29/2023, 5:38:44 PM', 'María emilia Granados', 'V17403236', 37, 'Femenino', '', '', '58 4147825000', 'Mariaegranado@gmail.com', 'Mariaemilia236', '', 'Team JP', 'Equipos novatos', 'Mochima', '2023-07-29', '17:30:00', 0),
(162, '7/29/2023, 5:47:12 PM', 'ana castillo', '26740482', 25, 'Femenino', '', '', '04120115050', 'anacastillo5c@gmail.com', 'Ana_joselyn', '', 'Guatire strong', 'Equipos novatos', 'Sierra Nevada', '2023-07-29', '18:00:00', 0),
(163, '7/29/2023, 5:48:28 PM', 'Karla Gatti', '24567062', 27, 'Femenino', '', '', '04245506826', 'karlagatti09@gmail.com', 'karlagattic', '', 'Cervezas & Burpees', 'Equipos novatos', 'Santos Luzardo', '2023-07-29', '18:00:00', 0),
(164, '7/29/2023, 5:51:55 PM', 'Igor Pagés ', 'undefined', 33, 'Masculino', '', '', '04247308717', 'igorpages808@gmail.com', 'Igorikrdo', '', 'Meraki team ', 'Equipos novatos', 'Yurubi', '2023-07-29', '18:00:00', 0),
(165, '7/29/2023, 5:56:02 PM', 'Daniela castillo', '32746325', 15, 'Femenino', '', '', '04120450955', 'Daniv161107@gmail.com', 'Dani.castillo16_', '', 'Generación fire', 'Equipos novatos', 'Canaima', '2023-07-29', '18:00:00', 0),
(166, '7/29/2023, 5:56:07 PM', 'Oriana Barrera', 'V19885284', 32, 'Femenino', '', '', 'undefined', 'Orianabsanchez@gmail.com', 'Orianabsanchez', '', 'Suicide Squad ', 'Equipos novatos', 'Henri Pittier', '2023-07-29', '18:00:00', 0),
(167, '7/29/2023, 5:59:40 PM', 'Virginia varela', '17227691', 38, 'Femenino', '', '', '04142166933', 'Virginia.varela85@gmail.com', 'Carorugby ', '', 'Invertem ', 'Equipos novatos', 'Wuaraira_Repano', '2023-07-29', '18:00:00', 0),
(168, '7/29/2023, 6:02:02 PM', 'Ivanna Da Silva ', '27391319', 23, 'Femenino', '', '', '04242804574', 'Ivannitadasilva@gmail.com', 'undefined', '', 'SHIROV', 'Equipos novatos', 'Canaima', '2023-07-29', '19:00:00', 0),
(169, '7/29/2023, 6:05:44 PM', 'Robert osorio', '19511299', 32, 'Masculino', '', '', '04242445181', 'Robertosorio23@gmail.com', 'undefined', '', 'El autobus de coche', 'Equipos novatos', 'Wuaraira_Repano', '2023-07-29', '18:30:00', 0),
(170, '7/29/2023, 6:06:34 PM', 'Amel MOUKLED BALLAN ', 'undefined', 38, 'Femenino', '', '', '04248724026', 'Amalmaklad@gmail.com', 'Amelmb ', '', 'Vibranium team', 'Equipos novatos', 'Santos Luzardo', '2023-07-29', '18:30:00', 0),
(171, '7/29/2023, 6:07:22 PM', 'Yuliana Gil ', 'V30090345', 20, 'Femenino', '', '', '04265838406', 'yulia.acro2014@gmail.com', 'Yulia.gil ', '', 'IRON WARRIOR ', 'Equipos novatos', 'Yurubi', '2023-07-29', '18:30:00', 0),
(172, '7/29/2023, 6:09:19 PM', 'Arianna Ysabel Castillo Villanueva', '33798172', 13, 'Femenino', '', '', '04120450934', 'aribel1406@gmail.com', 'ari.castillov_', '', 'Generación Killer', 'Equipos novatos', 'Sierra Nevada', '2023-07-29', '18:30:00', 0),
(173, '7/29/2023, 6:10:49 PM', 'Oswaldo José Talavera vilela', '27680647', 22, 'Masculino', '', '', '04126594536', 'oswaldot993@gmail.com', 'Oswaldofit_ve', '', 'Barroso RUNNERS ', 'Equipos novatos', 'Yurubi', '2023-07-29', '16:30:00', 0),
(174, '7/29/2023, 6:16:40 PM', 'Katherin Flores ', '30776118', 18, 'Femenino', '', '', '04147923307', 'katecff18@gmail.com ', 'Katecff18 ', '', 'América ', 'Equipos novatos', 'Santos Luzardo', '2023-07-29', '16:30:00', 0),
(175, '7/29/2023, 6:37:35 PM', 'Rodolfo Montoya', '28223606', 22, 'Masculino', '', '', '04121105632', 'rodolfojose_montoya@hotmail.com', 'rodolfojmn', '', '4 doritos', 'Equipos novatos', 'Canaima', '2023-07-29', '07:30:00', 0),
(176, '7/29/2023, 6:38:48 PM', 'Gisselle López ', '25071741', 26, 'Femenino', '', '', '04141333931', 'Gisslz@hotmail.com ', 'Gisslz', '', 'Monster ', 'Equipos novatos', 'Mochima', '2023-07-29', '19:00:00', 0),
(177, '7/29/2023, 6:39:35 PM', 'Leonardo marcano', '21176643', 29, 'Masculino', '', '', 'undefined', 'rodolfojose_montoya@hotmail.com', 'leojmarcano', '', 'america', 'Equipos novatos', 'Cienagas del catatumbo', '2023-07-29', '07:30:00', 0),
(178, '7/29/2023, 6:39:57 PM', 'Janet Torre', '25038033', 29, 'Femenino', '', '', '04129616601', 'Torre.janet@gmail.com', 'Torrejanet', '', 'Monster INC', 'Equipos novatos', 'Santos Luzardo', '2023-07-29', '16:00:00', 0),
(179, '7/29/2023, 6:40:18 PM', 'Nolitza colombo', 'V19300339', 37, 'undefined', '', '', '04265430042', 'nolitza2006@gmail.com', 'Nolitza colombo ', '', 'Cervezas $ Burpees ', 'Equipos novatos', 'Santos Luzardo', '2023-07-29', '19:00:00', 0),
(180, '7/29/2023, 6:41:36 PM', 'Janet Torre', '25038033', 29, 'Femenino', '', '', '04129616601', 'Torre.janet@gmail.com', 'Torrejanet', '', 'Monster INC', 'Equipos novatos', 'Henri Pittier', '2023-07-29', '19:00:00', 0),
(181, '7/29/2023, 6:43:49 PM', 'Junior Duque ', '19967668', 34, 'Masculino', '', '', '04245169461', 'duquesvzla@gmail.com', 'Educandotucuerpo', '', 'Cervezas& Burpees ', 'Equipos novatos', 'Mochima', '2023-07-29', '19:30:00', 0),
(182, '7/29/2023, 6:49:10 PM', 'Eduardo Farias', 'V15114447', 40, 'Masculino', '', '', '04241720882', 'Eduardofariascordero@gmail.com ', 'Eifc300', '', 'Costilla', 'Equipos escalados', 'Canaima', '2023-07-29', '19:30:00', 0),
(183, '7/29/2023, 6:53:00 PM', 'jerson ochoa ', '22914725', 29, 'Masculino', '', '', '04241518373', 'jerson8a24@gmail.com ', 'jerson8a ', '', 'Meraki team ', 'Equipos novatos', 'Yurubi', '2023-07-29', '19:00:00', 0),
(184, '7/29/2023, 6:59:13 PM', 'undefined', '26990100', 24, 'Masculino', '', '', '04149512682', 'juliomolero5@gmail.com', 'Juliomolero17', '', 'Be happy ', 'Duplas HH avanzados', 'Sierra Nevada', '2023-07-29', '19:00:00', 0),
(185, '7/29/2023, 7:00:31 PM', 'Andreina Ramos ', '29731717', 21, 'Femenino', '', '', '04129974333', 'ramosmaita52@gmail.com', 'andreina1804', '', 'Meraki team ', 'Equipos novatos', 'Cienagas del catatumbo', '2023-07-29', '19:00:00', 0),
(186, '7/29/2023, 7:00:49 PM', 'Fabianna', 'V27150154', 23, 'Femenino', '', '', '04241479565', 'Fabianna2809@gmail.com', 'Fabii.obregonn', '', 'The Vikings home', 'Equipos escalados', 'Santos Luzardo', '2023-07-29', '19:30:00', 0),
(187, '7/29/2023, 7:02:54 PM', 'Gabriela Viloria ', '28664904', 20, 'Femenino', '', '', '0416-5800675', 'Gabrielaviloria167@gmail.com ', 'Gabrielaviloria16 ', '', 'America', 'undefined', 'Wuaraira_Repano', '2023-07-29', '19:00:00', 0),
(188, '7/29/2023, 7:04:48 PM', 'Richard Montilla', '27949627', 22, 'Masculino', '', '', '04126940814', 'richardelpopular@gmail.com', 'Montilla.fit', '', 'Iron Warriors ', 'Equipos novatos', 'Yurubi', '2023-07-29', '19:30:00', 0),
(189, '7/29/2023, 7:06:00 PM', 'Carlos y', 'V12576677', 47, 'Masculino', '', '', '04147978479', 'tisanca@gmail.com', 'sanchez_carlos_e', '', 'IRON WARRIORS ', 'Equipos novatos', 'Yurubi', '2023-07-29', '19:30:00', 0),
(190, '7/29/2023, 7:07:50 PM', 'Rocíos Carvajal', '26971171', 26, 'Femenino', '', '', '04149947628', 'rocioscarvajal97@gmail.com', 'Rocio_angeles1', '', 'Iron Warriors ', 'Equipos novatos', 'Henri Pittier', '2023-07-29', '19:30:00', 0),
(191, '7/29/2023, 7:11:41 PM', 'María Luisa López ', '14142135', 44, 'Femenino', '', '', '04141324771', 'marisita142@hotmail.com', '@marisita142', '', 'Jaque Mate', 'Equipos supermaster', 'Santos Luzardo', '2023-07-29', '14:00:00', 0),
(192, '7/29/2023, 7:13:46 PM', 'Mauricio Quintero', '30053601', 20, 'Masculino', '', '', '04244225928', 'Mauricioaqdl@gmail.com', 'MauricioAQDL', '', 'Black Clover ', 'Equipos escalados', 'Wuaraira_Repano', '2023-07-29', '14:00:00', 0),
(193, '7/29/2023, 7:14:12 PM', 'Daniela Moreno ', '27925752', 24, 'Femenino', '', '', '4244414075', 'Danibea1105@gmail.com ', 'Daniela1105m', '', 'Black Clover ', 'Equipos escalados', 'Wuaraira_Repano', '2023-07-29', '16:00:00', 0),
(194, '7/29/2023, 7:20:26 PM', 'Henry García ', '10010319', 47, 'Masculino', '', '', '04127278164', 'Henry211075@GMAIL.COM', '@henry.josegarcia', '', 'Shirok ', 'Equipos novatos', 'Henri Pittier', '2023-07-30', '10:00:00', 0),
(195, '7/29/2023, 7:26:35 PM', 'Leo mendez', 'V19348266', 34, 'Masculino', '', '', 'undefined', 'Leomg23@gmail.com', 'Leomg23', '', 'Siee cara', 'Equipos escalados', 'Henri Pittier', '2023-07-30', '10:30:00', 0),
(196, '7/29/2023, 7:28:21 PM', 'Fabianna', 'V27150154', 23, 'Femenino', '', '', '04241479564', 'Fabianna2809@gmail.com', 'Fabii.obregonn', '', 'The Vikings home', 'Equipos escalados', 'Sierra Nevada', '2023-07-29', '19:30:00', 0),
(197, '7/29/2023, 7:34:31 PM', 'Yonhy castillo ', '21140067', 30, 'Masculino', '', '', '04145531928', 'Castilloyonhy@gmail.con', '@yonhy01', '', 'Kabod', 'Equipos escalados', 'Canaima', '2023-07-30', '09:00:00', 0),
(198, '7/29/2023, 10:50:31 PM', 'Wilfredo Bello ', 'V16273353', 39, 'Masculino', '', '', '04141384622', 'wjbello@gmail.com', 'Wilbello ', '', 'Toxinetas ', 'Equipos escalados', 'Los Roques', '2023-07-30', '12:00:00', 0),
(199, '7/29/2023, 10:53:57 PM', 'Wilfredo Bello ', 'V16273353', 39, 'Masculino', '', '', '04141384622', 'wjbello@gmail.com', 'Wilbello ', '', 'Toxinetas ', 'Equipos escalados', 'Wuaraira_Repano', '2023-07-30', '12:00:00', 0),
(200, '7/29/2023, 10:56:51 PM', 'Descanso Jornada', 'V17930210', 32, 'Prefiero no decirlo', '', '', '0412-6050059', 'inteligenciacomercial@intervit.net', 'Descanso', '', 'Descanso', 'Equipos novatos', 'Canaima', '2023-07-30', '12:30:00', 0),
(201, '7/29/2023, 10:57:36 PM', 'Descanso Jornada', 'V17930210', 32, 'Prefiero no decirlo', '', '', '0412-6050059', 'inteligenciacomercial@intervit.net', 'Descanso', '', 'Descanso', 'Equipos novatos', 'Canaima', '2023-07-30', '13:00:00', 0),
(202, '7/29/2023, 10:57:42 PM', 'Sidney Duran', '23944158', 27, 'Femenino', '', '', '04122992045', 'Sidney.duran01@gmail.com', 'Sidneyduran', '', 'Las toxinetas', 'Equipos escalados', 'Mochima', '2023-07-30', '12:00:00', 0),
(203, '7/29/2023, 10:58:25 PM', 'Descanso Jornada', 'V17930210', 32, 'Prefiero no decirlo', '', '', '0412-6050059', 'inteligenciacomercial@intervit.net', 'Descanso', '', 'Descanso', 'Equipos novatos', 'Cienagas del catatumbo', '2023-07-30', '12:30:00', 0),
(204, '7/29/2023, 10:59:13 PM', 'Descanso Jornada', 'V17930210', 32, 'Prefiero no decirlo', '', '', '0412-6050059', 'inteligenciacomercial@intervit.net', 'Descanso', '', 'Descanso', 'Equipos novatos', 'Cienagas del catatumbo', '2023-07-30', '13:00:00', 0),
(205, '7/29/2023, 11:00:10 PM', 'Descanso Jornada', 'V17930210', 32, 'Masculino', '', '', '0412-6050059', 'inteligenciacomercial@intervit.net', 'Descanso', '', 'Descanso', 'Equipos novatos', 'Cueva del Guacharo', '2023-07-30', '12:30:00', 0),
(206, '7/29/2023, 11:00:57 PM', 'Descanso Jornada', 'V17930210', 32, 'Masculino', '', '', '0412-6050059', 'inteligenciacomercial@intervit.net', 'Descanso', '', 'Descanso', 'Equipos novatos', 'Henri Pittier', '2023-07-30', '12:00:00', 1),
(207, '7/29/2023, 11:02:12 PM', 'Daniel Prado', '19505196', 33, 'Masculino', '', '', '04122932531', 'Danielprado90@gmail.com', 'Danielplasticsurgery', '', 'Las toxinetas', 'Equipos escalados', 'Santos Luzardo', '2023-07-30', '12:00:00', 0),
(208, '7/29/2023, 11:06:00 PM', 'Wilfredo Bello ', 'V16273353', 39, 'Masculino', '', '', '04141384622', 'wjbello@gmail.com', 'Wilbello ', '', 'Toxinetas ', 'Equipos escalados', 'Yurubi', '2023-07-30', '12:00:00', 0),
(209, '7/29/2023, 11:11:50 PM', 'Descanso Jornada', 'V17930210', 32, 'Prefiero no decirlo', '', '', '0412-6050059', 'inteligenciacomercial@intervit.net', 'Descanso', '', 'Descanso', 'Equipos novatos', 'Cueva del Guacharo', '2023-07-30', '13:00:00', 0),
(210, '7/29/2023, 11:15:48 PM', 'Descanso Jornada', 'V17930210', 32, 'Masculino', '', '', '0412-6050059', 'inteligenciacomercial@intervit.net', 'Descanso', '', 'Descanso', 'Equipos novatos', 'Henri Pittier', '2023-07-30', '12:30:00', 0),
(211, '7/29/2023, 11:16:37 PM', 'Descanso Jornada', 'V17930210', 32, 'Prefiero no decirlo', '', '', '0412-6050059', 'inteligenciacomercial@intervit.net', 'Descanso', '', 'Descanso', 'Equipos novatos', 'Henri Pittier', '2023-07-30', '13:00:00', 0),
(212, '7/29/2023, 11:24:29 PM', 'Descanso Jornada', 'V17930210', 32, 'Prefiero no decirlo', '', '', '0412-6050059', 'inteligenciacomercial@intervit.net', 'descanso', '', 'Descanso', 'Equipos novatos', 'Los Roques', '2023-07-30', '12:30:00', 0),
(213, '7/29/2023, 11:25:11 PM', 'Descanso Jornada', 'V17930210', 32, 'Prefiero no decirlo', '', '', '0412-6050059', 'inteligenciacomercial@intervit.net', 'Descanso', '', '32', 'Equipos novatos', 'Los Roques', '2023-07-30', '13:00:00', 0),
(214, '7/29/2023, 11:25:55 PM', 'Descanso Jornada', 'V17930210', 32, 'Prefiero no decirlo', '', '', '0412-6050059', 'inteligenciacomercial@intervit.net', 'Descanso', '', '32', 'Equipos novatos', 'Mochima', '2023-07-30', '12:30:00', 1),
(215, '7/29/2023, 11:27:40 PM', 'Descanso Jornada', 'V17930210', 32, 'Prefiero no decirlo', '', '', '0412-6050059', 'inteligenciacomercial@intervit.net', 'Descanso', '', 'Descanso', 'Equipos novatos', 'Mochima', '2023-07-30', '13:30:00', 0),
(216, '7/29/2023, 11:29:05 PM', 'Descanso Jornada', 'V17930210', 32, 'Prefiero no decirlo', '', '', '0412-6050059', 'inteligenciacomercial@intervit.net', 'Descanso', '', 'Descanso', 'Equipos novatos', 'Mochima', '2023-07-30', '14:00:00', 0),
(217, '7/29/2023, 11:29:53 PM', 'Descanso Jornada', 'V17930210', 32, 'Prefiero no decirlo', '', '', '0412-6050059', 'inteligenciacomercial@intervit.net', 'Descanso', '', 'Descanso', 'Equipos novatos', 'Santos Luzardo', '2023-07-30', '13:30:00', 0),
(218, '7/29/2023, 11:30:31 PM', 'Descanso Jornada', 'V17930210', 32, 'Prefiero no decirlo', '', '', '0412-6050059', 'inteligenciacomercial@intervit.net', 'Descanso', '', 'Descanso', 'Equipos novatos', 'Santos Luzardo', '2023-07-30', '14:00:00', 0),
(219, '7/29/2023, 11:31:44 PM', 'Descanso Jornada', 'V17930210', 32, 'Masculino', '', '', '0412-6050059', 'inteligenciacomercial@intervit.net', 'Descanso', '', 'Descanso', 'Equipos novatos', 'Sierra Nevada', '2023-07-30', '13:30:00', 0),
(220, '7/29/2023, 11:32:55 PM', 'Descanso Jornada', 'V17930210', 32, 'Prefiero no decirlo', '', '', '0412-6050059', 'inteligenciacomercial@intervit.net', 'Descanso', '', 'Descanso', 'Equipos novatos', 'Sierra Nevada', '2023-07-30', '14:00:00', 0),
(221, '7/29/2023, 11:34:23 PM', 'Descanso Jornada', 'V17930210', 32, 'Prefiero no decirlo', '', '', '0412-6050059', 'inteligenciacomercial@intervit.net', 'Descanso', '', 'Descanso', 'Equipos novatos', 'Wuaraira_Repano', '2023-07-30', '13:30:00', 0),
(222, '7/29/2023, 11:35:02 PM', 'Descanso Jornada', 'V17930210', 32, 'Masculino', '', '', '0412-6050059', 'inteligenciacomercial@intervit.net', 'descanso', '', 'Descanso', 'Equipos novatos', 'Wuaraira_Repano', '2023-07-30', '14:00:00', 0),
(223, '7/29/2023, 11:36:00 PM', 'Descanso Jornada', 'V17930210', 32, 'Prefiero no decirlo', '', '', '0412-6050059', 'inteligenciacomercial@intervit.net', 'Descanso', '', 'Descanso', 'Equipos novatos', 'Yurubi', '2023-07-30', '13:30:00', 0),
(224, '7/29/2023, 11:36:41 PM', 'Descanso Jornada', 'V17930210', 32, 'Prefiero no decirlo', '', '', '0412-6050059', 'inteligenciacomercial@intervit.net', 'Descanso', '', 'Descanso', 'Equipos novatos', 'Yurubi', '2023-07-30', '14:00:00', 0);
INSERT INTO `agenda` (`id`, `fecha_reg`, `nombre`, `cedula`, `edad`, `genero`, `estado`, `ciudad`, `telefono`, `correo`, `instagram`, `evento`, `equipo`, `categoria`, `estacion`, `fecha_cita`, `hora_cita`, `concluida`) VALUES
(225, '7/30/2023, 8:22:11 AM', 'Arianna Ysabel Castillo Villanueva', '33798172', 13, 'Femenino', '', '', '04120450934', 'aribel1406@gmail.com', 'ari.castillov_', '', 'Generación Killer', 'Equipos novatos', 'Sierra Nevada', '2023-07-30', '11:00:00', 0),
(226, '7/30/2023, 8:23:26 AM', 'Oriana salazar', '26385202', 25, 'Femenino', '', '', '04148297399', 'Orianasalazar19@gmail.com', 'Orianasalazar19', '', 'Generación fire', 'Equipos novatos', 'Cienagas del catatumbo', '2023-07-30', '11:30:00', 0),
(227, '7/30/2023, 8:24:19 AM', 'Angie molina', '16490862', 37, 'Femenino', '', '', '04248385220', 'Molinaangie84@gmail.com', 'ari.castillov_', '', 'Generación Killer', 'undefined', 'Sierra Nevada', '2023-07-30', '11:30:00', 0),
(228, '7/30/2023, 8:24:32 AM', 'Jose misel', '21389627', 30, 'Femenino', '', '', '04149844638', 'Jmisel69@gmail.com ', 'Jmisel', '', 'Generación fire', 'Equipos novatos', 'Yurubi', '2023-07-30', '11:00:00', 0),
(229, '7/30/2023, 8:25:55 AM', 'Daniela castillo', '32746325', 15, 'Femenino', '', '', '04120460955', 'Daniv161107@gmail.com', 'Dani.castillo16_', '', 'Generación fire', 'Equipos novatos', 'Wuaraira_Repano', '2023-07-30', '11:00:00', 0),
(230, '7/30/2023, 8:35:48 AM', 'Descanso Jornada', 'V17930210', 32, 'Prefiero no decirlo', '', '', '0412-6050059', 'inteligenciacomercial@intervit.net', 'Descanso', '', 'Descanso', 'Equipos novatos', 'Canaima', '2023-07-30', '14:30:00', 0),
(231, '7/30/2023, 8:37:03 AM', 'Descanso Jornada', 'V17930210', 32, 'Prefiero no decirlo', '', '', '0412-6050059', 'inteligenciacomercial@intervit.net', 'Descanso', '', 'Descanso', 'Equipos novatos', 'Cienagas del catatumbo', '2023-07-30', '14:30:00', 0),
(232, '7/30/2023, 8:38:29 AM', 'Descanso Jornada', 'V17930210', 32, 'Prefiero no decirlo', '', '', '0412-6050059', 'inteligenciacomercial@intervit.net', 'Descanso', '', 'Descanso', 'Equipos novatos', 'Cueva del Guacharo', '2023-07-30', '14:30:00', 0),
(233, '7/30/2023, 8:39:25 AM', 'Descanso Jornada', 'V17930210', 32, 'Prefiero no decirlo', '', '', '0412-6050059', 'inteligenciacomercial@intervit.net', 'Descanso', '', 'Descanso', 'Equipos novatos', 'Henri Pittier', '2023-07-30', '14:30:00', 0),
(234, '7/30/2023, 8:40:26 AM', 'Descanso Jornada', 'V17930210', 32, 'Prefiero no decirlo', '', '', '0412-6050059', 'inteligenciacomercial@intervit.net', 'Descanso', '', 'Descanso', 'Equipos novatos', 'Los Roques', '2023-07-30', '14:30:00', 0),
(235, '7/30/2023, 8:41:24 AM', 'Descanso Jornada', 'V17930210', 32, 'Prefiero no decirlo', '', '', '0412-6050059', 'inteligenciacomercial@intervit.net', 'Descanso', '', '32', 'Equipos novatos', 'Mochima', '2023-07-30', '15:00:00', 0),
(236, '7/30/2023, 8:42:06 AM', 'Descanso Jornada', 'V17930210', 32, 'Prefiero no decirlo', '', '', '0412-6050059', 'inteligenciacomercial@intervit.net', 'Descanso', '', 'Descanso', 'Equipos novatos', 'Santos Luzardo', '2023-07-30', '15:00:00', 0),
(237, '7/30/2023, 8:42:52 AM', 'Descanso Jornada', 'V17930210', 23, 'Masculino', '', '', '0412-6050059', 'inteligenciacomercial@intervit.net', 'Descanso', '', 'Descanso', 'Equipos novatos', 'Sierra Nevada', '2023-07-30', '15:00:00', 0),
(238, '7/30/2023, 8:43:29 AM', 'Descanso Jornada', 'V17930210', 32, 'Prefiero no decirlo', '', '', '0412-6050059', 'inteligenciacomercial@intervit.net', 'Descanso', '', 'Descanso', 'Equipos novatos', 'Yurubi', '2023-07-30', '15:00:00', 0),
(239, '7/30/2023, 8:44:22 AM', 'Descanso Jornada', 'V17930210', 32, 'Prefiero no decirlo', '', '', '0412-6050059', 'inteligenciacomercial@intervit.net', 'Descanso', '', 'Descanso', 'Equipos novatos', 'Wuaraira_Repano', '2023-07-30', '15:00:00', 0),
(240, '7/30/2023, 9:12:22 AM', 'Jesús Portillo ', '26318895', 25, 'Masculino', '', '', '04126404627', 'Jepsportillo@gmail.com', 'undefined', '', 'Zulia ', 'Equipos escalados', 'Cueva del Guacharo', '2023-07-30', '09:00:00', 0),
(241, '7/30/2023, 9:27:14 AM', 'Victor marval ', 'V14188075', 44, 'Masculino', '', '', '04140144512', 'vmarval@gmail.com', '@vmarval', '', 'Inverteam', 'Equipos novatos', 'Canaima', '2023-07-30', '09:30:00', 0),
(242, '7/30/2023, 9:28:04 AM', 'Steven Hernán Pinto Hernández ', 'V25082586', 27, 'Masculino', '', '', '04143915490', 'stevph3@gmail.com', '@stevenpinto1', '', 'UNITED FORCE ', 'Duplas HH escalados', 'Henri Pittier', '2023-07-30', '09:30:00', 0),
(243, '7/30/2023, 9:30:11 AM', 'Ricardo Tovar', '14500419', 44, 'Masculino', '', '', '04122052030', 'ritoguedez@gmail.com', '@rdtg_arq', '', 'MARS', 'Equipos escalados', 'Cueva del Guacharo', '2023-07-30', '13:30:00', 0),
(244, '7/30/2023, 9:30:23 AM', 'Makys', '16298103', 38, 'Masculino', '', '', '04146328650', 'Makys21@hotmail.com', '21md21', '', 'Maracaibo', 'Equipos supermaster', 'Los Roques', '2023-07-30', '11:30:00', 0),
(245, '7/30/2023, 9:36:14 AM', 'Yonhy castillo ', 'V21140067', 30, 'Masculino', '', '', '04145531928', 'Castilloyonhy@gmail.com ', '@yonhy01', '', 'Team kabod ', 'Equipos escalados', 'Mochima', '2023-07-30', '11:00:00', 0),
(246, '7/30/2023, 9:38:49 AM', 'Dasaiky', '23532239', 29, 'Femenino', '', '', '04143857773', 'Dasaikypm@gmail.com', 'Dasaiky', '', 'Team Complex ', 'Equipos escalados', 'Henri Pittier', '2023-07-30', '11:00:00', 0),
(247, '7/30/2023, 9:39:34 AM', 'Félix Mendoza', 'V14704283', 42, 'Masculino', '', '', '04143829292', 'jolyzolano@gmail.com', '@jolyzolano', '', 'ARNICA', 'Equipos supermaster', 'Santos Luzardo', '2023-07-30', '13:00:00', 0),
(248, '7/30/2023, 9:39:37 AM', 'Marianny Loaiza ', '21235137', 29, 'Femenino', '', '', '04128893862', 'Mariannyloaiza7@gmail.com', 'Mariannyloaiza', '', 'Team Complex ', 'Equipos escalados', 'Henri Pittier', '2023-07-30', '11:30:00', 0),
(249, '7/30/2023, 9:40:18 AM', 'Angel jeanton ', '15316244', 41, 'Masculino', '', '', '04140840738', 'ajeanton333@hotmail.com ', 'ajeanton333', '', 'Team Arnica', 'Equipos supermaster', 'Sierra Nevada', '2023-07-30', '13:00:00', 0),
(250, '7/30/2023, 9:40:55 AM', 'Maria labarca', 'V19312125', 34, 'Femenino', '', '', 'undefined', 'mary2012us1@gmail.com', 'Mavilabarca', '', 'Team Arnics', 'Equipos supermaster', 'Henri Pittier', '2023-07-30', '13:30:00', 0),
(251, '7/30/2023, 9:41:59 AM', 'Nailed Hurtado', '16963187', 38, 'undefined', '', '', '04148257312', 'Desireehurtado13@gmail.com', 'Hd_desiree', '', 'Arnica', 'Equipos supermaster', 'Los Roques', '2023-07-30', '13:30:00', 0),
(252, '7/30/2023, 9:45:51 AM', 'Luis hernandez ', '17100899', 37, 'Masculino', '', '', '04141267290', 'importaciones.global@gmail.com', 'Luis_ccs', '', 'Jake mate', 'Equipos novatos', 'Wuaraira_Repano', '2023-07-30', '11:30:00', 0),
(253, '7/30/2023, 9:46:37 AM', 'Andrea Rodriguez', '18712742', 33, 'Femenino', '', '', '04241950298', 'desena.rodriguez89@gmail.com', 'andrer89', '', 'Jake Mate', 'Equipos novatos', 'Yurubi', '2023-07-30', '11:30:00', 0),
(254, '7/30/2023, 9:54:15 AM', 'Laurent Rivero ', '24774230', 28, 'Femenino', '', '', '04242106807', 'Laurcc16@gmail.com', 'Laurentrivero', '', 'Suicide squad', 'Equipos novatos', 'Mochima', '2023-07-30', '10:00:00', 0),
(255, '7/30/2023, 9:56:08 AM', 'Dayana Vicentelli ', '24210174', 29, 'Femenino', '', '', '04242165997', 'Davicentelli1812@gmail.com ', 'Davicentelli ', '', 'Stamina', 'Trios mixtos', 'Cueva del Guacharo', '2023-07-30', '09:30:00', 0),
(256, '7/30/2023, 9:59:45 AM', 'Jorge Emanuel Olivares Contreras ', '31017207', 18, 'Masculino', '', '', 'undefined', 'jorgeemanuelolivarescontreras@gmail.com', 'Jeoc.cf', '', 'X-force', 'Duplas HH escalados', 'Sierra Nevada', '2023-07-30', '10:00:00', 0),
(257, '7/30/2023, 10:04:03 AM', 'Marco Romero', '26175424', 25, 'Masculino', '', '', '04126594066', 'marcoromerov02@gmail.com', 'marcoromerov02', '', 'Faec-Gunzo', 'Duplas HH escalados', 'Cueva del Guacharo', '2023-07-30', '10:30:00', 0),
(258, '7/30/2023, 10:05:45 AM', 'Andreina Ramos ', '29731717', 21, 'Femenino', '', '', '04129974333', 'ramosmaita52@gmail.com ', 'Andreina1804', '', 'Meraki team ', 'Equipos novatos', 'Santos Luzardo', '2023-07-30', '10:30:00', 0),
(259, '7/30/2023, 10:08:08 AM', 'Fernando Espinoza ', '27910161', 23, 'Masculino', '', '', '04125474963', 'faec151299@gmail.com', 'Fer_1512', '', 'FAEC - GUNZO ', 'Duplas HH escalados', 'Yurubi', '2023-07-30', '10:30:00', 0),
(260, '7/30/2023, 10:10:23 AM', 'Andrea diaz ', '26175273', 29, 'Femenino', '', '', '04141678711', 'Andreadiazv@icloud.com', 'Andreavalnt', '', 'Zulia', 'Equipos escalados', 'Sierra Nevada', '2023-07-30', '10:30:00', 0),
(261, '7/30/2023, 10:13:51 AM', 'Igor Pagés ', '19925203', 33, 'Masculino', '', '', '04247308717', 'igorpages808@gmail.com', 'Igorikrdo ', '', 'Meraki team ', 'Equipos novatos', 'Cienagas del catatumbo', '2023-07-30', '10:30:00', 0),
(262, '7/30/2023, 10:17:46 AM', 'Robert osorio', '19511299', 32, 'Masculino', '', '', '04242445181', 'Robertosorio23@gmail.com ', 'undefined', '', 'El autobús de coche', 'Equipos novatos', 'Canaima', '2023-07-30', '10:30:00', 0),
(263, '7/30/2023, 10:19:43 AM', 'Eduardo Coronel ', '18179640', 36, 'Masculino', '', '', '04143437515', 'undefined', '@ejcr17', '', 'Team invictus', 'Duplas HH avanzados', 'Mochima', '2023-07-30', '10:30:00', 0),
(264, '7/30/2023, 10:23:33 AM', 'Jorge pildain', '19876728', 32, 'Masculino', '', '', '04120450934', 'aribel1406@gmail.com', 'ari.castillov_', '', 'Generación Killer', 'Equipos novatos', 'Mochima', '2023-07-30', '11:30:00', 0),
(265, '7/30/2023, 10:24:29 AM', 'Luis acosta', 'V25209271', 27, 'Masculino', '', '', '04126139684', 'Luisdavid1411@gmail.com', 'Luisdavid11', '', 'Acuad suicide ', 'Equipos novatos', 'Santos Luzardo', '2023-07-30', '11:00:00', 0),
(266, '7/30/2023, 10:24:39 AM', 'Génesis chaustre', '27659447', 23, 'Femenino', '', '', '04141296189', 'Chaustregenesis@gmail.com', 'Genesis29_chaustre', '', 'Misfits ', 'Equipos novatos', 'Canaima', '2023-07-30', '13:30:00', 0),
(267, '7/30/2023, 10:25:43 AM', 'Oscar Velazquez', '18991362', 34, 'Masculino', '', '', '04242133951', 'Oscaradolfov@outlook.com', 'Oscaradolfov', '', 'Los increíbles ', 'Equipos novatos', 'Cueva del Guacharo', '2023-07-30', '10:00:00', 0),
(268, '7/30/2023, 10:26:05 AM', 'Jesús madriz ', '21494584', 27, 'Masculino', '', '', '04123951702', 'Chaustregenesis@gmail.com', 'Iam.jesusmz ', '', 'Misfits ', 'Equipos novatos', 'Henri Pittier', '2023-07-30', '14:00:00', 0),
(269, '7/30/2023, 10:28:52 AM', 'Maolis', 'V16461122', 39, 'Femenino', '', '', '04149168359', 'Maolis1504@gmail.com', 'Maolis', '', 'Los increibles', 'Equipos novatos', 'Wuaraira_Repano', '2023-07-30', '10:30:00', 0),
(270, '7/30/2023, 10:29:43 AM', 'Cesar Rosillo', '19819559', 32, 'Masculino', '', '', '04142682682', 'crosillo91@gmail.com', '@cesarosillo', '', 'Inverted Burpees', 'Equipos novatos', 'Los Roques', '2023-07-30', '11:00:00', 0),
(271, '7/30/2023, 10:30:24 AM', 'Héctor pulido', 'V 15393779', 30, 'Masculino', '', '', '04124766119', 'Invictusboxvzla@gmail.com ', '@invictus_box', '', 'InvictusTeam', 'Duplas HH avanzados', 'Los Roques', '2023-07-30', '11:00:00', 0),
(272, '7/30/2023, 10:30:40 AM', 'Loira', 'V15019339', 42, 'Femenino', '', '', '04144274484', 'Loirabienesraices@gmail.com', 'Loirazahr', '', 'El resuelve ', 'Equipos novatos', 'Wuaraira_Repano', '2023-07-30', '10:00:00', 0),
(273, '7/30/2023, 10:30:42 AM', 'Nicole Allueva', 'V21616118', 31, 'undefined', '', '', '04241448578', 'Allueva.nicole@gmail.com', 'Nicoallueva', '', 'Jakemate', 'Equipos novatos', 'Mochima', '2023-07-30', '13:00:00', 0),
(274, '7/30/2023, 10:33:30 AM', 'Flor Ramos', '25741468', 27, 'Femenino', '', '', '04241818237', 'Ramosflor1725@gmail.com', 'Florramosm', '', 'Autobús de coche ', 'Equipos novatos', 'Wuaraira_Repano', '2023-07-30', '12:30:00', 0),
(275, '7/30/2023, 10:35:16 AM', 'Flor Ramos', '25741468', 27, 'Femenino', '', '', '04241818237', 'Ramosflor1725@gmail.com', 'Florramosm', '', 'El autobús de coche ', 'Equipos novatos', 'Santos Luzardo', '2023-07-30', '11:30:00', 0),
(276, '7/30/2023, 10:36:08 AM', 'Angeles Martinez ', '31448535', 16, 'Femenino', '', '', '‪+58 412‑2982883‬', 'angelesangulomartinez@gmail.com ', 'aangelesmartinez_ ', '', 'the little vikings', 'Equipos novatos', 'Cueva del Guacharo', '2023-07-30', '11:30:00', 0),
(277, '7/30/2023, 10:38:53 AM', 'Danny Misel ', '18042090', 35, 'Masculino', '', '', '04141043571', 'dannymisel999@gmail.com', 'Danny_misel', '', 'Centauros del caos', 'Duplas HH avanzados', 'Santos Luzardo', '2023-07-30', '10:00:00', 0),
(278, '7/30/2023, 10:39:50 AM', 'Luis Jose Morales ', 'V19516118', 34, 'Masculino', '', '', '04145867099', 'lljmbustillo@gmail.com', '@lulois_s', '', 'El Resuelve', 'Equipos novatos', 'Cueva del Guacharo', '2023-07-30', '11:00:00', 0),
(279, '7/30/2023, 10:44:07 AM', 'Sahia Perez', '25309825', 26, 'Femenino', '', '', '04246531049', 'sahiaperez@gmail.com ', 'sahiaperez@gmail.com', '', 'Rocket', 'Equipos novatos', 'Cienagas del catatumbo', '2023-07-30', '12:00:00', 0),
(280, '7/30/2023, 10:45:44 AM', 'Mariano Cedeño ', 'V27000208', 24, 'Masculino', '', '', '04120921540', 'Marianoace1206@gmail.com', 'marianoace', '', 'Rookie Evolution ', 'Equipos novatos', 'Wuaraira_Repano', '2023-07-30', '13:00:00', 0),
(281, '7/30/2023, 10:54:07 AM', 'Antonio', 'V18534903', 35, 'Masculino', '', '', '04241759144', 'antoniojcm1988@gmail.com', '@Antoniojcm1988', '', 'The Little vikings', 'Equipos novatos', 'Yurubi', '2023-07-30', '12:30:00', 0),
(282, '7/30/2023, 11:03:27 AM', 'Eduardo Farias', 'V15114447', 40, 'Masculino', '', '', '04241720882', 'Eduardofariascordero@gmail.com ', 'Eifc300', '', 'Costilla', 'Equipos escalados', 'Sierra Nevada', '2023-07-30', '12:00:00', 0),
(283, '7/30/2023, 11:11:31 AM', 'Christian Sifontes ', '19910742', 32, 'Masculino', '', '', '04129492840', 'cschristiiansi@gmail.com', '@christiian_ds', '', 'TEAM ORDAZ ', 'Equipos escalados', 'Santos Luzardo', '2023-07-30', '12:30:00', 0),
(284, '7/30/2023, 11:13:25 AM', 'Junior Duque', '19967668', 34, 'Masculino', '', '', '04245169461', 'Duquesvzla@gmail.com', 'Educandotucuerpo', '', 'Cervezas y burpees', 'Equipos novatos', 'Los Roques', '2023-07-30', '14:00:00', 0),
(285, '7/30/2023, 11:14:06 AM', 'Aranza Rosal ', '31872305', 16, 'Femenino', '', '', '4122424139', 'aranzaauxiliadorarosallarez@gmail.com', '@aranzarosal_', '', 'los increíbles ', 'Equipos novatos', 'Sierra Nevada', '2023-07-30', '12:30:00', 0),
(286, '7/30/2023, 11:14:15 AM', 'Luis Ruiz ', 'V17428251', 36, 'Masculino', '', '', '04241678999', 'Luisduff123@gmail.com', 'Capitanluisruiz ', '', 'Dgc machine', 'Equipos escalados', 'Cueva del Guacharo', '2023-07-30', '12:00:00', 0),
(287, '7/30/2023, 11:14:48 AM', 'Antonio jose laurentin mendez', '26899062', 25, 'Masculino', '', '', '04128801523', 'Antoniolaumen@gmail.com', '@ajlaurentin', '', 'Paralelo', 'Duplas HH avanzados', 'Sierra Nevada', '2023-07-30', '14:30:00', 0),
(288, '7/30/2023, 11:15:59 AM', 'Nolitza Colombo ', '19300339', 37, 'Femenino', '', '', '04265430042', 'nolitza2006@gmail.com', 'Nolitza colombo ', '', 'Cervezas & burpees ', 'Equipos novatos', 'Mochima', '2023-07-30', '14:30:00', 0),
(289, '7/30/2023, 11:18:07 AM', 'Daniella Noguera ', '16813000', 40, 'Femenino', '', '', '04145633658', 'daniellanoguera@gmail.com', 'daniellanoguera08', '', 'Rookie Evolution ', 'Equipos novatos', 'Cueva del Guacharo', '2023-07-30', '18:00:00', 0),
(290, '7/30/2023, 11:19:50 AM', 'Daniella Noguera ', 'V16813000', 40, 'Femenino', '', '', '04145633658', 'daniellanoguera@gmail.com', 'daniellanoguera08', '', 'Rookie Evolution ', 'Equipos novatos', 'Los Roques', '2023-07-30', '16:00:00', 0),
(291, '7/30/2023, 11:24:01 AM', 'José Ramón Rojas', 'undefined', 36, 'Masculino', '', '', '04248874083', 'rojas1903@gmail.com', 'Joseroja_199', '', 'Monster', 'Equipos novatos', 'Cienagas del catatumbo', '2023-07-30', '13:30:00', 0),
(292, '7/30/2023, 11:25:32 AM', 'Marilibia Bruguera Machado', 'V10478557', 52, 'Femenino', '', '', '04142639305', 'marilibiabruguera@gmail.com', 'marilibiabruguera@gmail.com', '', 'Roast to Rx', 'Duplas HM supermaster', 'Yurubi', '2023-07-30', '13:00:00', 0),
(293, '7/30/2023, 11:31:02 AM', 'Jesús Portillo ', '26318895', 25, 'Masculino', '', '', '04126404627', 'Jepsportillo@gmail.com', 'undefined', '', 'Zulia ', 'Equipos escalados', 'Cueva del Guacharo', '2023-07-30', '14:00:00', 0),
(294, '7/30/2023, 11:32:23 AM', 'Jose Rosal', '17146626', 37, 'Masculino', '', '', '04241297218', 'Joanropi19@gmail.com', 'Ja.rosal', '', 'Jaque Mate', 'Equipos supermaster', 'Canaima', '2023-07-30', '14:00:00', 0),
(295, '7/30/2023, 11:40:48 AM', 'Alejandro Jota', '30061101', 20, 'Masculino', '', '', '04120965234', 'alejandro.jota12@gmail.com', 'Alejandro jota', '', 'Strongblackforce', 'Equipos novatos', 'Santos Luzardo', '2023-07-30', '14:30:00', 0),
(296, '7/30/2023, 11:40:49 AM', 'Miguel Alejandro diaz castillo ', '29926736', 20, 'Masculino', '', '', '04146192282', 'Diazmg200@gmail.com', '_migueldz', '', 'Zulia', 'Equipos escalados', 'Cueva del Guacharo', '2023-07-30', '15:00:00', 0),
(297, '7/30/2023, 11:46:13 AM', 'Andrea diaz', '26175273', 29, 'Femenino', '', '', '04141678711', 'Andreadiazv@icloud.com', 'Andreavalnt', '', 'Zulia ', 'Equipos escalados', 'Yurubi', '2023-07-30', '14:30:00', 0),
(298, '7/30/2023, 11:46:26 AM', 'Dayana', '17281588', 36, 'Femenino', '', '', '04246206965', 'Dayanacacasilla@gmail.com', 'undefined', '', 'Maracaibo', 'Equipos supermaster', 'Cienagas del catatumbo', '2023-07-30', '14:00:00', 0),
(299, '7/30/2023, 11:55:25 AM', 'Daniela castillo', '32746325', 15, 'Femenino', '', '', '04120450955', 'Daniv161107@gmail.com', 'Dani.castillo16_', '', 'Generación fire', 'Equipos novatos', 'Cueva del Guacharo', '2023-07-30', '15:30:00', 0),
(300, '7/30/2023, 11:59:29 AM', 'Diego Garcia', '27261784', 23, 'Masculino', '', '', '04127959809', 'diegowagner2000@gmail.com', 'dgsrcia', '', 'el resuelve', 'Equipos novatos', 'Canaima', '2023-07-30', '15:00:00', 0),
(301, '7/30/2023, 12:01:07 PM', 'Jonay', '30541709', 18, 'Masculino', '', '', '4120637176', 'andresgonspi@gmail.com', 'jonaygonzalezz ', '', 'Puro pinchos ', 'Equipos escalados', 'Mochima', '2023-07-30', '15:30:00', 0),
(302, '7/30/2023, 12:02:26 PM', 'Jehan Guillen', '26610370', 24, 'Masculino', '', '', '04242227427', 'Jehan.guillen23@gmail.com', '@jehansito', '', 'Puro pincho', 'undefined', 'Mochima', '2023-07-30', '16:00:00', 0),
(303, '7/30/2023, 12:02:55 PM', 'Jesús López ', 'V14828868', 43, 'Masculino', '', '', '04262851844', 'jesusrlopezm@gmail.com', '@jessuas34', '', 'Generación fire ', 'Equipos novatos', 'Henri Pittier', '2023-07-30', '09:00:00', 0),
(304, '7/30/2023, 12:03:45 PM', 'Bryan gomes ', 'V18304117', 34, 'undefined', '', '', '04121900002', 'Bgv129@gmail.com', 'Bryangomes', '', 'Khaos ', 'Equipos escalados', 'Henri Pittier', '2023-07-30', '15:00:00', 0),
(305, '7/30/2023, 12:05:03 PM', 'Ricardo mesa ', 'V17287704', 39, 'Prefiero no decirlo', '', '', '04122719972', 'Ricardomefe@gmail.com', 'Mefe01', '', 'Khaos ', 'Equipos escalados', 'Wuaraira_Repano', '2023-07-30', '14:30:00', 0),
(306, '7/30/2023, 12:13:13 PM', 'Jhon Jader ', '23715121', 29, 'Masculino', '', '', '04246997773', 'jaderruiz66@gmail.com', '@jader_jcr', '', 'BlueHydra', 'Duplas HH avanzados', 'Sierra Nevada', '2023-07-30', '15:30:00', 0),
(307, '7/30/2023, 12:20:34 PM', 'Maylin', '18276334', 34, 'Femenino', '', '', '04129534167', 'Maylingm28@hotmail.com', 'Maylindagm28', '', 'Mars', 'Equipos escalados', 'Santos Luzardo', '2023-07-30', '15:30:00', 0),
(308, '7/30/2023, 12:29:28 PM', 'Mauricio Quintero', '30053601', 20, 'Masculino', '', '', '04244225928', 'Mauricioaqdl@gmail.com', 'Mauricioaqdl', '', 'Black Clover ', 'Equipos escalados', 'Canaima', '2023-07-30', '16:30:00', 0),
(309, '7/30/2023, 12:37:03 PM', 'Karla Gatti', '24567062', 27, 'Femenino', '', '', '04245506826', 'karlagatti09@gmail.com', 'karlagattic', '', 'Cervezas & Burpees', 'Equipos novatos', 'Cienagas del catatumbo', '2023-07-30', '15:00:00', 0),
(310, '7/30/2023, 12:42:27 PM', 'Gitanyaly', '24203441', 28, 'Femenino', '', '', '04241732324', 'jaimesgitanyaly@gmail.com', '@gitanyalyjaimes', '', 'Free riders ', 'Equipos escalados', 'Canaima', '2023-07-30', '15:30:00', 0),
(311, '7/30/2023, 12:43:25 PM', 'Relihannys sanchez', '29906841', 21, 'Femenino', '', '', '04249108286', 'Srelihannys@gmail.com', 'Rhhsanchez', '', 'Pegasus power ', 'Equipos avanzados', 'Mochima', '2023-07-30', '16:30:00', 0),
(312, '7/30/2023, 12:59:00 PM', 'Makys deftereos', '16298103', 38, 'Masculino', '', '', '04146328650', 'Makys2111@hotmail.com', '21md21', '', 'Maracaibo', 'Equipos supermaster', 'Los Roques', '2023-07-30', '16:30:00', 0),
(313, '7/30/2023, 1:06:20 PM', 'Rubén arias', '24954618', 26, 'Masculino', '', '', '04246608026', 'rralessandra.aa@gmail.com', 'Rubenalessandro_', '', 'San Luis ihum', 'Trios mixtos', 'Henri Pittier', '2023-07-30', '15:30:00', 0),
(314, '7/30/2023, 1:11:10 PM', 'Janet Torre', '25038033', 29, 'Femenino', '', '', '04129616601', 'Torre.janet@gmail.com', 'Torrejanet', '', 'Monster INC', 'Equipos novatos', 'Sierra Nevada', '2023-07-30', '16:00:00', 0),
(315, '7/30/2023, 1:16:29 PM', 'Sahia Perez', '25309825', 26, 'Femenino', '', '', '04246531049', 'sahiaperez@gmail.com', 'sahiaperez@gmail.com', '', 'Rocket ', 'Equipos novatos', 'Santos Luzardo', '2023-07-30', '16:00:00', 0),
(316, '7/30/2023, 1:18:24 PM', 'Francisco salas', '26751874', 28, 'Masculino', '', '', '04121800622', 'franciscosalas090595@gmail.com', '@fransalas0905', '', 'Eagle', 'Trios mixtos', 'Los Roques', '2023-07-30', '15:30:00', 0),
(317, '7/30/2023, 1:24:20 PM', 'Gabriel Maldonado ', 'V27903774', 22, 'Masculino', '', '', '4140220542', 'maldonado.Gabriel.2001@gmail.com', '@maldonadogad', '', 'THE LAST CALL', 'Equipos novatos', 'Wuaraira_Repano', '2023-07-30', '15:30:00', 0),
(318, '7/30/2023, 1:30:37 PM', 'José Rafael Quintana ', 'V25367355', 28, 'Masculino', '', '', '04143988510', 'jrquintana77@gmail.com', 'Jrquintanagram', '', 'D-GENERATION ', 'Duplas HH escalados', 'Canaima', '2023-07-30', '16:00:00', 0),
(319, '7/30/2023, 1:31:50 PM', 'Eduinker Mendoza ', 'V31761700', 18, 'Masculino', '', '', '04142171299', 'eduinker12@gmail.com', 'eduinker12', '', 'D-GENERATION ', 'Duplas HH escalados', 'Cienagas del catatumbo', '2023-07-30', '15:30:00', 0),
(320, '7/30/2023, 1:44:50 PM', 'Susana villarroel', '16006181', 40, 'Femenino', '', '', '04242101495', 'Susanadvill@gmail.com', 'Su_villarroel', '', 'Mars ', 'Equipos escalados', 'Wuaraira_Repano', '2023-07-30', '16:00:00', 0),
(321, '7/30/2023, 2:06:25 PM', 'David castillo', '27738225', 25, 'Masculino', '', '', '04245552444', 'Dalejandrocastillo1998@gmail.com', 'David_cadt', '', 'In2u', 'Equipos avanzados', 'Sierra Nevada', '2023-07-30', '16:30:00', 0),
(322, '7/30/2023, 2:09:54 PM', 'Gerardo colmenares ', 'V14872247', 41, 'Masculino', '', '', '04147208747', 'Gerardo_3981@hotmail.com ', '@circuitgym', '', 'Guerreross del wod', 'Duplas HM supermaster', 'Sierra Nevada', '2023-07-30', '17:00:00', 0),
(323, '7/30/2023, 2:10:34 PM', 'Jesús Angulo ', '26371413', 25, 'Masculino', '', '', '04247449607', 'Jaap.jch@gmail.com', 'Jesusangulop', '', 'Ape-hydra', 'Duplas HH escalados', 'Henri Pittier', '2023-07-30', '16:00:00', 0),
(324, '7/30/2023, 2:11:30 PM', 'Sheyla Veronica', '16413911', 38, 'Femenino', '', '', '04141248065', 's_homsi@hotmail.com', 'Sheyla_homsi', '', 'Free Riders ', 'Equipos escalados', 'Cueva del Guacharo', '2023-07-30', '16:00:00', 0),
(325, '7/30/2023, 2:30:23 PM', 'Juan Mejía ', '30176607', 21, 'Masculino', '', '', '04245944621', 'Juanmejialiscano02@gmail.com', 'Juanmeejia', '', 'Madbear team', 'Duplas HH escalados', 'Wuaraira_Repano', '2023-07-30', '16:30:00', 0),
(326, '7/30/2023, 2:31:47 PM', 'Juan mejia', '30176607', 21, 'Masculino', '', '', '04245944621', 'Juanmejiliscano02@gmail.com', 'Juanmeejia', '', 'Madbear team', 'Duplas HH escalados', 'Cienagas del catatumbo', '2023-07-30', '16:30:00', 0),
(327, '7/30/2023, 2:34:07 PM', 'Kevin silva', 'V23640826', 29, 'Masculino', '', '', '04123784327', 'Kevinsilv1993@gmail.com', 'Kev_93', '', 'California', 'Duplas HH avanzados', 'Santos Luzardo', '2023-07-30', '16:30:00', 0),
(328, '7/30/2023, 2:37:14 PM', 'Kenny soto', 'V19500461', 32, 'Masculino', '', '', '04241256667', 'ksoto051090@gmail.com', 'Kennysotoh', '', 'GYMIONS ', 'Duplas HH escalados', 'Sierra Nevada', '2023-07-30', '17:30:00', 0),
(329, '7/30/2023, 2:48:27 PM', 'Jorge Emanuel ', '31017208', 18, 'Masculino', '', '', '0424-6825776', 'jorgeemanuelolivarescontreras@gmail.com', 'Jeoc.cf', '', 'X-force', 'Duplas HH escalados', 'Los Roques', '2023-07-30', '15:00:00', 0),
(330, '7/30/2023, 2:49:09 PM', 'Manuel Millan ', 'V1383319', 51, 'Masculino', '', '', '04242805513', 'osmeiri.salazar@gmail.com', '@mcmillan', '', 'Speckbulls', 'Equipos supermaster', 'Los Roques', '2023-07-30', '15:00:00', 0),
(331, '7/30/2023, 2:50:09 PM', 'Crolina gonzalez ', '12756608', 46, 'Femenino', '', '', '04244977629', 'Monkygb@hotmail.com', 'Carolina77', '', 'Master adeson', 'Duplas HM supermaster', 'Henri Pittier', '2023-07-30', '16:30:00', 0),
(332, '7/30/2023, 2:56:30 PM', 'Alejandro Jota', '30061101', 20, 'Masculino', '', '', '04120965234', 'alejandro.jota12@gmail.com', 'Alejandro jota', '', 'Strong', 'Equipos novatos', 'Henri Pittier', '2023-07-30', '17:00:00', 0),
(333, '7/30/2023, 3:04:09 PM', 'Daniel Mijares', 'V26489501', 25, 'Masculino', '', '', '04126367139', 'danielmijaresc@gmail.com', 'Daniel_mi17', '', 'Speck Pork', 'Duplas HH avanzados', 'Wuaraira_Repano', '2023-07-30', '17:00:00', 0),
(334, '7/30/2023, 3:06:49 PM', 'Orlays castilla', '27242562', 23, 'Masculino', '', '', '0412-4316398', 'Orlaysc@gmail.com', 'Orlaysc7', '', 'Paralelo', 'Duplas HH avanzados', 'Mochima', '2023-07-30', '09:30:00', 0),
(335, '7/30/2023, 3:11:53 PM', 'Leniad', '20792403', 31, 'Masculino', '', '', '04129995933', 'irwinrivas0514@gmail.com', 'lebiad148', '', 'team California ', 'Duplas HH avanzados', 'Henri Pittier', '2023-07-30', '07:30:00', 0),
(336, '7/30/2023, 3:29:45 PM', 'Pedro Medina', 'V20537070', 32, 'Masculino', '', '', '04123597475', 'pedromedina09@gmail.com', 'pedro.medinadiaz', '', 'Rookie Evolution ', 'Equipos novatos', 'Sierra Nevada', '2023-07-30', '18:00:00', 0),
(337, '7/30/2023, 3:44:28 PM', 'Fernando Espinoza ', '27910161', 23, 'Masculino', '', '', '04125474963', 'faec151299@gmail.com', 'Fer_1512', '', 'FAEC - GUNZO ', 'Duplas HH escalados', 'Yurubi', '2023-07-30', '16:00:00', 0),
(338, '7/30/2023, 3:47:39 PM', 'Marco romero', '26175424', 24, 'Masculino', '', '', '04126594066', 'marcoromerov02@gmail.com', 'marcoromerov02', '', 'FAEC - GUNZO ', 'Duplas HH escalados', 'Yurubi', '2023-07-30', '16:30:00', 0),
(339, '7/30/2023, 4:01:55 PM', 'Kleiner Toloza ', '28532873', 20, 'Masculino', '', '', '04247076812', 'kleiner250802@gmail.com', 'Kleiner_Aleman', '', 'Elite’s team ', 'Equipos escalados', 'Yurubi', '2023-07-30', '17:00:00', 0),
(340, '7/30/2023, 4:29:06 PM', 'jerson ochoa ', '22914725', 29, 'Masculino', '', '', '04241518373', 'jerson8a24@gmail.com ', 'jerson8a ', '', 'Meraki team ', 'Equipos novatos', 'Cueva del Guacharo', '2023-07-30', '16:30:00', 0),
(341, '7/30/2023, 4:30:48 PM', 'Daniel Moreno ', 'V17692941', 35, 'Masculino', '', '', '04241091465', 'danielemorenobere@gmail.com', 'morenodaniel3 ', '', 'Monster', 'Equipos novatos', 'Yurubi', '2023-07-30', '17:30:00', 0),
(342, '7/30/2023, 4:43:44 PM', 'Juan Vargas ', 'V18698786', 34, 'Masculino', '', '', '0424-1386463 ', 'Juanf.vargasp@gmail.com ', 'Asilovepalomo', '', 'Speck pork', 'Duplas HH avanzados', 'Canaima', '2023-07-30', '17:00:00', 0),
(343, '7/30/2023, 5:22:01 PM', 'Daniela castillo', '32746325', 15, 'Femenino', '', '', '04120450955', 'Daniv161107@gmail.com', 'Dani.castillo16_', '', 'Generación fire', 'Equipos novatos', 'Wuaraira_Repano', '2023-07-30', '18:00:00', 0),
(344, '7/30/2023, 5:27:58 PM', 'Miguel Alejandro diaz castillo ', '29926736', 20, 'Masculino', '', '', '04146192282', 'Diazmg200@gmail.com', '_migueldz', '', 'Zulia ', 'Equipos escalados', 'Cueva del Guacharo', '2023-07-30', '18:30:00', 0),
(345, '7/30/2023, 5:31:25 PM', 'Cristóbal Felipe Adames Marcano', '27943264', 22, 'Masculino', '', '', 'undefined', 'cristobal27adames@gmail.com', 'adamescristobal', '', 'Croptop fitnes', 'Duplas HH avanzados', 'Sierra Nevada', '2023-07-30', '18:30:00', 0),
(346, '7/30/2023, 5:32:06 PM', 'diego garcia', '27261784', 23, 'Masculino', '', '', '04127959809', 'diegowagner2000@gmail.com', 'diego', '', 'el resuelve ', 'Equipos novatos', 'Yurubi', '2023-07-30', '18:00:00', 0),
(347, '7/30/2023, 5:59:03 PM', 'Daniela castillo', '32746325', 15, 'Femenino', '', '', '04120450955', 'Daniv161107@gmail.com', 'Dani.castillo16_', '', 'Generación fire', 'Equipos novatos', 'Los Roques', '2023-07-30', '18:00:00', 0),
(348, '7/30/2023, 6:00:47 PM', 'Daniela castillo', '32746325', 15, 'Femenino', '', '', '04120450955', 'Daniv161107@gmail.com', 'Dani.castillo16_', '', 'Generación fire', 'Equipos novatos', 'Santos Luzardo', '2023-07-30', '18:00:00', 0),
(349, '7/30/2023, 6:08:40 PM', 'Greixis ', '28352110', 26, 'Femenino', '', '', '04243055058', 'greixis.azacon@gmail.com', 'Grey.regnautl', '', 'Element ', 'Equipos novatos', 'Los Roques', '2023-07-30', '17:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `estaciones`
--

CREATE TABLE `estaciones` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `estatus` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `estaciones`
--

INSERT INTO `estaciones` (`id`, `descripcion`, `estatus`) VALUES
(1, 'Canaima', 'activo'),
(2, 'Cienagas del Catatumbo', 'activo'),
(3, 'Cueva del Guacharo', 'activo'),
(4, 'Henri Pittier', 'activo'),
(5, 'Los Roques', 'activo'),
(6, 'Mochima', 'activo'),
(7, 'Santos Luzardo', 'activo'),
(8, 'Sierra Nevada', 'activo'),
(9, 'Yurubi', 'activo'),
(10, 'Wuaraira Repano', 'activo');

-- --------------------------------------------------------

--
-- Table structure for table `eventos`
--

CREATE TABLE `eventos` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `fecha_ini` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `estatus` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `eventos`
--

INSERT INTO `eventos` (`id`, `descripcion`, `fecha_ini`, `fecha_fin`, `estatus`) VALUES
(1, 'Test event', '2023-01-01', '2023-01-02', 'inactivo'),
(2, 'Weekend Fest2023', '2023-09-09', '2023-09-10', 'activo');

-- --------------------------------------------------------

--
-- Table structure for table `horarios`
--

CREATE TABLE `horarios` (
  `id` int(11) NOT NULL,
  `hora` time NOT NULL,
  `estatus` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `horarios`
--

INSERT INTO `horarios` (`id`, `hora`, `estatus`) VALUES
(1, '07:30:00', 'activo'),
(2, '08:00:00', 'activo'),
(3, '08:30:00', 'activo'),
(4, '09:00:00', 'activo'),
(5, '09:30:00', 'activo'),
(6, '10:00:00', 'activo'),
(7, '10:30:00', 'activo'),
(8, '11:00:00', 'activo'),
(9, '11:30:00', 'activo'),
(10, '12:00:00', 'activo'),
(11, '12:30:00', 'activo'),
(12, '13:00:00', 'activo'),
(13, '13:30:00', 'activo'),
(14, '14:00:00', 'activo'),
(15, '14:30:00', 'activo'),
(16, '15:00:00', 'activo'),
(17, '15:30:00', 'activo'),
(18, '16:00:00', 'activo'),
(19, '16:30:00', 'activo'),
(20, '17:00:00', 'activo'),
(21, '17:30:00', 'activo'),
(22, '18:00:00', 'activo'),
(23, '18:30:00', 'activo'),
(24, '19:00:00', 'activo'),
(25, '19:30:00', 'activo');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agenda`
--
ALTER TABLE `agenda`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `estaciones`
--
ALTER TABLE `estaciones`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `eventos`
--
ALTER TABLE `eventos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `horarios`
--
ALTER TABLE `horarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agenda`
--
ALTER TABLE `agenda`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=350;

--
-- AUTO_INCREMENT for table `estaciones`
--
ALTER TABLE `estaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `eventos`
--
ALTER TABLE `eventos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `horarios`
--
ALTER TABLE `horarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

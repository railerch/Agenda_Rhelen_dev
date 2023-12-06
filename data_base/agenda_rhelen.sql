-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-12-2023 a las 21:13:35
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `agenda_rhelen_dev`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `agenda`
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
  `disciplina` varchar(100) NOT NULL,
  `categoria` varchar(50) NOT NULL,
  `equipo` varchar(50) NOT NULL,
  `estacion` varchar(50) NOT NULL,
  `fecha_cita` date NOT NULL,
  `hora_cita` time NOT NULL,
  `concluida` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `descansos`
--

CREATE TABLE `descansos` (
  `id` int(10) UNSIGNED NOT NULL,
  `estacion` varchar(100) NOT NULL,
  `evento` varchar(100) NOT NULL,
  `desde` time NOT NULL,
  `hasta` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estaciones`
--

CREATE TABLE `estaciones` (
  `id` int(10) UNSIGNED NOT NULL,
  `descripcion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `estaciones`
--

INSERT INTO `estaciones` (`id`, `descripcion`) VALUES
(1, 'Canaima'),
(2, 'Cienagas del Catatumbo'),
(3, 'Cueva del Guacharo'),
(4, 'Henri Pittier'),
(5, 'Los Roques'),
(6, 'Mochima'),
(7, 'Salto Angel (piscina)'),
(8, 'Salto Aponguao (piscina)'),
(9, 'Salto El Sapo (piscina)'),
(10, 'Salto Yurani (piscina)'),
(11, 'Santos Luzardo'),
(12, 'Sierra Nevada'),
(13, 'Wuaraira Repano'),
(14, 'Yurubi');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eventos`
--

CREATE TABLE `eventos` (
  `descripcion` varchar(100) NOT NULL,
  `fecha_ini` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `hora_inicio` time NOT NULL DEFAULT '00:00:00',
  `hora_cierre` time NOT NULL DEFAULT '00:00:00',
  `estaciones` varchar(100) DEFAULT NULL,
  `estatus` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horarios`
--

CREATE TABLE `horarios` (
  `id` int(11) NOT NULL,
  `hora` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `horarios`
--

INSERT INTO `horarios` (`id`, `hora`) VALUES
(1, '07:30:00'),
(2, '08:00:00'),
(3, '08:30:00'),
(4, '09:00:00'),
(5, '09:30:00'),
(6, '10:00:00'),
(7, '10:30:00'),
(8, '11:00:00'),
(9, '11:30:00'),
(10, '12:00:00'),
(11, '12:30:00'),
(12, '13:00:00'),
(13, '13:30:00'),
(14, '14:00:00'),
(15, '14:30:00'),
(16, '15:00:00'),
(17, '15:30:00'),
(18, '16:00:00'),
(19, '16:30:00'),
(20, '17:00:00'),
(21, '17:30:00'),
(22, '18:00:00'),
(23, '18:30:00'),
(24, '19:00:00'),
(25, '19:30:00'),
(26, '20:00:00'),
(27, '20:30:00'),
(28, '21:00:00'),
(29, '21:30:00'),
(30, '22:00:00'),
(31, '22:30:00'),
(32, '23:00:00'),
(33, '23:30:00'),
(34, '00:00:00'),
(35, '00:30:00'),
(36, '01:00:00'),
(37, '01:30:00'),
(38, '02:00:00'),
(39, '02:30:00'),
(40, '03:00:00'),
(41, '03:30:00'),
(42, '04:00:00'),
(43, '04:30:00'),
(44, '05:00:00'),
(45, '05:30:00'),
(46, '06:00:00'),
(47, '06:30:00'),
(48, '07:00:00');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `agenda`
--
ALTER TABLE `agenda`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `descansos`
--
ALTER TABLE `descansos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `estaciones`
--
ALTER TABLE `estaciones`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `descripcion` (`descripcion`);

--
-- Indices de la tabla `horarios`
--
ALTER TABLE `horarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `agenda`
--
ALTER TABLE `agenda`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `descansos`
--
ALTER TABLE `descansos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estaciones`
--
ALTER TABLE `estaciones`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `horarios`
--
ALTER TABLE `horarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

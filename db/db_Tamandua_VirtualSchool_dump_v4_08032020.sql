-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 08-03-2020 a las 01:19:49
-- Versión del servidor: 5.6.45
-- Versión de PHP: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_Tamandua_VirtualSchool`
--
CREATE DATABASE IF NOT EXISTS `db_Tamandua_VirtualSchool` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `db_Tamandua_VirtualSchool`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Grado`
--

DROP TABLE IF EXISTS `Grado`;
CREATE TABLE `Grado` (
  `id_grado` int(11) NOT NULL,
  `descripcion` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `Grado`
--

INSERT INTO `Grado` (`id_grado`, `descripcion`) VALUES
(1, 'Primero'),
(2, 'Segundo'),
(3, 'Tercero'),
(4, 'Cuarto'),
(5, 'Quinto'),
(6, 'Sexto'),
(7, 'Docente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Grado_Orientacion`
--

DROP TABLE IF EXISTS `Grado_Orientacion`;
CREATE TABLE `Grado_Orientacion` (
  `id_grado` int(11) NOT NULL,
  `id_orientacion` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Material`
--

DROP TABLE IF EXISTS `Material`;
CREATE TABLE `Material` (
  `id_material` int(11) NOT NULL,
  `id_tipo` int(11) NOT NULL,
  `id_grado` int(11) NOT NULL,
  `id_plan` int(11) NOT NULL,
  `Path` text,
  `Url` text,
  `estado` tinyint(1) NOT NULL,
  `fec_reg` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Perfil`
--

DROP TABLE IF EXISTS `Perfil`;
CREATE TABLE `Perfil` (
  `id_perfil` int(11) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `Perfil`
--

INSERT INTO `Perfil` (`id_perfil`, `descripcion`) VALUES
(1, 'Administrador'),
(2, 'Editor'),
(3, 'Curador'),
(4, 'Usuario'),
(5, 'Invitado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Permisos`
--

DROP TABLE IF EXISTS `Permisos`;
CREATE TABLE `Permisos` (
  `id_permisos` int(11) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Per_Per`
--

DROP TABLE IF EXISTS `Per_Per`;
CREATE TABLE `Per_Per` (
  `id_perfil` int(11) NOT NULL,
  `id_permisos` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Plan_academico`
--

DROP TABLE IF EXISTS `Plan_academico`;
CREATE TABLE `Plan_academico` (
  `id_plan` int(11) NOT NULL,
  `descripcion` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Tipo_material`
--

DROP TABLE IF EXISTS `Tipo_material`;
CREATE TABLE `Tipo_material` (
  `id_tipo` int(11) NOT NULL,
  `editable` tinyint(1) DEFAULT NULL,
  `downloadable` tinyint(1) DEFAULT NULL,
  `descripcion` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Usuario`
--

DROP TABLE IF EXISTS `Usuario`;
CREATE TABLE `Usuario` (
  `id_usuario` int(11) NOT NULL,
  `id_perfil` int(11) NOT NULL,
  `id_grado` int(11) NOT NULL,
  `nombre` text NOT NULL,
  `mail` text NOT NULL,
  `celular` int(11) DEFAULT NULL,
  `fec_alta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Usu_material`
--

DROP TABLE IF EXISTS `Usu_material`;
CREATE TABLE `Usu_material` (
  `id_usuario` int(11) NOT NULL,
  `id_material` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Grado`
--
ALTER TABLE `Grado`
  ADD PRIMARY KEY (`id_grado`);

--
-- Indices de la tabla `Material`
--
ALTER TABLE `Material`
  ADD PRIMARY KEY (`id_material`);

--
-- Indices de la tabla `Perfil`
--
ALTER TABLE `Perfil`
  ADD PRIMARY KEY (`id_perfil`);

--
-- Indices de la tabla `Permisos`
--
ALTER TABLE `Permisos`
  ADD PRIMARY KEY (`id_permisos`);

--
-- Indices de la tabla `Plan_academico`
--
ALTER TABLE `Plan_academico`
  ADD PRIMARY KEY (`id_plan`);

--
-- Indices de la tabla `Tipo_material`
--
ALTER TABLE `Tipo_material`
  ADD PRIMARY KEY (`id_tipo`);

--
-- Indices de la tabla `Usuario`
--
ALTER TABLE `Usuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `Usuario`
--
ALTER TABLE `Usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

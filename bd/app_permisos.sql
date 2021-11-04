-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-10-2021 a las 14:03:56
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.2.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `app_permisos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrera`
--

CREATE TABLE `carrera` (
  `idcarrera` int(10) UNSIGNED NOT NULL,
  `tx_carrera` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `carrera`
--

INSERT INTO `carrera` (`idcarrera`, `tx_carrera`) VALUES
(1, 'IDGS'),
(2, 'Turismo'),
(3, 'CONTA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ctg_tipousuario`
--

CREATE TABLE `ctg_tipousuario` (
  `idctg_tipousuario` int(10) UNSIGNED NOT NULL,
  `tx_tipousuario` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ctg_tipousuario`
--

INSERT INTO `ctg_tipousuario` (`idctg_tipousuario`, `tx_tipousuario`) VALUES
(1, 1),
(2, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuatrimestre`
--

CREATE TABLE `cuatrimestre` (
  `idcuatrimestre` int(10) UNSIGNED NOT NULL,
  `tx_cuatrimestre` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cuatrimestre`
--

INSERT INTO `cuatrimestre` (`idcuatrimestre`, `tx_cuatrimestre`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo`
--

CREATE TABLE `grupo` (
  `idgrupo` int(10) UNSIGNED NOT NULL,
  `tx_grupo` varchar(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `grupo`
--

INSERT INTO `grupo` (`idgrupo`, `tx_grupo`) VALUES
(1, 'a'),
(2, 'B'),
(3, 'C'),
(4, 'D'),
(5, 'E');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitudpermiso`
--

CREATE TABLE `solicitudpermiso` (
  `idsolicitudpermiso` int(10) UNSIGNED NOT NULL,
  `tx_tipopermiso` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `solicitudpermiso`
--

INSERT INTO `solicitudpermiso` (`idsolicitudpermiso`, `tx_tipopermiso`) VALUES
(1, 'un dia'),
(2, 'especial');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitudpermiso_tbl_user`
--

CREATE TABLE `solicitudpermiso_tbl_user` (
  `solicitudpermiso_idsolicitudpermiso` int(10) UNSIGNED NOT NULL,
  `tbl_user_idtbl_user` int(10) UNSIGNED NOT NULL,
  `dt_permiso` datetime DEFAULT NULL,
  `status_permiso_idstatus_permiso` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `solicitudpermiso_tbl_user`
--

INSERT INTO `solicitudpermiso_tbl_user` (`solicitudpermiso_idsolicitudpermiso`, `tbl_user_idtbl_user`, `dt_permiso`, `status_permiso_idstatus_permiso`) VALUES
(1, 1, '0000-00-00 00:00:00', 2),
(1, 5, NULL, 2),
(2, 6, NULL, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `status_permiso`
--

CREATE TABLE `status_permiso` (
  `idstatus_permiso` int(10) UNSIGNED NOT NULL,
  `tx_statuspermiso` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `status_permiso`
--

INSERT INTO `status_permiso` (`idstatus_permiso`, `tx_statuspermiso`) VALUES
(1, 'Confirmado'),
(2, 'Pendiente'),
(3, 'Rechazado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_user`
--

CREATE TABLE `tbl_user` (
  `idtbl_user` int(10) UNSIGNED NOT NULL,
  `matriculauser` bigint(20) DEFAULT NULL,
  `tx_nombreuser` varchar(45) NOT NULL,
  `tx_appaterno` varchar(45) DEFAULT NULL,
  `tx_apmaterno` varchar(45) DEFAULT NULL,
  `tx_username` varchar(45) DEFAULT NULL,
  `tx_password` varchar(45) DEFAULT NULL,
  `ctg_tipousuario_idctg_tipousuario` int(10) UNSIGNED NOT NULL,
  `carrera_idcarrera` int(10) UNSIGNED NOT NULL,
  `cuatrimestre_idcuatrimestre` int(10) UNSIGNED NOT NULL,
  `grupo_idgrupo` int(10) UNSIGNED NOT NULL,
  `dt_registro` datetime DEFAULT NULL,
  `tutor` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_user`
--

INSERT INTO `tbl_user` (`idtbl_user`, `matriculauser`, `tx_nombreuser`, `tx_appaterno`, `tx_apmaterno`, `tx_username`, `tx_password`, `ctg_tipousuario_idctg_tipousuario`, `carrera_idcarrera`, `cuatrimestre_idcuatrimestre`, `grupo_idgrupo`, `dt_registro`, `tutor`) VALUES
(1, 91811019, 'Kevin', 'Mazariegos', 'Gómez', 'keed', '123', 1, 1, 1, 1, '2021-07-13 19:13:38', 'kimu'),
(2, NULL, 'Hector', 'Herrera', 'Escobar', 'Kronux', '123456789', 2, 1, 10, 1, '2021-07-13 23:09:37', '0'),
(5, 918110923, 'Jose Luis', 'solorzano', 'lopez', 'jose', '12345678', 1, 1, 1, 1, '2021-07-22 17:37:50', 'kimu'),
(6, 91811025, 'irvin', 'muños', 'jimenez', '123456789', 'iriom', 1, 1, 2, 1, '2021-07-12 23:33:52', '0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tutor`
--

CREATE TABLE `tutor` (
  `id_cedula` int(10) UNSIGNED NOT NULL,
  `cedula` varchar(50) DEFAULT '0',
  `tx_nombreuser` varchar(50) DEFAULT '0',
  `tx_appaterno` varchar(50) DEFAULT '0',
  `tx_apmaterno` varchar(50) DEFAULT '0',
  `tx_username` varchar(50) DEFAULT '0',
  `tx_password` varchar(50) DEFAULT '0',
  `ctg_tipousuario_idctg_tipousuario` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `carrera_idcarrera` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `cuatrimestre_idcuatrimestre` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `grupo_idgrupo` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `dt_registro` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tutor`
--

INSERT INTO `tutor` (`id_cedula`, `cedula`, `tx_nombreuser`, `tx_appaterno`, `tx_apmaterno`, `tx_username`, `tx_password`, `ctg_tipousuario_idctg_tipousuario`, `carrera_idcarrera`, `cuatrimestre_idcuatrimestre`, `grupo_idgrupo`, `dt_registro`) VALUES
(5, 'kimu', 'kimu', 'kjk', 'jj', 'kimu', '123456', 2, 1, 1, 1, '2021-10-03 13:53:07');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carrera`
--
ALTER TABLE `carrera`
  ADD PRIMARY KEY (`idcarrera`);

--
-- Indices de la tabla `ctg_tipousuario`
--
ALTER TABLE `ctg_tipousuario`
  ADD PRIMARY KEY (`idctg_tipousuario`);

--
-- Indices de la tabla `cuatrimestre`
--
ALTER TABLE `cuatrimestre`
  ADD PRIMARY KEY (`idcuatrimestre`);

--
-- Indices de la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD PRIMARY KEY (`idgrupo`);

--
-- Indices de la tabla `solicitudpermiso`
--
ALTER TABLE `solicitudpermiso`
  ADD PRIMARY KEY (`idsolicitudpermiso`);

--
-- Indices de la tabla `solicitudpermiso_tbl_user`
--
ALTER TABLE `solicitudpermiso_tbl_user`
  ADD PRIMARY KEY (`solicitudpermiso_idsolicitudpermiso`,`tbl_user_idtbl_user`),
  ADD KEY `solicitudpermiso_has_tbl_user_FKIndex1` (`solicitudpermiso_idsolicitudpermiso`),
  ADD KEY `solicitudpermiso_has_tbl_user_FKIndex2` (`tbl_user_idtbl_user`),
  ADD KEY `status_permiso_idstatus_permiso` (`status_permiso_idstatus_permiso`);

--
-- Indices de la tabla `status_permiso`
--
ALTER TABLE `status_permiso`
  ADD PRIMARY KEY (`idstatus_permiso`);

--
-- Indices de la tabla `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`idtbl_user`),
  ADD KEY `tbl_user_FKIndex1` (`ctg_tipousuario_idctg_tipousuario`),
  ADD KEY `tbl_user_FKIndex2` (`carrera_idcarrera`),
  ADD KEY `tbl_user_FKIndex3` (`cuatrimestre_idcuatrimestre`),
  ADD KEY `tbl_user_FKIndex4` (`grupo_idgrupo`);

--
-- Indices de la tabla `tutor`
--
ALTER TABLE `tutor`
  ADD PRIMARY KEY (`id_cedula`),
  ADD KEY `ctg_tipousuario_idctg_tipousuario` (`ctg_tipousuario_idctg_tipousuario`),
  ADD KEY `carrera_idcarrera` (`carrera_idcarrera`),
  ADD KEY `cuatrimestre_idcuatrimestre` (`cuatrimestre_idcuatrimestre`),
  ADD KEY `grupo_idgrupo` (`grupo_idgrupo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carrera`
--
ALTER TABLE `carrera`
  MODIFY `idcarrera` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `ctg_tipousuario`
--
ALTER TABLE `ctg_tipousuario`
  MODIFY `idctg_tipousuario` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `cuatrimestre`
--
ALTER TABLE `cuatrimestre`
  MODIFY `idcuatrimestre` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `grupo`
--
ALTER TABLE `grupo`
  MODIFY `idgrupo` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `solicitudpermiso`
--
ALTER TABLE `solicitudpermiso`
  MODIFY `idsolicitudpermiso` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `status_permiso`
--
ALTER TABLE `status_permiso`
  MODIFY `idstatus_permiso` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `idtbl_user` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `tutor`
--
ALTER TABLE `tutor`
  MODIFY `id_cedula` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `solicitudpermiso_tbl_user`
--
ALTER TABLE `solicitudpermiso_tbl_user`
  ADD CONSTRAINT `status_permiso_idstatus_permiso` FOREIGN KEY (`status_permiso_idstatus_permiso`) REFERENCES `status_permiso` (`idstatus_permiso`);

--
-- Filtros para la tabla `tutor`
--
ALTER TABLE `tutor`
  ADD CONSTRAINT `carrera_idcarrera` FOREIGN KEY (`carrera_idcarrera`) REFERENCES `carrera` (`idcarrera`),
  ADD CONSTRAINT `ctg_tipousuario_idctg_tipousuario` FOREIGN KEY (`ctg_tipousuario_idctg_tipousuario`) REFERENCES `ctg_tipousuario` (`idctg_tipousuario`),
  ADD CONSTRAINT `cuatrimestre_idcuatrimestre` FOREIGN KEY (`cuatrimestre_idcuatrimestre`) REFERENCES `cuatrimestre` (`idcuatrimestre`),
  ADD CONSTRAINT `grupo_idgrupo` FOREIGN KEY (`grupo_idgrupo`) REFERENCES `grupo` (`idgrupo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

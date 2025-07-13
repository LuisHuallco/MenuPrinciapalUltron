-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-07-2025 a las 05:35:20
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `relaciones`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alertas`
--

CREATE TABLE `alertas` (
  `Id` int(11) NOT NULL,
  `tipo` longtext NOT NULL,
  `valor` float NOT NULL,
  `fecha` date NOT NULL,
  `hora` time(6) NOT NULL,
  `mensaje` longtext NOT NULL,
  `estado` longtext NOT NULL,
  `ServidoresId` int(11) NOT NULL,
  `ParametrosId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `alertas`
--

INSERT INTO `alertas` (`Id`, `tipo`, `valor`, `fecha`, `hora`, `mensaje`, `estado`, `ServidoresId`, `ParametrosId`) VALUES
(1, 'Alto uso de CPU', 95.5, '2025-06-09', '00:00:00.000000', 'La CPU superó el 90%', 'pendiente', 1, 1),
(2, 'Alerta crítica', 93.75, '2025-06-20', '00:00:00.000000', 'Valor crítico mayor a 90', 'resuelta', 2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parametros`
--

CREATE TABLE `parametros` (
  `Id` int(11) NOT NULL,
  `nombre_parametro` longtext NOT NULL,
  `unidad` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `parametros`
--

INSERT INTO `parametros` (`Id`, `nombre_parametro`, `unidad`) VALUES
(1, 'CPU', 'GB'),
(2, 'RAM', 'GB'),
(3, 'Disco', 'GB');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servidores`
--

CREATE TABLE `servidores` (
  `Id` int(11) NOT NULL,
  `nombre_servidor` longtext NOT NULL,
  `ip` longtext NOT NULL,
  `ubicacion` longtext NOT NULL,
  `sistema_operativo` longtext NOT NULL,
  `estado` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `servidores`
--

INSERT INTO `servidores` (`Id`, `nombre_servidor`, `ip`, `ubicacion`, `sistema_operativo`, `estado`) VALUES
(1, 'Servidor1', '192.168.0.1', 'Quito', 'Windows Server', 'activo'),
(2, 'Servidor2', '198.165.205.5', 'Guayaquil', 'LINUX', 'Inactivo'),
(3, 'Servidor Quito', '8.8.8.8', 'Quito', 'Linux', 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `__efmigrationshistory`
--

CREATE TABLE `__efmigrationshistory` (
  `MigrationId` varchar(150) NOT NULL,
  `ProductVersion` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `__efmigrationshistory`
--

INSERT INTO `__efmigrationshistory` (`MigrationId`, `ProductVersion`) VALUES
('20250709012119_inicial', '8.0.18');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alertas`
--
ALTER TABLE `alertas`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_Alertas_ParametrosId` (`ParametrosId`),
  ADD KEY `IX_Alertas_ServidoresId` (`ServidoresId`);

--
-- Indices de la tabla `parametros`
--
ALTER TABLE `parametros`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `servidores`
--
ALTER TABLE `servidores`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `__efmigrationshistory`
--
ALTER TABLE `__efmigrationshistory`
  ADD PRIMARY KEY (`MigrationId`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alertas`
--
ALTER TABLE `alertas`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `parametros`
--
ALTER TABLE `parametros`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `servidores`
--
ALTER TABLE `servidores`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alertas`
--
ALTER TABLE `alertas`
  ADD CONSTRAINT `FK_Alertas_Parametros_ParametrosId` FOREIGN KEY (`ParametrosId`) REFERENCES `parametros` (`Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_Alertas_Servidores_ServidoresId` FOREIGN KEY (`ServidoresId`) REFERENCES `servidores` (`Id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

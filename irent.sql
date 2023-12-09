-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 19, 2020 at 02:21 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `irent`
--

-- --------------------------------------------------------

--
-- Table structure for table `bitacora`
--

CREATE TABLE `bitacora` (
  `id_Bit` int(11) NOT NULL,
  `id_Dep` varchar(11) NOT NULL,
  `nom` varchar(45) NOT NULL,
  `fecha` date NOT NULL DEFAULT current_timestamp(),
  `mensaje` varchar(500) NOT NULL,
  `tipo` varchar(45) NOT NULL,
  `id_Pro` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bitacora`
--

INSERT INTO `bitacora` (`id_Bit`, `id_Dep`, `nom`, `fecha`, `mensaje`, `tipo`, `id_Pro`) VALUES
(1000, 'A100', 'camila', '2020-12-10', 'Buenos dias les queria comentar acerca de ', 'Consulta', 1000),
(1004, 'A100', 'Karla Camila', '2020-12-18', 'Buenas tardes, Â¿Podria ayudarme con el Wifi? Esty presentando problemas con la conexion y lo necesito urgentemente\r\n', 'Queja', 1000);

-- --------------------------------------------------------

--
-- Table structure for table `boleta`
--

CREATE TABLE `boleta` (
  `id_Boleta` int(11) NOT NULL,
  `id_Pro` int(11) NOT NULL,
  `fechaPago` date NOT NULL,
  `id_Dep` varchar(11) NOT NULL,
  `alquiler` decimal(10,0) NOT NULL,
  `servicio` decimal(10,0) NOT NULL,
  `monto` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `departamento`
--

CREATE TABLE `departamento` (
  `id_Dep` varchar(9) NOT NULL,
  `doDep` int(11) NOT NULL,
  `baDep` int(11) NOT NULL,
  `estado` varchar(30) NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `area` decimal(7,2) NOT NULL,
  `distrito` varchar(45) NOT NULL,
  `id_Pro` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `departamento`
--

INSERT INTO `departamento` (`id_Dep`, `doDep`, `baDep`, `estado`, `monto`, `area`, `distrito`, `id_Pro`) VALUES
('A100', 1, 1, 'Ocupado', '1000.00', '80.00', 'San Isidro', 1000),
('A101', 1, 1, 'Ocupado', '1000.00', '80.00', 'San Isidro', 1000),
('A102', 1, 1, 'Ocupado', '1000.00', '80.00', 'San Isidro', 1000),
('A103', 1, 1, 'Libre', '1000.00', '80.00', 'San Isidro', 1000),
('A104', 1, 1, 'Libre', '1000.00', '80.00', 'San Isidro', 1000),
('A105', 1, 1, 'Libre', '1000.00', '80.00', 'San Isidro', 1000),
('B100', 2, 1, 'Libre', '2500.00', '100.00', 'San Isidro', 1000),
('B101', 2, 1, 'Libre', '2500.00', '100.00', 'San Isidro', 1000),
('B102', 2, 1, 'Libre', '2500.00', '100.00', 'San Isidro', 1000),
('B103', 2, 1, 'Libre', '2500.00', '100.00', 'San Isidro', 1000),
('B104', 2, 1, 'Libre', '2500.00', '100.00', 'San Isidro', 1000),
('B105', 2, 1, 'Libre', '2500.00', '100.00', 'San Isidro', 1000),
('C100', 2, 3, 'Libre', '3000.00', '120.00', 'San Isidro', 1000),
('C101', 2, 3, 'Libre', '3000.00', '120.00', 'San Isidro', 1000),
('C102', 2, 3, 'Libre', '3000.00', '120.00', 'San Isidro', 1000),
('C103', 2, 3, 'Libre', '3000.00', '120.00', 'San Isidro', 1000),
('C104', 2, 3, 'Libre', '3000.00', '120.00', 'San Isidro', 1000),
('C105', 2, 3, 'Libre', '3000.00', '120.00', 'San Isidro', 1000),
('D100', 3, 3, 'Libre', '4200.00', '150.00', 'San Isidro', 1000),
('D101', 3, 3, 'Libre', '4200.00', '150.00', 'San Isidro', 1000),
('D102', 3, 3, 'Libre', '4200.00', '150.00', 'San Isidro', 1000),
('D103', 3, 3, 'Libre', '4200.00', '150.00', 'San Isidro', 1000);

-- --------------------------------------------------------

--
-- Table structure for table `inquilino`
--

CREATE TABLE `inquilino` (
  `id_Inq` int(11) NOT NULL,
  `nom` varchar(45) NOT NULL,
  `ape` varchar(45) NOT NULL,
  `tel` int(11) NOT NULL,
  `fechaIng` date NOT NULL DEFAULT current_timestamp(),
  `tiempo` int(11) DEFAULT NULL,
  `id_Dep` varchar(10) DEFAULT NULL,
  `pass` varchar(45) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 2,
  `id_Pro` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `inquilino`
--

INSERT INTO `inquilino` (`id_Inq`, `nom`, `ape`, `tel`, `fechaIng`, `tiempo`, `id_Dep`, `pass`, `estado`, `id_Pro`) VALUES
(34000, 'Karla Camila', 'Estrabao', 123456789, '2020-11-13', 5, 'A100', 'camila', 1, 1000),
(34001, 'Louis William', 'Tommo', 987654321, '2020-11-13', 5, 'A101', 'louis', 1, 1000),
(34002, 'Violetta', 'Castillo', 987620130, '2020-12-18', 4, 'A102', 'violeta', 1, 1000);

-- --------------------------------------------------------

--
-- Table structure for table `loginpro`
--

CREATE TABLE `loginpro` (
  `id_Pro` int(11) NOT NULL,
  `pass` varchar(45) NOT NULL,
  `diainicio` date NOT NULL DEFAULT current_timestamp(),
  `horainicio` time NOT NULL DEFAULT current_timestamp(),
  `diafin` varchar(45) DEFAULT NULL,
  `horafin` varchar(45) DEFAULT NULL,
  `estado` int(11) NOT NULL,
  `intento` int(11) NOT NULL,
  `numlog` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `loginquilino`
--

CREATE TABLE `loginquilino` (
  `id_Inq` int(11) NOT NULL,
  `pass` varchar(45) NOT NULL,
  `diainicio` date NOT NULL DEFAULT current_timestamp(),
  `horainicio` time NOT NULL DEFAULT current_timestamp(),
  `diafin` varchar(45) DEFAULT NULL,
  `horafin` varchar(45) DEFAULT NULL,
  `estado` int(11) NOT NULL,
  `intento` int(11) NOT NULL,
  `numlog` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pago`
--

CREATE TABLE `pago` (
  `id_Pago` int(11) NOT NULL,
  `nomPago` varchar(60) NOT NULL,
  `fechaVen` date NOT NULL,
  `monto` decimal(8,2) NOT NULL,
  `estado` varchar(45) NOT NULL DEFAULT 'Procesando',
  `id_Dep` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pago`
--

INSERT INTO `pago` (`id_Pago`, `nomPago`, `fechaVen`, `monto`, `estado`, `id_Dep`) VALUES
(1, 'Agosto', '2020-08-24', '1300.00', 'Pagado', 'A100'),
(2, 'Septiembre', '2020-09-24', '1300.00', 'Pagado', 'A100'),
(3, 'Octubre', '2020-10-24', '1200.00', 'Pagado', 'A100'),
(4, 'Noviembre', '2020-11-24', '1500.00', 'Atrasado', 'A100'),
(5, 'Diciembre', '2020-12-24', '1300.00', 'Procesando', 'A100'),
(6, 'Agosto', '2020-08-24', '1200.00', 'Pagado', 'A101'),
(7, 'Septiembre', '2020-09-15', '1250.00', 'Pagado', 'A101'),
(8, 'Octubre', '2020-10-24', '1200.00', 'Pagado', 'A101'),
(9, 'Noviembre', '2020-11-24', '1300.00', 'Pagado', 'A101'),
(10, 'Diciembre', '2020-12-24', '1300.00', 'Procesando', 'A101'),
(11, 'Enero', '2021-01-24', '1200.00', 'Procesando', 'A100');

-- --------------------------------------------------------

--
-- Table structure for table `propietario`
--

CREATE TABLE `propietario` (
  `id_Pro` int(11) NOT NULL,
  `nomPro` varchar(50) NOT NULL,
  `telPro` int(11) NOT NULL,
  `nacionPro` varchar(20) NOT NULL,
  `edadPro` int(11) NOT NULL,
  `pass` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `propietario`
--

INSERT INTO `propietario` (`id_Pro`, `nomPro`, `telPro`, `nacionPro`, `edadPro`, `pass`) VALUES
(1000, 'Louis Smity', 987654332, 'Peruano', 45, 'louis');

-- --------------------------------------------------------

--
-- Table structure for table `servicio`
--

CREATE TABLE `servicio` (
  `id_Ser` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `costo` decimal(8,2) NOT NULL,
  `id_Dep` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `servicio`
--

INSERT INTO `servicio` (`id_Ser`, `nom`, `costo`, `id_Dep`) VALUES
(1, 'Agua', '80.00', 'A100'),
(2, 'Luz', '120.00', 'A100'),
(3, 'Wifi', '50.00', 'A100'),
(4, 'Cable', '50.00', 'A100'),
(5, 'Agua', '80.00', 'A101'),
(6, 'Luz', '120.00', 'A101'),
(7, 'Wifi', '50.00', 'A101');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bitacora`
--
ALTER TABLE `bitacora`
  ADD PRIMARY KEY (`id_Bit`),
  ADD KEY `id_Dep` (`id_Dep`),
  ADD KEY `id_Pro` (`id_Pro`);

--
-- Indexes for table `boleta`
--
ALTER TABLE `boleta`
  ADD PRIMARY KEY (`id_Boleta`);

--
-- Indexes for table `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`id_Dep`),
  ADD KEY `id_Pro` (`id_Pro`);

--
-- Indexes for table `inquilino`
--
ALTER TABLE `inquilino`
  ADD PRIMARY KEY (`id_Inq`),
  ADD KEY `inquilino_ibfk_1` (`id_Dep`),
  ADD KEY `id_Pro` (`id_Pro`);

--
-- Indexes for table `loginpro`
--
ALTER TABLE `loginpro`
  ADD PRIMARY KEY (`numlog`),
  ADD KEY `id_Pro` (`id_Pro`);

--
-- Indexes for table `loginquilino`
--
ALTER TABLE `loginquilino`
  ADD PRIMARY KEY (`numlog`),
  ADD KEY `id_Inq` (`id_Inq`);

--
-- Indexes for table `pago`
--
ALTER TABLE `pago`
  ADD PRIMARY KEY (`id_Pago`),
  ADD KEY `pago_ibfk_1` (`id_Dep`);

--
-- Indexes for table `propietario`
--
ALTER TABLE `propietario`
  ADD PRIMARY KEY (`id_Pro`);

--
-- Indexes for table `servicio`
--
ALTER TABLE `servicio`
  ADD PRIMARY KEY (`id_Ser`),
  ADD KEY `id_Dep` (`id_Dep`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bitacora`
--
ALTER TABLE `bitacora`
  MODIFY `id_Bit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1005;

--
-- AUTO_INCREMENT for table `boleta`
--
ALTER TABLE `boleta`
  MODIFY `id_Boleta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inquilino`
--
ALTER TABLE `inquilino`
  MODIFY `id_Inq` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34004;

--
-- AUTO_INCREMENT for table `loginpro`
--
ALTER TABLE `loginpro`
  MODIFY `numlog` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `loginquilino`
--
ALTER TABLE `loginquilino`
  MODIFY `numlog` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `pago`
--
ALTER TABLE `pago`
  MODIFY `id_Pago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `propietario`
--
ALTER TABLE `propietario`
  MODIFY `id_Pro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1001;

--
-- AUTO_INCREMENT for table `servicio`
--
ALTER TABLE `servicio`
  MODIFY `id_Ser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bitacora`
--
ALTER TABLE `bitacora`
  ADD CONSTRAINT `bitacora_ibfk_1` FOREIGN KEY (`id_Dep`) REFERENCES `departamento` (`id_Dep`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bitacora_ibfk_2` FOREIGN KEY (`id_Pro`) REFERENCES `propietario` (`id_Pro`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `departamento`
--
ALTER TABLE `departamento`
  ADD CONSTRAINT `departamento_ibfk_1` FOREIGN KEY (`id_Pro`) REFERENCES `propietario` (`id_Pro`);

--
-- Constraints for table `inquilino`
--
ALTER TABLE `inquilino`
  ADD CONSTRAINT `inquilino_ibfk_1` FOREIGN KEY (`id_Dep`) REFERENCES `departamento` (`id_Dep`) ON UPDATE CASCADE,
  ADD CONSTRAINT `inquilino_ibfk_2` FOREIGN KEY (`id_Pro`) REFERENCES `propietario` (`id_Pro`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `loginpro`
--
ALTER TABLE `loginpro`
  ADD CONSTRAINT `loginpro_ibfk_1` FOREIGN KEY (`id_Pro`) REFERENCES `propietario` (`id_Pro`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `loginquilino`
--
ALTER TABLE `loginquilino`
  ADD CONSTRAINT `loginquilino_ibfk_1` FOREIGN KEY (`id_Inq`) REFERENCES `inquilino` (`id_Inq`);

--
-- Constraints for table `pago`
--
ALTER TABLE `pago`
  ADD CONSTRAINT `pago_ibfk_1` FOREIGN KEY (`id_Dep`) REFERENCES `departamento` (`id_Dep`) ON UPDATE CASCADE;

--
-- Constraints for table `servicio`
--
ALTER TABLE `servicio`
  ADD CONSTRAINT `servicio_ibfk_1` FOREIGN KEY (`id_Dep`) REFERENCES `departamento` (`id_Dep`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

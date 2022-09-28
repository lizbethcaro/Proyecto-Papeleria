-- phpMyAdmin SQL Dump
-- version 4.5.4.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 26-09-2022 a las 23:05:50
-- Versión del servidor: 5.7.11
-- Versión de PHP: 5.6.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `papeleriaa`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `moventrada`
--

CREATE TABLE `moventrada` (
  `nroDocumento` int(50) NOT NULL,
  `fechaEntrada` date NOT NULL,
  `idTipoEntrada` int(50) NOT NULL,
  `neto` int(50) NOT NULL,
  `iva` int(50) NOT NULL,
  `total` int(50) NOT NULL,
  `rutUsuario` varchar(50) NOT NULL,
  `rutProveedor` varchar(50) NOT NULL,
  `idTipoDocumento` int(50) NOT NULL,
  `idTurno` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movsalida`
--

CREATE TABLE `movsalida` (
  `nroSalida` int(50) NOT NULL,
  `fechaSalida` date NOT NULL,
  `idTipoSalida` int(50) NOT NULL,
  `rutUsuario` varchar(50) NOT NULL,
  `idTurno` int(11) NOT NULL,
  `total` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permiso`
--

CREATE TABLE `permiso` (
  `idPermiso` int(50) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `codigo` int(50) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` text NOT NULL,
  `stock` int(10) NOT NULL,
  `stockCritico` int(10) NOT NULL,
  `stockReposicion` int(50) NOT NULL,
  `precioVenta` int(10) NOT NULL,
  `rutProveedor` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `rutProveedor` varchar(50) NOT NULL,
  `nombreEmpresa` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `telefono` varchar(50) NOT NULL,
  `nombreVendedor` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `r_moventradaproducto`
--

CREATE TABLE `r_moventradaproducto` (
  `idRmovEntradaProducto` int(50) NOT NULL,
  `nroDocumento` int(50) NOT NULL,
  `codigo` int(50) NOT NULL,
  `precioCompra` int(50) NOT NULL,
  `cantidad` int(50) NOT NULL,
  `total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `r_movsalidaproducto`
--

CREATE TABLE `r_movsalidaproducto` (
  `idRmovSalidaProducto` int(50) NOT NULL,
  `nroSalida` int(50) NOT NULL,
  `codigo` int(50) NOT NULL,
  `cantidad` int(50) NOT NULL,
  `total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stock`
--

CREATE TABLE `stock` (
  `idStock` int(50) NOT NULL,
  `codigo` int(50) NOT NULL,
  `cantidad` int(50) NOT NULL,
  `fechaVencimiento` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipodocumento`
--

CREATE TABLE `tipodocumento` (
  `idTipoDocumento` int(50) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoentrada`
--

CREATE TABLE `tipoentrada` (
  `idTipoEntrada` int(50) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposalida`
--

CREATE TABLE `tiposalida` (
  `idTipoSalida` int(50) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoturno`
--

CREATE TABLE `tipoturno` (
  `idTurno` int(11) NOT NULL,
  `nombre` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `rutUsuario` varchar(50) NOT NULL,
  `nombre` varchar(15) NOT NULL,
  `telefono` varchar(50) NOT NULL,
  `contrasena` varchar(50) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `nombreUsuario` varchar(50) NOT NULL,
  `idPermiso` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `moventrada`
--
ALTER TABLE `moventrada`
  ADD PRIMARY KEY (`nroDocumento`),
  ADD KEY `tipoentrada_moventrada_idTipoEntrada_fk` (`idTipoEntrada`),
  ADD KEY `usuario_moventrada_rutUsuario_fk` (`rutUsuario`),
  ADD KEY `proveedor_moventrada_rutProveedor_fk` (`rutProveedor`),
  ADD KEY `tipodocumento_moventrada_idTipoDocumento_fk` (`idTipoDocumento`),
  ADD KEY `tipoturno_moventrada_idTurno_fk` (`idTurno`);

--
-- Indices de la tabla `movsalida`
--
ALTER TABLE `movsalida`
  ADD PRIMARY KEY (`nroSalida`),
  ADD KEY `usuario_movsalida_rutUsuario_fk` (`rutUsuario`),
  ADD KEY `tiposalida_movsalida_idTipoSalida_fk` (`idTipoSalida`),
  ADD KEY `tipoturno_movsalida_idTurno_fk` (`idTurno`);

--
-- Indices de la tabla `permiso`
--
ALTER TABLE `permiso`
  ADD PRIMARY KEY (`idPermiso`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `producto_proveedor_rutProveedor_fk` (`rutProveedor`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`rutProveedor`);

--
-- Indices de la tabla `r_moventradaproducto`
--
ALTER TABLE `r_moventradaproducto`
  ADD PRIMARY KEY (`idRmovEntradaProducto`),
  ADD KEY `moventrada_rmovmoventradaproducto_nroSalida_fk` (`nroDocumento`),
  ADD KEY `prodcuto_rmovmoventradaproducto_codigo_fk` (`codigo`);

--
-- Indices de la tabla `r_movsalidaproducto`
--
ALTER TABLE `r_movsalidaproducto`
  ADD PRIMARY KEY (`idRmovSalidaProducto`),
  ADD KEY `movsalida_rmovsalidap_nroSalida_fk` (`nroSalida`),
  ADD KEY `prodcuto_rmovsalidap_codigo_fk` (`codigo`);

--
-- Indices de la tabla `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`idStock`),
  ADD KEY `producto_stock_codigo_fk` (`codigo`);

--
-- Indices de la tabla `tipodocumento`
--
ALTER TABLE `tipodocumento`
  ADD PRIMARY KEY (`idTipoDocumento`);

--
-- Indices de la tabla `tipoentrada`
--
ALTER TABLE `tipoentrada`
  ADD PRIMARY KEY (`idTipoEntrada`);

--
-- Indices de la tabla `tiposalida`
--
ALTER TABLE `tiposalida`
  ADD PRIMARY KEY (`idTipoSalida`);

--
-- Indices de la tabla `tipoturno`
--
ALTER TABLE `tipoturno`
  ADD PRIMARY KEY (`idTurno`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`rutUsuario`),
  ADD KEY `permiso_usuario_idpermiso_fk` (`idPermiso`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `moventrada`
--
ALTER TABLE `moventrada`
  ADD CONSTRAINT `proveedor_moventrada_rutProveedor_fk` FOREIGN KEY (`rutProveedor`) REFERENCES `proveedor` (`rutProveedor`),
  ADD CONSTRAINT `tipodocumento_moventrada_idTipoDocumento_fk` FOREIGN KEY (`idTipoDocumento`) REFERENCES `tipodocumento` (`idTipoDocumento`),
  ADD CONSTRAINT `tipoentrada_moventrada_idTipoEntrada_fk` FOREIGN KEY (`idTipoEntrada`) REFERENCES `tipoentrada` (`idTipoEntrada`),
  ADD CONSTRAINT `tipoturno_moventrada_idTurno_fk` FOREIGN KEY (`idTurno`) REFERENCES `tipoturno` (`idTurno`),
  ADD CONSTRAINT `usuario_moventrada_rutUsuario_fk` FOREIGN KEY (`rutUsuario`) REFERENCES `usuario` (`rutUsuario`);

--
-- Filtros para la tabla `movsalida`
--
ALTER TABLE `movsalida`
  ADD CONSTRAINT `tiposalida_movsalida_idTipoSalida_fk` FOREIGN KEY (`idTipoSalida`) REFERENCES `tiposalida` (`idTipoSalida`),
  ADD CONSTRAINT `tipoturno_movsalida_idTurno_fk` FOREIGN KEY (`idTurno`) REFERENCES `tipoturno` (`idTurno`),
  ADD CONSTRAINT `usuario_movsalida_rutUsuario_fk` FOREIGN KEY (`rutUsuario`) REFERENCES `usuario` (`rutUsuario`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_proveedor_rutProveedor_fk` FOREIGN KEY (`rutProveedor`) REFERENCES `proveedor` (`rutProveedor`);

--
-- Filtros para la tabla `r_moventradaproducto`
--
ALTER TABLE `r_moventradaproducto`
  ADD CONSTRAINT `moventrada_rmovmoventradaproducto_nroSalida_fk` FOREIGN KEY (`nroDocumento`) REFERENCES `moventrada` (`nroDocumento`),
  ADD CONSTRAINT `prodcuto_rmovmoventradaproducto_codigo_fk` FOREIGN KEY (`codigo`) REFERENCES `producto` (`codigo`);

--
-- Filtros para la tabla `r_movsalidaproducto`
--
ALTER TABLE `r_movsalidaproducto`
  ADD CONSTRAINT `movsalida_rmovsalidap_nroSalida_fk` FOREIGN KEY (`nroSalida`) REFERENCES `movsalida` (`nroSalida`),
  ADD CONSTRAINT `prodcuto_rmovsalidap_codigo_fk` FOREIGN KEY (`codigo`) REFERENCES `producto` (`codigo`);

--
-- Filtros para la tabla `stock`
--
ALTER TABLE `stock`
  ADD CONSTRAINT `producto_stock_codigo_fk` FOREIGN KEY (`codigo`) REFERENCES `producto` (`codigo`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `permiso_usuario_idpermiso_fk` FOREIGN KEY (`idPermiso`) REFERENCES `permiso` (`idPermiso`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

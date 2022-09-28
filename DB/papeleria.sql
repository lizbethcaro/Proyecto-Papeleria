CREATE TABLE IF NOT EXISTS `permiso` (
  `idPermiso` int(50) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`idPermiso`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `tipoentrada` (
  `idTipoEntrada` int(50) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`idTipoEntrada`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `tipodocumento` (
  `idTipoDocumento` int(50) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`idTipoDocumento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `tiposalida` (
  `idTipoSalida` int(50) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`idTipoSalida`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `tipoturno` (
  `idTurno` int(11) NOT NULL,
  `nombre` date NOT NULL,
  PRIMARY KEY (`idTurno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `proveedor` (
  `rutProveedor` varchar(50) NOT NULL,
  `nombreEmpresa` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `telefono` varchar(50) NOT NULL,
  `nombreVendedor` varchar(50) NOT NULL,
  PRIMARY KEY (`rutProveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `usuario` (
  `rutUsuario` varchar(50) NOT NULL,
  `nombre` varchar(15) NOT NULL,
  `telefono` varchar(50) NOT NULL,
  `contrasena` varchar(50) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `nombreUsuario` varchar(50) NOT NULL,
  `idPermiso` int(50) NOT NULL,
  PRIMARY KEY (`rutUsuario`),
  CONSTRAINT `permiso_usuario_idpermiso_fk`FOREIGN KEY (`idPermiso`) REFERENCES `permiso` (`idPermiso`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `movsalida` (
  `nroSalida` int(50) NOT NULL,
  `fechaSalida` date NOT NULL,
  `idTipoSalida` int(50) NOT NULL,
  `rutUsuario` varchar(50) NOT NULL,
  `idTurno` int(11) NOT NULL,
  `total` int(50) NOT NULL,
  PRIMARY KEY (`nroSalida`),
  CONSTRAINT `usuario_movsalida_rutUsuario_fk`FOREIGN KEY (`rutUsuario`) REFERENCES `usuario` (`rutUsuario`),
  CONSTRAINT `tiposalida_movsalida_idTipoSalida_fk`FOREIGN KEY (`idTipoSalida`) REFERENCES `tiposalida` (`idTipoSalida`),
  CONSTRAINT `tipoturno_movsalida_idTurno_fk`FOREIGN KEY (`idTurno`) REFERENCES `tipoturno` (`idTurno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `producto` (
  `codigo` int(50) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` text NOT NULL,
  `stock` int(10) NOT NULL,
  `stockCritico` int(10) NOT NULL,
  `stockReposicion` int(50) NOT NULL,
  `precioVenta` int(10) NOT NULL,
  `rutProveedor` varchar(50) NOT NULL,  
  PRIMARY KEY (`codigo`),
  CONSTRAINT `producto_proveedor_rutProveedor_fk`FOREIGN KEY (`rutProveedor`) REFERENCES `proveedor` (`rutProveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE IF NOT EXISTS `stock` (
  `idStock` int(50) NOT NULL,
  `codigo` int(50) NOT NULL,
  `cantidad` int(50) NOT NULL,
  `fechaVencimiento` date NOT NULL,
  PRIMARY KEY (`idStock`),
  CONSTRAINT `producto_stock_codigo_fk`FOREIGN KEY (`codigo`) REFERENCES `producto` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `moventrada` (
  `nroDocumento` int(50) NOT NULL,
  `fechaEntrada` date NOT NULL,
  `idTipoEntrada` int(50) NOT NULL,
  `neto` int (50) NOT NULL,
  `iva` int(50) NOT NULL,
  `total` int(50) NOT NULL,
  `rutUsuario` varchar(50) NOT NULL,
  `rutProveedor` varchar(50) NOT NULL,
  `idTipoDocumento` int(50) NOT NULL,
  `idTurno` int(11) NOT NULL,
  PRIMARY KEY (`nroDocumento`),
  CONSTRAINT `tipoentrada_moventrada_idTipoEntrada_fk`FOREIGN KEY (`idTipoEntrada`) REFERENCES `tipoentrada` (`idTipoEntrada`),
  CONSTRAINT `usuario_moventrada_rutUsuario_fk`FOREIGN KEY (`rutUsuario`) REFERENCES `usuario` (`rutUsuario`),
  CONSTRAINT `proveedor_moventrada_rutProveedor_fk`FOREIGN KEY (`rutProveedor`) REFERENCES `proveedor` (`rutProveedor`),
  CONSTRAINT `tipodocumento_moventrada_idTipoDocumento_fk`FOREIGN KEY (`idTipoDocumento`) REFERENCES `tipodocumento` (`idTipoDocumento`),
  CONSTRAINT `tipoturno_moventrada_idTurno_fk`FOREIGN KEY (`idTurno`) REFERENCES `tipoturno` (`idTurno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



CREATE TABLE IF NOT EXISTS `r_movsalidaproducto` (
  `idRmovSalidaProducto` int(50) NOT NULL,
  `nroSalida` int(50) NOT NULL,
  `codigo` int(50) NOT NULL,
  `cantidad` int(50) NOT NULL,
  `total` int(11) NOT NULL,
  PRIMARY KEY (`idRmovSalidaProducto`),
  CONSTRAINT `movsalida_rmovsalidap_nroSalida_fk`FOREIGN KEY (`nroSalida`) REFERENCES `movsalida` (`nroSalida`),
  CONSTRAINT `prodcuto_rmovsalidap_codigo_fk`FOREIGN KEY (`codigo`) REFERENCES `producto` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `r_moventradaproducto` (
  `idRmovEntradaProducto` int(50) NOT NULL,
  `nroDocumento` int(50) NOT NULL,
  `codigo` int(50) NOT NULL,
  `precioCompra` int(50) NOT NULL,
  `cantidad` int(50) NOT NULL,
  `total` int(11) NOT NULL,
  PRIMARY KEY (`idRmovEntradaProducto`),
  CONSTRAINT `moventrada_rmovmoventradaproducto_nroSalida_fk`FOREIGN KEY (`nroDocumento`) REFERENCES `moventrada` (`nroDocumento`),
  CONSTRAINT `prodcuto_rmovmoventradaproducto_codigo_fk`FOREIGN KEY (`codigo`) REFERENCES `producto` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



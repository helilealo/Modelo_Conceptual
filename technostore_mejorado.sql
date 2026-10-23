-- =====================================================
-- TechnoStore - Modelo mejorado (3FN) para MySQL Workbench
-- =====================================================
DROP SCHEMA IF EXISTS technostore;
CREATE SCHEMA technostore DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE technostore;

-- ---------- CATALOGOS ----------
CREATE TABLE cargo (
  idcargo      INT AUTO_INCREMENT PRIMARY KEY,
  nombre_cargo VARCHAR(30) NOT NULL,
  area         VARCHAR(15) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE marca (
  idmarca      INT AUTO_INCREMENT PRIMARY KEY,
  nombre_marca VARCHAR(29) NOT NULL UNIQUE
) ENGINE=InnoDB;

CREATE TABLE metodo_pago (
  idmetodo_pago INT AUTO_INCREMENT PRIMARY KEY,
  nombre        VARCHAR(30) NOT NULL UNIQUE
) ENGINE=InnoDB;

CREATE TABLE canal (
  idcanal      INT AUTO_INCREMENT PRIMARY KEY,
  nombre_canal VARCHAR(35) NOT NULL UNIQUE
) ENGINE=InnoDB;

CREATE TABLE tipo_atencion (
  idtipo_atencion INT AUTO_INCREMENT PRIMARY KEY,
  nombre          VARCHAR(45) NOT NULL,
  modalidad       VARCHAR(15) NOT NULL
) ENGINE=InnoDB;

-- ---------- PERSONAS ----------
CREATE TABLE clientes (
  idclientes      INT AUTO_INCREMENT PRIMARY KEY,
  nombres         VARCHAR(40) NOT NULL,
  apellidos       VARCHAR(40) NOT NULL,
  numero_telefono VARCHAR(20),
  ciudad          VARCHAR(30)
) ENGINE=InnoDB;

CREATE TABLE empleado (
  idempleado INT AUTO_INCREMENT PRIMARY KEY,
  nombres    VARCHAR(40) NOT NULL,
  apellidos  VARCHAR(40) NOT NULL,
  telefono   VARCHAR(20),
  correo     VARCHAR(111) UNIQUE,
  idcargo    INT NOT NULL,
  CONSTRAINT fk_empleado_cargo FOREIGN KEY (idcargo) REFERENCES cargo (idcargo)
) ENGINE=InnoDB;

-- ---------- PRODUCTOS ----------
CREATE TABLE producto (
  idproducto      INT AUTO_INCREMENT PRIMARY KEY,
  nombre_producto VARCHAR(45) NOT NULL,
  codigo_barras   VARCHAR(52) NOT NULL UNIQUE,
  precio          DECIMAL(10,2) NOT NULL,
  idmarca         INT NOT NULL,
  diseno          VARCHAR(15),
  forma           VARCHAR(60),
  CONSTRAINT fk_producto_marca FOREIGN KEY (idmarca) REFERENCES marca (idmarca)
) ENGINE=InnoDB;

-- ---------- PROVEEDORES ----------
CREATE TABLE proveedor (
  idproveedor    INT AUTO_INCREMENT PRIMARY KEY,
  nombre_empresa VARCHAR(70) NOT NULL,
  telefono       VARCHAR(20),
  ciudad         VARCHAR(39)
) ENGINE=InnoDB;

CREATE TABLE compra_proveedor (
  idcompra         INT AUTO_INCREMENT PRIMARY KEY,
  idproveedor      INT NOT NULL,
  idproducto       INT NOT NULL,
  costo            DECIMAL(10,3) NOT NULL,
  fecha_asignacion DATETIME,
  fecha_recibido   DATETIME,
  estado_envio     ENUM('pendiente','en_camino','entregado') NOT NULL DEFAULT 'pendiente',
  estado_recibido  ENUM('pendiente','recibido','rechazado')  NOT NULL DEFAULT 'pendiente',
  CONSTRAINT fk_compra_proveedor FOREIGN KEY (idproveedor) REFERENCES proveedor (idproveedor),
  CONSTRAINT fk_compra_producto  FOREIGN KEY (idproducto)  REFERENCES producto (idproducto)
) ENGINE=InnoDB;

-- ---------- VENTAS ----------
CREATE TABLE venta (
  idventa       INT AUTO_INCREMENT PRIMARY KEY,
  idclientes    INT NOT NULL,
  idempleado    INT NOT NULL,
  idmetodo_pago INT NOT NULL,
  fecha_venta   DATE NOT NULL,
  ubicacion     VARCHAR(30),
  CONSTRAINT fk_venta_cliente  FOREIGN KEY (idclientes)    REFERENCES clientes (idclientes),
  CONSTRAINT fk_venta_empleado FOREIGN KEY (idempleado)    REFERENCES empleado (idempleado),
  CONSTRAINT fk_venta_pago     FOREIGN KEY (idmetodo_pago) REFERENCES metodo_pago (idmetodo_pago)
) ENGINE=InnoDB;

CREATE TABLE detalle_venta (
  iddetalle       INT AUTO_INCREMENT PRIMARY KEY,
  idventa         INT NOT NULL,
  idproducto      INT NOT NULL,
  cantidad        INT NOT NULL CHECK (cantidad > 0),
  precio_unitario DECIMAL(10,2) NOT NULL,
  CONSTRAINT fk_detalle_venta    FOREIGN KEY (idventa)    REFERENCES venta (idventa),
  CONSTRAINT fk_detalle_producto FOREIGN KEY (idproducto) REFERENCES producto (idproducto)
) ENGINE=InnoDB;

CREATE TABLE logistica (
  idlogistica INT AUTO_INCREMENT PRIMARY KEY,
  idventa     INT NOT NULL UNIQUE,
  envio       VARCHAR(30),
  fecha_envio DATETIME,
  paquete     VARCHAR(65),
  peso        DECIMAL(8,3),
  CONSTRAINT fk_logistica_venta FOREIGN KEY (idventa) REFERENCES venta (idventa)
) ENGINE=InnoDB;

-- ---------- SOPORTE ----------
CREATE TABLE ticket (
  idticket        INT AUTO_INCREMENT PRIMARY KEY,
  idclientes      INT NOT NULL,
  idempleado      INT NOT NULL,
  idcanal         INT NOT NULL,
  idtipo_atencion INT NOT NULL,
  nombre_ticket   VARCHAR(70) NOT NULL,
  fecha           DATETIME NOT NULL,
  descripcion     VARCHAR(101),
  CONSTRAINT fk_ticket_cliente  FOREIGN KEY (idclientes)      REFERENCES clientes (idclientes),
  CONSTRAINT fk_ticket_empleado FOREIGN KEY (idempleado)      REFERENCES empleado (idempleado),
  CONSTRAINT fk_ticket_canal    FOREIGN KEY (idcanal)         REFERENCES canal (idcanal),
  CONSTRAINT fk_ticket_atencion FOREIGN KEY (idtipo_atencion) REFERENCES tipo_atencion (idtipo_atencion)
) ENGINE=InnoDB;


-- ###############################################################
-- ###### COMANDOS DDL (DB DiseñoAutomotriz) - Daniel Navas ######
-- ###############################################################

-- Creación y Selección de la base de datos
CREATE DATABASE automotive_design;
USE automotive_design;

-- Creación de las tablas
CREATE TABLE cliente (
    id INT NOT NULL AUTO_INCREMENT,
    mombre VARCHAR(50),
    apellido VARCHAR(50),
    direccion VARCHAR(100),
    telefono VARCHAR(15),
    email VARCHAR(50),
    CONSTRAINT PK_Cliente_Id PRIMARY KEY (id)
);

CREATE TABLE vehiculo (
    id INT NOT NULL AUTO_INCREMENT,
    placa VARCHAR(10),
    marca VARCHAR(50),
    modelo VARCHAR(50),
    año INT,
    id_cliente INT,
    CONSTRAINT PK_Vehiculo_Id PRIMARY KEY (id),
	CONSTRAINT FK_Cliente_Vehiculo_Id FOREIGN KEY (id_cliente) REFERENCES cliente(id)
);

CREATE TABLE servicio (
    id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50),
    descripcion TEXT,
    costo DECIMAL(10, 2),
    CONSTRAINT PK_Servicio_Id PRIMARY KEY (id)
);

CREATE TABLE empleado (
    id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    cargo VARCHAR(50),
    telefono VARCHAR(15),
    CONSTRAINT PK_Empleado_Id PRIMARY KEY (id)
);

CREATE TABLE reparacion (
    id INT NOT NULL AUTO_INCREMENT,
    fecha DATE,
    id_vehiculo INT,
    id_empleado INT,
    id_servicio INT,
    costo_total DECIMAL(10, 2),
    descripcion TEXT,
    CONSTRAINT PK_Reparacion_Id PRIMARY KEY (id),
    CONSTRAINT FK_Vehiculo_Reparacion_Id FOREIGN KEY (id_vehiculo) REFERENCES vehiculo(id),
    CONSTRAINT FK_Empleado_Reparacion_Id FOREIGN KEY (id_empleado) REFERENCES empleado(id),
    CONSTRAINT FK_Servicio_Reparacion_Id FOREIGN KEY (id_servicio) REFERENCES servicio(id)
);

CREATE TABLE proveedor (
    id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50),
    contacto VARCHAR(50),
    telefono VARCHAR(15),
    email VARCHAR(50),
    CONSTRAINT PK_Proveedor_Id PRIMARY KEY (id)
);

CREATE TABLE pieza (
    id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50),
    descripcion TEXT,
    precio DECIMAL(10, 2),
    id_proveedor INT,
    CONSTRAINT PK_Pieza_Id PRIMARY KEY (id),
    CONSTRAINT FK_Proveedor_Pieza_Id FOREIGN KEY (id_proveedor) REFERENCES proveedor(id)
);

CREATE TABLE reparacion_pieza (
    id_reparacion INT,
    id_pieza INT,
    cantidad INT,
    CONSTRAINT PK_ReparacionPieza_Id PRIMARY KEY (id_reparacion, id_pieza),
    CONSTRAINT FK_Reparacion_ReparacionPieza_Id FOREIGN KEY (id_reparacion) REFERENCES reparacion(id),
    CONSTRAINT FK_Pieza_ReparacionPieza_Id FOREIGN KEY (id_pieza) REFERENCES pieza(id)
);

CREATE TABLE cita (
    id INT NOT NULL AUTO_INCREMENT,
    fecha_hora DATETIME,
    id_cliente INT,
    id_vehiculo INT,
    id_servicio INT,
    CONSTRAINT PK_Cita_Id PRIMARY KEY (id),
    CONSTRAINT FK_Cliente_Cita_Id FOREIGN KEY (id_cliente) REFERENCES cliente(id),
    CONSTRAINT FK_Vehiculo_Cita_Id FOREIGN KEY (id_vehiculo) REFERENCES vehiculo(id),
    CONSTRAINT FK_Servicio_Cita_Id FOREIGN KEY (id_servicio) REFERENCES servicio(id)
);

CREATE TABLE inventario (
    id INT NOT NULL AUTO_INCREMENT,
    id_pieza INT,
    cantidad INT,
    ubicacion VARCHAR(50),
    CONSTRAINT PK_Inventario_Id PRIMARY KEY (id),
    CONSTRAINT FK_Pieza_Inventario_Id FOREIGN KEY (id_pieza) REFERENCES pieza(id)
);

CREATE TABLE orden_compra (
    id INT NOT NULL AUTO_INCREMENT,
    fecha DATE,
    id_proveedor INT,
    id_empleado INT,
    total DECIMAL(10, 2),
    CONSTRAINT PK_OrdenCompra_Id PRIMARY KEY (id),
    CONSTRAINT FK_Proveedor_OrdenCompra_Id FOREIGN KEY (id_proveedor) REFERENCES proveedor(id),
    CONSTRAINT FK_Empleado_OrdenCompra_Id FOREIGN KEY (id_empleado) REFERENCES empleado(id)
);

CREATE TABLE orden_detalle (
    id_orden INT,
    id_pieza INT,
    cantidad INT,
    precio DECIMAL(10, 2),
    CONSTRAINT PK_OrdenDetalle_Id PRIMARY KEY (id_orden, id_pieza),
    CONSTRAINT FK_OrdenCompra_OrdenDetalle_Id FOREIGN KEY (id_orden) REFERENCES orden_compra(id),
    CONSTRAINT FK_Pieza_OrdenDetalle_Id FOREIGN KEY (id_pieza) REFERENCES pieza(id)
);

CREATE TABLE facturacion (
    id INT NOT NULL AUTO_INCREMENT,
    fecha DATE,
    id_cliente INT,
    total DECIMAL(10, 2),
    CONSTRAINT PK_Facturacion_Id PRIMARY KEY (id),
    CONSTRAINT FK_Cliente_Facturacion_Id FOREIGN KEY (id_cliente) REFERENCES cliente(id)
);

CREATE TABLE factura_detalle (
    id_factura INT,
    id_reparacion INT,
    cantidad INT,
    precio DECIMAL(10, 2),
    CONSTRAINT PK_FacturaDetalle_Id PRIMARY KEY (id_factura, id_reparacion),
    CONSTRAINT FK_Factura_FacturaDetalle_Id FOREIGN KEY (id_factura) REFERENCES facturacion(id),
    CONSTRAINT FK_Reparacion_FacturaDetalle_Id FOREIGN KEY (id_reparacion) REFERENCES reparacion(id)
);




-- Daniel Navas - C.C: 1.***.***.797
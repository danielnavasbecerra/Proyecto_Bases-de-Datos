
-- ###############################################################
-- ###### COMANDOS DDL (DB DiseñoAutomotriz) - Daniel Navas ######
-- ###############################################################

-- Creación y Selección de la base de datos
CREATE DATABASE automotive_design;
USE automotive_design;

-- Creación de las tablas (30-Total)
CREATE TABLE pais (
    id INT AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    CONSTRAINT PK_Pais_Id PRIMARY KEY(id)
);

CREATE TABLE region (
    id INT AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    CONSTRAINT PK_Region_Id PRIMARY KEY(id)
);

CREATE TABLE ciudad (
    id INT AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    CONSTRAINT PK_Ciudad_Id PRIMARY KEY(id)
);

CREATE TABLE tipo_telefono (
    id INT AUTO_INCREMENT,
    tipo VARCHAR(50) NOT NULL,
    CONSTRAINT PK_TipoTelefono_Id PRIMARY KEY(id)
);

CREATE TABLE marca (
    id INT AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    CONSTRAINT PK_Marca_Id PRIMARY KEY(id)
);

CREATE TABLE servicio (
    id INT AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    descripcion TEXT,
    costo DECIMAL(10, 2) NOT NULL,
    CONSTRAINT PK_Servicio_Id PRIMARY KEY(id)
);

CREATE TABLE cargo (
    id INT AUTO_INCREMENT,
    puesto VARCHAR(50) NOT NULL,
    CONSTRAINT PK_Cargo_Id PRIMARY KEY(id)
);

CREATE TABLE contacto (
    id INT AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    email VARCHAR(50),
    CONSTRAINT PK_Contacto_Id PRIMARY KEY(id)
);

CREATE TABLE pieza (
    id INT AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    descripcion TEXT,
    CONSTRAINT PK_Pieza_Id PRIMARY KEY(id)
);

CREATE TABLE ubicacion (
    id INT AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    CONSTRAINT PK_Ubicacion_Id PRIMARY KEY(id)
);

CREATE TABLE cliente (
    id INT AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    email VARCHAR(50),
    CONSTRAINT PK_Cliente_Id PRIMARY KEY(id)
);

CREATE TABLE telefono_cliente (
	id INT AUTO_INCREMENT,
	id_cliente INT NOT NULL,
	id_tipo INT NOT NULL,
	numero VARCHAR(50) NOT NULL,
	CONSTRAINT PK_TelefonoCliente_Id PRIMARY KEY(id),
	CONSTRAINT FK_Cliente_TelefonoCliente_Id FOREIGN KEY(id_cliente) REFERENCES cliente(id),
	CONSTRAINT FK_Tipo_TelefonoCliente_Id FOREIGN KEY(id_tipo) REFERENCES tipo_telefono(id)
);

CREATE TABLE direccion_cliente (
    id INT AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    id_pais INT NOT NULL,
    id_region INT NOT NULL,
    id_ciudad INT NOT NULL,
    detalle TEXT NOT NULL,
    CONSTRAINT PK_DireccionCliente_Id PRIMARY KEY(id),
    CONSTRAINT FK_Cliente_DireccionCliente_Id FOREIGN KEY(id_cliente) REFERENCES cliente(id),
    CONSTRAINT FK_Pais_DireccionCliente_Id FOREIGN KEY(id_pais) REFERENCES pais(id),
    CONSTRAINT FK_Region_DireccionCliente_Id FOREIGN KEY(id_region) REFERENCES region(id),
    CONSTRAINT FK_Ciudad_DireccionCliente_Id FOREIGN KEY(id_ciudad) REFERENCES ciudad(id)
);

CREATE TABLE vehiculo (
    id INT AUTO_INCREMENT,
    placa VARCHAR(10) UNIQUE NOT NULL,
    id_marca INT NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    año_fabricacion YEAR NOT NULL,
    id_cliente INT NOT NULL,
    CONSTRAINT PK_Vehiculo_Id PRIMARY KEY(id),
    CONSTRAINT FK_Marca_Vehiculo_Id FOREIGN KEY(id_marca) REFERENCES marca(id),
    CONSTRAINT FK_Cliente_Vehiculo_Id FOREIGN KEY(id_cliente) REFERENCES cliente(id)
);

CREATE TABLE empleado (
    id INT AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    id_cargo INT NOT NULL,
    email VARCHAR(50),
    CONSTRAINT PK_Empleado_Id PRIMARY KEY(id),
    CONSTRAINT FK_Cargo_Empleado_Id FOREIGN KEY(id_cargo) REFERENCES cargo(id)
);

CREATE TABLE telefono_empleado (
	id INT AUTO_INCREMENT,
	id_empleado INT NOT NULL,
	id_tipo INT NOT NULL,
	numero VARCHAR(50) NOT NULL,
	CONSTRAINT PK_TelefonoEmpleado_Id PRIMARY KEY(id),
	CONSTRAINT FK_Empleado_TelefonoEmpleado_Id FOREIGN KEY(id_empleado) REFERENCES empleado(id),
	CONSTRAINT FK_Tipo_TelefonoEmpleado_Id FOREIGN KEY(id_tipo) REFERENCES tipo_telefono(id)
);

CREATE TABLE reparacion (
    id INT AUTO_INCREMENT,
    fecha DATE NOT NULL,
    id_empleado INT NOT NULL,
    id_vehiculo INT NOT NULL,
    costo_total DECIMAL(10, 2) NOT NULL,
    descripcion TEXT NOT NULL,
    CONSTRAINT PK_Reparacion_Id PRIMARY KEY(id),
    CONSTRAINT FK_Empleado_Reparacion_Id FOREIGN KEY(id_empleado) REFERENCES empleado(id),
    CONSTRAINT FK_Vehiculo_Reparacion_Id FOREIGN KEY(id_vehiculo) REFERENCES vehiculo(id)
);

CREATE TABLE proveedor (
    id INT AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    id_contacto INT NOT NULL,
    email VARCHAR(50),
    CONSTRAINT PK_Proveedor_Id PRIMARY KEY(id),
    CONSTRAINT FK_Contacto_Proveedor_Id FOREIGN KEY(id_contacto) REFERENCES contacto(id)
);

CREATE TABLE telefono_proveedor (
	id INT AUTO_INCREMENT,
	id_proveedor INT,
	id_tipo INT,
	numero VARCHAR(50),
	CONSTRAINT PK_TelefonoProveedor_Id PRIMARY KEY(id),
	CONSTRAINT FK_Proveedor_TelefonoProveedor_Id FOREIGN KEY(id_proveedor) REFERENCES proveedor(id),
	CONSTRAINT FK_Tipo_TelefonoProveedor_Id FOREIGN KEY(id_tipo) REFERENCES tipo_telefono(id)
);

CREATE TABLE inventario (
    id INT AUTO_INCREMENT,
    cantidad INT NOT NULL,
    id_ubicacion INT NOT NULL,
    CONSTRAINT PK_Inventario_Id PRIMARY KEY(id),
    CONSTRAINT FK_Ubicacion_Inventario_Id FOREIGN KEY(id_ubicacion) REFERENCES ubicacion(id)
);

CREATE TABLE cita (
    id INT AUTO_INCREMENT,
    fecha_hora DATETIME NOT NULL,
    id_cliente INT NOT NULL,
    id_vehiculo INT NOT NULL,
    CONSTRAINT PK_Cita_Id PRIMARY KEY(id),
    CONSTRAINT FK_Cliente_Cita_Id FOREIGN KEY(id_cliente) REFERENCES cliente(id),
    CONSTRAINT FK_Vehiculo_Cita_Id FOREIGN KEY(id_vehiculo) REFERENCES vehiculo(id)
);

CREATE TABLE orden_compra (
    id INT AUTO_INCREMENT,
    fecha DATE NOT NULL,
    id_proveedor INT NOT NULL,
    id_empleado INT NOT NULL,
    total DECIMAL(10, 2) NOT NULL,
    CONSTRAINT PK_OrdenCompra_Id PRIMARY KEY(id),
    CONSTRAINT FK_Proveedor_OrdenCompra_Id FOREIGN KEY(id_proveedor) REFERENCES proveedor(id),
    CONSTRAINT FK_Empleado_OrdenCompra_Id FOREIGN KEY(id_empleado) REFERENCES empleado(id)
);

CREATE TABLE factura (
    id INT AUTO_INCREMENT,
    fecha DATE NOT NULL,
    id_cliente INT NOT NULL,
    total DECIMAL(10, 2) NOT NULL,
    CONSTRAINT PK_Factura_Id PRIMARY KEY(id),
    CONSTRAINT FK_Cliente_Factura_Id FOREIGN KEY(id_cliente) REFERENCES cliente(id)
);

CREATE TABLE reparacion_servicio (
    id_reparacion INT NOT NULL,
    id_servicio INT NOT NULL,
    CONSTRAINT PK_ReparacionServicio_Id PRIMARY KEY(id_reparacion, id_servicio),
    CONSTRAINT FK_Reparacion_ReparacionServicio_Id FOREIGN KEY(id_reparacion) REFERENCES reparacion(id),
    CONSTRAINT FK_Servicio_ReparacionServicio_Id FOREIGN KEY(id_servicio) REFERENCES servicio(id)
);

CREATE TABLE precio (
    id_proveedor INT NOT NULL,
    id_pieza INT NOT NULL,
    precio_venta DECIMAL(10, 2) NOT NULL,
    precio_proveedor DECIMAL(10, 2) NOT NULL,
    CONSTRAINT PK_Precio_Id PRIMARY KEY(id_proveedor, id_pieza),
    CONSTRAINT FK_Proveedor_Precio_Id FOREIGN KEY(id_proveedor) REFERENCES proveedor(id),
    CONSTRAINT FK_Pieza_Precio_Id FOREIGN KEY(id_pieza) REFERENCES pieza(id)
);

CREATE TABLE reparacion_piezas (
    id_reparacion INT NOT NULL,
    id_pieza INT NOT NULL,
    cantidad INT NOT NULL,
    CONSTRAINT PK_ReparacionPieza_Id PRIMARY KEY(id_reparacion, id_pieza),
    CONSTRAINT FK_Reparacion_ReparacionPieza_Id FOREIGN KEY(id_reparacion) REFERENCES reparacion(id),
    CONSTRAINT FK_Pieza_ReparacionPieza_Id FOREIGN KEY(id_pieza) REFERENCES pieza(id)
);

CREATE TABLE cita_servicio (
    id_cita INT NOT NULL,
    id_servicio INT NOT NULL,
    CONSTRAINT PK_CitaServicio_Id PRIMARY KEY(id_cita, id_servicio),
    CONSTRAINT FK_Cita_CitaServicio_Id FOREIGN KEY(id_cita) REFERENCES cita(id),
    CONSTRAINT FK_Servicio_CitaServicio_Id FOREIGN KEY(id_servicio) REFERENCES servicio(id)
);

CREATE TABLE pieza_inventario (
    id_inventario INT NOT NULL,
    id_pieza INT NOT NULL,
    CONSTRAINT PK_PiezaInventario_Id PRIMARY KEY(id_inventario, id_pieza),
    CONSTRAINT FK_Inventario_PiezaInventario_Id FOREIGN KEY(id_inventario) REFERENCES inventario(id),
    CONSTRAINT FK_Pieza_PiezaInventario_Id FOREIGN KEY(id_pieza) REFERENCES pieza(id)
);

CREATE TABLE orden_detalle (
    id_orden INT NOT NULL,
    id_pieza INT NOT NULL,
    cantidad INT NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    CONSTRAINT PK_OrdenDetalle_Id PRIMARY KEY(id_orden, id_pieza),
    CONSTRAINT FK_OrdenCompra_OrdenDetalle_Id FOREIGN KEY(id_orden) REFERENCES orden_compra(id),
    CONSTRAINT FK_Pieza_OrdenDetalle_Id FOREIGN KEY(id_pieza) REFERENCES pieza(id)
);

CREATE TABLE factura_detalle (
    id_factura INT NOT NULL,
    id_reparacion INT NOT NULL,
    cantidad INT NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    CONSTRAINT PK_FacturaDetalle_Id PRIMARY KEY(id_factura, id_reparacion),
    CONSTRAINT FK_Factura_FacturaDetalle_Id FOREIGN KEY(id_factura) REFERENCES factura(id),
    CONSTRAINT FK_Reparacion_FacturaDetalle_Id FOREIGN KEY(id_reparacion) REFERENCES reparacion(id)
);




-- Daniel Navas - C.C: 1.***.***.797

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
    CONSTRAINT PK_Cliente_Id PRIMARY KEY(id)
);

CREATE TABLE Vehiculo (
    id INT PRIMARY KEY,
    Placa VARCHAR(10),
    Marca VARCHAR(50),
    Modelo VARCHAR(50),
    Año INT,
    ClienteID INT,
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);

CREATE TABLE Servicio (
    id INT PRIMARY KEY,
    Nombre VARCHAR(50),
    Descripcion TEXT,
    Costo DECIMAL(10, 2)
);


CREATE TABLE Reparacion (
    id INT PRIMARY KEY,
    Fecha DATE,
    VehiculoID INT,
    EmpleadoID INT,
    ServicioID INT,
    CostoTotal DECIMAL(10, 2),
    Descripcion TEXT,
    FOREIGN KEY (VehiculoID) REFERENCES Vehiculos(VehiculoID),
    FOREIGN KEY (EmpleadoID) REFERENCES Empleados(EmpleadoID),
    FOREIGN KEY (ServicioID) REFERENCES Servicios(ServicioID)
);

CREATE TABLE Empleado (
    id INT PRIMARY KEY,
    Nombre VARCHAR(50),
    Apellido VARCHAR(50),
    Cargo VARCHAR(50),
    Telefono VARCHAR(15)
);

CREATE TABLE Proveedor (
    id INT PRIMARY KEY,
    Nombre VARCHAR(50),
    Contacto VARCHAR(50),
    Telefono VARCHAR(15),
    Email VARCHAR(50)
);

CREATE TABLE Pieza (
    id INT PRIMARY KEY,
    Nombre VARCHAR(50),
    Descripcion TEXT,
    Precio DECIMAL(10, 2),
    ProveedorID INT,
    FOREIGN KEY (ProveedorID) REFERENCES Proveedores(ProveedorID)
);

CREATE TABLE ReparacionPieza (
    ReparacionID INT,
    PiezaID INT,
    Cantidad INT,
    PRIMARY KEY (ReparacionID, PiezaID),
    FOREIGN KEY (ReparacionID) REFERENCES Reparaciones(ReparacionID),
    FOREIGN KEY (PiezaID) REFERENCES Piezas(PiezaID)
);

CREATE TABLE Cita (
    id INT PRIMARY KEY,
    FechaHora DATETIME,
    ClienteID INT,
    VehiculoID INT,
    ServicioID INT,
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID),
    FOREIGN KEY (VehiculoID) REFERENCES Vehiculos(VehiculoID),
    FOREIGN KEY (ServicioID) REFERENCES Servicios(ServicioID)
);

CREATE TABLE Inventario (
    id INT PRIMARY KEY,
    PiezaID INT,
    Cantidad INT,
    Ubicacion VARCHAR(50),
    FOREIGN KEY (PiezaID) REFERENCES Piezas(PiezaID)
);

CREATE TABLE OrdenCompra (
    id INT PRIMARY KEY,
    Fecha DATE,
    ProveedorID INT,
    EmpleadoID INT,
    Total DECIMAL(10, 2),
    FOREIGN KEY (ProveedorID) REFERENCES Proveedores(ProveedorID),
    FOREIGN KEY (EmpleadoID) REFERENCES Empleados(EmpleadoID)
);

CREATE TABLE OrdenDetalle (
    OrdenID INT,
    PiezaID INT,
    Cantidad INT,
    Precio DECIMAL(10, 2),
    PRIMARY KEY (OrdenID, PiezaID),
    FOREIGN KEY (OrdenID) REFERENCES ordenes_Compra(OrdenID),
    FOREIGN KEY (PiezaID) REFERENCES Piezas(PiezaID)
);

CREATE TABLE Facturacion (
    id INT PRIMARY KEY,
    Fecha DATE,
    ClienteID INT,
    Total DECIMAL(10, 2),
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);

CREATE TABLE FacturaDetalle (
    FacturaID INT,
    ReparacionID INT,
    Cantidad INT,
    Precio DECIMAL(10, 2),
    PRIMARY KEY (FacturaID, ReparacionID),
    FOREIGN KEY (FacturaID) REFERENCES Facturacion(FacturaID),
    FOREIGN KEY (ReparacionID) REFERENCES Reparaciones(ReparacionID)
);




-- Daniel Navas - C.C: 1.***.***.797
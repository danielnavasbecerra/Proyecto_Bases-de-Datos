
-- ###############################################################
-- ###### COMANDOS DML (DB DiseñoAutomotriz) - Daniel Navas ######
-- ###############################################################

-- Inserciones Tabla Pais
INSERT INTO pais (nombre) VALUES 
('España'), 
('Estados Unidos'), 
('México');


-- Inserciones Tabla Region
-- Regiones para España:
INSERT INTO region (nombre) VALUES 
('Andalucía'), 
('Cataluña');

-- Regiones para Estados Unidos:
INSERT INTO region (nombre) VALUES 
('California'), 
('Texas');

-- Regiones para México:
INSERT INTO region (nombre) VALUES 
('Ciudad de México'), 
('Nuevo León');


-- Inserciones Tabla Ciudad
-- Ciudades para Andalucía (España):
INSERT INTO ciudad (nombre) VALUES 
('Sevilla'), 
('Málaga');
-- Ciudades para Cataluña (España):
INSERT INTO ciudad (nombre) VALUES 
('Barcelona'), 
('Girona');

-- Ciudades para California (Estados Unidos):
INSERT INTO ciudad (nombre) VALUES 
('Los Ángeles'), 
('San Francisco');
-- Ciudades para Texas (Estados Unidos):
INSERT INTO ciudad (nombre) VALUES 
('Houston'), 
('Dallas');

-- Ciudades para Ciudad de México (México):
INSERT INTO ciudad (nombre) VALUES 
('Ciudad de México'), 
('Guadalajara');
-- Ciudades para Nuevo León (México)
INSERT INTO ciudad (nombre) VALUES 
('Monterrey'), 
('San Nicolás de los Garza');


-- Inserciones Tabla TipoTelefono
INSERT INTO tipo_telefono (tipo) VALUES 
('Móvil'), 
('Fijo'), 
('Trabajo');


-- Inserciones Tabla Marca
INSERT INTO marca (nombre) VALUES
('Toyota'),
('Ford'),
('Volkswagen'),
('BMW'),
('Mercedes-Benz'),
('Audi');


-- Inserciones Tabla Servicio
INSERT INTO servicio (nombre, descripcion, costo) VALUES
('Cambio de aceite', 'Incluye cambio de filtro de aceite', 50.00),
('Alineación y balanceo', 'Alineación de ruedas y balanceo', 80.00),
('Cambio de frenos', 'Reemplazo de pastillas y discos de freno', 120.00),
('Reparación de motor', 'Reparación general del motor', 500.00),
('Cambio de neumáticos', 'Incluye montaje y balanceo de neumáticos', 200.00),
('Lavado y encerado', 'Lavado exterior e interior y encerado', 30.00),
('Reparación de chapa y pintura', 'Reparación de abolladuras y pintura', 150.00),
('Mantenimiento de aire acondicionado', 'Limpieza y mantenimiento del sistema de aire acondicionado', 80.00),
('Cambio de batería', 'Reemplazo de batería y revisión del sistema eléctrico', 100.00),
('Inspección de seguridad', 'Inspección de seguridad completa', 50.00);


-- Inserciones Tabla Cargo
INSERT INTO cargo (puesto) VALUES
('Gerente'),
('Mecánico'),
('Recepcionista'),
('Técnico de pintura'),
('Técnico de chapa'),
('Técnico de electricidad'),
('Auxiliar de limpieza');


-- Inserciones Tabla Contacto
INSERT INTO contacto (nombre, apellido, email) VALUES
('Juan', 'Pérez', 'juan.perez@example.com'),
('María', 'López', 'maria.lopez@example.com'),
('Carlos', 'Sánchez', 'carlos.sanchez@example.com'),
('Laura', 'García', 'laura.garcia@example.com'),
('Pedro', 'Martínez', 'pedro.martinez@example.com'),
('Ana', 'Rodríguez', 'ana.rodriguez@example.com'),
('Diego', 'Hernández', 'diego.hernandez@example.com'),
('Sofía', 'Díaz', 'sofia.diaz@example.com'),
('Luis', 'Torres', 'luis.torres@example.com'),
('Elena', 'Gómez', 'elena.gomez@example.com');


-- Inserciones Tabla Pieza
INSERT INTO pieza (nombre, descripcion) VALUES
('Filtro de aceite', 'Filtro de aceite de motor estándar'),
('Pastillas de freno', 'Pastillas de freno delanteras'),
('Discos de freno', 'Discos de freno delanteros'),
('Neumático', 'Neumático radial de 16 pulgadas'),
('Batería', 'Batería de automóvil de 12V'),
('Bujía', 'Bujía de encendido estándar'),
('Correa de distribución', 'Correa de distribución de motor'),
('Líquido refrigerante', 'Líquido refrigerante de motor'),
('Filtro de aire', 'Filtro de aire para motor'),
('Bombilla', 'Bombilla de luz de faro delantero');


-- Inserciones Tabla Ubicacion
INSERT INTO ubicacion (nombre) VALUES
('Almacén principal'),
('Almacén secundario'),
('Sala de exhibición'),
('Taller de mecánica'),
('Oficina administrativa'),
('Área de servicio al cliente'),
('Área de recepción'),
('Estacionamiento'),
('Área de lavado'),
('Zona de pintura');


-- Inserciones Tabla Cliente
INSERT INTO cliente (nombre, apellido, email) VALUES
('David', 'González', 'david.gonzalez@example.com'),
('Paula', 'Fernández', 'paula.fernandez@example.com'),
('Javier', 'Martínez', 'javier.martinez@example.com'),
('Andrea', 'López', 'andrea.lopez@example.com'),
('José', 'García', 'jose.garcia@example.com'),
('Marta', 'Sánchez', 'marta.sanchez@example.com'),
('Daniel', 'Pérez', 'daniel.perez@example.com'),
('Sara', 'Gómez', 'sara.gomez@example.com'),
('Alejandro', 'Muñoz', 'alejandro.munoz@example.com'),
('Cristina', 'Díaz', 'cristina.diaz@example.com');


-- Inserciones Tabla TelefonoCliente
-- Teléfonos para David González:
INSERT INTO telefono_cliente (id_cliente, id_tipo, numero) VALUES
(1, 1, '123456789'), -- Móvil
(1, 2, '987654321'); -- Fijo

-- Teléfonos para Paula Fernández:
INSERT INTO telefono_cliente (id_cliente, id_tipo, numero) VALUES
(2, 1, '234567890'), -- Móvil
(2, 3, '456789012'); -- Trabajo

-- Teléfonos para Javier Martínez:
INSERT INTO telefono_cliente (id_cliente, id_tipo, numero) VALUES
(3, 2, '345678901'), -- Fijo
(3, 1, '567890123'); -- Móvil

-- Teléfonos para Andrea López:
INSERT INTO telefono_cliente (id_cliente, id_tipo, numero) VALUES
(4, 1, '456789012'), -- Móvil
(4, 2, '678901234'); -- Fijo

-- Teléfonos para José García:
INSERT INTO telefono_cliente (id_cliente, id_tipo, numero) VALUES
(5, 1, '567890123'), -- Móvil
(5, 3, '789012345'); -- Trabajo

-- Teléfonos para Marta Sánchez:
INSERT INTO telefono_cliente (id_cliente, id_tipo, numero) VALUES
(6, 2, '678901234'), -- Fijo
(6, 1, '890123456'); -- Móvil

-- Teléfonos para Daniel Pérez:
INSERT INTO telefono_cliente (id_cliente, id_tipo, numero) VALUES
(7, 1, '789012345'), -- Móvil
(7, 3, '901234567'); -- Trabajo

-- Teléfonos para Sara Gómez:
INSERT INTO telefono_cliente (id_cliente, id_tipo, numero) VALUES
(8, 2, '890123456'), -- Fijo
(8, 1, '012345678'); -- Móvil

-- Teléfonos para Alejandro Muñoz:
INSERT INTO telefono_cliente (id_cliente, id_tipo, numero) VALUES
(9, 1, '901234567'), -- Móvil
(9, 2, '123456789'); -- Fijo

-- Teléfonos para Cristina Díaz:
INSERT INTO telefono_cliente (id_cliente, id_tipo, numero) VALUES
(10, 1, '012345678'), -- Móvil
(10, 3, '234567890'); -- Trabajo


-- Inserciones Tabla DireccionCliente
-- Direccion para David González en España, Andalucía, Sevilla:
INSERT INTO direccion_cliente (id_cliente, id_pais, id_region, id_ciudad, detalle) VALUES
(1, 1, 1, 1, 'Calle Principal, 123');

-- Direccion para Paula Fernández en España, Cataluña, Barcelona:
INSERT INTO direccion_cliente (id_cliente, id_pais, id_region, id_ciudad, detalle) VALUES
(2, 1, 2, 2, 'Plaza Mayor, 789');

-- Direccion para Javier Martínez en Estados Unidos, California, Los Ángeles:
INSERT INTO direccion_cliente (id_cliente, id_pais, id_region, id_ciudad, detalle) VALUES
(3, 2, 3, 3, 'Sunset Boulevard, 1234');

-- Direccion para Andrea López en Estados Unidos, California, San Francisco:
INSERT INTO direccion_cliente (id_cliente, id_pais, id_region, id_ciudad, detalle) VALUES
(4, 2, 3, 4, 'Golden Gate Street, 91011');

-- Direccion para José García en México, Ciudad de México, Ciudad de México:
INSERT INTO direccion_cliente (id_cliente, id_pais, id_region, id_ciudad, detalle) VALUES
(5, 3, 5, 5, 'Zócalo, 151617');

-- Direccion para Marta Sánchez en México, Nuevo León, Monterrey:
INSERT INTO direccion_cliente (id_cliente, id_pais, id_region, id_ciudad, detalle) VALUES
(6, 3, 6, 6, 'Constitución Avenue, 212223');

-- Direccion para Daniel Pérez en España, Andalucía, Málaga:
INSERT INTO direccion_cliente (id_cliente, id_pais, id_region, id_ciudad, detalle) VALUES
(7, 1, 1, 2, 'Calle Real, 272829');

-- Direccion para Sara Gómez en Estados Unidos, Texas, Dallas:
INSERT INTO direccion_cliente (id_cliente, id_pais, id_region, id_ciudad, detalle) VALUES
(8, 2, 4, 4, 'Main Street, 333435');

-- Direccion para Alejandro Muñoz en México, Ciudad de México, Ciudad de México:
INSERT INTO direccion_cliente (id_cliente, id_pais, id_region, id_ciudad, detalle) VALUES
(9, 3, 5, 5, 'Reforma Avenue, 394041');

-- Direccion para Cristina Díaz en España, Cataluña, Girona:
INSERT INTO direccion_cliente (id_cliente, id_pais, id_region, id_ciudad, detalle) VALUES
(10, 1, 2, 3, 'Rambla, 454647');


-- Inserciones Tabla Vehiculo
-- Vehículo de David González
INSERT INTO vehiculo (placa, id_marca, modelo, año_fabricacion, id_cliente) VALUES
('ABC123', 1, 'Corolla', 2020, 1);

-- Vehículo de Paula Fernández
INSERT INTO vehiculo (placa, id_marca, modelo, año_fabricacion, id_cliente) VALUES
('DEF456', 2, 'Fiesta', 2019, 2);

-- Vehículo de Javier Martínez
INSERT INTO vehiculo (placa, id_marca, modelo, año_fabricacion, id_cliente) VALUES
('GHI789', 3, 'Golf', 2018, 3);

-- Vehículo de Andrea López
INSERT INTO vehiculo (placa, id_marca, modelo, año_fabricacion, id_cliente) VALUES
('JKL012', 4, 'X5', 2021, 4);

-- Vehículo de José García
INSERT INTO vehiculo (placa, id_marca, modelo, año_fabricacion, id_cliente) VALUES
('MNO345', 5, 'Clase C', 2017, 5);

-- Vehículo de Marta Sánchez
INSERT INTO vehiculo (placa, id_marca, modelo, año_fabricacion, id_cliente) VALUES
('PQR678', 6, 'A3', 2019, 6);

-- Vehículo de Daniel Pérez
INSERT INTO vehiculo (placa, id_marca, modelo, año_fabricacion, id_cliente) VALUES
('STU901', 1, 'Yaris', 2020, 7);

-- Vehículo de Sara Gómez
INSERT INTO vehiculo (placa, id_marca, modelo, año_fabricacion, id_cliente) VALUES
('VWX234', 2, 'Focus', 2018, 8);

-- Vehículo de Alejandro Muñoz
INSERT INTO vehiculo (placa, id_marca, modelo, año_fabricacion, id_cliente) VALUES
('YZA567', 3, 'Polo', 2021, 9);

-- Vehículo de Cristina Díaz
INSERT INTO vehiculo (placa, id_marca, modelo, año_fabricacion, id_cliente) VALUES
('BCD890', 4, 'Serie 3', 2019, 10);


-- Inserciones Tabla Empleado
-- Empleado 1: Gerente
INSERT INTO empleado (nombre, apellido, id_cargo, email) VALUES
('Carlos', 'García', 1, 'carlos.garcia@example.com');

-- Empleado 2: Mecánico
INSERT INTO empleado (nombre, apellido, id_cargo, email) VALUES
('Luis', 'Martínez', 2, 'luis.martinez@example.com');

-- Empleado 3: Recepcionista
INSERT INTO empleado (nombre, apellido, id_cargo, email) VALUES
('Ana', 'López', 3, 'ana.lopez@example.com');

-- Empleado 4: Técnico de pintura
INSERT INTO empleado (nombre, apellido, id_cargo, email) VALUES
('Pedro', 'Fernández', 4, 'pedro.fernandez@example.com');

-- Empleado 5: Técnico de chapa
INSERT INTO empleado (nombre, apellido, id_cargo, email) VALUES
('María', 'Gómez', 5, 'maria.gomez@example.com');

-- Empleado 6: Técnico de electricidad
INSERT INTO empleado (nombre, apellido, id_cargo, email) VALUES
('Jorge', 'Díaz', 6, 'jorge.diaz@example.com');

-- Empleado 7: Auxiliar de limpieza
INSERT INTO empleado (nombre, apellido, id_cargo, email) VALUES
('Elena', 'Rodríguez', 7, 'elena.rodriguez@example.com');


-- Inserciones Tabla TelefonoEmpleado
-- Teléfono del Gerente
INSERT INTO telefono_empleado (id_empleado, id_tipo, numero) VALUES
(1, 1, '+1234567890');

-- Teléfono del Mecánico
INSERT INTO telefono_empleado (id_empleado, id_tipo, numero) VALUES
(2, 1, '+2345678901');

-- Teléfono del Recepcionista
INSERT INTO telefono_empleado (id_empleado, id_tipo, numero) VALUES
(3, 1, '+3456789012');

-- Teléfono del Técnico de pintura
INSERT INTO telefono_empleado (id_empleado, id_tipo, numero) VALUES
(4, 1, '+4567890123');

-- Teléfono del Técnico de chapa
INSERT INTO telefono_empleado (id_empleado, id_tipo, numero) VALUES
(5, 1, '+5678901234');

-- Teléfono del Técnico de electricidad
INSERT INTO telefono_empleado (id_empleado, id_tipo, numero) VALUES
(6, 1, '+6789012345');

-- Teléfono del Auxiliar de limpieza
INSERT INTO telefono_empleado (id_empleado, id_tipo, numero) VALUES
(7, 1, '+7890123456');


-- Inserciones Tabla Reparacion
INSERT INTO reparacion (fecha, id_empleado, id_vehiculo, costo_total, descripcion) VALUES
('2024-06-01', 2, 1, 500.00, 'Reparación del motor'),
('2024-06-02', 3, 2, 350.00, 'Cambio de neumáticos'),
('2024-06-03', 4, 3, 700.00, 'Reparación de la carrocería'),
('2024-06-04', 5, 4, 200.00, 'Lavado y pulido del vehículo'),
('2024-06-05', 6, 5, 1000.00, 'Reparación del sistema eléctrico'),
('2024-06-06', 7, 6, 800.00, 'Reparación de la pintura'),
('2024-06-07', 2, 7, 600.00, 'Alineación y balanceo'),
('2024-06-08', 3, 8, 900.00, 'Reparación del sistema de frenos'),
('2024-06-09', 4, 9, 400.00, 'Cambio de aceite y filtro'),
('2024-06-10', 5, 10, 300.00, 'Reparación de la suspensión');


-- Inserciones Tabla Proveedor
INSERT INTO proveedor (nombre, id_contacto, email) VALUES
('Autopiezas García', 1, 'autopiezas.garcia@example.com'),
('Talleres López', 2, 'talleres.lopez@example.com'),
('Distribuidora Martínez', 3, 'distribuidora.martinez@example.com'),
('Repuestos Sánchez', 4, 'repuestos.sanchez@example.com'),
('Autopartes Rodríguez', 5, 'autopartes.rodriguez@example.com'),
('Mecánica Hernández', 6, 'mecanica.hernandez@example.com'),
('Frenos Gómez', 7, 'frenos.gomez@example.com'),
('Neumáticos Torres', 8, 'neumaticos.torres@example.com'),
('Autorepuestos Díaz', 9, 'autorepuestos.diaz@example.com'),
('Talleres Gutiérrez', 10, 'talleres.gutierrez@example.com');


-- Inserciones Tabla TelefonoProveedor
INSERT INTO telefono_proveedor (id_proveedor, id_tipo, numero) VALUES
(1, 1, '+1234567890'),
(2, 1, '+2345678901'),
(3, 1, '+3456789012'),
(4, 1, '+4567890123'),
(5, 1, '+5678901234'),
(6, 1, '+6789012345'),
(7, 1, '+7890123456'),
(8, 1, '+8901234567'),
(9, 1, '+9012345678'),
(10, 1, '+0123456789');


-- Inserciones Tabla Inventario
INSERT INTO inventario (cantidad, id_ubicacion) VALUES
(100, 1),
(50, 2),
(20, 3),
(80, 4),
(10, 5),
(30, 6),
(15, 7),
(200, 8),
(40, 9),
(25, 10);


-- Inserciones Tabla Cita
INSERT INTO cita (fecha_hora, id_cliente, id_vehiculo) VALUES
('2024-06-15 09:00:00', 1, 1),
('2024-06-16 10:30:00', 2, 2),
('2024-06-17 11:00:00', 3, 3),
('2024-06-18 14:00:00', 4, 4),
('2024-06-19 15:30:00', 5, 5),
('2024-06-20 08:00:00', 6, 6),
('2024-06-21 09:30:00', 7, 7),
('2024-06-22 12:00:00', 8, 8),
('2024-06-23 13:30:00', 9, 9),
('2024-06-24 16:00:00', 10, 10);


-- Inserciones Tabla OrdenCompra
INSERT INTO orden_compra (fecha, id_proveedor, id_empleado, total) VALUES
('2024-06-15', 1, 1, 1500.00),
('2024-06-16', 2, 2, 2000.00),
('2024-06-17', 3, 3, 1800.00),
('2024-06-18', 4, 4, 2200.00),
('2024-06-19', 5, 5, 2500.00),
('2024-06-20', 6, 6, 1900.00),
('2024-06-21', 7, 7, 1700.00),
('2024-06-22', 8, 1, 2100.00),
('2024-06-23', 9, 2, 2300.00),
('2024-06-24', 10, 3, 2600.00);


-- Inserciones Tabla Factura
INSERT INTO factura (fecha, id_cliente, total) VALUES
('2024-06-15', 1, 500.00),
('2024-06-16', 2, 700.00),
('2024-06-17', 3, 600.00),
('2024-06-18', 4, 800.00),
('2024-06-19', 5, 900.00),
('2024-06-20', 6, 750.00),
('2024-06-21', 7, 650.00),
('2024-06-22', 8, 850.00),
('2024-06-23', 9, 950.00),
('2024-06-24', 10, 1000.00);


-- Inserciones Tabla ReparacionServicio
-- Servicios de la Reparación 1 (Reparación del motor)
INSERT INTO reparacion_servicio (id_reparacion, id_servicio) VALUES
(1, 4);  -- Reparación de motor

-- Servicios de la Reparación 2 (Cambio de neumáticos)
INSERT INTO reparacion_servicio (id_reparacion, id_servicio) VALUES
(2, 5);  -- Cambio de neumáticos

-- Servicios de la Reparación 3 (Reparación de la carrocería)
INSERT INTO reparacion_servicio (id_reparacion, id_servicio) VALUES
(3, 7);  -- Reparación de chapa y pintura

-- Servicios de la Reparación 4 (Lavado y pulido del vehículo)
INSERT INTO reparacion_servicio (id_reparacion, id_servicio) VALUES
(4, 6);  -- Lavado y encerado

-- Servicios de la Reparación 5 (Reparación del sistema eléctrico)
INSERT INTO reparacion_servicio (id_reparacion, id_servicio) VALUES
(5, 8);  -- Mantenimiento de aire acondicionado

-- Servicios de la Reparación 6 (Reparación de la pintura)
INSERT INTO reparacion_servicio (id_reparacion, id_servicio) VALUES
(6, 7);  -- Reparación de chapa y pintura

-- Servicios de la Reparación 7 (Alineación y balanceo)
INSERT INTO reparacion_servicio (id_reparacion, id_servicio) VALUES
(7, 2);  -- Alineación y balanceo

-- Servicios de la Reparación 8 (Reparación del sistema de frenos)
INSERT INTO reparacion_servicio (id_reparacion, id_servicio) VALUES
(8, 3);  -- Cambio de frenos

-- Servicios de la Reparación 9 (Cambio de aceite y filtro)
INSERT INTO reparacion_servicio (id_reparacion, id_servicio) VALUES
(9, 1);  -- Cambio de aceite

-- Servicios de la Reparación 10 (Reparación de la suspensión)
INSERT INTO reparacion_servicio (id_reparacion, id_servicio) VALUES
(10, 10);  -- Inspección de seguridad


-- Inserciones Tabla Servicio
-- Precios para Autopiezas García
INSERT INTO precio (id_proveedor, id_pieza, precio_venta, precio_proveedor) VALUES
(1, 1, 10.00, 7.00),   -- Filtro de aceite
(1, 10, 5.00, 3.50);   -- Bombilla

-- Precios para Talleres López
INSERT INTO precio (id_proveedor, id_pieza, precio_venta, precio_proveedor) VALUES
(2, 2, 40.00, 30.00),  -- Pastillas de freno
(2, 3, 60.00, 45.00);  -- Discos de freno

-- Precios para Distribuidora Martínez
INSERT INTO precio (id_proveedor, id_pieza, precio_venta, precio_proveedor) VALUES
(3, 4, 150.00, 120.00);  -- Neumático

-- Precios para Repuestos Sánchez
INSERT INTO precio (id_proveedor, id_pieza, precio_venta, precio_proveedor) VALUES
(4, 5, 80.00, 60.00);   -- Batería

-- Precios para Autopartes Rodríguez
INSERT INTO precio (id_proveedor, id_pieza, precio_venta, precio_proveedor) VALUES
(5, 6, 2.50, 1.75);   -- Bujía

-- Precios para Mecánica Hernández
INSERT INTO precio (id_proveedor, id_pieza, precio_venta, precio_proveedor) VALUES
(6, 7, 30.00, 20.00);   -- Correa de distribución

-- Precios para Frenos Gómez
INSERT INTO precio (id_proveedor, id_pieza, precio_venta, precio_proveedor) VALUES
(7, 8, 10.00, 7.00);   -- Líquido refrigerante

-- Precios para Neumáticos Torres
INSERT INTO precio (id_proveedor, id_pieza, precio_venta, precio_proveedor) VALUES
(8, 9, 5.00, 3.50);   -- Filtro de aire

-- Precios para Autorepuestos Díaz
INSERT INTO precio (id_proveedor, id_pieza, precio_venta, precio_proveedor) VALUES
(9, 10, 3.00, 2.00);   -- Bombilla

-- Precios para Talleres Gutiérrez
INSERT INTO precio (id_proveedor, id_pieza, precio_venta, precio_proveedor) VALUES
(10, 1, 9.00, 6.50),   -- Filtro de aceite
(10, 2, 35.00, 25.00),  -- Pastillas de freno
(10, 3, 55.00, 40.00),  -- Discos de freno
(10, 4, 140.00, 110.00),  -- Neumático
(10, 5, 75.00, 55.00),  -- Batería
(10, 6, 2.00, 1.50),   -- Bujía
(10, 7, 25.00, 15.00),   -- Correa de distribución
(10, 8, 8.00, 5.00),   -- Líquido refrigerante
(10, 9, 4.00, 2.50),   -- Filtro de aire
(10, 10, 2.00, 1.25);  -- Bombilla


-- Inserciones Tabla ReparacionPiezas
-- Piezas para la reparación del motor (Reparación ID: 1)
INSERT INTO reparacion_piezas (id_reparacion, id_pieza, cantidad) VALUES
(1, 1, 1),   -- Filtro de aceite
(1, 6, 4);   -- Bujía

-- Piezas para el cambio de neumáticos (Reparación ID: 2)
INSERT INTO reparacion_piezas (id_reparacion, id_pieza, cantidad) VALUES
(2, 4, 4);   -- Neumático

-- Piezas para la reparación de la carrocería (Reparación ID: 3)
-- No se utilizaron piezas

-- Piezas para el lavado y pulido del vehículo (Reparación ID: 4)
-- No se utilizaron piezas

-- Piezas para la reparación del sistema eléctrico (Reparación ID: 5)
-- No se utilizaron piezas

-- Piezas para la reparación de la pintura (Reparación ID: 6)
-- No se utilizaron piezas

-- Piezas para la alineación y balanceo (Reparación ID: 7)
-- No se utilizaron piezas

-- Piezas para la reparación del sistema de frenos (Reparación ID: 8)
-- No se utilizaron piezas

-- Piezas para el cambio de aceite y filtro (Reparación ID: 9)
INSERT INTO reparacion_piezas (id_reparacion, id_pieza, cantidad) VALUES
(9, 1, 1);   -- Filtro de aceite

-- Piezas para la reparación de la suspensión (Reparación ID: 10)
-- No se utilizaron piezas


-- Inserciones Tabla CitaServicio
INSERT INTO cita_servicio (id_cita, id_servicio) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);


-- Inserciones Tabla PiezaInventario
INSERT INTO pieza_inventario (id_inventario, id_pieza) VALUES
(1, 1),
(2, 2),
(3, 3), 
(4, 4),
(5, 5), 
(6, 6),
(7, 7),
(8, 8), 
(9, 9),
(10, 10);


-- Inserciones Tabla OrdenDetalle
INSERT INTO orden_detalle (id_orden, id_pieza, cantidad, precio) VALUES
(1, 1, 10, 15.00),
(1, 2, 20, 25.00),
(2, 3, 15, 30.00),
(2, 4, 30, 40.00),
(3, 5, 8, 50.00),
(3, 6, 12, 20.00),
(4, 7, 5, 10.00),
(4, 8, 10, 15.00),
(5, 9, 20, 5.00),
(5, 10, 15, 8.00),
(6, 1, 18, 12.00),
(6, 2, 25, 22.00),
(7, 3, 10, 35.00),
(7, 4, 18, 45.00),
(8, 5, 6, 55.00),
(8, 6, 8, 18.00),
(9, 7, 4, 60.00),
(9, 8, 7, 25.00),
(10, 9, 15, 4.00),
(10, 10, 12, 10.00);


-- Inserciones Tabla FacturaDetalle
INSERT INTO factura_detalle (id_factura, id_reparacion, cantidad, precio) VALUES
(1, 1, 1, 500.00),
(2, 2, 1, 350.00),
(3, 3, 1, 700.00),
(4, 4, 1, 200.00),
(5, 5, 1, 1000.00),
(6, 6, 1, 800.00),
(7, 7, 1, 600.00),
(8, 8, 1, 900.00),
(9, 9, 1, 400.00),
(10, 10, 1, 300.00);




-- Daniel Navas - C.C: 1.***.***.797
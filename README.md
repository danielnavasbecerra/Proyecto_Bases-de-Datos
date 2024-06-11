# Proyecto_Bases-de-Datos

> [!NOTE]
>
> #### Se añadieron las imagenes sobre los Modelos(Conceptual, Lógico, Fisico y  Relacional) arriba 🔝 en los archivos llamados #Modelo_DanielNavas.png
>
> #### Se añadieron los comandos DDL(**Data Definition Language**) arriba 🔝 en el archivo llamado DDL_DanielNavas.sql
>
> #### Se añadieron los comandos DML(**Data Manipulation Language**) arriba 🔝 en el archivo llamado DML_DanielNavas.sql
>
> 



## Tablas

```mysql
+-----------------------------+
| Tables_in_automotive_design |
+-----------------------------+
| cargo                       |
| cita                        |
| cita_servicio               |
| ciudad                      |
| cliente                     |
| contacto                    |
| direccion_cliente           |
| empleado                    |
| factura                     |
| factura_detalle             |
| inventario                  |
| marca                       |
| orden_compra                |
| orden_detalle               |
| pais                        |
| pieza                       |
| pieza_inventario            |
| precio                      |
| proveedor                   |
| region                      |
| reparacion                  |
| reparacion_piezas           |
| reparacion_servicio         |
| servicio                    |
| telefono_cliente            |
| telefono_empleado           |
| telefono_proveedor          |
| tipo_telefono               |
| ubicacion                   |
| vehiculo                    |
+-----------------------------+
```



## Consultas Requeridas

1. Obtener el historial de reparaciones de un vehículo específico.

   ```mysql
   SELECT r.fecha AS fecha_reparacion, s.nombre AS servicio, r.costo_total, r.descripcion
   FROM reparacion AS r
   JOIN reparacion_servicio AS rs ON r.id = rs.id_reparacion
   JOIN servicio AS s ON rs.id_servicio = s.id
   JOIN vehiculo AS v ON r.id_vehiculo = v.id
   WHERE v.placa = 'DEF456';
   
   +------------------+----------------------+-------------+----------------------+
   | fecha_reparacion | servicio             | costo_total | descripcion          |
   +------------------+----------------------+-------------+----------------------+
   | 2024-06-02       | Cambio de neumáticos |      350.00 | Cambio de neumáticos |
   +------------------+----------------------+-------------+----------------------+
   
   ```

   > ###### Se esta seleccionando la fecha de la reparación, el nombre del servicio, el costo total y la descripción de la reparación; luego se están combinando las tabla de reparaciones (`reparacion`), la tabla que relaciona las reparaciones con los servicios (`reparacion_servicio`), la tabla de servicios (`servicio`) y la tabla de vehículos (`vehiculo`)  utilizando la cláusula `JOIN`; luego se están limitando los resultados solo a las reparaciones asociadas con un vehículo específico, esto se hace comparando la placa del vehículo con la placa que hemos puesto, en este caso, `'DEF456'`.
   
   

2. Calcular el costo total de todas las reparaciones realizadas por un empleado específico en un período de tiempo.

   ```mysql
   SELECT e.nombre AS nombre_empleado, SUM(r.costo_total) AS costo_total_reparaciones
   FROM reparacion AS r
   JOIN empleado AS e ON r.id_empleado = e.id
   WHERE e.id = 4
   AND r.fecha BETWEEN '2024-06-03' AND '2024-06-09';
   
   +-----------------+--------------------------+
   | nombre_empleado | costo_total_reparaciones |
   +-----------------+--------------------------+
   | Pedro           |                  1100.00 |
   +-----------------+--------------------------+
   
   ```

   > ###### Se esta seleccionando el nombre del empleado y la suma total de los costos de las reparaciones realizadas por el empleado; luego se están combinando las tablas de reparación (`reparacion`) y empleado (`empleado`) utilizando la cláusula `JOIN`, esto nos permite asociar cada reparación con su respectivo empleado; luego se limitan los resultados solo a las reparaciones realizadas por el empleado específico (`e.id = ID_DEL_EMPLEADO`) dentro del período de tiempo especificado (`r.fecha BETWEEN 'FECHA_INICIAL' AND 'FECHA_FINAL'`).
   
   

3. Listar todos los clientes y los vehículos que poseen.

   ```mysql
   SELECT c.nombre AS nombre_cliente, c.apellido AS apellido_cliente, v.placa, v.modelo
   FROM cliente AS c
   LEFT JOIN vehiculo AS v ON c.id = v.id_cliente;
   
   +----------------+------------------+--------+---------+
   | nombre_cliente | apellido_cliente | placa  | modelo  |
   +----------------+------------------+--------+---------+
   | David          | González         | ABC123 | Corolla |
   | Paula          | Fernández        | DEF456 | Fiesta  |
   | Javier         | Martínez         | GHI789 | Golf    |
   | Andrea         | López            | JKL012 | X5      |
   | José           | García           | MNO345 | Clase C |
   | Marta          | Sánchez          | PQR678 | A3      |
   | Daniel         | Pérez            | STU901 | Yaris   |
   | Sara           | Gómez            | VWX234 | Focus   |
   | Alejandro      | Muñoz            | YZA567 | Polo    |
   | Cristina       | Díaz             | BCD890 | Serie 3 |
   +----------------+------------------+--------+---------+
   
   ```

   > ###### Se esta seleccionando el nombre y apellido del cliente (`c.nombre`, `c.apellido`), así como la placa y modelo de los vehículos que poseen (`v.placa`, `v.modelo`); luego se combinan las tablas de cliente (`cliente`) y vehículo (`vehiculo`) utilizando un `LEFT JOIN`, esto nos permite incluir todos los clientes, incluso aquellos que no tienen vehículos asociados en la tabla de vehículos (Aunque en este caso todos tienen un vehículo); luego se esta asociando cada cliente con sus vehículos correspondientes `c.id = v.id_cliente`, lo que permite mostrar los vehículos que posee cada cliente.
   
   

4. Obtener la cantidad de piezas en inventario para cada pieza.

   ```mysql
   SELECT p.nombre AS nombre_pieza, COUNT(*) AS cantidad_en_inventario
   FROM pieza AS p
   LEFT JOIN pieza_inventario AS pi ON p.id = pi.id_pieza
   GROUP BY p.nombre;
   
   +------------------------+------------------------+
   | nombre_pieza           | cantidad_en_inventario |
   +------------------------+------------------------+
   | Batería                |                      1 |
   | Bombilla               |                      1 |
   | Bujía                  |                      1 |
   | Correa de distribución |                      1 |
   | Discos de freno        |                      1 |
   | Filtro de aceite       |                      1 |
   | Filtro de aire         |                      1 |
   | Líquido refrigerante   |                      1 |
   | Neumático              |                      1 |
   | Pastillas de freno     |                      1 |
   +------------------------+------------------------+
   
   ```

   > ###### Se esta seleccionando el nombre de la pieza (`p.nombre`) y contando la cantidad de registros en la tabla de inventario asociados con cada tipo de pieza (`COUNT(*) AS cantidad_en_inventario`); luego se combinan las tablas de pieza (`pieza`) y pieza_inventario (`pieza_inventario`) utilizando un `LEFT JOIN`, lo que permite incluir todas las piezas, incluso aquellas que no tienen registros en la tabla de inventario; luego se están agrupando los datos por el nombre de la pieza (`GROUP BY p.nombre`), lo que permite contar la cantidad de registros en la tabla de inventario asociados con cada tipo de pieza.
   
   

5. Obtener las citas programadas para un día específico.

   ```mysql
   SELECT c.fecha_hora, cl.nombre AS nombre_cliente, cl.apellido AS apellido_cliente, v.placa, v.modelo
   FROM cita AS c
   JOIN cliente AS cl ON c.id_cliente = cl.id
   JOIN vehiculo AS v ON c.id_vehiculo = v.id
   WHERE DATE(c.fecha_hora) = '2024-06-17';
   
   +---------------------+----------------+------------------+--------+--------+
   | fecha_hora          | nombre_cliente | apellido_cliente | placa  | modelo |
   +---------------------+----------------+------------------+--------+--------+
   | 2024-06-17 11:00:00 | Javier         | Martínez         | GHI789 | Golf   |
   +---------------------+----------------+------------------+--------+--------+
   
   ```

   > ###### Se selecciona la fecha y hora de la cita (`c.fecha_hora`), así como el nombre y apellido del cliente (`cl.nombre`, `cl.apellido`) y la placa y modelo del vehículo (`v.placa`, `v.modelo`) asociados con cada cita; luego se combinan las tablas de cita (`cita`), cliente (`cliente`) y vehículo (`vehiculo`) utilizando `JOIN`, esto permite obtener la información necesaria sobre cada cita, el cliente asociado y el vehículo asociado; luego se filtran los resultados para incluir solo las citas cuya fecha coincida con el día específico proporcionado. Utilizamos la función `DATE()` para extraer solo la fecha de `c.fecha_hora` y luego comparamos esta fecha con la fecha específica proporcionada.
   >
   
   
   
6. Generar una factura para un cliente específico en una fecha determinada.

   ```mysql
   SELECT c.nombre AS nombre_cliente, c.apellido AS apellido_cliente, r.fecha, SUM(r.costo_total) AS total_factura
   FROM cliente AS c
   JOIN vehiculo AS v ON c.id = v.id_cliente
   JOIN reparacion AS r ON v.id = r.id_vehiculo
   WHERE c.id = 1
   AND DATE(r.fecha) = '2024-06-01'
   GROUP BY c.nombre, c.apellido, r.fecha;
   
   +----------------+------------------+------------+---------------+
   | nombre_cliente | apellido_cliente | fecha      | total_factura |
   +----------------+------------------+------------+---------------+
   | David          | González         | 2024-06-01 |        500.00 |
   +----------------+------------------+------------+---------------+
   
   ```

   > ###### Se selecciona el nombre y apellido del cliente (`c.nombre`, `c.apellido`), la fecha de la reparación (`r.fecha`) y la suma total de los costos de reparación (`SUM(r.costo_total) AS total_factura`) para generar el total de la factura; luego se combinan las tablas de cliente (`cliente`), vehículo (`vehiculo`) y reparación (`reparacion`) utilizando `JOIN`. Esto nos permite obtener la información necesaria sobre las reparaciones realizadas por el cliente específico; luego se filtran los resultados para incluir solo las reparaciones realizadas por el cliente específico en la fecha determinada. Utilizamos la función `DATE()` para extraer solo la fecha de `r.fecha` y luego comparamos esta fecha con la fecha especificada; luego se  agrupan los datos por el nombre del cliente, el apellido y la fecha de la reparación (`GROUP BY c.nombre, c.apellido, r.fecha`). Esto nos permite calcular el total de la factura para cada cliente en la fecha especificada.
   >
   
   
   
7. Listar todas las órdenes de compra y sus detalles.

   ```mysql
   SELECT oc.id AS id_orden_compra, oc.fecha, p.nombre AS nombre_proveedor, od.id_pieza, od.cantidad, od.precio
   FROM orden_compra AS oc
   JOIN orden_detalle AS od ON oc.id = od.id_orden
   JOIN proveedor p ON oc.id_proveedor = p.id;
   
   +-----------------+------------+------------------------+----------+----------+--------+
   | id_orden_compra | fecha      | nombre_proveedor       | id_pieza | cantidad | precio |
   +-----------------+------------+------------------------+----------+----------+--------+
   |               1 | 2024-06-15 | Autopiezas García      |        1 |       10 |  15.00 |
   |               1 | 2024-06-15 | Autopiezas García      |        2 |       20 |  25.00 |
   |               2 | 2024-06-16 | Talleres López         |        3 |       15 |  30.00 |
   |               2 | 2024-06-16 | Talleres López         |        4 |       30 |  40.00 |
   |               3 | 2024-06-17 | Distribuidora Martínez |        5 |        8 |  50.00 |
   |               3 | 2024-06-17 | Distribuidora Martínez |        6 |       12 |  20.00 |
   |               4 | 2024-06-18 | Repuestos Sánchez      |        7 |        5 |  10.00 |
   |               4 | 2024-06-18 | Repuestos Sánchez      |        8 |       10 |  15.00 |
   |               5 | 2024-06-19 | Autopartes Rodríguez   |        9 |       20 |   5.00 |
   |               5 | 2024-06-19 | Autopartes Rodríguez   |       10 |       15 |   8.00 |
   |               6 | 2024-06-20 | Mecánica Hernández     |        1 |       18 |  12.00 |
   |               6 | 2024-06-20 | Mecánica Hernández     |        2 |       25 |  22.00 |
   |               7 | 2024-06-21 | Frenos Gómez           |        3 |       10 |  35.00 |
   |               7 | 2024-06-21 | Frenos Gómez           |        4 |       18 |  45.00 |
   |               8 | 2024-06-22 | Neumáticos Torres      |        5 |        6 |  55.00 |
   |               8 | 2024-06-22 | Neumáticos Torres      |        6 |        8 |  18.00 |
   |               9 | 2024-06-23 | Autorepuestos Díaz     |        7 |        4 |  60.00 |
   |               9 | 2024-06-23 | Autorepuestos Díaz     |        8 |        7 |  25.00 |
   |              10 | 2024-06-24 | Talleres Gutiérrez     |        9 |       15 |   4.00 |
   |              10 | 2024-06-24 | Talleres Gutiérrez     |       10 |       12 |  10.00 |
   +-----------------+------------+------------------------+----------+----------+--------+
   
   ```

   > ###### Estamos seleccionando el ID de la orden de compra (`oc.id`), la fecha de la orden de compra (`oc.fecha`), el nombre del proveedor (`p.nombre`), el ID de la pieza comprada (`od.id_pieza`), la cantidad de piezas compradas (`od.cantidad`) y el precio de cada pieza (`od.precio`).
   >
   > ###### Estamos combinando las tablas de orden de compra (`orden_compra`), orden de compra detalle (`orden_detalle`) y proveedor (`proveedor`) utilizando `JOIN`. Esto nos permite obtener la información necesaria sobre cada orden de compra y sus detalles, así como el proveedor asociado con cada orden.
   
   

8. Obtener el costo total de piezas utilizadas en una reparación específica.

   ```mysql
   *
   ```

   > [!TIP]

   

9. Obtener el inventario de piezas que necesitan ser reabastecidas (cantidad menor que un umbral).

   ```mysql
   *
   ```

   > [!TIP]

   

10. Obtener la lista de servicios más solicitados en un período específico.

    ```mysql
    SELECT s.nombre AS nombre_servicio, COUNT(*) AS cantidad_solicitudes
    FROM reparacion_servicio rs
    JOIN servicio s ON rs.id_servicio = s.id
    JOIN reparacion r ON rs.id_reparacion = r.id
    WHERE r.fecha BETWEEN '2024-06-02' AND '2024-06-07'
    GROUP BY s.nombre
    ORDER BY cantidad_solicitudes DESC;
    
    +-------------------------------------+----------------------+
    | nombre_servicio                     | cantidad_solicitudes |
    +-------------------------------------+----------------------+
    | Reparación de chapa y pintura       |                    2 |
    | Cambio de neumáticos                |                    1 |
    | Alineación y balanceo               |                    1 |
    | Mantenimiento de aire acondicionado |                    1 |
    | Lavado y encerado                   |                    1 |
    +-------------------------------------+----------------------+
    
    ```

    > ###### Estamos seleccionando el nombre del servicio (`s.nombre`) y contando cuántas veces se solicita cada servicio (`COUNT(*) AS cantidad_solicitudes`).
    >
    > ###### Estamos combinando las tablas de reparacion_servicio (`reparacion_servicio`), servicio (`servicio`) y reparacion (`reparacion`) utilizando `JOIN`. Esto nos permite obtener información sobre los servicios solicitados en cada reparación.
    >
    > ###### Estamos filtrando los resultados para incluir solo las reparaciones que ocurrieron dentro del período específico establecido por `FECHA_INICIAL` y `FECHA_FINAL`.
    >
    > ###### Estamos agrupando los datos por el nombre del servicio (`GROUP BY s.nombre`). Esto nos permite contar cuántas veces se solicita cada servicio.
    >
    > ###### Estamos ordenando los resultados en orden descendente según la cantidad de solicitudes (`ORDER BY cantidad_solicitudes DESC`). Esto nos proporcionará la lista de servicios más solicitados en primer lugar.
    
    

11. Obtener el costo total de reparaciones para cada cliente en un período específico.

    ```mysql
    SELECT c.nombre AS nombre_cliente, c.apellido AS apellido_cliente, SUM(r.costo_total) AS costo_total_reparaciones
    FROM cliente c
    JOIN vehiculo v ON c.id = v.id_cliente
    JOIN reparacion r ON v.id = r.id_vehiculo
    WHERE r.fecha BETWEEN '2024-06-02' AND '2024-06-05'
    GROUP BY c.id, c.nombre, c.apellido;
    
    +----------------+------------------+--------------------------+
    | nombre_cliente | apellido_cliente | costo_total_reparaciones |
    +----------------+------------------+--------------------------+
    | Paula          | Fernández        |                   350.00 |
    | Javier         | Martínez         |                   700.00 |
    | Andrea         | López            |                   200.00 |
    | José           | García           |                  1000.00 |
    +----------------+------------------+--------------------------+
    
    
    ```

    > ###### Estamos seleccionando el nombre y apellido del cliente (`c.nombre`, `c.apellido`) y la suma total gastada por el cliente en reparaciones (`SUM(r.costo_total) AS costo_total_reparaciones`).
    >
    > ###### Estamos combinando las tablas de cliente (`cliente`), vehículo (`vehiculo`) y reparación (`reparacion`) utilizando `JOIN`. Esto nos permite obtener la información necesaria sobre cada cliente y sus reparaciones asociadas.
    >
    > ###### Estamos filtrando los resultados para incluir solo las reparaciones que ocurrieron durante el período específico establecido por `FECHA_INICIAL` y `FECHA_FINAL`.
    >
    > ###### Estamos agrupando los datos por el ID del cliente (`GROUP BY c.id`). Esto nos permite calcular el costo total de reparaciones para cada cliente en el período especificado.
    
    

12. Listar los empleados con mayor cantidad de reparaciones realizadas en un período específico.

    ```mysql
    SELECT e.nombre AS nombre_empleado, e.apellido AS apellido_empleado, COUNT(r.id) AS cantidad_reparaciones
    FROM empleado AS e
    JOIN reparacion AS r ON e.id = r.id_empleado
    WHERE r.fecha BETWEEN '2024-06-02' AND '2024-06-04'
    GROUP BY e.id, e.nombre, e.apellido
    ORDER BY cantidad_reparaciones DESC;
    
    +-----------------+-------------------+-----------------------+
    | nombre_empleado | apellido_empleado | cantidad_reparaciones |
    +-----------------+-------------------+-----------------------+
    | Ana             | López             |                     1 |
    | Pedro           | Fernández         |                     1 |
    | María           | Gómez             |                     1 |
    +-----------------+-------------------+-----------------------+
    
    ```

    > ###### Estamos seleccionando el nombre y apellido del empleado (`e.nombre`, `e.apellido`) y la cantidad total de reparaciones realizadas por el empleado (`COUNT(r.id) AS cantidad_reparaciones`).
    >
    > ###### Estamos combinando las tablas de empleado (`empleado`) y reparación (`reparacion`) utilizando `JOIN`. Esto nos permite obtener la información necesaria sobre cada empleado y las reparaciones que han realizado.
    >
    > ###### Estamos filtrando los resultados para incluir solo las reparaciones que ocurrieron durante el período específico establecido por `FECHA_INICIAL` y `FECHA_FINAL`.
    >
    > ###### Estamos agrupando los datos por el ID del empleado (`GROUP BY e.id, e.nombre, e.apellido`). Esto nos permite contar el número de reparaciones realizadas por cada empleado.
    >
    > ###### Estamos ordenando los resultados en orden descendente según la cantidad de reparaciones realizadas (`ORDER BY cantidad_reparaciones DESC`), para listar primero a los empleados con mayor cantidad de reparaciones.

    

13. Obtener las piezas más utilizadas en reparaciones durante un período específico.

    ```mysql
    SELECT p.nombre AS nombre_pieza, SUM(rp.cantidad) AS cantidad_utilizada
    FROM pieza p
    JOIN reparacion_piezas rp ON p.id = rp.id_pieza
    JOIN reparacion r ON rp.id_reparacion = r.id
    WHERE r.fecha BETWEEN '2024-06-02' AND '2024-06-04'
    GROUP BY p.id, p.nombre
    ORDER BY cantidad_utilizada DESC;
    
    +--------------+--------------------+
    | nombre_pieza | cantidad_utilizada |
    +--------------+--------------------+
    | Neumático    |                  4 |
    +--------------+--------------------+
    
    ```

    > ###### Estamos seleccionando el nombre de la pieza (`p.nombre`) y la suma total de la cantidad utilizada de esa pieza en reparaciones (`SUM(rp.cantidad) AS cantidad_utilizada`).
    >
    > ###### Estamos combinando las tablas de pieza (`pieza`), reparacion_piezas (`reparacion_piezas`) y reparacion (`reparacion`) utilizando `JOIN`. Esto nos permite obtener la información necesaria sobre cada pieza y sus reparaciones asociadas.
    >
    > ###### Estamos filtrando los resultados para incluir solo las reparaciones que ocurrieron durante el período específico establecido por `FECHA_INICIAL` y `FECHA_FINAL`.
    >
    > ###### Estamos agrupando los datos por el ID de la pieza (`GROUP BY p.id, p.nombre`). Esto nos permite calcular la cantidad total de cada pieza utilizada en reparaciones durante el período especificado.
    >
    > ###### Estamos ordenando los resultados en orden descendente según la cantidad total utilizada (`ORDER BY cantidad_utilizada DESC`), para listar primero las piezas más utilizadas.

    

14. Calcular el promedio de costo de reparaciones por vehículo.

    ```mysql
    SELECT v.placa AS placa_vehiculo, AVG(r.costo_total) AS promedio_costo_reparaciones
    FROM vehiculo v
    JOIN reparacion r ON v.id = r.id_vehiculo
    GROUP BY v.id, v.placa;
    
    +----------------+-----------------------------+
    | placa_vehiculo | promedio_costo_reparaciones |
    +----------------+-----------------------------+
    | ABC123         |                  500.000000 |
    | BCD890         |                  300.000000 |
    | DEF456         |                  350.000000 |
    | GHI789         |                  700.000000 |
    | JKL012         |                  200.000000 |
    | MNO345         |                 1000.000000 |
    | PQR678         |                  800.000000 |
    | STU901         |                  600.000000 |
    | VWX234         |                  900.000000 |
    | YZA567         |                  400.000000 |
    +----------------+-----------------------------+
    
    ```

    > ###### Estamos seleccionando la placa del vehículo (`v.placa`) y el promedio del costo total de las reparaciones de ese vehículo (`AVG(r.costo_total) AS promedio_costo_reparaciones`).
    >
    > ###### Estamos combinando las tablas de vehículo (`vehiculo`) y reparación (`reparacion`) utilizando `JOIN`. Esto nos permite obtener la información necesaria sobre cada vehículo y sus reparaciones asociadas.
    >
    > ###### Estamos agrupando los datos por el ID del vehículo y su placa (`GROUP BY v.id, v.placa`). Esto nos permite calcular el promedio del costo de reparaciones para cada vehículo.

    

15. Obtener el inventario de piezas por proveedor.

    ```mysql
    SELECT p.nombre AS nombre_pieza, pr.nombre AS nombre_proveedor, i.cantidad AS cantidad_inventario
    FROM pieza p
    JOIN precio prc ON p.id = prc.id_pieza
    JOIN proveedor pr ON prc.id_proveedor = pr.id
    JOIN pieza_inventario pi ON p.id = pi.id_pieza
    JOIN inventario i ON pi.id_inventario = i.id;
    
    +-------------------------+-------------------------+---------------------+
    | nombre_pieza            | nombre_proveedor        | cantidad_inventario |
    +-------------------------+-------------------------+---------------------+
    | Filtro de aceite        | Autopiezas García       |                 100 |
    | Filtro de aceite        | Talleres Gutiérrez      |                 100 |
    | Pastillas de freno      | Talleres López          |                  50 |
    | Pastillas de freno      | Talleres Gutiérrez      |                  50 |
    | Discos de freno         | Talleres López          |                  20 |
    | Discos de freno         | Talleres Gutiérrez      |                  20 |
    | Neumático               | Distribuidora Martínez  |                  80 |
    | Neumático               | Talleres Gutiérrez      |                  80 |
    | Batería                 | Repuestos Sánchez       |                  10 |
    | Batería                 | Talleres Gutiérrez      |                  10 |
    | Bujía                   | Autopartes Rodríguez    |                  30 |
    | Bujía                   | Talleres Gutiérrez      |                  30 |
    | Correa de distribución  | Mecánica Hernández      |                  15 |
    | Correa de distribución  | Talleres Gutiérrez      |                  15 |
    | Líquido refrigerante    | Frenos Gómez            |                 200 |
    | Líquido refrigerante    | Talleres Gutiérrez      |                 200 |
    | Filtro de aire          | Neumáticos Torres       |                  40 |
    | Filtro de aire          | Talleres Gutiérrez      |                  40 |
    | Bombilla                | Autopiezas García       |                  25 |
    | Bombilla                | Autorepuestos Díaz      |                  25 |
    | Bombilla                | Talleres Gutiérrez      |                  25 |
    +-------------------------+-------------------------+---------------------+
    
    ```

    > ###### Estamos seleccionando el nombre de la pieza (`p.nombre`), el nombre del proveedor (`pr.nombre`) y la cantidad en inventario (`i.cantidad`).
    >
    > ###### `JOIN precio prc ON p.id = prc.id_pieza`: Combinamos las tablas `pieza` y `precio` para obtener los proveedores que suministran cada pieza.
    >
    > ###### `JOIN proveedor pr ON prc.id_proveedor = pr.id`: Combinamos la tabla `precio` con `proveedor` para obtener los nombres de los proveedores.
    >
    > ###### `JOIN pieza_inventario pi ON p.id = pi.id_pieza`: Combinamos las tablas `pieza` y `pieza_inventario` para obtener los inventarios asociados a cada pieza.
    >
    > ###### `JOIN inventario i ON pi.id_inventario = i.id`: Combinamos `pieza_inventario` con `inventario` para obtener las cantidades en inventario.

    

16. Listar los clientes que no han realizado reparaciones en el último año.

    ```mysql
    *
    ```

    > [!TIP]

    

17. Obtener las ganancias totales del taller en un período específico.

    ```mysql
    SELECT SUM(f.total) AS ganancias_totales
    FROM factura f
    WHERE f.fecha BETWEEN '2024-06-02' AND '2024-06-15';
    
    +-------------------+
    | ganancias_totales |
    +-------------------+
    |            500.00 |
    +-------------------+
    
    ```

    > ###### Estamos seleccionando la suma total de todas las facturas emitidas (`SUM(f.total)`) en el período específico y la etiquetamos como `ganancias_totales`.
    >
    > ###### La consulta se centra en la tabla `factura` (`factura f`).
    >
    > ###### Utilizamos una cláusula `WHERE` para filtrar las facturas emitidas entre las fechas específicas proporcionadas (`f.fecha BETWEEN 'FECHA_INICIAL' AND'FECHA_FINAL'`).

    

18. Listar los empleados y el total de horas trabajadas en reparaciones en un período específico (asumiendo que se registra la duración de cada reparación).

    ```mysql
    *
    ```

    > [!TIP]

    

19. Obtener el listado de servicios prestados por cada empleado en un período específico.

    ```mysql
    SELECT e.nombre AS nombre_empleado, e.apellido AS apellido_empleado, s.nombre AS nombre_servicio, r.fecha
    FROM empleado e
    JOIN reparacion r ON e.id = r.id_empleado
    JOIN reparacion_servicio rs ON r.id = rs.id_reparacion
    JOIN servicio s ON rs.id_servicio = s.id
    WHERE r.fecha BETWEEN '2024-06-02' AND '2024-06-10'
    ORDER BY e.nombre, e.apellido, r.fecha;
    
    +-----------------+-------------------+-------------------------------------+------------+
    | nombre_empleado | apellido_empleado | nombre_servicio                     | fecha      |
    +-----------------+-------------------+-------------------------------------+------------+
    | Ana             | López             | Cambio de neumáticos                | 2024-06-02 |
    | Ana             | López             | Cambio de frenos                    | 2024-06-08 |
    | Elena           | Rodríguez         | Reparación de chapa y pintura       | 2024-06-06 |
    | Jorge           | Díaz              | Mantenimiento de aire acondicionado | 2024-06-05 |
    | Luis            | Martínez          | Alineación y balanceo               | 2024-06-07 |
    | María           | Gómez             | Lavado y encerado                   | 2024-06-04 |
    | María           | Gómez             | Inspección de seguridad             | 2024-06-10 |
    | Pedro           | Fernández         | Reparación de chapa y pintura       | 2024-06-03 |
    | Pedro           | Fernández         | Cambio de aceite                    | 2024-06-09 |
    +-----------------+-------------------+-------------------------------------+------------+
    
    ```
    
    > ###### Estamos seleccionando el nombre y apellido del empleado (`e.nombre`, `e.apellido`), el nombre del servicio prestado (`s.nombre`), y la fecha de la reparación (`r.fecha`).
    >
    > ###### `JOIN reparacion r ON e.id = r.id_empleado`: Combinamos las tablas `empleado` y `reparacion` para obtener las reparaciones realizadas por cada empleado.
    >
    > ###### `JOIN reparacion_servicio rs ON r.id = rs.id_reparacion`: Combinamos `reparacion` con `reparacion_servicio` para obtener los servicios específicos prestados en cada reparación.
    >
    > ###### `JOIN servicio s ON rs.id_servicio = s.id`: Combinamos `reparacion_servicio` con `servicio` para obtener los nombres de los servicios prestados.
    >
    > ###### Filtramos las reparaciones para incluir solo aquellas que ocurrieron durante el período específico establecido por `FECHA_INICIAL` y `FECHA_FINAL`.
    >
    > ###### Ordenamos los resultados por el nombre del empleado, apellido y la fecha de la reparación para que la información sea fácil de leer y organizada cronológicamente.
    
    



## Subconsultas

1. Obtener el cliente que ha gastado más en reparaciones durante el último año.

   ```mysql
   SELECT c.nombre AS nombre_cliente, c.apellido AS apellido_cliente, SUM(r.costo_total) AS total_gastado
   FROM cliente c
   JOIN vehiculo v ON c.id = v.id_cliente
   JOIN reparacion r ON v.id = r.id_vehiculo
   WHERE r.fecha BETWEEN DATE_SUB(NOW(), INTERVAL 1 YEAR) AND NOW()
   GROUP BY c.id
   ORDER BY total_gastado DESC
   LIMIT 1;
   
   +----------------+------------------+---------------+
   | nombre_cliente | apellido_cliente | total_gastado |
   +----------------+------------------+---------------+
   | José           | García           |       1000.00 |
   +----------------+------------------+---------------+
   
   ```

   > ###### Estamos seleccionando el nombre y apellido del cliente (`c.nombre`, `c.apellido`) y la suma total gastada por el cliente en reparaciones (`SUM(r.costo_total) AS total_gastado`).
   >
   > ###### Estamos combinando las tablas de cliente (`cliente`), vehículo (`vehiculo`) y reparación (`reparacion`) utilizando `JOIN`. Esto nos permite obtener la información necesaria sobre cada cliente y sus reparaciones asociadas.
   >
   > ###### Estamos filtrando los resultados para incluir solo las reparaciones que ocurrieron durante el último año utilizando la función `DATE_SUB(NOW(), INTERVAL 1 YEAR)` para restar un año a la fecha actual y `NOW()` para obtener la fecha actual.
   >
   > ###### Estamos agrupando los datos por el ID del cliente (`GROUP BY c.id`). Esto nos permite calcular el total gastado por cada cliente en reparaciones.
   >
   > ######  Estamos ordenando los resultados en orden descendente según el total gastado (`ORDER BY total_gastado DESC`) y luego seleccionando solo el primer resultado utilizando `LIMIT 1`, lo que nos da el cliente que ha gastado más en reparaciones durante el último año.
   
   

2. Obtener la pieza más utilizada en reparaciones durante el último mes.

   ```mysql
   SELECT p.nombre AS nombre_pieza, SUM(rp.cantidad) AS total_utilizado
   FROM pieza p
   JOIN reparacion_piezas rp ON p.id = rp.id_pieza
   JOIN reparacion r ON rp.id_reparacion = r.id
   WHERE r.fecha BETWEEN DATE_SUB(NOW(), INTERVAL 1 MONTH) AND NOW()
   GROUP BY p.id
   ORDER BY total_utilizado DESC
   LIMIT 1;
   
   +--------------+-----------------+
   | nombre_pieza | total_utilizado |
   +--------------+-----------------+
   | Neumático    |               4 |
   +--------------+-----------------+
   
   ```

   > ###### Estamos seleccionando el nombre de la pieza (`p.nombre`) y la suma total de la cantidad utilizada de esa pieza en reparaciones (`SUM(rp.cantidad) AS total_utilizado`).
   >
   > ###### Estamos combinando las tablas de pieza (`pieza`), reparacion_piezas (`reparacion_piezas`) y reparacion (`reparacion`) utilizando `JOIN`. Esto nos permite obtener la información necesaria sobre cada pieza y sus reparaciones asociadas.
   >
   > ###### Estamos filtrando los resultados para incluir solo las reparaciones que ocurrieron durante el último mes utilizando la función `DATE_SUB(NOW(), INTERVAL 1 MONTH)` para restar un mes a la fecha actual y `NOW()` para obtener la fecha actual.
   >
   > ###### Estamos agrupando los datos por el ID de la pieza (`GROUP BY p.id`). Esto nos permite calcular la cantidad total de cada pieza utilizada en reparaciones durante el último mes.
   >
   > ###### Estamos ordenando los resultados en orden descendente según la cantidad total utilizada (`ORDER BY total_utilizado DESC`) y luego seleccionando solo el primer resultado utilizando `LIMIT 1`, lo que nos da la pieza más utilizada en reparaciones durante el último mes.
   
   

3. Obtener los proveedores que suministran las piezas más caras.

   ```mysql
   SELECT pr.nombre AS nombre_proveedor, p.precio_proveedor AS precio_pieza_mas_cara
   FROM proveedor pr
   JOIN precio p ON pr.id = p.id_proveedor
   WHERE p.precio_proveedor = (
       SELECT MAX(precio_proveedor)
       FROM precio
   );
   
   +------------------------+-----------------------+
   | nombre_proveedor       | precio_pieza_mas_cara |
   +------------------------+-----------------------+
   | Distribuidora Martínez |                120.00 |
   +------------------------+-----------------------+
   
   ```

   > ###### Estamos seleccionando el nombre del proveedor (`pr.nombre`).
   >
   > ###### Estamos combinando las tablas de proveedor (`proveedor`) y precio (`precio`) utilizando `JOIN`. Esto nos permite obtener la información necesaria sobre cada proveedor y los precios de las piezas que suministran.
   >
   > ###### Estamos filtrando los resultados para incluir solo los proveedores cuyas piezas tengan el precio máximo utilizando una subconsulta. La subconsulta `SELECT MAX(precio_proveedor) FROM precio` calcula el precio máximo de todas las piezas suministradas por cualquier proveedor.
   >
   > ###### Estamos comparando el precio de cada proveedor con el precio máximo calculado por la subconsulta utilizando la condición `p.precio_proveedor = (...)`.
   
   

4. Listar las reparaciones que no utilizaron piezas específicas durante el último año.

   ```mysql
   SELECT fecha, id_empleado, costo_total, descripcion
   FROM reparacion
   WHERE id NOT IN (
       SELECT DISTINCT id_reparacion
       FROM reparacion_piezas
   )
   AND fecha BETWEEN DATE_SUB(NOW(), INTERVAL 1 YEAR) AND NOW();
   
   +------------+-------------+-------------+----------------------------------+
   | fecha      | id_empleado | costo_total | descripcion                      |
   +------------+-------------+-------------+----------------------------------+
   | 2024-06-03 |           4 |      700.00 | Reparación de la carrocería      |
   | 2024-06-04 |           5 |      200.00 | Lavado y pulido del vehículo     |
   | 2024-06-05 |           6 |     1000.00 | Reparación del sistema eléctrico |
   | 2024-06-06 |           7 |      800.00 | Reparación de la pintura         |
   | 2024-06-07 |           2 |      600.00 | Alineación y balanceo            |
   | 2024-06-08 |           3 |      900.00 | Reparación del sistema de frenos |
   | 2024-06-10 |           5 |      300.00 | Reparación de la suspensión      |
   +------------+-------------+-------------+----------------------------------+
   
   ```

   > ###### Utilizamos una subconsulta para encontrar las reparaciones que no tienen ninguna entrada en la tabla `reparacion_piezas`. Utilizamos `DISTINCT` para obtener únicamente los identificadores únicos de reparaciones en la tabla `reparacion_piezas`.
   >
   > ###### Se filtran las reparaciones para incluir solo aquellas que ocurrieron durante el último año utilizando la función `DATE_SUB(NOW(), INTERVAL 1 YEAR)` para restar un año a la fecha actual y `NOW()` para obtener la fecha actual.
   
   

5. Obtener las piezas que están en inventario por debajo del 10% del stock inicial.

   ```mysql
   *
   ```

   > [!TIP]
   >
   > 

   

## Procedimientos Almacenados

1. Crear un procedimiento almacenado para insertar una nueva reparación.

   ```mysql
   DELIMITER $$
   
   CREATE PROCEDURE InsertarReparacion(
       IN fecha_reparacion DATE,
       IN id_empleado INT,
       IN id_vehiculo INT,
       IN costo_total DECIMAL(10, 2),
       IN descripcion TEXT
   )
   BEGIN
       INSERT INTO reparacion(fecha, id_empleado, id_vehiculo, costo_total, descripcion)
       VALUES(fecha_reparacion, id_empleado, id_vehiculo, costo_total, descripcion);
   END$$
   
   DELIMITER ;
   
   
   CALL InsertarReparacion('2024-06-10', 1, 1, 500.00, 'Reparación del motor');
   
   ```

   > ###### `DELIMITER //`: Esto cambia el delimitador de fin de instrucción a `//` para que podamos escribir el procedimiento almacenado en varias líneas.
   >
   > ###### `CREATE PROCEDURE InsertarReparacion(...)`: Creamos un nuevo procedimiento almacenado llamado `InsertarReparacion` que acepta cinco parámetros de entrada: `fecha_reparacion`, `id_empleado`, `id_vehiculo`, `costo_total` y `descripcion`.
   >
   > ###### `BEGIN ... END`: Este bloque encapsula las instrucciones SQL que constituyen el cuerpo del procedimiento almacenado.
   >
   > ###### `INSERT INTO reparacion ...`: Esta es la instrucción SQL que inserta una nueva fila en la tabla `reparacion` con los valores proporcionados para los parámetros de entrada.
   >
   > ###### `DELIMITER ;`: Esto restablece el delimitador de fin de instrucción a `;` para evitar conflictos con otras instrucciones SQL fuera del procedimiento almacenado.

   

2. Crear un procedimiento almacenado para actualizar el inventario de una pieza.

   ```mysql
   DELIMITER //
   
   CREATE PROCEDURE actualizar_inventario_pieza(
       IN p_id_pieza INT,
       IN p_nueva_cantidad INT
   )
   BEGIN
       UPDATE inventario i
       JOIN pieza_inventario pi ON i.id = pi.id_inventario
       SET i.cantidad = p_nueva_cantidad
       WHERE pi.id_pieza = p_id_pieza;
   END //
   
   DELIMITER ;
   
   ```

   > **DELIMITER //:** Cambiamos el delimitador de las declaraciones SQL para que podamos definir todo el procedimiento almacenado sin que MySQL lo interprete como múltiples declaraciones separadas.
   >
   > **CREATE PROCEDURE:** Comenzamos la definición del procedimiento almacenado llamado `actualizar_inventario_pieza`.
   >
   > **Parámetros de entrada:**
   >
   > - `IN p_id_pieza INT`: El identificador de la pieza que se va a actualizar.
   > - `IN p_nueva_cantidad INT`: La nueva cantidad que se establecerá en el inventario para la pieza especificada.
   >
   > **Cuerpo del procedimiento:**
   >
   > - `UPDATE inventario i JOIN pieza_inventario pi ON i.id = pi.id_inventario SET i.cantidad = p_nueva_cantidad WHERE pi.id_pieza = p_id_pieza;`: Actualiza la cantidad de inventario de la pieza especificada. Se utiliza una combinación (`JOIN`) entre las tablas `inventario` y `pieza_inventario` para encontrar el inventario correspondiente a la pieza y luego se establece la nueva cantidad.
   >
   > **END:** Finaliza la definición del procedimiento almacenado.
   >
   > **DELIMITER ;:** Restablecemos el delimitador a `;`.

   

3. Crear un procedimiento almacenado para eliminar una cita.

   ```mysql
   
   ```

   > 
   >
   > 

   

4. Crear un procedimiento almacenado para generar una factura.

   ```mysql
   
   ```

   

5. Crear un procedimiento almacenado para obtener el historial de reparaciones de un vehículo.

   ```mysql
   
   ```

   

6. Crear un procedimiento almacenado para calcular el costo total de reparaciones de un cliente en un período.

   ```mysql
   
   ```

   

7. Crear un procedimiento almacenado para obtener la lista de vehículos que requieren mantenimiento basado en el kilometraje.

   ```mysql
   
   ```

   

8. Crear un procedimiento almacenado para insertar una nueva orden de compra.

   ```mysql
   
   ```

   

9. Crear un procedimiento almacenado para actualizar los datos de un cliente.

   ```mysql
   
   ```

   

10. Crear un procedimiento almacenado para obtener los servicios más solicitados en un período.

   ```mysql
   
   ```

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

1. Devuelve un listado con el código de oficina y la ciudad donde hay oficinas.

   ```mysql
   SELECT r.id AS id_reparacion, r.fecha, s.nombre AS servicio, r.costo_total, r.descripcion
   FROM reparacion r
   JOIN reparacion_servicio rs ON r.id = rs.id_reparacion
   JOIN servicio s ON rs.id_servicio = s.id
   JOIN vehiculo v ON r.id_vehiculo = v.id
   WHERE v.placa = 'ABC123';
   
   
   
   ```

   > [!TIP]
   >
   > 

   

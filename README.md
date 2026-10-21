# RetailPro – Análisis de ventas

Proyecto del curso de Data Analytics (Coderhouse) sobre RetailPro, una distribuidora de tecnología. La pregunta de negocio que guía el curso: por qué las ventas crecieron solo 3% interanual frente al 11% del mercado, y qué combinación de región, categoría y canal lo explica.

Este repositorio reúne la parte técnica: la base de datos en SQL Server, las consultas de negocio y el modelo de datos con medidas DAX en Power BI.

## Contenido del repositorio

| Archivo | Qué hace |
|---|---|
| `ventas_tech_db.sql` | Crea las 4 tablas (categorias, clientes, productos, ventas) y carga los datos de práctica |
| `m4_consultas_negocio.sql` | Consultas de negocio: resumen mensual, ranking de productos, clientes recurrentes, meses vs. promedio |
| `m5_consultas_joins.sql` | Consultas con JOINs: vista base, clientes sin ventas, productos sin ventas, consolidado con UNION ALL |
| `Vittar_Valentina_Checkpoint2.pbix` | Modelo en estrella en Power BI con calendario `Dim_Fechas` y tabla `_Medidas` (5 medidas DAX) |

## Herramientas

- SQL Server Express y SQL Server Management Studio (SSMS)
- Power BI Desktop, Power Query (lenguaje M) y DAX
- GitHub para el control de versiones
- IA (Claude) como asistente de borradores; todo el contenido fue revisado y validado

## Cómo ejecutar los scripts SQL

Requisito: SQL Server con SSMS. El script usa `DROP TABLE IF EXISTS`, disponible desde SQL Server 2016.

1. Abrí SSMS y conectate a tu instancia.
2. Abrí una consulta nueva y creá la base. El script **no** la crea por sí solo:
   ```sql
   CREATE DATABASE Ventas_Tech_DB;
   GO
   USE Ventas_Tech_DB;
   GO
   ```
3. Abrí `ventas_tech_db.sql` (File → Open → File), elegí `Ventas_Tech_DB` en el desplegable de bases de datos y ejecutá con **F5**. Crea las tablas y carga los datos. Se puede volver a ejecutar sin problemas porque borra las tablas antes de crearlas.
4. Verificá el resultado de la sección 4 del script: 4 filas en `categorias`, 5 en `clientes`, 6 en `productos` y 10 en `ventas`.
5. En la misma base, ejecutá `m4_consultas_negocio.sql` y después `m5_consultas_joins.sql`.

## Modelo de datos

Base `Ventas_Tech_DB`: `categorias` (1) → (N) `productos` (1) → (N) `ventas` (N) ← (1) `clientes`. Las claves foráneas están declaradas en el script.

En Power BI el modelo es una estrella: `Fact_Ventas` conectada a `Dim_Clientes`, `Dim_Productos`, `Dim_Fechas` y, a través de `Dim_Productos`, a `Dim_Categorias`. Todas las relaciones son 1:N, con filtro en una sola dirección.

Las medidas de `_Medidas`: Total Ventas, Ventas Online, Ventas YTD, Ventas LY y % Crecimiento Anual.

## Alcance y limitaciones

- La base SQL es un set de práctica: 10 ventas entre el 5 y el 15 de marzo de 2024. Con un solo mes incompleto no se pueden analizar tendencias ni estacionalidad.
- El `.pbix` usa otro dataset (50 ventas entre 2023 y 2024) que lee desde el Excel `Pipeline_ETL_Dataset.xlsx`, desde una ruta local. Para refrescarlo hay que apuntar a tu copia del archivo (Transform data → Data source settings).

## Uso de IA

El borrador de este README fue generado con IA y luego editado y verificado manualmente contra los scripts del repositorio.

## Autora

Valentina Vittar

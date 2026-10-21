CREATE DATABASE cafeteria

USE cafeteria 

CREATE TABLE categorias (
id_categoria INT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL
);

CREATE TABLE clientes (
id_cliente INT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL, 
apellido VARCHAR(100) NOT NULL,
email VARCHAR(150),
fecha_alta DATE
);

CREATE TABLE productos (
id_producto INT PRIMARY KEY,
nombre varchar(100) NOT NULL,
precio DECIMAL(10,2) NOT NULL,
id_categoria INT,
FOREIGN KEY (id_categoria)
REFERENCES categorias (id_categoria)
);

CREATE TABLE ventas (
id_venta INT PRIMARY KEY,
id_cliente INT NOT NULL,
id_producto INT NOT NULL,
cantidad INT NOT NULL,
fecha_venta DATE NOT NULL,
FOREIGN KEY (id_cliente)
REFERENCES clientes (id_cliente),
FOREIGN KEY (id_producto)
REFERENCES productos (id_producto)
);

INSERT INTO categorias (id_categoria, nombre)
VALUES
(1, 'Cafeteria'),
(2, 'Pasteleria'),
(3, 'Sandwiches'),
(4, 'Bebidas');

INSERT INTO clientes (id_cliente, nombre, apellido, email, fecha_alta)
VALUES
(1, 'Juan', 'Perez', 'juan.perez@email.com', '2026-01-10'),
(2, 'Maria', 'Gomez', 'maria.gomez@email.com', '2026-01-15'),
(3, 'Lucas', 'Rodriguez', 'lucas.rodriguez@email.com', '2026-02-05'),
(4, 'Ana', 'Martinez', 'ana.martinez@email.com', '2026-02-20'),
(5,'Carlos', 'Lopez', 'carlos.lopez@email.com', '2026-03-01'),
(6, 'Sofia', 'Fernandez', 'sofia.fernandez@email.com', '2026-03-12');

INSERT INTO productos (id_producto, nombre, precio, id_categoria)
VALUES
(1, 'Cafe espresso', 1800.00, 1),
(2, 'Cafe latte', 2500.00, 1),
(3, 'Capuchino', 2700.00, 1),
(4, 'Te', 1600.00, 1),
(5, 'Medialuna', 1200.00, 2),
(6, 'Porcion de torta', 3200.00, 2),
(7, 'Cookie', 1800.00, 2),
(8, 'Tostado', 4500.00,3),
(9, 'Sandwich', 5300.00,3),
(10, 'Jugo de naranja', 2200.00, 4),
(11, 'Limonada', 2000.00, 4);




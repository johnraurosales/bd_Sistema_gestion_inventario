
INSERT INTO categorias (nombre, descripcion) VALUES
('Laptops', 'Computadoras portátiles de alto rendimiento'),
('Smartphones', 'Teléfonos inteligentes de última generación'),
('Tablets', 'Dispositivos portátiles con pantalla táctil'),
('Accesorios', 'Periféricos y accesorios tecnológicos'),
('Componentes', 'Partes internas para ensamblaje de PCs');


INSERT INTO marcas (nombre, pais_origen) VALUES
('Apple', 'Estados Unidos'),
('Samsung', 'Corea del Sur'),
('Dell', 'Estados Unidos'),
('HP', 'Estados Unidos'),
('Lenovo', 'China');

INSERT INTO proveedores (nombre, email, telefono, direccion) VALUES
('Tech Supplies S.A.', 'contacto@techsupplies.com', '01-2345678', 'Av. Tecnología 123'),
('Gadgets Perú', 'ventas@gadgetsperu.com', '01-8765432', 'Jr. Innovación 456'),
('ElectroMundo', 'info@electromundo.com', '01-1122334', 'Calle Circuito 789'),
('Digital Hub', 'digital@hub.com', '01-5566778', 'Av. Digital 101'),
('PC World', 'ventas@pcworld.com', '01-9988776', 'Jr. Hardware 202');

INSERT INTO zonas (nombre, descripcion) VALUES
('Zona A', 'Área principal de almacenamiento'),
('Zona B', 'Área secundaria de almacenamiento'),
('Zona C', 'Área de productos en revisión'),
('Zona D', 'Área de productos defectuosos'),
('Zona E', 'Área de productos nuevos');

INSERT INTO estantes (codigo, id_zona, descripcion) VALUES
('A1', 1, 'Estante principal zona A'),
('A2', 1, 'Estante secundario zona A'),
('B1', 2, 'Estante zona B'),
('C1', 3, 'Estante zona C'),
('D1', 4, 'Estante zona D');

INSERT INTO ubicaciones (id_estante, nivel, capacidad_maxima, descripcion) VALUES
(1, 1, 100, 'Primer nivel estante A1'),
(1, 2, 80, 'Segundo nivel estante A1'),
(2, 1, 90, 'Primer nivel estante A2'),
(3, 1, 60, 'Nivel único estante B1'),
(4, 1, 50, 'Zona de revisión C1');

INSERT INTO usuarios (nombre, email, contraseña) VALUES
('Ana García', 'ana@empresa.com', '1234'),
('Luis Pérez', 'luis@empresa.com', '1234'),
('María López', 'maria@empresa.com', '1234'),
('Carlos Torres', 'carlos@empresa.com', '1234'),
('Sofía Mendoza', 'sofia@empresa.com', '1234');

INSERT INTO roles (nombre) VALUES
('Administrador'),
('Vendedor'),
('Almacén'),
('Soporte Técnico'),
('Gerente');

INSERT INTO tipos_movimiento (descripcion) VALUES
('Ingreso por compra'),
('Salida por venta'),
('Devolución'),
('Ajuste de inventario'),
('Traslado interno');



INSERT INTO productos (nombre, descripcion, id_categoria, id_marca, id_ubicacion, stock_actual, stock_minimo, precio_unitario) VALUES
('MacBook Pro 16"', 'Laptop profesional con procesador M1 Pro', 1, 1, 1, 10, 5, 2500.00),
('iPhone 13 Pro', 'Smartphone con cámara de 1200 MP', 2, 1, 2, 20, 10, 999.99),
('Galaxy Tab S7', 'Tablet con pantalla de 11" y S Pen incluido', 3, 2, 3, 15, 7, 649.99),
('Mouse Logitech MX Master 3', 'Mouse ergonómico con múltiples botones', 4, 3, 4, 50, 25, 99.99),
('SSD Samsung 970 EVO 1TB', 'Disco sólido NVMe de alta velocidad', 5, 4, 5, 30, 15, 129.99),
('Lenovo ThinkPad X1', 'Laptop empresarial con procesador i7', 1, 5, 1, 12, 6, 1800.00),
('Samsung Galaxy S21', 'Smartphone con pantalla de 6.2"', 2, 2, 2, 25, 12, 799.99),
('iPad Air 2022', 'Tablet con chip M1 y pantalla de 10.9"', 3, 1, 3, 18, 9, 749.99),
('Teclado mecánico Corsair K95', 'Teclado con retroiluminación RGB', 4, 3, 4, 40, 20, 199.99),
('Memoria RAM Kingston 16GB', 'Módulo de memoria DDR4 3200MHz', 5, 4, 5, 35, 17, 79.99),
('Dell XPS 13', 'Laptop ultradelgada con pantalla InfinityEdge', 1, 5, 1, 14, 7, 1500.00),
('Google Pixel 6', 'Smartphone con cámara de 50MP', 2, 2, 2, 22, 11, 699.99),
('Microsoft Surface Pro 7', 'Tablet convertible con teclado desmontable', 3, 1, 3, 3, 16, 899.99),
('Auriculares Bose QC35 II', 'Auriculares con cancelación de ruido', 4, 3, 4, 45, 22, 299.99),
('Tarjeta gráfica NVIDIA RTX 3080', 'GPU de alto rendimiento para gaming', 5, 4, 5, 50, 25, 799.99);

INSERT INTO productos_proveedores (id_producto, id_proveedor) VALUES
(1, 1), (2, 1), (3, 2), (4, 2), (5, 3),
(6, 3), (7, 4), (8, 4), (9, 5), (10, 5),
(11, 1), (12, 2), (13, 3), (14, 4), (15, 5);


INSERT INTO usuarios_roles (id_usuario, id_rol) VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5),
(1, 3), (2, 1), (3, 2), (4, 5), (5, 4);

INSERT INTO pedidos (id_proveedor, fecha_pedido, estado) VALUES
(1, '2025-06-01T00:00:00', 'pendiente'),
(2, '2025-06-02T00:00:00', 'pendiente'),
(3, '2025-06-03T00:00:00', 'pendiente'),
(4, '2025-06-04T00:00:00', 'pendiente'),
(5, '2025-06-05T00:00:00', 'pendiente'),
(1, '2025-06-06T00:00:00', 'pendiente'),
(2, '2025-06-07T00:00:00', 'pendiente'),
(3, '2025-06-08T00:00:00', 'pendiente'),
(4, '2025-06-09T00:00:00', 'pendiente'),
(5, '2025-06-10T00:00:00', 'pendiente'),
(1, '2025-06-11T00:00:00', 'pendiente'),
(2, '2025-06-12T00:00:00', 'pendiente'),
(3, '2025-06-13T00:00:00', 'pendiente'),
(4, '2025-06-14T00:00:00', 'pendiente'),
(5, '2025-06-15T00:00:00', 'pendiente');

INSERT INTO pedidos_productos (id_pedido, id_producto, cantidad) VALUES
(14, 1, 5),
(15, 2, 10),
(16, 3, 8),
(17, 4, 15),
(18, 5, 20),
(19, 6, 12),
(20, 7, 18),
(21, 8, 5),
(22, 9, 6),
(23, 10, 9),
(24, 11, 3),
(25, 12, 7),
(26, 13, 5),
(27, 14, 4),
(28, 15, 2);


INSERT INTO movimientos (id_tipo_movimiento, id_producto, cantidad, id_usuario, observaciones) VALUES
(1, 1, 5, 1, 'Ingreso inicial'),
(1, 2, 10, 2, 'Compra'),
(2, 3, -3, 3, 'Venta'),
(2, 4, -5, 1, 'Venta mayorista'),
(3, 5, 2, 4, 'Devolución cliente'),
(4, 6, 1, 2, 'Ajuste stock'),
(1, 7, 12, 3, 'Ingreso nuevo stock'),
(2, 8, -6, 1, 'Venta'),
(3, 9, 1, 5, 'Devolución'),
(4, 10, -1, 4, 'Ajuste negativo'),
(1, 11, 7, 1, 'Ingreso'),
(2, 12, -4, 2, 'Salida por venta'),
(3, 13, 2, 3, 'Devolución'),
(4, 14, -3, 4, 'Ajuste'),
(5, 15, 5, 5, 'Traslado');

INSERT INTO auditorias (accion, tabla_afectada, id_usuario, detalle) VALUES
('INSERT', 'productos', 1, 'Se insertó un nuevo producto.'),
('UPDATE', 'productos', 2, 'Se actualizó el precio del producto.'),
('DELETE', 'productos', 3, 'Se eliminó un producto obsoleto.'),
('ERROR', 'pedidos', 4, 'Error en el estado del pedido.'),
('INSERT', 'usuarios', 1, 'Nuevo usuario registrado.'),
('INSERT', 'movimientos', 2, 'Se registró movimiento de entrada.'),
('UPDATE', 'usuarios', 3, 'Cambio de contraseña.'),
('DELETE', 'usuarios_roles', 4, 'Se removió un rol.'),
('INSERT', 'categorias', 5, 'Categoría nueva: Tablets'),
('UPDATE', 'proveedores', 2, 'Se cambió dirección de proveedor.'),
('INSERT', 'estantes', 3, 'Nuevo estante zona C'),
('DELETE', 'productos_proveedores', 1, 'Se eliminó relación proveedor-producto.'),
('INSERT', 'roles', 1, 'Rol soporte técnico agregado.'),
('UPDATE', 'ubicaciones', 2, 'Se aumentó capacidad.'),
('ERROR', 'movimientos', 5, 'Cantidad inválida detectada.');

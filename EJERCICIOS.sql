


SELECT 
    p.nombre AS producto,
    p.stock_actual,
    p.stock_minimo
FROM productos p
WHERE p.stock_actual < p.stock_minimo;


SELECT 
    pr.id_pedido,
    pv.nombre AS proveedor,
    pr.fecha_pedido,
    pr.estado
FROM pedidos pr
JOIN proveedores pv ON pr.id_proveedor = pv.id_proveedor
ORDER BY pr.fecha_pedido DESC;

CREATE VIEW vista_inventario_detallado AS
SELECT 
    p.id_producto,
    p.nombre AS producto,
    c.nombre AS categoria,
    m.nombre AS marca,
    u.nivel AS nivel_ubicacion,
    u.capacidad_maxima,
    p.stock_actual,
    p.precio_unitario
FROM productos p
JOIN categorias c ON p.id_categoria = c.id_categoria
JOIN marcas m ON p.id_marca = m.id_marca
JOIN ubicaciones u ON p.id_ubicacion = u.id_ubicacion;


SELECT * FROM vista_inventario_detallado;



CREATE PROCEDURE sp_productos_por_categoria
    @id_categoria INT
AS
BEGIN
    SELECT 
        p.id_producto,
        p.nombre AS producto,
        p.descripcion,
        p.stock_actual,
        p.precio_unitario,
        c.nombre AS categoria
    FROM productos p
    JOIN categorias c ON p.id_categoria = c.id_categoria
    WHERE p.id_categoria = @id_categoria;
END;
GO

EXEC sp_productos_por_categoria @id_categoria = 2;




SELECT 
    p.nombre AS producto,
    pv.nombre AS proveedor
FROM productos p
JOIN productos_proveedores pp ON p.id_producto = pp.id_producto
JOIN proveedores pv ON pp.id_proveedor = pv.id_proveedor
ORDER BY p.nombre;

CREATE PROCEDURE sp_stock_producto
    @id_producto INT
AS
BEGIN
    SELECT 
        nombre AS producto,
        stock_actual
    FROM productos
    WHERE id_producto = @id_producto;
END;
GO

EXEC sp_stock_producto @id_producto = 3;



CREATE OR ALTER VIEW vista_stock_valor_zona_categoria AS
SELECT 
    z.nombre AS zona,
    c.nombre AS categoria,
    COUNT(p.id_producto) AS total_productos,
    SUM(p.stock_actual) AS stock_total,
    SUM(p.stock_actual * p.precio_unitario) AS valor_total
FROM productos p
JOIN categorias c ON p.id_categoria = c.id_categoria
JOIN ubicaciones u ON p.id_ubicacion = u.id_ubicacion
JOIN estantes e ON u.id_estante = e.id_estante
JOIN zonas z ON e.id_zona = z.id_zona
GROUP BY z.nombre, c.nombre;
GO

SELECT * FROM vista_stock_valor_zona_categoria;



















# bd_Sistema_gestion_inventario

Caso Propuesto: Sistema de Gestión de Inventario.
Descripción del Caso: La empresa comercializa productos electrónicos como laptops, monitores, impresoras y accesorios. Opera con un único almacén, pero enfrenta dificultades por su actual sistema manual (hojas de cálculo): errores en el stock, productos mal ubicados, y falta de trazabilidad.

Buscan desarrollar un sistema automatizado que permita gestionar con precisión el inventario, mejorar la organización del almacén, y registrar todos los movimientos y cambios realizados por los empleados.

🎯 Objetivos del Sistema:
- Registrar productos, categorías, marcas y proveedores.
- Llevar el control del stock actual y mínimo de cada producto.
- Registrar entradas y salidas de inventario.
- Asignar a cada producto una ubicación física (zona, estante y nivel).
- Generar pedidos de reabastecimiento cuando el stock sea bajo.
- Mantener una auditoría detallada de las operaciones del sistema.
- Permitir búsquedas rápidas y generación de reportes.

🧾 Estructura de las Entidades (Campos Clave)

1. productos
id_producto (PK)
nombre
descripcion
id_categoria (FK)
id_marca (FK)
id_proveedor (FK)
id_ubicacion (FK)
stock_actual
stock_minimo
precio_unitario

2. categorias
id_categoria (PK)
nombre
descripcion

3. marcas
id_marca (PK)
nombre
pais_origen

4. proveedores
id_proveedor (PK)
nombre
email
telefono
direccion

5. zonas
id_zona (PK)
nombre
descripcion

6. estantes
id_estante (PK)
codigo
id_zona (FK)
descripcion

7. ubicaciones
id_ubicacion (PK)
id_estante (FK)
nivel (ej. 1, 2, 3)
capacidad_maxima
descripcion

8. movimientos
id_movimiento (PK)
fecha
id_tipo_movimiento (FK)
id_producto (FK)
cantidad
id_usuario (FK)
observaciones

9. tipos_movimiento
id_tipo_movimiento (PK)
descripcion (ej. Entrada por compra, Salida por venta, Ajuste por daño, Devolución)

10. usuarios
id_usuario (PK)
nombre
rol
email
contraseña (si aplica autenticación)

11. pedidos
id_pedido (PK)
id_producto (FK)
id_proveedor (FK)
fecha_pedido
cantidad
estado (pendiente, recibido, cancelado)

12. auditorias
id_auditoria (PK)
accion (INSERT, UPDATE, DELETE, ERROR)
tabla_afectada
id_usuario (FK)
fecha
detalle


📋 Reglas del Negocio:
- Cada producto debe tener una ubicación única en el almacén.
- No se permite registrar salidas si no hay stock suficiente.
- Al bajar del stock mínimo, debe generarse un pedido o alerta.
- Todo movimiento debe estar vinculado a un usuario, producto y tipo.
- Solo usuarios autorizados pueden realizar movimientos o cambios.
- Todas las acciones relevantes deben quedar registradas en auditoría.


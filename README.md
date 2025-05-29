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

🧱 Entidades del Sistema

Productos: Artículos disponibles para la venta

Categorías: Clasificación de productos

Marcas: Marca del producto

Proveedores: Empresas que suministran productos

Zonas: Áreas del almacén

Estantes: Estructuras dentro de las zonas

Ubicaciones: Niveles o compartimentos de los estantes

Usuarios: Empleados que usan el sistema

Roles: Permisos asociados a los usuarios

Tipos de Movimiento: Entrada, salida, ajuste de inventario

Movimientos: Registro de cambios en el inventario

Pedidos: Solicitudes de productos a proveedores

Auditorías: Historial de acciones de los usuarios

productos_proveedores: Relación M:N entre productos y proveedores

pedidos_productos: Relación M:N entre pedidos y productos

usuarios_roles: Relación M:N entre usuarios y roles



📋 Reglas del Negocio:
- Cada producto debe tener una ubicación única en el almacén.
- No se permite registrar salidas si no hay stock suficiente.
- Al bajar del stock mínimo, debe generarse un pedido o alerta.
- Todo movimiento debe estar vinculado a un usuario, producto y tipo.
- Solo usuarios autorizados pueden realizar movimientos o cambios.
- Todas las acciones relevantes deben quedar registradas en auditoría.



![Diagrama de entidad relacion](https://github.com/user-attachments/assets/cba5ced3-865e-42be-8bf6-a25efef577d6)

![image](https://github.com/user-attachments/assets/32d5e7cf-40d8-47b1-af94-66b25d235fe9)

![image](https://github.com/user-attachments/assets/2f733fd4-454b-4fe2-901c-0b67f6a01e98)




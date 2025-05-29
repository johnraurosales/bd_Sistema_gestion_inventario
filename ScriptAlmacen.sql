-- Crear la base de datos
IF DB_ID('Almacen') IS NOT NULL
    DROP DATABASE Almacen;
GO

CREATE DATABASE Almacen;
GO

USE Almacen;
GO

-- Categorías
CREATE TABLE categorias (
    id_categoria INT IDENTITY PRIMARY KEY,
    nombre NVARCHAR(100) NOT NULL,
    descripcion NVARCHAR(MAX)
);

-- Marcas
CREATE TABLE marcas (
    id_marca INT IDENTITY PRIMARY KEY,
    nombre NVARCHAR(100) NOT NULL,
    pais_origen NVARCHAR(100)
);

-- Proveedores
CREATE TABLE proveedores (
    id_proveedor INT IDENTITY PRIMARY KEY,
    nombre NVARCHAR(100) NOT NULL,
    email NVARCHAR(100),
    telefono NVARCHAR(20),
    direccion NVARCHAR(MAX)
);

-- Zonas
CREATE TABLE zonas (
    id_zona INT IDENTITY PRIMARY KEY,
    nombre NVARCHAR(100) NOT NULL,
    descripcion NVARCHAR(MAX)
);

-- Estantes
CREATE TABLE estantes (
    id_estante INT IDENTITY PRIMARY KEY,
    codigo NVARCHAR(50) NOT NULL,
    id_zona INT NOT NULL,
    descripcion NVARCHAR(MAX),
    FOREIGN KEY (id_zona) REFERENCES zonas(id_zona)
);

-- Ubicaciones
CREATE TABLE ubicaciones (
    id_ubicacion INT IDENTITY PRIMARY KEY,
    id_estante INT NOT NULL,
    nivel INT NOT NULL,
    capacidad_maxima INT NOT NULL,
    descripcion NVARCHAR(MAX),
    FOREIGN KEY (id_estante) REFERENCES estantes(id_estante)
);

-- Usuarios
CREATE TABLE usuarios (
    id_usuario INT IDENTITY PRIMARY KEY,
    nombre NVARCHAR(100) NOT NULL,
    email NVARCHAR(100) NOT NULL,
    contrasena NVARCHAR(255) NOT NULL
);

-- Roles
CREATE TABLE roles (
    id_rol INT IDENTITY PRIMARY KEY,
    nombre NVARCHAR(50) NOT NULL
);

-- Relación M:N entre usuarios y roles
CREATE TABLE usuarios_roles (
    id_usuario INT NOT NULL,
    id_rol INT NOT NULL,
    PRIMARY KEY (id_usuario, id_rol),
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
    FOREIGN KEY (id_rol) REFERENCES roles(id_rol)
);

-- Productos
CREATE TABLE productos (
    id_producto INT IDENTITY PRIMARY KEY,
    nombre NVARCHAR(100) NOT NULL,
    descripcion NVARCHAR(MAX),
    id_categoria INT NOT NULL,
    id_marca INT NOT NULL,
    id_ubicacion INT NOT NULL,
    stock_actual INT NOT NULL DEFAULT 0,
    stock_minimo INT NOT NULL DEFAULT 0,
    precio_unitario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria),
    FOREIGN KEY (id_marca) REFERENCES marcas(id_marca),
    FOREIGN KEY (id_ubicacion) REFERENCES ubicaciones(id_ubicacion)
);

-- Relación M:N entre productos y proveedores
CREATE TABLE productos_proveedores (
    id_producto INT NOT NULL,
    id_proveedor INT NOT NULL,
    PRIMARY KEY (id_producto, id_proveedor),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto),
    FOREIGN KEY (id_proveedor) REFERENCES proveedores(id_proveedor)
);

-- Tipos de movimiento
CREATE TABLE tipos_movimiento (
    id_tipo_movimiento INT IDENTITY PRIMARY KEY,
    descripcion NVARCHAR(100) NOT NULL
);

-- Movimientos de inventario
CREATE TABLE movimientos (
    id_movimiento INT IDENTITY PRIMARY KEY,
    fecha DATETIME DEFAULT GETDATE(),
    id_tipo_movimiento INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    id_usuario INT NOT NULL,
    observaciones NVARCHAR(MAX),
    FOREIGN KEY (id_tipo_movimiento) REFERENCES tipos_movimiento(id_tipo_movimiento),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto),
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

-- Pedidos
CREATE TABLE pedidos (
    id_pedido INT IDENTITY PRIMARY KEY,
    id_proveedor INT NOT NULL,
    fecha_pedido DATETIME DEFAULT GETDATE(),
    estado NVARCHAR(20) NOT NULL CHECK (estado IN ('pendiente', 'recibido', 'cancelado')),
    FOREIGN KEY (id_proveedor) REFERENCES proveedores(id_proveedor)
);

-- Relación M:N entre pedidos y productos
CREATE TABLE pedidos_productos (
    id_pedido INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    PRIMARY KEY (id_pedido, id_producto),
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

-- Auditorías del sistema
CREATE TABLE auditorias (
    id_auditoria INT IDENTITY PRIMARY KEY,
    accion NVARCHAR(10) NOT NULL CHECK (accion IN ('INSERT', 'UPDATE', 'DELETE', 'ERROR')),
    tabla_afectada NVARCHAR(100) NOT NULL,
    id_usuario INT NOT NULL,
    fecha DATETIME DEFAULT GETDATE(),
    detalle NVARCHAR(MAX),
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);
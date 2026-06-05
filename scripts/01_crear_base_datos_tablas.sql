-- creacion de la base de datos
create schema ERP_Comercial;

use ERP_Comercial;

-- creacion de la tabla categorias
create table categorias (
id_categoria int primary key,
nombre_categoria varchar(50) not null
);

-- creacion de la tabla sucursales
create table sucursales (
id_sucursal int primary key,
nombre_sucursal varchar(50) not null,
pais varchar(50) not null,
ciudad varchar(50) not null
);

-- creacion de la tabla vendedores
create table vendedores (
id_vendedor int primary key,
nombre_vendedor varchar(50) not null,
id_sucursal int not null,
cargo varchar(50) not null,
fecha_ingreso date not null,
foreign key (id_sucursal) references sucursales(id_sucursal)
);

-- creacion de la tabla clientes
create table clientes (
id_cliente int primary key,
nombre_cliente varchar(50) not null,
pais varchar(50) not null,
ciudad varchar(50) not null,
segmento varchar(50) not null,
fecha_registro date not null
);

-- creacion de la tabla proveedores
create table proveedores (
id_proveedor int primary key,
nombre_proveedor varchar(50) not null,
pais varchar(50) not null,
contacto varchar(255) not null
);

-- creacion de la tabla productos
create table productos (
id_producto int primary key,
nombre_producto varchar(100) not null,
id_categoria int not null,
id_proveedor int not null,
precio_unitario decimal(10, 2) not null,
costo_unitario decimal(10, 2) not null,
stock_minimo int not null,
foreign key (id_categoria) references categorias(id_categoria),
foreign key (id_proveedor) references proveedores(id_proveedor)
);

-- creacion de la tabla inventarios
create table inventario (
id_inventario int primary key,
id_producto int not null,
id_sucursal int not null,
stock_actual int not null,
ultima_actualizacion date not null,
foreign key (id_producto) references productos (id_producto),
foreign key (id_sucursal) references sucursales (id_sucursal)
);

-- creacion de la tabla pedidos
create table pedidos (
id_pedido int primary key,
fecha_pedido date not null,
id_cliente int not null,
id_vendedor int not null,
id_sucursal int not null,
estado_pedido varchar(50) not null,
canal_venta varchar(50) not null,
foreign key (id_cliente) references clientes(id_cliente),
foreign key (id_vendedor) references vendedores(id_vendedor),
foreign key (id_sucursal) references sucursales (id_sucursal)
);

-- creacion de la tabla detalle_pedido
create table detalle_pedido (
id_detalle int primary key,
id_pedido int not null,
id_producto int not null,
cantidad int not null,
precio_unitario decimal(10, 2) not null,
descuento decimal(5, 2) not null,
foreign key (id_pedido) references pedidos(id_pedido),
foreign key (id_producto) references productos(id_producto)
);

-- creacion de la tabla pagos
create table pagos (
id_pago int primary key,
id_pedido int not null,
fecha_pago date,
metodo_pago varchar(50) not null,
monto_pagado decimal(10, 2) not null,
estado_pago varchar(50) not null,
foreign key (id_pedido) references pedidos(id_pedido)
);

-- creacion de la tabla envios
create table envios (
id_envio int primary key,
id_pedido int not null,
fecha_envio date,
empresa_envio varchar (50) not null,
estado_envio varchar(50) not null,
costo_envio decimal(10, 2) not null,
foreign key (id_pedido) references pedidos(id_pedido)
);

-- creacion de la tabla devoluciones
create table devoluciones (
id_devolucion int primary key,
id_pedido int not null,
id_producto int not null,
fecha_devolucion date not null,
cantidad_devuelta int not null,
motivo varchar(50) not null,
foreign key (id_pedido) references pedidos(id_pedido),
foreign key (id_producto) references productos(id_producto)
);
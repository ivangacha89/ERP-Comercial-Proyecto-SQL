-- Datos de inserción - Proyecto SQL ERP Comercial
-- Ejecutar después de crear las tablas

-- categorias
INSERT INTO categorias (id_categoria, nombre_categoria)
VALUES
(1, 'Tecnología'),
(2, 'Oficina'),
(3, 'Mobiliario'),
(4, 'Software');

-- sucursales
INSERT INTO sucursales (id_sucursal, nombre_sucursal, pais, ciudad)
VALUES
(1, 'Sucursal Santiago', 'Chile', 'Santiago'),
(2, 'Sucursal Lima', 'Perú', 'Lima'),
(3, 'Sucursal Bogotá', 'Colombia', 'Bogotá');

-- vendedores
INSERT INTO vendedores (id_vendedor, nombre_vendedor, id_sucursal, cargo, fecha_ingreso)
VALUES
(1, 'Camila Torres', 1, 'Ejecutiva Comercial', '2023-01-10'),
(2, 'Felipe Rojas', 1, 'Ejecutivo Comercial', '2023-03-15'),
(3, 'María Quispe', 2, 'Ejecutiva Comercial', '2022-11-01'),
(4, 'Andrés Gómez', 3, 'Ejecutivo Comercial', '2024-02-05');

-- clientes
INSERT INTO clientes (id_cliente, nombre_cliente, pais, ciudad, segmento, fecha_registro)
VALUES
(1, 'Comercial Andes', 'Chile', 'Santiago', 'Empresa', '2023-01-05'),
(2, 'Retail Express', 'Chile', 'Valparaíso', 'Retail', '2023-02-12'),
(3, 'Inversiones Norte', 'Perú', 'Lima', 'Empresa', '2023-04-20'),
(4, 'Global Market', 'Colombia', 'Bogotá', 'Empresa', '2023-06-15'),
(5, 'Emprende Fácil', 'Chile', 'Concepción', 'Pyme', '2023-07-09'),
(6, 'Distribuidora Lima', 'Perú', 'Lima', 'Distribuidor', '2023-08-18'),
(7, 'Servicios Patagonia', 'Chile', 'Puerto Montt', 'Pyme', '2023-10-02'),
(8, 'Tech Solutions', 'México', 'Ciudad de México', 'Empresa', '2024-01-11');

-- proveedores
INSERT INTO proveedores (id_proveedor, nombre_proveedor, pais, contacto)
VALUES
(1, 'Importadora Tech', 'Chile', 'contacto@importech.cl'),
(2, 'OfiProveedores', 'Perú', 'ventas@ofipro.pe'),
(3, 'Muebles Latam', 'Colombia', 'comercial@muebleslatam.co'),
(4, 'SoftCloud', 'México', 'soporte@softcloud.mx');

-- productos
INSERT INTO productos (id_producto, nombre_producto, id_categoria, id_proveedor, precio_unitario, costo_unitario, stock_minimo)
VALUES
(1, 'Notebook Ejecutivo', 1, 1, 950.00, 620.00, 5),
(2, 'Monitor 24 pulgadas', 1, 1, 220.00, 140.00, 8),
(3, 'Teclado Inalámbrico', 1, 1, 45.00, 25.00, 15),
(4, 'Mouse Ergonomico', 1, 1, 30.00, 14.00, 20),
(5, 'Silla Oficina Pro', 3, 3, 180.00, 105.00, 6),
(6, 'Escritorio Modular', 3, 3, 260.00, 160.00, 4),
(7, 'Pack Papelería', 2, 2, 35.00, 18.00, 20),
(8, 'Impresora Multifuncional', 1, 1, 320.00, 210.00, 5),
(9, 'Licencia CRM Mensual', 4, 4, 80.00, 35.00, 10),
(10, 'Licencia BI Mensual', 4, 4, 120.00, 50.00, 10),
(11, 'Archivador Corporativo', 2, 2, 22.00, 11.00, 25),
(12, 'Router Empresarial', 1, 1, 150.00, 85.00, 6);

-- inventario
INSERT INTO inventario (id_inventario, id_producto, id_sucursal, stock_actual, ultima_actualizacion)
VALUES
(1, 1, 1, 14, '2024-01-01'),
(2, 2, 1, 20, '2024-01-01'),
(3, 3, 1, 45, '2024-01-01'),
(4, 4, 1, 60, '2024-01-01'),
(5, 5, 1, 12, '2024-01-01'),
(6, 6, 1, 8, '2024-01-01'),
(7, 7, 1, 80, '2024-01-01'),
(8, 8, 1, 9, '2024-01-01'),
(9, 9, 1, 30, '2024-01-01'),
(10, 10, 1, 25, '2024-01-01'),
(11, 11, 1, 90, '2024-01-01'),
(12, 12, 1, 10, '2024-01-01'),
(13, 1, 2, 8, '2024-01-01'),
(14, 2, 2, 14, '2024-01-01'),
(15, 3, 2, 30, '2024-01-01'),
(16, 4, 2, 35, '2024-01-01'),
(17, 5, 2, 7, '2024-01-01'),
(18, 6, 2, 5, '2024-01-01'),
(19, 7, 2, 55, '2024-01-01'),
(20, 8, 2, 6, '2024-01-01'),
(21, 9, 2, 18, '2024-01-01'),
(22, 10, 2, 15, '2024-01-01'),
(23, 11, 2, 60, '2024-01-01'),
(24, 12, 2, 7, '2024-01-01'),
(25, 1, 3, 6, '2024-01-01'),
(26, 2, 3, 10, '2024-01-01'),
(27, 3, 3, 24, '2024-01-01'),
(28, 4, 3, 28, '2024-01-01'),
(29, 5, 3, 5, '2024-01-01'),
(30, 6, 3, 4, '2024-01-01'),
(31, 7, 3, 40, '2024-01-01'),
(32, 8, 3, 4, '2024-01-01'),
(33, 9, 3, 12, '2024-01-01'),
(34, 10, 3, 10, '2024-01-01'),
(35, 11, 3, 50, '2024-01-01'),
(36, 12, 3, 5, '2024-01-01');

-- pedidos
INSERT INTO pedidos (id_pedido, fecha_pedido, id_cliente, id_vendedor, id_sucursal, estado_pedido, canal_venta)
VALUES
(1, '2024-01-05', 1, 1, 1, 'Entregado', 'Web'),
(2, '2024-01-12', 2, 2, 1, 'Entregado', 'Tienda'),
(3, '2024-01-20', 3, 3, 2, 'Entregado', 'Ejecutivo'),
(4, '2024-02-03', 4, 4, 3, 'Entregado', 'Ejecutivo'),
(5, '2024-02-10', 5, 1, 1, 'Entregado', 'Web'),
(6, '2024-02-18', 6, 3, 2, 'Entregado', 'Tienda'),
(7, '2024-03-02', 7, 2, 1, 'Entregado', 'Ejecutivo'),
(8, '2024-03-09', 8, 4, 3, 'Entregado', 'Web'),
(9, '2024-03-14', 1, 1, 1, 'Entregado', 'Tienda'),
(10, '2024-03-25', 3, 3, 2, 'Entregado', 'Ejecutivo'),
(11, '2024-04-04', 4, 4, 3, 'Entregado', 'Web'),
(12, '2024-04-12', 5, 2, 1, 'Entregado', 'Tienda'),
(13, '2024-04-19', 6, 3, 2, 'Entregado', 'Ejecutivo'),
(14, '2024-05-03', 2, 1, 1, 'Entregado', 'Web'),
(15, '2024-05-10', 7, 2, 1, 'Pendiente', 'Ejecutivo'),
(16, '2024-05-18', 8, 4, 3, 'Entregado', 'Web'),
(17, '2024-06-07', 1, 1, 1, 'Pendiente', 'Tienda'),
(18, '2024-06-15', 4, 4, 3, 'Cancelado', 'Ejecutivo');

-- detalle_pedido
INSERT INTO detalle_pedido (id_detalle, id_pedido, id_producto, cantidad, precio_unitario, descuento)
VALUES
(1, 1, 1, 1, 950, 0.05),
(2, 1, 3, 2, 45, 0.00),
(3, 2, 5, 3, 180, 0.10),
(4, 2, 7, 5, 35, 0.00),
(5, 3, 10, 4, 120, 0.05),
(6, 3, 12, 2, 150, 0.00),
(7, 4, 2, 5, 220, 0.08),
(8, 4, 4, 10, 30, 0.00),
(9, 5, 8, 1, 320, 0.00),
(10, 5, 11, 6, 22, 0.00),
(11, 6, 6, 2, 260, 0.05),
(12, 6, 7, 8, 35, 0.00),
(13, 7, 9, 5, 80, 0.00),
(14, 7, 10, 3, 120, 0.00),
(15, 8, 1, 2, 950, 0.10),
(16, 8, 12, 3, 150, 0.05),
(17, 9, 2, 4, 220, 0.00),
(18, 9, 3, 6, 45, 0.00),
(19, 10, 5, 2, 180, 0.00),
(20, 10, 6, 1, 260, 0.00),
(21, 11, 8, 2, 320, 0.05),
(22, 11, 4, 8, 30, 0.00),
(23, 12, 7, 10, 35, 0.00),
(24, 12, 11, 12, 22, 0.00),
(25, 13, 10, 6, 120, 0.10),
(26, 13, 9, 4, 80, 0.00),
(27, 14, 1, 1, 950, 0.00),
(28, 14, 2, 2, 220, 0.05),
(29, 15, 12, 2, 150, 0.00),
(30, 15, 4, 5, 30, 0.00),
(31, 16, 8, 1, 320, 0.00),
(32, 16, 10, 2, 120, 0.00),
(33, 17, 3, 10, 45, 0.00),
(34, 17, 7, 15, 35, 0.00),
(35, 18, 6, 1, 260, 0.00),
(36, 18, 5, 1, 180, 0.00);

-- pagos
INSERT INTO pagos (id_pago, id_pedido, fecha_pago, metodo_pago, monto_pagado, estado_pago)
VALUES
(1, 1, '2024-01-06', 'Transferencia', 992.50, 'Pagado'),
(2, 2, '2024-01-13', 'Tarjeta', 661.00, 'Pagado'),
(3, 3, '2024-01-22', 'Transferencia', 756.00, 'Pagado'),
(4, 4, '2024-02-05', 'Transferencia', 1312.00, 'Pagado'),
(5, 5, '2024-02-11', 'Tarjeta', 452.00, 'Pagado'),
(6, 6, '2024-02-20', 'Transferencia', 774.00, 'Pagado'),
(7, 7, '2024-03-04', 'Transferencia', 760.00, 'Pagado'),
(8, 8, '2024-03-10', 'Tarjeta', 2137.50, 'Pagado'),
(9, 9, '2024-03-15', 'Transferencia', 1150.00, 'Pagado'),
(10, 10, '2024-03-26', 'Transferencia', 620.00, 'Pagado'),
(11, 11, '2024-04-05', 'Tarjeta', 848.00, 'Pagado'),
(12, 12, '2024-04-13', 'Transferencia', 614.00, 'Pagado'),
(13, 13, '2024-04-20', 'Transferencia', 968.00, 'Pagado'),
(14, 14, '2024-05-04', 'Tarjeta', 1368.00, 'Pagado'),
(15, 15, NULL, 'Transferencia', 0.00, 'Pendiente'),
(16, 16, '2024-05-20', 'Tarjeta', 560.00, 'Pagado'),
(17, 17, NULL, 'Transferencia', 0.00, 'Pendiente'),
(18, 18, NULL, 'Transferencia', 0.00, 'Cancelado');

-- envios
INSERT INTO envios (id_envio, id_pedido, fecha_envio, empresa_envio, estado_envio, costo_envio)
VALUES
(1, 1, '2024-01-06', 'Chilexpress', 'Entregado', 18),
(2, 2, '2024-01-13', 'Starken', 'Entregado', 22),
(3, 3, '2024-01-22', 'DHL', 'Entregado', 35),
(4, 4, '2024-02-05', 'DHL', 'Entregado', 40),
(5, 5, '2024-02-11', 'Chilexpress', 'Entregado', 16),
(6, 6, '2024-02-20', 'DHL', 'Entregado', 30),
(7, 7, '2024-03-04', 'Starken', 'Entregado', 20),
(8, 8, '2024-03-10', 'DHL', 'Entregado', 45),
(9, 9, '2024-03-15', 'Chilexpress', 'Entregado', 24),
(10, 10, '2024-03-26', 'DHL', 'Entregado', 32),
(11, 11, '2024-04-05', 'DHL', 'Entregado', 38),
(12, 12, '2024-04-13', 'Starken', 'Entregado', 18),
(13, 13, '2024-04-20', 'DHL', 'Entregado', 34),
(14, 14, '2024-05-04', 'Chilexpress', 'Entregado', 25),
(15, 15, NULL, 'Starken', 'Pendiente', 0),
(16, 16, '2024-05-20', 'DHL', 'Entregado', 36),
(17, 17, NULL, 'Chilexpress', 'Pendiente', 0),
(18, 18, NULL, 'DHL', 'Cancelado', 0);

-- devoluciones
INSERT INTO devoluciones (id_devolucion, id_pedido, id_producto, fecha_devolucion, cantidad_devuelta, motivo)
VALUES
(1, 4, 4, '2024-02-12', 2, 'Producto defectuoso'),
(2, 8, 12, '2024-03-18', 1, 'Cambio solicitado'),
(3, 11, 8, '2024-04-11', 1, 'Falla de equipo'),
(4, 14, 2, '2024-05-12', 1, 'Producto no requerido');

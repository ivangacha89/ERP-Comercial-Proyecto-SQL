-- Validar que todas las tablas tengan datos.
select * from categorias;
select * from sucursales;
select * from vendedores;
select * from clientes;
select * from proveedores;
select * from productos;
select * from inventario;
select * from pedidos;
select * from detalle_pedido;
select * from pagos;
select * from envios;
select * from devoluciones;

-- Contar la cantidad de registros por tabla.
select count(*) as cantidad_registros_categorias
from categorias;

select count(*) as cantidad_registros_sucursales
from sucursales;

select count(*) as cantidad_registros_vendedores
from vendedores;

select count(*) as cantidad_registros_clientes
from clientes;

select count(*) as cantidad_registros_proveedores
from proveedores;

select count(*) as cantidad_registros_productos
from productos;

select count(*) as cantidad_registros_inventario
from inventario;

select count(*) as cantidad_registros_pedidos
from pedidos;

select count(*) as cantidad_registros_detalle_pedido
from detalle_pedido;

select count(*) as cantidad_registros_pagos
from pagos;

select count(*) as cantidad_registros_envios
from envios;

select count(*) as cantidad_registros_devoluciones
from devoluciones;

-- Consultar pedidos junto con cliente, vendedor y sucursal.

select 
	p.id_pedido,
    p.fecha_pedido,
    c.nombre_cliente,
    v.nombre_vendedor,
    s.nombre_sucursal,
    p.estado_pedido,
    p.canal_venta
from
	pedidos p
left join
	clientes c on p.id_cliente = c.id_cliente
left join
	vendedores v on p.id_vendedor = v.id_vendedor
left join
	sucursales s on p.id_sucursal = s.id_sucursal;
    
-- Calcular el total vendido por pedido.

select 
	id_pedido,
    round(sum(cantidad * precio_unitario * (1 - descuento)), 2) as total_vendido_por_producto
from 
	detalle_pedido
group by 
	id_pedido;

-- Calcular ventas acumuladas por cliente.

select 
	c.nombre_cliente,
    round(sum(d.cantidad * d.precio_unitario * (1 - d.descuento)), 2) as total_vendido_por_cliente
from
	clientes c
join 
	pedidos p on c.id_cliente = p.id_cliente
join
	detalle_pedido d on d.id_pedido = p.id_pedido
group by 
	c.id_cliente, c.nombre_cliente;

-- Calcular ventas por producto y categoría.

select -- agrupado por producto y categoria
	p.nombre_producto,
    c.nombre_categoria,
    round(sum(d.cantidad * d.precio_unitario * (1 - d.descuento)), 2) as ventas_por_categoria
from
	productos p
join 
	categorias c on c.id_categoria = p.id_categoria
join
	detalle_pedido d on d.id_producto = p.id_producto
group by
	p.id_producto, p.nombre_producto, c.id_categoria, c.nombre_categoria;
	
    
select -- agrupado solo por categoria
    c.nombre_categoria,
    round(sum(d.cantidad * d.precio_unitario * (1 - d.descuento)), 2) as ventas_por_producto_categoria
from
	productos p
join 
	categorias c on c.id_categoria = p.id_categoria
join
	detalle_pedido d on d.id_producto = p.id_producto
group by
	c.id_categoria, c.nombre_categoria;
    
-- Calcular utilidad por producto.

select 
	p.nombre_producto,
    round(sum(d.cantidad * (d.precio_unitario * (1 - d.descuento))), 2) as total_vendido,
    round(sum(d.cantidad * (d.precio_unitario * (1 - d.descuento) - p.costo_unitario)), 2) as utilidad_por_producto,
    round(sum(d.cantidad * (d.precio_unitario * (1 - d.descuento) - p.costo_unitario)) / sum(d.cantidad * (d.precio_unitario * (1 - d.descuento))) * 100, 1)
    as margen_utilidad
from
	productos p
join
	detalle_pedido d on d.id_producto = p.id_producto
group by
	p.id_producto, p.nombre_producto;
    
-- Calcular ventas por vendedor.

select 
	v.nombre_vendedor,
    round(sum(d.cantidad * d.precio_unitario * (1 - d.descuento)), 2) as ventas_por_vendedor
from
	vendedores v
join 
	pedidos p on v.id_vendedor = p.id_vendedor
join
	detalle_pedido d on d.id_pedido = p.id_pedido
group by
	v.id_vendedor, v.nombre_vendedor;
    
-- Calcular ventas mensuales.

select 
	year(p.fecha_pedido) as Año,
    monthname(p.fecha_pedido) as Mes,
	round(sum(d.cantidad * d.precio_unitario * (1 - d.descuento)), 2) as ventas_mensuales
from 
	pedidos p
join
	detalle_pedido d on p.id_pedido = d.id_pedido
group by
	year(p.fecha_pedido), month(p.fecha_pedido), monthname(p.fecha_pedido);
    
-- Identificar pedidos pendientes o cancelados.

select
	id_pedido,
	year(p.fecha_pedido) as año_pedido,
    month(p.fecha_pedido) as mes_pedido,
    c.nombre_cliente,
    v.nombre_vendedor,
    s.nombre_sucursal,
    p.estado_pedido,
    p.canal_venta
from
	pedidos p
join
	clientes c on p.id_cliente = c.id_cliente
join
	vendedores v on p.id_vendedor = v.id_vendedor
join
	sucursales s on p.id_sucursal = s.id_sucursal
where 
	p.estado_pedido in ("Pendiente", "Cancelado");
    
-- Identificar productos con bajo stock.

select 
	p.nombre_producto,
    s.nombre_sucursal,
    i.stock_actual,
    p.stock_minimo,
    (i.stock_actual - p.stock_minimo) as diferencia_stock
from
	productos p
join
	inventario i on p.id_producto = i.id_producto
join
	sucursales s on s.id_sucursal = i.id_sucursal
where 
	i.stock_actual <= p.stock_minimo;

-- Identificar pedidos con pagos pendientes.

select
	p.id_pedido,
	date_format(pg.fecha_pago, "%Y-%m") as periodo,
    c.nombre_cliente,
    v.nombre_vendedor,
    s.nombre_sucursal,
    p.estado_pedido,
    p.canal_venta,
    pg.metodo_pago,
    pg.monto_pagado,
    pg.estado_pago
from
	pedidos p
join
	clientes c on p.id_cliente = c.id_cliente
join
	vendedores v on p.id_vendedor = v.id_vendedor
join
	sucursales s on p.id_sucursal = s.id_sucursal
join 
	pagos pg on pg.id_pedido = p.id_pedido
where 
	pg.estado_pago = "Pendiente";
    
-- Consultar productos con stock crítico.

-- Se utliza la vista stock_actual y se haace el filtro por estado del stock para no repetir la logica

-- esta query contiene la sucursal, por esa razon se repiten productos
select * from stock_actual where stock_estado_actual = "critico";
    
-- Consultar pedidos con devoluciones.

select
	pe.id_pedido,
	c.nombre_cliente,
    pr.nombre_producto,
    d.cantidad_devuelta,
    d.motivo,
    d.fecha_devolucion,
    pe.estado_pedido,
    pe.canal_venta
from 
	clientes c
join
	pedidos pe on c.id_cliente = pe.id_cliente
join
	devoluciones d on d.id_pedido = pe.id_pedido
join 
	productos pr on pr.id_producto = d.id_producto;
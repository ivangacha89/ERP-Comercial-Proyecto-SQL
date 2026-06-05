-- Preguntas de análisis


-- 1. ¿Qué cliente realizó el mayor total de compras?

select 
	c.nombre_cliente,
    round(sum(d.cantidad * d.precio_unitario * (1 - d.descuento)), 2) as total_vendido_por_cliente
from
	clientes c
join 
	pedidos p on c.id_cliente = p.id_cliente
join
	detalle_pedido d on d.id_pedido = p.id_pedido
where
	p.estado_pedido = "Entregado"
group by 
	c.id_cliente, c.nombre_cliente
order by
    round(sum(d.cantidad * d.precio_unitario * (1 - d.descuento)), 2) desc
limit 1;

-- Respuesta: Tech Solutions -> 2697.50


-- 2. ¿Qué vendedor generó más ventas?

select 
	v.nombre_vendedor,
    round(sum(d.cantidad * d.precio_unitario * (1 - d.descuento)), 2) as ventas_por_vendedor
from
	vendedores v
join 
	pedidos p on v.id_vendedor = p.id_vendedor
join
	detalle_pedido d on d.id_pedido = p.id_pedido
where
	p.estado_pedido = "Entregado"
group by
	v.id_vendedor, v.nombre_vendedor
order by
	round(sum(d.cantidad * d.precio_unitario * (1 - d.descuento)), 2) desc
limit 1;

-- Respuesta: Andrés Gómez -> 4857.50


-- 3. ¿Qué producto tuvo más unidades vendidas?

select
	p.nombre_producto,
    sum(d.cantidad) as unidades_vendidas
from
	productos p
join
	detalle_pedido d on d.id_producto = p.id_producto
group by
	p.id_producto, p.nombre_producto
order by
	sum(d.cantidad) desc
limit 1;

-- Respuesta: Pack Papelería -> 38


-- 4. ¿Qué pedido tuvo el mayor monto vendido?

select
	id_pedido,
    venta_neta
from
	resumen_de_ventas
order by
	venta_neta desc
limit 1;

-- Respuesta: Pedido #8 -> 2137.50


-- 5. ¿Qué canal de venta generó más ingresos?

select 
	canal_venta,
    sum(venta_neta) as venta_neta
from 
	resumen_de_ventas
where
	estado_pedido = "Entregado"
group by
	canal_venta;

-- Respuesta: Web -> 6358.00


-- 6. ¿Qué sucursal realizó más ventas?

select 
	nombre_sucursal,
    sum(venta_neta) as venta_neta
from 
	resumen_de_ventas
where
	estado_pedido = "Entregado"
group by
	nombre_sucursal;

-- Respuesta: Sucursal Santiago -> 7422.50


-- 7. ¿Qué productos presentan stock crítico?

select * from stock_actual where stock_estado_actual = "critico";

/*
Respuesta:

	Notebook Ejecutivo			Sucursal Bogotá
	Silla Oficina Pro			Sucursal Bogotá
	Silla Oficina Pro			Sucursal Lima
	Escritorio Modular			Sucursal Bogotá
	Escritorio Modular			Sucursal Lima
	Impresora Multifuncional	Sucursal Bogotá
	Impresora Multifuncional	Sucursal Lima
	Licencia BI Mensual			Sucursal Bogotá
	Router Empresarial			Sucursal Bogotá
	Router Empresarial			Sucursal Lima
*/


-- 8. ¿Qué pedidos siguen pendientes o cancelados? *

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


-- Respuesta: Pedidos #15, #17 y #18


-- 9. ¿Qué pedidos tuvieron devoluciones?

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

-- Respuesta: Pedidos #4, #8, #11 y #14


-- 10. ¿Cuántos pagos siguen pendientes o cancelados?

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
	pg.estado_pago in ("Pendiente", "Cancelado");

-- Respuesta: 3 pagos, IDs #15, #17 y #18

-- Crear una vista resumen de ventas.

create view 
	resumen_de_ventas as
select 
	p.id_pedido,
    date_format(p.fecha_pedido, "%Y-%m") as periodo,
    c.nombre_cliente,
    v.nombre_vendedor,
    s.nombre_sucursal,
    p.estado_pedido,
    p.canal_venta,
    pg.estado_pago,
    round(sum(dp.cantidad * dp.precio_unitario), 2) as venta_bruta,
    round(sum(dp.cantidad * dp.precio_unitario * dp.descuento), 2) as total_descuentos,
    round(sum(dp.cantidad * dp.precio_unitario * (1 - dp.descuento)), 2) as venta_neta
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
join
	detalle_pedido dp on dp.id_pedido = p.id_pedido
group by
	p.id_pedido,
    p.fecha_pedido,
    c.nombre_cliente,
    v.nombre_vendedor,
    s.nombre_sucursal,
    p.canal_venta,
    p.estado_pedido,
    pg.estado_pago,
    pg.monto_pagado;
    
-- Crear una vista de stock actual.

create view 
	stock_actual as
select
	p.nombre_producto,
    s.nombre_sucursal,
    i.stock_actual,
    p.stock_minimo,
    (i.stock_actual - p.stock_minimo) as diferencia_stock,
    case
		when (i.stock_actual - p.stock_minimo) >= 5 then "normal"
        when (i.stock_actual - p.stock_minimo) between 2 and 4 then "bajo"
        else "critico"
	end as stock_estado_actual
from
	productos p
join
	inventario i on p.id_producto = i.id_producto
join
	sucursales s on i.id_sucursal = s.id_sucursal;
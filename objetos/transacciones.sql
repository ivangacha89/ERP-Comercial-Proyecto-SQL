-- Crear una transacción para actualizar inventario y pagos.

start transaction;
	
    -- operacion 1: descontar stock del producto 12 en la sucursal 1
    update inventario
    set stock_actual = stock_actual - 2
    where id_producto = 12
    and id_sucursal = 1;
    
    -- operacion 2: descontar stock del producto 4 en la sucursal 1
    update inventario
    set stock_actual = stock_actual - 5
    where id_producto = 4
    and id_sucursal = 1;
    
    -- operacion 3: registrar el pago del pedido 15
    update pagos
    set 
		estado_pago = "Pagado",
		monto_pagado = 450.00,
        fecha_pago = "2024-05-11"
    where id_pago = 15;
    
-- Verificar que todo quedó bien antes de confirmar
select 'Verificando inventario producto 12 sucursal 1:' as info;
select stock_actual from inventario where id_producto = 12 and id_sucursal = 1;

select 'Verificando inventario producto 4 sucursal 1:' as info;
select stock_actual from inventario where id_producto = 4 and id_sucursal = 1;

-- si todo es correcto se hace commit
commit;

-- si algo falla se ejecuta el rollback
rollback;

/*
Proceso de prueba de la transaccion y comprobacion de datos

-- Stock actual de los productos involucrados
SELECT i.id_inventario, p.nombre_producto, i.stock_actual, s.nombre_sucursal
FROM inventario i
JOIN productos p ON i.id_producto = p.id_producto
JOIN sucursales s ON i.id_sucursal = s.id_sucursal
WHERE i.id_producto IN (12, 4)
AND i.id_sucursal = 1;

-- Estado actual del pago 15
SELECT id_pago, estado_pago, monto_pagado, fecha_pago
FROM pagos
WHERE id_pago = 15;
*/
-- Crear un trigger para actualizar inventario automáticamente.

DELIMITER //

create trigger actualizar_inventario
after insert on detalle_pedido
for each row
begin
	update inventario
    set stock_actual = stock_actual - new.cantidad
    where id_producto = new.id_producto
    and id_sucursal = (select id_sucursal from pedidos where id_pedido = new.id_pedido);
end //

DELIMITER ;

/*
Proceso de prueba del trigger y comprobacion de datos

-- stock antes de insertar
SELECT i.stock_actual, p.nombre_producto, s.nombre_sucursal
FROM inventario i
JOIN productos p ON i.id_producto = p.id_producto
JOIN sucursales s ON i.id_sucursal = s.id_sucursal
WHERE i.id_producto = 1
AND i.id_sucursal = 3;
-- Resultado esperado: stock_actual = 6

-- Simula una venta de 3 Notebooks en Sucursal Bogotá (sucursal 3, pedido 18)
INSERT INTO detalle_pedido 
VALUES (37, 18, 1, 3, 950.00, 0.00);

-- stock despues de insertar
SELECT i.stock_actual, p.nombre_producto, s.nombre_sucursal
FROM inventario i
JOIN productos p ON i.id_producto = p.id_producto
JOIN sucursales s ON i.id_sucursal = s.id_sucursal
WHERE i.id_producto = 1
AND i.id_sucursal = 3;
-- Resultado esperado: stock_actual = 3

-- se elimina el registro con id_detalle = 37 para la prueba del disparo del trigger
delete from detalle_pedido
where id_detalle = 37;

-- se retorna el valor del stock_actual = 6 del inventario del producto
update inventario
set stock_actual = 6
where id_producto = 1 and id_sucursal = 3;
*/
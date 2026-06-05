-- Crear una función para calcular totales con descuento.

DELIMITER //

create function calcular_totales_con_descuento(cantidad int, precio_unitario decimal(10, 2), descuento decimal(5, 2))
returns decimal(10, 2)
deterministic
begin
	declare precio_total_con_descuento decimal(10, 2);
    set precio_total_con_descuento = cantidad * precio_unitario * (1 - descuento);
    return precio_total_con_descuento;
end //

DELIMITER ;

SELECT
    id_detalle,
    calcular_totales_con_descuento(cantidad, precio_unitario, descuento) AS total
FROM detalle_pedido;
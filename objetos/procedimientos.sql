-- Crear un procedimiento almacenado para resumir compras por cliente.

/*
Se utliza la vista resumen_de_ventas y se muestran columnas relevantes para no repetir la logica

Se hace manejo para evaluar si el cliente ingresado existe o no al llamar el procedimiento
y asi devolver un mensaje predeterminado en caso de que el cliente no exista
*/


DELIMITER //

create procedure resumir_compras_por_cliente(in p_nombre varchar(100))
begin
	if exists (
		select 1
		from resumen_de_ventas
		where nombre_cliente = p_nombre
    ) then
		select 
			id_pedido,
			Periodo,
			nombre_cliente,
			nombre_vendedor,
			nombre_sucursal,
			canal_venta,
			estado_pago,
			Venta_neta
		from resumen_de_ventas
		where nombre_cliente = p_nombre;
	else
		select "El cliente ingresado no existe" as mensaje;
	end if;
end //

DELIMITER ;

CALL resumir_compras_por_cliente('Comercial Andes');  -- existe
CALL resumir_compras_por_cliente('Cliente Fantasma');  -- no existe
-- Crear índices para optimizar consultas frecuentes.

-- tabla pedidos

-- filtros por estado_pedido constantemente
create index idx_pedidos_estado on pedidos (estado_pedido);

-- joins frecuentes hacia clientes, vendedores y sucursales
create index idx_pedidos_cliente on pedidos (id_cliente);
create index idx_pedidos_vendedor on pedidos (id_vendedor);
create index idx_pedidos_sucursal on pedidos (id_sucursal);

-- agrupaciones y ordenamientos por fecha constantemente
create index idx_pedidos_fecha on pedidos (fecha_pedido);

-- tabla detalle_pedido

-- join principal hacia pedidos
create index idx_detalle_pedido on detalle_pedido (id_pedido);

-- join hacia productos
create index idx_detalle_producto on detalle_pedido (id_producto);

-- tabla inventario

-- where que siempre filtra por producto y sucursal juntos
create index idx_inventario_producto_sucursal
on inventario (id_producto, id_sucursal);

-- tabla pagos

-- filtros por estado_pago frecuentemente
create index idx_pagos_estado on pagos (estado_pago);

-- join hacia pedidos
create index idx_pagos_pedido on pagos (id_pedido);
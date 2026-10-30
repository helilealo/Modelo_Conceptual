USE technostore;

-- ---------- CATALOGOS ----------
INSERT INTO cargo (nombre_cargo, area) VALUES
('Gerente General',        'Gerencia'),
('Vendedor de Tienda',     'Ventas'),
('Asesor de Soporte',      'Soporte'),
('Coordinador Logistico',  'Logistica'),
('Analista de Compras',    'Compras'),
('Tecnico de Sistemas',    'Tecnologia'),
('Cajero',                 'Ventas');

INSERT INTO marca (nombre_marca) VALUES
('Samsung'),
('Apple'),
('HP'),
('Lenovo'),
('Logitech'),
('Asus'),
('Sony');

INSERT INTO metodo_pago (nombre) VALUES
('Efectivo'),
('Tarjeta de credito'),
('Tarjeta debito'),
('PSE'),
('Nequi'),
('Daviplata'),
('Transferencia');

INSERT INTO canal (nombre_canal) VALUES
('Telefono'),
('WhatsApp'),
('Correo electronico'),
('Chat web'),
('Presencial'),
('Redes sociales');

INSERT INTO tipo_atencion (nombre, modalidad) VALUES
('Garantia de producto',     'Presencial'),
('Falla tecnica',            'Virtual'),
('Consulta de precios',      'Virtual'),
('Seguimiento de envio',     'Virtual'),
('Devolucion de producto',   'Presencial'),
('Soporte de instalacion',   'Remota'),
('Reclamo por factura',      'Virtual');

-- ---------- PERSONAS ----------
INSERT INTO clientes (nombres, apellidos, numero_telefono, ciudad) VALUES
('Carlos Andres',  'Ramirez Gomez',   '3001234567', 'Bogota'),
('Maria Fernanda', 'Lopez Torres',    '3109876543', 'Bogota'),
('Juan David',     'Martinez Rojas',  '3204567890', 'Medellin'),
('Laura Camila',   'Garcia Pardo',    '3156781234', 'Cali'),
('Santiago',       'Hernandez Diaz',  '3017894561', 'Bogota'),
('Valentina',      'Castro Mejia',    '3123456780', 'Bucaramanga'),
('Andres Felipe',  'Moreno Silva',    '3182345671', 'Barranquilla'),
('Daniela',        'Vargas Ortiz',    '3009871234', 'Soacha');

INSERT INTO empleado (nombres, apellidos, telefono, correo, idcargo) VALUES
('Luis Alberto',  'Perez Sanchez',    '3011112222', 'luis.perez@technostore.com',     1),
('Ana Maria',     'Rodriguez Cruz',   '3022223333', 'ana.rodriguez@technostore.com',  2),
('Camilo',        'Fernandez Leon',   '3033334444', 'camilo.fernandez@technostore.com', 3),
('Paola Andrea',  'Gutierrez Nino',   '3044445555', 'paola.gutierrez@technostore.com', 4),
('Jorge Ivan',    'Salazar Ramos',    '3055556666', 'jorge.salazar@technostore.com',  5),
('Sebastian',     'Ortega Beltran',   '3066667777', 'sebastian.ortega@technostore.com', 6),
('Natalia',       'Cardenas Pinzon',  '3077778888', 'natalia.cardenas@technostore.com', 7);

-- ---------- PRODUCTOS ----------
INSERT INTO producto (nombre_producto, codigo_barras, precio, idmarca, diseno, forma) VALUES
('Smartphone Galaxy A54',     '7701234500011', 1450000.00, 1, 'Moderno',   'Rectangular 6.4 pulgadas'),
('iPhone 14',                 '7701234500028', 3800000.00, 2, 'Premium',   'Rectangular 6.1 pulgadas'),
('Portatil HP Pavilion 15',   '7701234500035', 2650000.00, 3, 'Clasico',   'Laptop 15.6 pulgadas'),
('Portatil Lenovo IdeaPad 3', '7701234500042', 2200000.00, 4, 'Basico',    'Laptop 14 pulgadas'),
('Mouse Inalambrico MX',      '7701234500059',  320000.00, 5, 'Ergonomico','Ovalado'),
('Teclado Mecanico Gamer',    '7701234500066',  280000.00, 6, 'Gamer',     'Compacto 60%'),
('Audifonos WH-1000XM5',      '7701234500073', 1300000.00, 7, 'Premium',   'Diadema over-ear'),
('Monitor Samsung 24 pulgadas','7701234500080', 780000.00, 1, 'Delgado',   'Plano Full HD');

-- ---------- PROVEEDORES ----------
INSERT INTO proveedor (nombre_empresa, telefono, ciudad) VALUES
('Distribuciones Tecnologicas SAS', '6013001000', 'Bogota'),
('Importadora Digital Colombia',    '6042002000', 'Medellin'),
('Mayorista de Celulares Ltda',     '6023003000', 'Cali'),
('Computadores y Accesorios SAS',   '6013004000', 'Bogota'),
('Global Tech Suppliers',           '6053005000', 'Barranquilla'),
('Electro Partes del Norte',        '6076006000', 'Bucaramanga');

INSERT INTO compra_proveedor (idproveedor, idproducto, costo, fecha_asignacion, fecha_recibido, estado_envio, estado_recibido) VALUES
(3, 1, 1200000.000, '2026-09-01 09:00:00', '2026-09-05 14:30:00', 'entregado', 'recibido'),
(3, 2, 3300000.000, '2026-09-02 10:15:00', '2026-09-08 11:00:00', 'entregado', 'recibido'),
(4, 3, 2250000.000, '2026-09-03 08:45:00', '2026-09-10 16:20:00', 'entregado', 'recibido'),
(4, 4, 1850000.000, '2026-09-10 13:00:00', NULL,                  'en_camino', 'pendiente'),
(1, 5,  250000.000, '2026-09-15 09:30:00', '2026-09-18 10:00:00', 'entregado', 'rechazado'),
(2, 6,  210000.000, '2026-09-20 11:00:00', NULL,                  'pendiente', 'pendiente'),
(5, 7, 1050000.000, '2026-09-22 15:00:00', NULL,                  'en_camino', 'pendiente');

-- ---------- VENTAS ----------
INSERT INTO venta (idclientes, idempleado, idmetodo_pago, fecha_venta, ubicacion) VALUES
(1, 2, 2, '2026-10-01', 'Tienda Chapinero'),
(2, 2, 5, '2026-10-02', 'Tienda Chapinero'),
(3, 7, 4, '2026-10-03', 'Tienda Online'),
(4, 7, 1, '2026-10-05', 'Tienda Centro'),
(5, 2, 3, '2026-10-07', 'Tienda Chapinero'),
(6, 7, 7, '2026-10-09', 'Tienda Online'),
(7, 2, 2, '2026-10-12', 'Tienda Online'),
(8, 7, 6, '2026-10-14', 'Tienda Centro');

INSERT INTO detalle_venta (idventa, idproducto, cantidad, precio_unitario) VALUES
(1, 1, 1, 1450000.00),
(1, 5, 2,  320000.00),
(2, 2, 1, 3800000.00),
(3, 3, 1, 2650000.00),
(4, 6, 1,  280000.00),
(5, 8, 2,  780000.00),
(6, 4, 1, 2200000.00),
(6, 5, 1,  320000.00),
(7, 7, 1, 1300000.00),
(8, 1, 1, 1450000.00);

INSERT INTO logistica (idventa, envio, fecha_envio, paquete, peso) VALUES
(1, 'Domicilio Bogota',     '2026-10-01 16:00:00', 'Caja mediana con proteccion', 1.250),
(2, 'Domicilio Bogota',     '2026-10-03 10:30:00', 'Caja pequena sellada',        0.450),
(3, 'Envio Nacional',       '2026-10-04 09:00:00', 'Caja grande con espuma',      3.200),
(5, 'Recogida en tienda',   '2026-10-07 18:00:00', 'Caja grande monitor',         6.800),
(6, 'Envio Nacional',       '2026-10-10 08:45:00', 'Caja grande con espuma',      3.500),
(7, 'Envio Nacional',       '2026-10-13 11:15:00', 'Caja mediana premium',        0.980),
(8, 'Domicilio Soacha',     '2026-10-15 14:00:00', 'Caja pequena sellada',        0.400);

-- ---------- SOPORTE ----------
INSERT INTO ticket (idclientes, idempleado, idcanal, idtipo_atencion, nombre_ticket, fecha, descripcion) VALUES
(1, 3, 2, 2, 'Pantalla con fallas de tactil',   '2026-10-06 10:00:00', 'El cliente reporta que la pantalla del celular no responde en la parte inferior.'),
(2, 3, 1, 4, 'Consulta estado de envio',        '2026-10-04 15:30:00', 'Solicita informacion sobre la fecha de llegada de su pedido.'),
(3, 3, 4, 6, 'Ayuda instalando el portatil',    '2026-10-08 09:15:00', 'Necesita apoyo para configurar el sistema operativo y los controladores.'),
(4, 6, 5, 1, 'Garantia teclado mecanico',       '2026-10-10 11:45:00', 'Una tecla dejo de funcionar a los 5 dias de la compra.'),
(5, 3, 3, 7, 'Error en el valor de la factura', '2026-10-11 14:20:00', 'El cliente indica que el valor cobrado no coincide con el precio publicado.'),
(6, 3, 2, 3, 'Consulta de precios de accesorios','2026-10-13 16:10:00', 'Pregunta por descuentos en mouse y teclados al comprar varios productos.'),
(7, 6, 6, 5, 'Devolucion de audifonos',         '2026-10-16 10:50:00', 'Solicita devolver los audifonos por problemas de conexion bluetooth.');
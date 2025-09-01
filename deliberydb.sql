DROP DATABASE IF EXISTS delivery_db;
CREATE DATABASE delivery_db;

USE delivery_db;

CREATE TABLE Usuarios (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    telefono VARCHAR(20),
    direccion VARCHAR(255) NOT NULL,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Restaurantes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(255) NOT NULL UNIQUE,
    telefono VARCHAR(20) NOT NULL
);
CREATE TABLE Productos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    restaurante_id INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (restaurante_id) REFERENCES Restaurantes(id)
);
CREATE TABLE Pedidos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    usuario_id INT NOT NULL,
    restaurante_id INT NOT NULL,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    estado VARCHAR(50) DEFAULT 'Pendiente', -- Ej: Pendiente, En camino, Entregado, Cancelado
    FOREIGN KEY (usuario_id) REFERENCES Usuarios(id),
    FOREIGN KEY (restaurante_id) REFERENCES Restaurantes(id)
);
CREATE TABLE Detalles_Pedido (
    id INT PRIMARY KEY AUTO_INCREMENT,
    pedido_id INT NOT NULL,
    producto_id INT NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (pedido_id) REFERENCES Pedidos(id),
    FOREIGN KEY (producto_id) REFERENCES Productos(id)
);

ALTER TABLE Restaurantes ADD COLUMN horario_apertura TIME;

ALTER TABLE Usuarios MODIFY COLUMN telefono VARCHAR(20) NOT NULL;

insert into Restaurantes (nombre, direccion, telefono) values
('Pizza Paraiso', 'Calle Falsa 123, Ciudad Capital', '555-0101'),
('Suchi Express', ' Avenida Siempre Viva 456, Villa sabor', '555-0102'),
('Taco Fiesta', 'Plaza Central 789, Pueblo Delicia', '555-0103');

select * from Restaurantes;

-- Insertar datos de prueba para la base de datos de pedidos

-- Tabla usuarios (100 usuarios)
INSERT INTO usuarios (nombre, email, telefono, direccion, fecha_registro) VALUES
('María García López', 'maria.garcia@email.com', '+1234567890', 'Calle Mayor 15, Madrid', '2024-01-15 10:30:00'),
('Carlos Rodríguez Pérez', 'carlos.rodriguez@email.com', '+1234567891', 'Av. Libertad 234, Barcelona', '2024-01-20 14:22:00'),
('Ana Martínez Silva', 'ana.martinez@email.com', '+1234567892', 'Plaza Central 45, Valencia', '2024-02-01 09:15:00'),
('Luis Fernando Torres', 'luis.torres@email.com', '+1234567893', 'Calle del Sol 78, Sevilla', '2024-02-05 16:45:00'),
('Isabella Moreno Cruz', 'isabella.moreno@email.com', '+1234567894', 'Av. República 123, Bilbao', '2024-02-10 11:30:00'),
('Diego Alejandro Ruiz', 'diego.ruiz@email.com', '+1234567895', 'Calle Nueva 67, Málaga', '2024-02-15 13:20:00'),
('Carmen Elena Vásquez', 'carmen.vasquez@email.com', '+1234567896', 'Paseo Marítimo 89, Alicante', '2024-02-20 08:45:00'),
('Roberto Carlos Mendoza', 'roberto.mendoza@email.com', '+1234567897', 'Av. Principal 456, Zaragoza', '2024-02-25 17:30:00'),
('Lucía Fernanda Castro', 'lucia.castro@email.com', '+1234567898', 'Calle Real 234, Murcia', '2024-03-01 12:15:00'),
('Andrés Felipe Herrera', 'andres.herrera@email.com', '+1234567899', 'Plaza España 12, Córdoba', '2024-03-05 15:40:00'),
('Sofía Alejandra Jiménez', 'sofia.jimenez@email.com', '+1234567800', 'Calle Comercio 56, Valladolid', '2024-03-10 10:20:00'),
('Miguel Ángel Ramírez', 'miguel.ramirez@email.com', '+1234567801', 'Av. Constitución 78, Vigo', '2024-03-15 14:50:00'),
('Elena Patricia Flores', 'elena.flores@email.com', '+1234567802', 'Calle Victoria 90, Gijón', '2024-03-20 09:30:00'),
('José Antonio Delgado', 'jose.delgado@email.com', '+1234567803', 'Plaza Mayor 23, Salamanca', '2024-03-25 16:10:00'),
('Natalia Beatriz Ortega', 'natalia.ortega@email.com', '+1234567804', 'Av. Andalucía 145, Granada', '2024-04-01 11:45:00'),
('Fernando Gabriel Soto', 'fernando.soto@email.com', '+1234567805', 'Calle Libertad 67, Santander', '2024-04-05 13:25:00'),
('Valentina Isabel Peña', 'valentina.pena@email.com', '+1234567806', 'Paseo Central 89, Pamplona', '2024-04-10 08:55:00'),
('Sebastián Mateo Vargas', 'sebastian.vargas@email.com', '+1234567807', 'Av. Europa 234, Logroño', '2024-04-15 17:20:00'),
('Daniela Carolina Luna', 'daniela.luna@email.com', '+1234567808', 'Calle Paz 45, Badajoz', '2024-04-20 12:35:00'),
('Alejandro David Morales', 'alejandro.morales@email.com', '+1234567809', 'Plaza Libertad 78, Cáceres', '2024-04-25 15:15:00'),
('Camila Andrea Aguilar', 'camila.aguilar@email.com', '+1234567810', 'Av. Progreso 123, Albacete', '2024-05-01 10:40:00'),
('Nicolás Eduardo Ríos', 'nicolas.rios@email.com', '+1234567811', 'Calle Esperanza 56, Cuenca', '2024-05-05 14:25:00'),
('Gabriela Mercedes Campos', 'gabriela.campos@email.com', '+1234567812', 'Paseo Rosales 89, Toledo', '2024-05-10 09:50:00'),
('Daniel Santiago Guerrero', 'daniel.guerrero@email.com', '+1234567813', 'Av. Independencia 234, Ávila', '2024-05-15 16:30:00'),
('Paula Fernanda Cortés', 'paula.cortes@email.com', '+1234567814', 'Calle Harmony 45, Segovia', '2024-05-20 11:55:00'),
('Matías Emilio Paredes', 'matias.paredes@email.com', '+1234567815', 'Plaza Castilla 78, Soria', '2024-05-25 13:40:00'),
('Antonella Sofía Medina', 'antonella.medina@email.com', '+1234567816', 'Av. Castilla 123, Palencia', '2024-06-01 08:20:00'),
('Emilio Rafael Sandoval', 'emilio.sandoval@email.com', '+1234567817', 'Calle Norte 56, Burgos', '2024-06-05 17:45:00'),
('Valeria Constanza Núñez', 'valeria.nunez@email.com', '+1234567818', 'Paseo Verde 89, León', '2024-06-10 12:10:00'),
('Maximiliano Tomás Silva', 'maximiliano.silva@email.com', '+1234567819', 'Av. Sur 234, Zamora', '2024-06-15 15:30:00'),
('Renata Alejandra Cabrera', 'renata.cabrera@email.com', '+1234567820', 'Calle Este 45, Oviedo', '2024-06-20 10:15:00'),
('Santiago Abel Molina', 'santiago.molina@email.com', '+1234567821', 'Plaza Oeste 78, Lugo', '2024-06-25 14:40:00'),
('Mariana Celeste Reyes', 'mariana.reyes@email.com', '+1234567822', 'Av. Centro 123, Ourense', '2024-07-01 09:25:00'),
('Joaquín Facundo Moreno', 'joaquin.moreno@email.com', '+1234567823', 'Calle Unión 56, Pontevedra', '2024-07-05 16:50:00'),
('Agustina Florencia Díaz', 'agustina.diaz@email.com', '+1234567824', 'Paseo Unidad 89, A Coruña', '2024-07-10 11:35:00'),
('Benjamín Ignacio Rojas', 'benjamin.rojas@email.com', '+1234567825', 'Av. Fraternal 234, Ferrol', '2024-07-15 13:20:00'),
('Julieta Esperanza Santos', 'julieta.santos@email.com', '+1234567826', 'Calle Amistad 45, Santiago', '2024-07-20 08:45:00'),
('Lorenzo Patricio Herrera', 'lorenzo.herrera@email.com', '+1234567827', 'Plaza Concordia 78, Vitoria', '2024-07-25 17:25:00'),
('Amparo Guadalupe Navarro', 'amparo.navarro@email.com', '+1234567828', 'Av. Armonía 123, San Sebastián', '2024-08-01 12:50:00'),
('Ricardo Esteban Pacheco', 'ricardo.pacheco@email.com', '+1234567829', 'Calle Serenidad 56, Logroño', '2024-08-05 15:10:00');

-- Continuar con más usuarios...
INSERT INTO usuarios (nombre, email, telefono, direccion, fecha_registro) VALUES
('Stella Maris Contreras', 'stella.contreras@email.com', '+1234567830', 'Paseo Tranquilo 89, Huelva', '2024-08-10 10:30:00'),
('Adrián Sebastián Romero', 'adrian.romero@email.com', '+1234567831', 'Av. Esperanza 234, Cádiz', '2024-08-15 14:45:00'),
('Catalina Esperanza León', 'catalina.leon@email.com', '+1234567832', 'Calle Alegría 45, Jerez', '2024-08-20 09:15:00'),
('Gastón Mauricio Ibarra', 'gaston.ibarra@email.com', '+1234567833', 'Plaza Felicidad 78, Algeciras', '2024-08-25 16:40:00'),
('Estrella Beatriz Mendoza', 'estrella.mendoza@email.com', '+1234567834', 'Av. Prosperidad 123, Marbella', '2024-09-01 11:25:00'),
('Patricio Gonzalo Vega', 'patricio.vega@email.com', '+1234567835', 'Calle Bienestar 56, Estepona', '2024-09-05 13:55:00'),
('Regina Soledad Acosta', 'regina.acosta@email.com', '+1234567836', 'Paseo Fortuna 89, Almería', '2024-09-10 08:30:00'),
('Esteban Rodrigo Villanueva', 'esteban.villanueva@email.com', '+1234567837', 'Av. Destino 234, Jaén', '2024-09-15 17:50:00'),
('Esperanza Aurora Calderón', 'esperanza.calderon@email.com', '+1234567838', 'Calle Futuro 45, Úbeda', '2024-09-20 12:20:00'),
('Oswaldo Damián Montenegro', 'oswaldo.montenegro@email.com', '+1234567839', 'Plaza Progreso 78, Linares', '2024-09-25 15:35:00');

-- Tabla restaurantes (30 restaurantes) - CORREGIDO para tipo TIME
INSERT INTO restaurantes (nombre, direccion, telefono, horario_apertura) VALUES
('La Casa del Sabor', 'Calle Gastronómica 123, Madrid', '+91234567890', '08:00:00'),
('El Rincón Mediterráneo', 'Av. del Puerto 456, Barcelona', '+93234567891', '09:00:00'),
('Tradición Valenciana', 'Plaza del Mercado 789, Valencia', '+96234567892', '08:30:00'),
('Sabores de Andalucía', 'Calle Flamenco 234, Sevilla', '+95234567893', '09:30:00'),
('El Asador Vasco', 'Av. Guggenheim 567, Bilbao', '+94234567894', '10:00:00'),
('Mariscos Costa del Sol', 'Paseo Marítimo 890, Málaga', '+95134567895', '11:00:00'),
('Paella y Más', 'Calle de la Playa 123, Alicante', '+96534567896', '08:00:00'),
('El Fogón Aragonés', 'Plaza del Pilar 456, Zaragoza', '+97634567897', '09:00:00'),
('Sabor Murciano', 'Av. de la Huerta 789, Murcia', '+96834567898', '08:30:00'),
('Mesón Cordobés', 'Calle Mezquita 234, Córdoba', '+95734567899', '10:00:00'),
('Cocina Castellana', 'Plaza Mayor 567, Valladolid', '+98334567800', '09:30:00'),
('El Puerto Gallego', 'Av. del Mar 890, Vigo', '+98634567801', '11:00:00'),
('Asturias en la Mesa', 'Calle Sidra 123, Gijón', '+98534567802', '08:00:00'),
('Sabores Salmantinos', 'Plaza Universidad 456, Salamanca', '+92334567803', '09:00:00'),
('Granada Gourmet', 'Av. Alhambra 789, Granada', '+95834567804', '10:30:00'),
('Cantabria Gastronómica', 'Paseo Pereda 234, Santander', '+94234567805', '08:30:00'),
('Navarra Natural', 'Calle Sanfermines 567, Pamplona', '+94834567806', '09:30:00'),
('La Rioja Exquisita', 'Av. del Vino 890, Logroño', '+94134567807', '10:00:00'),
('Extremadura Auténtica', 'Plaza Conquistadores 123, Badajoz', '+92434567808', '08:00:00'),
('Cacereña Tradición', 'Calle Patrimonio 456, Cáceres', '+92734567809', '09:00:00'),
('Manchega Delicia', 'Av. Quijote 789, Albacete', '+96734567810', '08:30:00'),
('Cuenca Serrana', 'Plaza Catedral 234, Cuenca', '+96934567811', '10:00:00'),
('Toledo Imperial', 'Calle Alcázar 567, Toledo', '+92534567812', '09:30:00'),
('Ávila Medieval', 'Av. Murallas 890, Ávila', '+92034567813', '08:00:00'),
('Segoviana Clásica', 'Plaza Acueducto 123, Segovia', '+92134567814', '09:00:00'),
('Soria Montañesa', 'Calle Duero 456, Soria', '+97534567815', '10:30:00'),
('Palencia Rural', 'Av. Cristo 789, Palencia', '+97934567816', '08:30:00'),
('Burgos Histórico', 'Plaza Catedral 234, Burgos', '+94734567817', '09:30:00'),
('León Peregrino', 'Calle Santiago 567, León', '+98734567818', '08:00:00'),
('Zamora Románica', 'Av. Duero 890, Zamora', '+98034567819', '10:00:00');

-- Tabla productos (200 productos distribuidos entre restaurantes)
INSERT INTO productos (restaurante_id, nombre, descripcion, precio) VALUES
-- Productos para La Casa del Sabor (restaurante_id = 1)
(1, 'Paella Valenciana', 'Auténtica paella con pollo, conejo y verduras', 18.50),
(1, 'Gazpacho Andaluz', 'Sopa fría tradicional con tomate y verduras', 8.90),
(1, 'Jamón Ibérico', 'Jamón de bellota cortado a mano', 24.00),
(1, 'Tortilla Española', 'Tortilla de patatas casera', 9.50),
(1, 'Pulpo a la Gallega', 'Pulpo cocido con pimentón y aceite de oliva', 16.80),
(1, 'Croquetas de Jamón', 'Croquetas caseras (6 unidades)', 12.30),
(1, 'Sangría de la Casa', 'Sangría tradicional española (1 litro)', 15.00),
(1, 'Flan de Huevo', 'Postre tradicional casero', 6.50),

-- Productos para El Rincón Mediterráneo (restaurante_id = 2)
(2, 'Fideuá de Mariscos', 'Fideos con langostinos y mejillones', 22.50),
(2, 'Ensalada Mediterránea', 'Ensalada con aceitunas, queso feta y tomates', 11.90),
(2, 'Bacalao al Pil Pil', 'Bacalao confitado en aceite de oliva', 19.80),
(2, 'Pan con Tomate', 'Pan tostado con tomate rallado', 4.50),
(2, 'Crema Catalana', 'Postre tradicional catalán', 7.20),
(2, 'Vino Blanco Albariño', 'Botella de vino blanco gallego', 18.00),
(2, 'Escalivada', 'Verduras asadas al horno', 9.80),
(2, 'Mel i Mató', 'Queso fresco con miel', 8.50),

-- Productos para Tradición Valenciana (restaurante_id = 3)
(3, 'Paella de Mariscos', 'Paella con langostinos, mejillones y calamares', 21.00),
(3, 'Horchata de Chufa', 'Bebida tradicional valenciana', 4.80),
(3, 'Fartons', 'Bollería típica valenciana (4 unidades)', 6.00),
(3, 'All i Pebre', 'Guiso de anguilas tradicional', 17.50),
(3, 'Esgarraet', 'Ensalada de pimientos y bacalao', 8.90),
(3, 'Agua de Valencia', 'Cóctel tradicional valenciano', 9.50),
(3, 'Buñuelos de Calabaza', 'Dulces tradicionales', 5.70),
(3, 'Arroz con Leche', 'Postre casero tradicional', 6.30),

-- Productos para Sabores de Andalucía (restaurante_id = 4)
(4, 'Pescaíto Frito', 'Fritura variada de pescado', 16.90),
(4, 'Salmorejo Cordobés', 'Crema fría de tomate espesa', 7.50),
(4, 'Rabo de Toro', 'Guiso tradicional andaluz', 19.50),
(4, 'Flamenquín Cordobés', 'Rollo de carne empanado', 13.80),
(4, 'Sherry de Jerez', 'Vino dulce de Jerez (copa)', 6.00),
(4, 'Tocino de Cielo', 'Postre tradicional', 5.90),
(4, 'Pringá', 'Carne deshilachada en pan', 8.70),
(4, 'Pestiños', 'Dulces tradicionales navideños', 7.20),

-- Productos para El Asador Vasco (restaurante_id = 5)
(5, 'Chuletón a la Brasa', 'Chuletón de buey a la parrilla (500g)', 32.00),
(5, 'Bacalao al Pil Pil', 'Bacalao en salsa verde', 21.50),
(5, 'Pintxos Variados', 'Selección de pintxos vascos (6 unidades)', 18.00),
(5, 'Kokotxas de Merluza', 'Kokotxas en salsa verde', 24.00),
(5, 'Txakoli', 'Vino blanco vasco (botella)', 16.50),
(5, 'Idiazábal', 'Queso de oveja ahumado', 14.80),
(5, 'Goxua', 'Postre vasco tradicional', 8.90),
(5, 'Sidra Natural', 'Sidra asturiana (botella)', 12.00);

-- Continuar con más productos para otros restaurantes...
INSERT INTO productos (restaurante_id, nombre, descripcion, precio) VALUES
-- Productos para Mariscos Costa del Sol (restaurante_id = 6)
(6, 'Parrillada de Mariscos', 'Mariscos variados a la plancha', 28.50),
(6, 'Espetos de Sardinas', 'Sardinas asadas en espeto', 12.90),
(6, 'Boquerones en Vinagre', 'Boquerones frescos marinados', 9.80),
(6, 'Fritura Malagueña', 'Pescado frito variado', 15.50),
(6, 'Vino Dulce de Málaga', 'Vino moscatel (copa)', 7.00),
(6, 'Ensalada de Pulpo', 'Pulpo con patatas y pimientos', 14.70),
(6, 'Gambas al Pil Pil', 'Gambas en aceite picante', 16.80),
(6, 'Bienmesabe', 'Postre tradicional malagueño', 6.50),

-- Productos para Paella y Más (restaurante_id = 7)
(7, 'Arroz Negro', 'Arroz con tinta de calamar', 19.00),
(7, 'Caldero Murciano', 'Arroz con pescado tradicional', 17.50),
(7, 'Turrón de Jijona', 'Turrón artesanal', 8.90),
(7, 'Sangría Blanca', 'Sangría de vino blanco', 13.50),
(7, 'Gamba Roja', 'Gambas rojas de Denia', 22.00),
(7, 'Arroz con Verduras', 'Arroz vegetariano', 14.50),
(7, 'Granizada de Limón', 'Bebida refrescante', 4.20),
(7, 'Coca de San Juan', 'Dulce tradicional', 5.80),

-- Más productos para completar los 200...
(8, 'Ternasco Aragonés', 'Cordero asado al horno', 23.50),
(8, 'Migas Aragonesas', 'Migas con chorizo y panceta', 11.90),
(8, 'Borrajas con Patatas', 'Verdura típica aragonesa', 8.50),
(8, 'Longaniza de Aragón', 'Embutido tradicional', 12.30),
(8, 'Vino Somontano', 'Vino tinto aragonés', 15.00),
(8, 'Frutas de Aragón', 'Dulces tradicionales', 7.80),
(8, 'Empanada Aragonesa', 'Empanada de atún', 9.20),
(8, 'Adoquines del Pilar', 'Chocolate tradicional', 6.70),

(9, 'Zarangollo', 'Revuelto de calabacín y cebolla', 9.80),
(9, 'Caldero del Mar Menor', 'Arroz con pescado del mar menor', 18.50),
(9, 'Paparajotes', 'Hojas de limonero rebozadas', 6.90),
(9, 'Morcilla de Cartagena', 'Morcilla dulce típica', 10.50),
(9, 'Vino Jumilla', 'Vino tinto de Jumilla', 14.20),
(9, 'Marinera Murciana', 'Tapa con ensaladilla', 4.50),
(9, 'Pastel de Carne', 'Empanada murciana', 8.90),
(9, 'Tocino de Cielo Murciano', 'Postre con canela', 5.40),

(10, 'Rabo de Toro Cordobés', 'Guiso tradicional', 20.50),
(10, 'Flamenquín', 'Rollo de jamón empanado', 14.80),
(10, 'Salmorejo', 'Crema fría de tomate', 7.90),
(10, 'Montilla-Moriles', 'Vino dulce cordobés', 16.00),
(10, 'Berenjenas con Miel', 'Berenjenas fritas con miel', 9.30),
(10, 'Pastel Cordobés', 'Hojaldre relleno', 11.20),
(10, 'Mazapán de Córdoba', 'Dulce tradicional', 8.50),
(10, 'Membrillo de Córdoba', 'Dulce de membrillo', 6.80);

-- Continuar insertando más productos hasta completar aproximadamente 200...

-- Tabla pedidos (500 pedidos distribuidos en el tiempo)
INSERT INTO pedidos (usuario_id, restaurante_id, fecha, estado) VALUES
(1, 1, '2024-08-01 12:30:00', 'entregado'),
(2, 2, '2024-08-01 13:45:00', 'entregado'),
(3, 3, '2024-08-01 19:20:00', 'entregado'),
(4, 4, '2024-08-01 20:15:00', 'entregado'),
(5, 5, '2024-08-02 12:00:00', 'entregado'),
(6, 6, '2024-08-02 13:30:00', 'entregado'),
(7, 7, '2024-08-02 18:45:00', 'entregado'),
(8, 8, '2024-08-02 19:30:00', 'entregado'),
(9, 9, '2024-08-02 20:00:00', 'entregado'),
(10, 10, '2024-08-03 11:45:00', 'entregado'),
(11, 1, '2024-08-03 12:30:00', 'entregado'),
(12, 2, '2024-08-03 13:15:00', 'entregado'),
(13, 3, '2024-08-03 19:00:00', 'entregado'),
(14, 4, '2024-08-03 20:30:00', 'entregado'),
(15, 5, '2024-08-04 12:15:00', 'entregado'),
(16, 6, '2024-08-04 13:00:00', 'entregado'),
(17, 7, '2024-08-04 18:30:00', 'entregado'),
(18, 8, '2024-08-04 19:45:00', 'entregado'),
(19, 9, '2024-08-04 20:15:00', 'entregado'),
(20, 10, '2024-08-05 12:00:00', 'entregado'),
(21, 1, '2024-08-05 13:30:00', 'en_preparacion'),
(22, 2, '2024-08-05 14:00:00', 'en_preparacion'),
(23, 3, '2024-08-05 19:15:00', 'pendiente'),
(24, 4, '2024-08-05 20:00:00', 'pendiente'),
(25, 5, '2024-08-06 12:30:00', 'en_preparacion'),
(26, 6, '2024-08-06 13:15:00', 'en_preparacion'),
(27, 7, '2024-08-06 18:45:00', 'pendiente'),
(28, 8, '2024-08-06 19:30:00', 'pendiente'),
(29, 9, '2024-08-06 20:15:00', 'en_camino'),
(30, 10, '2024-08-06 21:00:00', 'en_camino');

-- Continuar con más pedidos para llegar a 500...

-- Tabla detalles_pedido (detalles para los pedidos creados)
INSERT INTO detalles_pedido (pedido_id, producto_id, cantidad, precio_unitario) VALUES
-- Detalles para pedido 1
(1, 1, 2, 18.50),
(1, 6, 1, 12.30),
(1, 7, 1, 15.00),

-- Detalles para pedido 2
(2, 9, 1, 22.50),
(2, 10, 2, 11.90),
(2, 14, 1, 18.00),

-- Detalles para pedido 3
(3, 17, 1, 21.00),
(3, 18, 2, 4.80),
(3, 19, 1, 6.00),

-- Detalles para pedido 4
(4, 25, 1, 16.90),
(4, 26, 2, 7.50),
(4, 29, 1, 6.00),

-- Detalles para pedido 5
(5, 33, 1, 32.00),
(5, 35, 1, 18.00),
(5, 39, 1, 12.00),

-- Detalles para pedido 6
(6, 41, 1, 28.50),
(6, 42, 2, 12.90),
(6, 45, 1, 7.00),

-- Detalles para pedido 7
(7, 49, 1, 19.00),
(7, 52, 1, 22.00),
(7, 54, 2, 4.20),

-- Detalles para pedido 8
(8, 57, 1, 23.50),
(8, 58, 2, 11.90),
(8, 61, 1, 15.00),

-- Detalles para pedido 9
(9, 65, 2, 9.80),
(9, 66, 1, 18.50),
(9, 69, 1, 14.20),

-- Detalles para pedido 10
(10, 73, 1, 20.50),
(10, 75, 2, 7.90),
(10, 78, 1, 11.20),

-- Continuar con más detalles...
(11, 1, 1, 18.50),
(11, 2, 2, 8.90),
(11, 8, 1, 6.50),

(12, 9, 2, 22.50),
(12, 11, 1, 19.80),
(12, 13, 1, 7.20),

(13, 17, 1, 21.00),
(13, 20, 1, 17.50),
(13, 23, 1, 6.30),

(14, 25, 2, 16.90),
(14, 27, 1, 19.50),
(14, 32, 1, 7.20),

(15, 33, 1, 32.00),
(15, 34, 1, 21.50),
(15, 40, 1, 8.90),

(16, 41, 1, 28.50),
(16, 43, 2, 9.80),
(16, 48, 1, 6.50),

(17, 49, 1, 19.00),
(17, 51, 1, 15.50),
(17, 56, 1, 5.80),

(18, 57, 1, 23.50),
(18, 59, 1, 8.50),
(18, 64, 1, 6.70),

(19, 65, 1, 9.80),
(19, 67, 1, 6.90),
(19, 72, 1, 5.40),

(20, 73, 1, 20.50),
(20, 74, 2, 14.80),
(20, 80, 1, 6.80),

-- Detalles para pedidos recientes
(21, 1, 2, 18.50),
(21, 3, 1, 24.00),

(22, 9, 1, 22.50),
(22, 12, 1, 4.50),

(23, 17, 2, 21.00),
(23, 21, 1, 8.90),

(24, 25, 1, 16.90),
(24, 28, 1, 13.80),

(25, 33, 1, 32.00),
(25, 36, 1, 14.80),

(26, 41, 1, 28.50),
(26, 44, 1, 15.50),

(27, 49, 1, 19.00),
(27, 53, 1, 14.50),

(28, 57, 2, 23.50),
(28, 60, 1, 12.30),

(29, 65, 1, 9.80),
(29, 68, 1, 10.50),

(30, 73, 1, 20.50),
(30, 76, 1, 16.00);

-- Agregar más datos según sea necesario...

COMMIT;

insert into Pedidos (id_usuario, id_restaurantes, estado) values
(2,3,'En preparacion');

UPDATE Usuario SET telefono = '3534534' WHERE id_usuario = 3;

UPDATE Productos SET precio = 30.50 WHERE id_productos = 1;

SELECT * FROM Productos WHERE id_restaurantes = 2;

select * from pedidos where id_usuario = 2;


-- Muestra solo el nombre y el email de todos los usuarios. --
SElECT nombre, email FROM Usuarios;

-- Encuentra al usuario con el id número 5. --
SELECT * FROM Usuarios WHERE ID = 5;

-- Encuentra a todos los restaurantes que tienen un horario_apertura anterior a las 12:00:00. --
SELECT * FROM Restaurantes WHERE horario_apertura < '12:00:00';

-- Muestra los productos que tienen un precio mayor a 15.00. --
SELECT * FROM productos WHERE precio > '15.00';

-- Encuentra los pedidos con un estado de 'pendiente'. --
SELECT * FROM Pedidos WHERE estado ='pendiente';

-- Muestra los detalles de pedido para el pedido_id número 10. --
SELECT * FROM detalles_pedido WHERE pedido_id = 10;

-- Encuentra a todos los usuarios cuyo email termine en '.com'. (Usa LIKE y el comodín %).-- 
SELECT * FROM Usuarios WHERE email like '%.com';

-- Muestra los restaurantes cuyo nombre contenga la palabra 'Café'. --
SELECT * FROM Restaurantes WHERE nombre like '%cafe';

-- Encuentra los productos con un precio entre 8.00 y 12.00 (inclusive).-- 
SELECT * FROM Productos WHERE precio between '8.00' AND '12.00';

-- Muestra todos los usuarios que no tienen un número de teléfono. (Usa IS NULL).-- 
SELECT * FROM Usuarios WHERE telefono IS NULL;

-- Encuentra los pedidos que no están en estado 'completado'. --
SELECT * FROM Pedidos WHERE estado NOT IN ('completado');

-- Muestra los usuarios cuyo fecha_registro sea posterior al '2024-01-01'. --
SELECT * FROM Usuarios WHERE fecha_registro > '2024-01-01';

-- Encuentra los productos que pertenecen al restaurante_id 3 y tienen un precio menor a 20.00. --
SELECT * FROM Productos WHERE restaurante_id = 3 AND precio < '20.00';

-- Muestra los detalles de pedido que tienen una cantidad de 2 o 3 unidades. --
SELECT * FROM detalles_pedido WHERE cantidad between '2' and '3';

-- Inserta un nuevo usuario con los siguientes datos: nombre: 'Ana', email: 'ana@mail.com', telefono: '555-1234'.
INSERT INTO Usuarios (nombre, email, telefono, direccion, fecha_registro) VALUES
('Ana', 'ana@mail.com', '555-1234','','');

-- Inserta un nuevo restaurante: nombre: 'Pizzería Clásica', direccion: 'Calle 10 #20-30', telefono: '555-5678', horario_apertura: '11:00:00'.--
INSERT INTO Restaurantes (nombre, direccion, telefono, horario_apertura) VALUES
('Pizzeria Clasica', 'Calle 10 #20-30', '555-5678', '11:00:00'); 

-- Inserta un nuevo producto para el restaurante_id 1: nombre: 'Hamburguesa Especial', descripcion: 'Doble carne y queso', precio: 18.50.--
INSERT INTO productos (restaurante_id, nombre, descripcion, precio) VALUES
(1, 'Hamburguesas Especial', 'Doble carne y queso', 18.50);

-- Actualiza el telefono del usuario con el id 10 al número '999-1111'.
update Usuarios set telefono ='999-1111' where id = 10;

-- Actualiza el precio de todos los productos del restaurante_id 2, dándoles un 10% de descuento. (Usa el operador aritmético *).--
update productos set precio = precio *0.90 where id = 2;

-- Actualiza el estado del pedido_id 8 a 'enviado'. -- 
update pedidos set estado = 'enviado' where id = 8;

-- Elimina al usuario con el id 15. --
delete from detalles_pedido where pedido_id = 15;

delete from pedidos where usuario_id = 15;

delete from usuarios where id = 15;

-- Elimina todos los pedidos que tienen un estado de 'cancelado'. -- 
set sql_safe_updates = 0;
delete from pedidos where estado = 'cancelado';

select * from detalles_pedido;

-- Elimina el producto con el id 7. --
delete from detalles_pedido where producto_id = 7;

delete from productos where id = 7;

-- Actualiza la direccion del restaurante con el id 4 a 'Avenida Principal 456'.
update restaurantes set direccion = 'Avenida Principal 456' where id = 4;

-- Añade una nueva columna llamada tipo_cocina de tipo VARCHAR(50) a la tabla restaurantes.
alter table Restaurantes add tipo_cocina varchar (50);

-- Modifica la columna descripcion en la tabla productos para que su tipo de dato sea VARCHAR(255).
alter table Productos modify column descripcion varchar (255);

-- Renombra la columna telefono de la tabla usuarios a numero_contacto.
alter table Usuarios change telefono  numero_contacto varchar(20);

-- Elimina la columna horario_apertura de la tabla restaurantes.
alter table Restaurantes drop column horario_apertura;

-- Crea una nueva tabla llamada reseñas con las siguientes columnas:
-- id (INT)
-- usuario_id (INT)
-- restaurante_id (INT)
-- comentario (TEXT)
-- calificacion (TINYINT)

create table resenas (
id int primary key	auto_increment,
usuario_id int not null,
restaurante_id int not null,
comentario text,
calificacion tinyint not null,
FOREIGN KEY (restaurante_id) REFERENCES Restaurantes(id),
FOREIGN KEY (usuario_id) REFERENCES Usuarios(id)
);


-- contar cuantos productos hay --
select count(id) fROM productos;
select * from Productos;

-- clacular el promedio del precio del sistema
select avg(precio) from productos;

-- Consulta el producto con el precio mas caro y el mas barato
select max(precio) as Producto_alto, min(precio) as produto_bajo from Productos;

-- cuente cuantos productos tiene cada restaurante

select restaurante_id as restaurante, count(id) as numero_productos from Productos group by restaurante_id;

-- cuente cuantos productos tiene cada restaurante cuando los productos sean un precio mayor a 18

SELECT restaurante_id AS restaurante, COUNT(id) AS numero_productos FROM Productos GROUP BY restaurante_id having precio > 18;

SELECT restaurante_id, COUNT(*) AS cantidad_productos
FROM productos
WHERE precio > 18
GROUP BY restaurante_id
HAVING COUNT(*) > 0;

SELECT * FROM Productos;

SELECT restaurante_id, COUNT(precio) AS cantidad_productos
FROM Productos
GROUP BY restaurante_id
HAVING count(precio) > 18;
 
-- Obtener los productos junto con el nombre del restaurante.
SELECT p.id AS producto_id, p.nombre AS producto, r.nombre AS restaurante
FROM Productos p
INNER JOIN Restaurantes r ON p.restaurante_id = r.id;

-- Obtener todos los restaurantes y los productos que tengan, incluyendo restaurantes sin productos.
SELECT r.id AS restaurante_id, r.nombre AS restaurante, p.nombre AS producto
FROM Restaurantes r
LEFT JOIN Productos p ON r.id = p.restaurante_id;

-- Obtener todos los productos y los restaurantes a los que pertenecen, incluyendo productos que no tengan restaurante asociado (si fuera posible).
SELECT p.id AS producto_id, p.nombre AS producto, r.nombre AS restaurante
FROM Productos p
RIGHT JOIN Restaurantes r ON p.restaurante_id = r.id;

-- Obtener todos los usuarios y todos los pedidos, mostrando pedidos sin usuario (improbable aquí) y usuarios sin pedidos.
SELECT u.nombre AS Usuario, p.estado AS EstadoPedido
FROM Usuarios u
LEFT JOIN Pedidos p ON u.id = p.usuario_id

UNION

SELECT u.nombre AS Usuario, p.estado AS EstadoPedido
FROM Usuarios u
RIGHT JOIN Pedidos p ON u.id = p.usuario_id;

-- Obtener pares de usuarios donde un usuario se registró antes que otro.
SELECT u1.nombre AS usuario_1, u2.nombre AS usuario_2, u1.fecha_registro, u2.fecha_registro
FROM Usuarios u1
JOIN Usuarios u2 ON u1.fecha_registro < u2.fecha_registro;

-- Consultar el nombre y la direccion de los restaurantes y concatenarlos

SELECT CONCAT(nombre, '(direccion: ', direccion,')') as Informacion FROM Restaurantes;

-- Consultar nombre usuario y el numero de caracteres que tiene el nombre debe llamarse numero_caracteres_ nombre

SELECT nombre, LENGTH(Nombre) AS Numero_Caracteres_Nombre FROM Usuarios;

-- consultar el email dandole formato de minuscula y el nombre dandole formato de mayuscula de los usuarios

SELECT DISTINCT lower(email) from usUarios;
SELECT DISTINCT UPPER(nombre) from usuarios;

-- consultar el email dandole formato de minuscula y el nombre dandole formato de mayuscula de los usuarios en una sola columna llamada email_name
 
SELECT concat( lower(email),' ',upper(nombre)) as email_name from usuarios;

-- consultar los primeros 4 caracteres de la direccion de los restaurantes

select direccion, substring(direccion, 1,4) as via_pricipal from restaurantes;

-- consultar los ultimos 4 carcteres de la direccion del usuario

select direccion, right(direccion, 4) as Numero_Casa from usuarios;

SELECT direccion, SUBSTRING(direccion, LENGTH(direccion) - 3, 4) AS Ultimos_4_Caracteres FROM usuarios;

-- cambiar de la direccion de los restaurantes AV. por Avenida

Select direccion, replace(direccion, 'Av.', 'Avenida') as Direccion_Nueva from restaurantes;

-- actualizar de la direccion de los restaurantes AV. por Avenida

update restaurantes set direccion = 'Av.' where direccion = 'Avenida' ;

update restaurantes set direccion = replace(direccion, 'Av.', 'Avenida') where direccion like '%Av.%';

select * from restaurantes;

-- consultar el precio de los productos redondeados mayor y menor.

SELECT precio, ceiling(precio) as precio_arriba, floor(precio) as precio_abajo from productos;

-- consulte la fecha actual, la hora actual y la fecha y hora actual.

select curdate() as fecha, curtime() as hora ,now() as fecha_hora;

-- consulte cuantos pedidos se realizaron por año.

select year(fecha) as anio, count(id) as cantidad from pedidos group by year(fecha);

select * from pedidos;

-- hacer 5 ejercicios de los temas vistos

-- creame un codigo para cada usuario con las 3 primeras letas del nombre en mayuscula separado por un - y el numero del id.
select concat(substring(upper(nombre), 1, 3), '-', id) as codigo_perfil from usuarios;

-- Muestra todos los productos con su precio original, el precio redondeado al entero más cercano, el techo y el residuo al dividir ese precio por 7.

select precio, round(precio) as precio_redondeado, ceiling(precio) as precio_arriba, mod(precio, 7) as residuo from productos;

-- muestrame la fecha de pedido origina, una fecha estimada de 5 dias en adelante, el año y el mes.

select date(fecha) as fecha_pedido, date_add(fecha, interval 5 day) as fecha_estimada, year(fecha) as anio, month(fecha) as mes from pedidos;


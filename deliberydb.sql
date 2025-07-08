create database delibery_db;
use delibery_db;
create table Usuario(
id_usuario int primary key auto_increment,
nombre varchar(100) not null,
email varchar(100) unique not null,
telefono varchar(20),
direccion varchar(55) not null
);
create table Restaurantes(
id_restaurantes int primary key auto_increment,
nombre varchar(100) not null,
direccion varchar(255) not null unique,
telefono varchar(20) not null
);
create table Productos(
id_productos int primary key auto_increment,
nombre varchar(100) not null,
descripcion text,
precio decimal(10,2) not null,
id_restaurantes int not null,
foreign key (id_restaurantes) references Restaurantes (id_restaurantes)
);
create table Pedidos(
id_pedidos int primary key auto_increment,
id_usuario int not null,
id_restaurantes int not null,
fecha timestamp default current_timestamp,
estado varchar(50) default 'pendiente', -- ej: pendiente, en camino, entregado, cancelado
foreign key (id_usuario) references Usuario(id_usuario),
foreign key (id_restaurantes) references Restaurantes(id_restaurantes)
);
create table Detalles_pedido (
id int primary key auto_increment,
id_pedidos int not null,
id_productos int not null,
cantidad int not null,
precio_unitario decimal(10,2) not null,
foreign key (id_pedidos) references Pedidos(id_pedidos),
foreign key (id_productos) references Productos(id_productos)
);
insert into Restaurantes (nombre, direccion, telefono) values
('Pizza Paraiso', 'Calle Falsa 123, Ciudad Capital', '555-0101'),
('Suchi Express', ' Avenida Siempre Viva 456, Villa sabor', '555-0102'),
('Taco Fiesta', 'Plaza Central 789, Pueblo Delicia', '555-0103');

select * from Restaurantes;

insert into Usuario (nombre, email, telefono, direccion) values
('Ana Torres', 'ana.t@email.com', '310-1234567', 'Carrera 5 # 4-56,Apartamento 101'),
('Carlos Ruiz', 'carlos.r@email.com', '311-9876543', 'Avenida del rio # 89-12'),
('Lucia Fernandez', 'lucia.f@email.com', '312-5558899', 'calle 100 # 15-20'),
('Javier Moreno', ' javier.m@email.com', '313-2223344', 'transversal 1 # 23-45'),
('Sofia Castro', 'sofia.c@email.com', '314-7776655', 'Avenida del parque  67-89');

insert into Productos (id_restaurantes, nombre, descripcion, precio) values
(1,'Pizza Hawaiana', 'Pizza con piña, jamon y queso mozzarela.', 22.50),
(1,'Pizza Pepperoni', 'Clasica pizza de pepperoni con extra queso.', 22.00),
(1,'Lasaña de Carne', 'Capas de pasta con salsa boloñesa y bechamel.', 28.00);

insert into Productos (id_restaurantes, nombre, descripcion, precio) values
(2,'Rollo California', 'Rollo de cangrejo, aguacate y pepino', 18.00),
(2,'Nigiri de salmon', 'Finas lonjas de salmon sobre arroz de sushi.', 15.50),
(2,'Yakimeshi Mixto', 'Arroz frito con verduras, pollo y camaron.', 21.00);

insert into Productos (id_restaurantes, nombre, descripcion, precio) values
(3,'Tacos al Pastor', 'Tres tacos de cerdo marinado con piña', 16.00),
(3,'Quesadilla de Champiñones', 'Tortilla de harina con queso y champiñones.', 14.00),
(3,'Burrito de Carne Asada', 'Gran burrito con carne, frijoles y arroz.', 20.50);

insert into Pedidos (id_usuario, id_restaurantes, estado) values
(2,3,'En preparacion');

UPDATE Usuario SET telefono = '3534534' WHERE id_usuario = 3;

UPDATE Productos SET precio = 30.50 WHERE id_productos = 1;

SELECT * FROM Productos WHERE id_restaurantes = 2;

select * from pedidos where id_usuario = 2;

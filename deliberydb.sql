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
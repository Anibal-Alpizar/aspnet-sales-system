create database DBCARRITO
go

use DBCARRITO
go

CREATE TABLE CATEGORIA(
IdCategoria INT PRIMARY KEY IDENTITY,
Descripcion VARCHAR(100),
Activo BIT DEFAULT 1,
FechaRegistro DATETIME DEFAULT GETDATE()
)
go

CREATE TABLE MARCA(
IdMarca INT PRIMARY KEY IDENTITY,
Descripcion VARCHAR(100),
Activo BIT DEFAULT 1,
FechaRegistro DATETIME DEFAULT GETDATE()
)
go

CREATE TABLE PRODUCTO(
IdProducto INT PRIMARY KEY IDENTITY,
Nombre VARCHAR(500),
Descripcion VARCHAR(500),
IdMarca INT references MARCA(IdMarca),
IdCategoria INT references CATEGORIA(IdCategoria),
Precio DECIMAL(10,2) DEFAULT 0,
Stock INT,
RutaImagen VARCHAR(100),
NombreImagen VARCHAR(100),
Activo BIT DEFAULT 1,
FechaRegistro DATETIME DEFAULT GETDATE()
)
go

CREATE TABLE CLIENTE(
IdCliente INT PRIMARY KEY IDENTITY,
Nombres VARCHAR(100),
Apellidos VARCHAR(100),
Correo VARCHAR(100),
Clave VARCHAR(150),
Reestablecer BIT DEFAULT 0,
FechaRegistro DATETIME DEFAULT GETDATE()
)
go

CREATE TABLE CARRITO(
IdCarrito INT PRIMARY KEY IDENTITY,
IdCliente INT references CLIENTE(IdCliente),
IdProducto INT references PRODUCTO(IdProducto),
Cantidad INT,
)
go

CREATE TABLE VENTA(
IdVenta INT PRIMARY KEY IDENTITY,
IdCliente INT references CLIENTE(IdCliente),
TotalProducto int,
MontoTotal DECIMAL(10,2),
Contacto VARCHAR(50),
IdDistrito varchar(10),
Telefono VARCHAR(50),
Direccion VARCHAR(500),
IdTransaccion VARCHAR(50),
FechaVenta DATETIME DEFAULT GETDATE()
)
go

CREATE TABLE DETALLE_VENTA(
IdDetalleVenta INT PRIMARY KEY IDENTITY,
IdVenta INT references VENTA(IdVenta),
IdProducto INT references PRODUCTO(IdProducto),
Cantidad INT,
Total DECIMAL(10,2)
)
go

CREATE TABLE USUARIO(
IdUsuario INT PRIMARY KEY IDENTITY,
Nombres VARCHAR(100),
Apellidos VARCHAR(100),
Correo VARCHAR(100),
Clave VARCHAR(150),
Reestablecer BIT DEFAULT 1,
Activo BIT DEFAULT 1,
FechaRegistro DATETIME DEFAULT GETDATE()
)
go

CREATE TABLE DEPARTAMENTO(
IdDepartamento VARCHAR(2) NOT NULL,
Descripcion VARCHAR(45) NOT NULL,
)
go

CREATE TABLE PROVINCIA(
IdProvincia VARCHAR(4) NOT NULL,
Descripcion VARCHAR(45) NOT NULL,
IdDepartamento VARCHAR(2) NOT NULL,
)
go

CREATE TABLE DISTRITO(
IdDistrito VARCHAR(6) NOT NULL,
Descripcion VARCHAR(45) NOT NULL,
IdProvincia VARCHAR(4) NOT NULL,
IdDepartamento VARCHAR(2) NOT NULL,
)
go

insert into USUARIO(Nombres,Apellidos,Correo,Clave) values ('test nombre','test apellido','test@example.com','ecd71870d1963316a97e3ac3408c9835ad8cf0f3c1bc703527c30265534f75ae')

 go

 insert into CATEGORIA(Descripcion) values 
 ('Tecnologia'),
 ('Muebles'),
 ('Dormitorio'),
  ('Deportes')


go

  insert into MARCA(Descripcion) values
('SONYTE'),
('HPTE'),
('LGTE'),
('HYUNDAITE'),
('CANONTE'),
('ROBERTA ALLENTE')


go


insert into DEPARTAMENTO(IdDepartamento,Descripcion)
values 
('01','Arequipa'),
('02','Ica'),
('03','Lima')


go

insert into PROVINCIA(IdProvincia,Descripcion,IdDepartamento)
values
('0101','Arequipa','01'),
('0102','Caman�','01'),

--ICA - PROVINCIAS
('0201', 'Ica ', '02'),
('0202', 'Chincha ', '02'),

--LIMA - PROVINCIAS
('0301', 'Lima ', '03'),
('0302', 'Barranca ', '03')


go

insert into DISTRITO(IdDistrito,Descripcion,IdProvincia,IdDepartamento) values 
('010101','Nieva','0101','01'),
('010102', 'El Cenepa', '0101', '01'),

('010201', 'Caman�', '0102', '01'),
('010202', 'Jos� Mar�a Quimper', '0102', '01'),

--ICA - DISTRITO
('020101', 'Ica', '0201', '02'),
('020102', 'La Tingui�a', '0201', '02'),
('020201', 'Chincha Alta', '0202', '02'),
('020202', 'Alto Laran', '0202', '02'),


--LIMA - DISTRITO
('030101', 'Lima', '0301', '03'),
('030102', 'Anc�n', '0301', '03'),
('030201', 'Barranca', '0302', '03'),
('030202', 'Paramonga', '0302', '03')




--
--
-- CREACION DE LA BASE DE DATOS DE VETERINARIA
--
CREATE DATABASE BDVETERINARIA
GO
--
--
-- USANDO LA BASE DE DATOS VETERINARIA
--
USE BDVETERINARIA
GO
--
--
--
-- CREACION DE TABLAS GENERALES
--
create table tb_tipoDocumento --
(
IDTipoDocumento char(5) primary key,
Descripcion		varchar(200) not null
)
go
--
create table tb_tipoMascota --
(
IDTipoMascota	char(5) primary key,
Descripcion		varchar(200) not null
)
go
--
create table tb_producto --
(
IDProducto		char(5) primary key,
Descripcion		varchar(200) not null,
Costo			decimal(6,2) not null,
Precio			decimal(6,2) not null,
Inventario		int  not null
)
go
--
--
-- CREACION DE TABLAS ESPECIFICAS
--
create table tb_proveedor --
(
IDProveedor		char(5) primary key,
Nombres			varchar(100) not null,
Apellidos		varchar(100) not null,
TelefonoFijo	char(7) not null,
TelefonoMovil	char(9) not null,
Direccion		varchar(100) not null,
Correo			varchar(100) not null,
Documento		varchar(100) not null,
-- llave foranea
IDTipoDocumento char(5) foreign key references tb_tipoDocumento(IDTipoDocumento) not null,
--
Estado			varchar(100) not null
)
go
--
create table tb_cliente --
(
IDCliente		char(5) primary key,
Nombres			varchar(100) not null,
Apellidos		varchar(100) not null,
TelefonoFijo	char(7) not null,
TelefonoMovil	char(9) not null,
Direccion		varchar(100) not null,
Correo			varchar(100) not null,
Documento		varchar(100) not null,
-- llave foranea
IDTipoDocumento char(5) foreign key references tb_tipoDocumento(IDTipoDocumento) not null,
--
Estado			varchar(100) not null
)
go
--
create table tb_mascota --
(
IDMascota		char(5) primary key,
IDCliente		char(5) foreign key references tb_cliente(IDCliente) not null,
Nombre			varchar(100) not null,
FechaNacimiento date not null,
Raza			varchar(100) not null,
Observaciones	varchar(100) not null,
IDTipoMascota   char(5) foreign key references tb_tipoMascota(IDTipoMascota) not null,
Estado			varchar(100) not null
)
go
--
create table tb_vacunacion --
(
IDVacunacion	char(5) primary key,
IDMascota		char(5) foreign key references tb_mascota(IDMascota) not null,
FechaProgramada date not null,
Vacuna			varchar(100) not null,
FechaAplicada	date not null
)
go
--
create table tb_consulta --
(
IDConsulta		char(5) primary key,
IDMascota		char(5) foreign key references tb_mascota(IDMascota) not null,
Fecha			date not null,
Sintomas		varchar(400) not null,
Diagnostico		varchar(400) not null
)
go
--
create table tb_reserva --
(
IDReserva		char(5) primary key,
IDCliente		char(5) foreign key references tb_cliente(IDCliente) not null,
IDMascota		char(5) foreign key references tb_mascota(IDMascota) not null,
Fecha			datetime unique not null,
Descripcion		varchar(400) not null,
Estado			varchar(80) not null
)
go
--
create table tb_compra --
(
IDCompra		char(5) primary key,
IDProveedor		char(5) foreign key references tb_proveedor(IDProveedor) not null,
Fecha			date not null
)
go
--
create table tb_compraDetalle --
(
IDCompraDetalle	char(5) primary key,
IDProducto		char(5) foreign key references tb_producto(IDProducto) not null,
IDCompra		char(5) foreign key references tb_compra(IDCompra) not null,
Descripcion		varchar(400) not null,
Cantidad		int not null,
Costo			decimal(6,2) not null,
Total			as (Cantidad*Costo)
)
go
--
create table tb_venta --
(
IDVenta			char(5) primary key,
IDCliente		char(5) foreign key references tb_cliente(IDCliente) not null,
Fecha			date not null
)
go
--
create table tb_ventaDetalle --
(
IDVentaDetalle	char(5) primary key,
IDVenta			char(5) foreign key references tb_venta(IDVenta) not null,
IDProducto		char(5) foreign key references tb_producto(IDProducto) not null,
Descripcion		varchar(400) not null,
Cantidad		int not null,
Costo			decimal(6,2) not null,
Total			as (Cantidad*Costo)
)
go





















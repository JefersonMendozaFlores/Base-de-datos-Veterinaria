
-- USANDO LA BASE DE DATOS BDVETERINARIA
--
use BDVETERINARIA
go
--
-- CREACION DE PROCEDURES
--

-- 
--
create or alter procedure usp_insertar_tipoDocumento
@IDTipoDocumento char(5),
@Descripcion varchar(200)
as
begin
if not exists(select * from tb_tipoDocumento where IDTipoDocumento=@IDTipoDocumento)
insert into tb_tipoDocumento
values (@IDTipoDocumento,@Descripcion)
else 
raiserror('EL CODIGO DEL TIPO DE DOCUMENTO INGRESADO YA EXISTE',6,1)
end
go
--

--
create or alter procedure usp_insertar_tipoMascota
@IDTipoMascota char(5),
@Descripcion	varchar(200)
as
begin
if not exists(select * from tb_tipoMascota where IDTipoMascota=@IDTipoMascota)
insert into tb_tipoMascota
values (@IDTipoMascota,@Descripcion)
else 
raiserror('EL CODIGO DEL TIPO DE MOSCOTA INGRESADO YA EXISTE',6,1)
end
go
--

--
--
create or alter procedure usp_insertar_producto
@IDProducto char(5),
@Descripcion varchar(200),
@Costo decimal(6,2),
@Precio decimal(6,2),
@Inventario int
as
begin
if not exists(select * from tb_producto where IDProducto=@IDProducto)
print('EL CODIGO DEL PRODUCTO ESTA CORRECTO')
else 
raiserror('EL CODIGO DEL PRODUCTO INGRESADO YA EXISTE',6,1)
if not exists(select * from tb_producto where Descripcion=@Descripcion)
insert into tb_producto
values (@IDProducto,@Descripcion,@Costo,@Precio,@Inventario)
else 
raiserror('LA DESCRIPCION DEL PRODUCTO INGRESADO YA EXISTE',6,1)
end
go
--

--
--
create or alter procedure usp_insertar_proveedor
@IDProveedor	 char(5),
@Nombres		 varchar(100),
@Apellidos		 varchar(100),
@TelefonoFijo  	 char(7),
@TelefonoMovil	 char(9),
@Direccion		 varchar(100),
@Correo			 varchar(100),
@Documento		 varchar(100),
@IDTipoDocumento char(5),
@Estado			 varchar(100)
as
begin
if not exists(select * from tb_proveedor where IDProveedor=@IDProveedor)
print('EL CODIGO DEL PROVEEDOR ESTA CORRECTO')
else 
raiserror('EL CODIGO DEL PROVEEDOR INGRESADO YA EXISTE',6,1)
--
if not exists(select * from tb_proveedor where Correo=@Correo)
insert into tb_proveedor
values (@IDProveedor,@Nombres,@Apellidos,@TelefonoFijo,@TelefonoMovil,@Direccion,@Correo,@Documento,@IDTipoDocumento,@Estado)
else 
raiserror('EL CORREO INGRESADO YA ESTA REGISTRADO EN UNA CUENTA EXISTENTE',6,1)
end
go
--

--
--
create or alter procedure usp_insertar_cliente
@IDCliente		char(5),
@Nombres		 varchar(100),
@Apellidos		 varchar(100),
@TelefonoFijo  	 char(7),
@TelefonoMovil	 char(9),
@Direccion		 varchar(100),
@Correo			 varchar(100),
@Documento		 varchar(100),
@IDTipoDocumento char(5),
@Estado			 varchar(100)
as
begin
if not exists(select * from tb_cliente where IDCliente=@IDCliente)
print('EL CODIGO DEL CLIENTE ESTA CORRECTO')
else 
raiserror('EL CODIGO DEL CLIENTE INGRESADO YA EXISTE',6,1)
--
if not exists(select * from tb_cliente where Correo=@Correo)
insert into tb_cliente
values (@IDCliente,@Nombres,@Apellidos,@TelefonoFijo,@TelefonoMovil,@Direccion,@Correo,@Documento,@IDTipoDocumento,@Estado)
else 
raiserror('EL CORREO INGRESADO YA ESTA REGISTRADO EN UNA CUENTA EXISTENTE',6,1)
end
go
--

--
--
create or alter procedure usp_insertar_mascota
@IDMascota			char(5),
@IDCliente			char(5),
@Nombre				varchar(100),
@FechaNacimiento	date,
@Raza				varchar(100),
@Observaciones		varchar(100),
@IDTipoMascota		char(5) ,
@Estado				varchar(100)
as
begin
--
if exists(select * from tb_cliente where IDCliente=@IDCliente)
print('EL CODIGO DEL CLIENTE INGRESADO FUE ENCONTRADO CON EXITO')
else 
raiserror('EL CODIGO DEL CLIENTE INGRESADO NO EXISTE',6,1)
--
if exists(select * from tb_tipoMascota where IDTipoMascota=@IDTipoMascota)
print('EL CODIGO DEL TIPO DE MASCOTA INGRESADO FUE ENCONTRADO CON EXITO')
else 
raiserror('EL CODIGO DEL TIPO DE MASCOTA INGRESADO NO EXISTE',6,1)
--
if not exists(select * from tb_mascota where IDMascota=@IDMascota)
insert into tb_mascota
values (@IDMascota,@IDCliente,@Nombre,@FechaNacimiento,@Raza,@Observaciones,@IDTipoMascota,@Estado)
else 
raiserror('EL CODIGO DE LA MASCOTA INGRESADO YA EXISTE',6,1)
end
go
--

--
--
create or alter procedure usp_insertar_vacunacion
@IDVacunacion	char(5),
@IDMascota		char(5),
@FechaProgramada date,
@Vacuna			varchar(100),
@FechaAplicada	date
as
begin
if exists(select * from tb_mascota where IDMascota=@IDMascota)
print('EL CODIGO DE LA MASCOTA INGRESADO FUE ENCONTRADO CON EXITO')
else 
raiserror('EL CODIGO DE LA MASCOTA INGRESADO NO EXISTE',6,1)
--
if not exists(select * from tb_vacunacion where IDVacunacion=@IDVacunacion)
insert into tb_vacunacion
values (@IDVacunacion,@IDMascota,@FechaProgramada,@Vacuna,@FechaAplicada)
else 
raiserror('EL CODIGO DE LA VACUNACION INGRESADO YA EXISTE',6,1)
end
go
--

--
--
create or alter procedure usp_insertar_consulta
@IDConsulta		char(5),
@IDMascota		char(5),
@Fecha			date,
@Sintomas		varchar(400),
@Diagnostico	varchar(400)
as
begin
if exists(select * from tb_mascota where IDMascota=@IDMascota)
print('EL CODIGO DE LA MASCOTA INGRESADO FUE ENCONTRADO CON EXITO')
else 
raiserror('EL CODIGO INGRESADO DE LA MASCOTA NO EXISTE',6,1)
--
if not exists(select * from tb_consulta where IDConsulta=@IDConsulta)
insert into tb_consulta
values (@IDConsulta,@IDMascota,@Fecha,@Sintomas,@Diagnostico)
else 
raiserror('EL CODIGO DE LA CONSULTA INGRESADO YA EXISTE',6,1)
end
go
--

--
--
create or alter procedure usp_insertar_reserva
@IDReserva		char(5),
@IDCliente		char(5),
@IDMascota		char(5),
@Fecha			datetime,
@Descripcion	varchar(400),
@Estado			varchar(80)
as
begin
--
if exists(select * from tb_cliente where IDCliente=@IDCliente)
print('EL CODIGO DEL CLIENTE INGRESADO FUE ENCONTRADO CON EXITO')
else 
raiserror('EL CODIGO DEL CLIENTE INGRESADO NO EXISTE',6,1)
--
if exists(select * from tb_mascota where IDMascota=@IDMascota)
print('EL CODIGO DE LA MASCOTA INGRESADO FUE ENCONTRADO CON EXITO')
else 
raiserror('EL CODIGO DE LA MASCOTA INGRESADO NO EXISTE',6,1)
--
if not exists(select * from tb_reserva where IDReserva=@IDReserva)
print('EL CODIGO DE LA RESERVA ESTA CORRECTO')
else 
raiserror('EL CODIGO DE LA RESERVA INGRESADO YA EXISTE',6,1)
--
if not exists(select * from tb_reserva where Fecha=@Fecha)
insert into tb_reserva
values (@IDReserva,@IDCliente,@IDMascota,@Fecha,@Descripcion,@Estado)
else 
raiserror('LA FECHA ESTA OCUPADA PARA LA RESERVA',6,1)
end
go
--

--
--
create or alter procedure usp_insertar_compra
@IDCompra		char(5),
@IDProveedor	char(5),
@Fecha			date
as
begin
if not exists(select * from tb_compra where IDCompra=@IDCompra)
print('EL CODIGO DE COMPRA ES CORRECTO')
else 
raiserror('EL CODIGO DE COMPRA YA EXISTE',6,1)
--
if exists(select * from tb_proveedor where IDProveedor=@IDProveedor)
insert into tb_compra
values (@IDCompra,@IDProveedor,@Fecha)
else 
raiserror('EL CODIGO DEL PROVEEDOR INGRESADO NO EXISTE',6,1)
end
go
--

--
--
create or alter procedure usp_insertar_compra_detalle
@IDCompraDetalle	char(5),
@IDProducto			char(5),
@IDCompra			char(5),
@Descripcion		varchar(400),
@Cantidad			int,
@Costo				decimal(6,2)
as
begin
if not exists(select * from tb_compraDetalle where IDCompraDetalle=@IDCompraDetalle)
print('EL CODIGO DEL DETALLE DE LA COMPRA ES CORRECTO')
else 
raiserror('EL CODIGO DEL DETALLE DE LA COMPRA YA EXISTE',6,1)
--
if exists(select * from tb_producto where IDProducto=@IDProducto)
print('SE LOGRO ENCONTRAR EL CODIGO DEL PRODUCTO CON EXITO')
else 
raiserror('EL CODIGO DEL PRODUCTO NO EXISTE',6,1)
--
if exists(select * from tb_compra where IDCompra=@IDCompra)
insert into tb_compraDetalle
values (@IDCompraDetalle,@IDProducto,@IDCompra,@Descripcion,@Cantidad,@Costo)
else 
raiserror('EL CODIGO DE LA COMPRA INGRESADO NO EXISTE',6,1)
end
go
--


--
--
create or alter procedure usp_insertar_venta
@IDVenta			char(5),
@IDCliente			char(5),
@Fecha				date
as
begin
if exists(select * from tb_cliente where IDCliente=@IDCliente)
print('EL CODIGO DEL CLIENTE ES CORRECTO')
else 
raiserror('EL CODIGO DEL CLIENTE INGRESADO NO EXISTE',6,1)
--
if not exists(select * from tb_venta where IDVenta=@IDVenta)
insert into tb_venta
values (@IDVenta,@IDCliente,@Fecha)
else 
raiserror('EL CODIGO DE VENTA YA EXISTE',6,1)
end
go
--

--
--
create or alter procedure usp_insertar_venta_detalle
@IDVentaDetalle	char(5),
@IDVenta		char(5),
@IDProducto		char(5),
@Descripcion	varchar(400),
@Cantidad		int,
@Costo			decimal(6,2)
as
begin
if exists(select * from tb_venta where IDVenta=@IDVenta)
print('EL CODIGO DE LA VENTA ES CORRECTO')
else 
raiserror('EL CODIGO DE LA VENTA NO EXISTE',6,1)
--
if exists(select * from tb_producto where IDProducto=@IDProducto)
print('EL CODIGO DEL PRODUCTO ES CORRECTO')
else 
raiserror('EL CODIGO DEL PRODUCTO NO EXISTE',6,1)
--
if not exists(select * from tb_ventaDetalle where IDVentaDetalle=@IDVentaDetalle)
insert into tb_ventaDetalle
values (@IDVentaDetalle,@IDVenta,@IDProducto,@Descripcion,@Cantidad,@Costo)
else 
raiserror('EL CODIGO DE LA VENTA INGRESADO YA EXISTE',6,1)
end
go
--








--go


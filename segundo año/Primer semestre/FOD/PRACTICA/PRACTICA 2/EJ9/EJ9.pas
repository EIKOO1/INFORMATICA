{
 Se cuenta con un archivo que posee información de las ventas que realiza una empresa a
los diferentes clientes. Se necesita obtener un reporte con las ventas organizadas por
cliente. Para ello, se deberá informar por pantalla: los datos personales del cliente, el total
mensual (mes por mes cuánto compró) y finalmente el monto total comprado en el año por el
cliente. Además, al finalizar el reporte, se debe informar el monto total de ventas obtenido
por la empresa.
El formato del archivo maestro está dado por: cliente (cod cliente, nombre y apellido), año,
mes, día y monto de la venta. El orden del archivo está dado por: cod cliente, año y mes.
   
}


program ej9;
const
	valoralto =  9999;
type
	cadena = String [30];
	
	infoMaestro =  record
		codCliente:integer;
		apellido,nombre:cadena;
		anio,mes,dia:integer;
		monto:real;
	end;
	
maestro =  file of infoMaestro;

procedure leerReg(var regmae:infoMaestro);
begin
	writeln ('INGRESE COD CLIENTE');readln (regmae.codCliente);
	if (regmae.codCliente <> valoralto)then
	begin
		writeln ('INGRESE NOMBRE Y APELLIDO'); readln (regmae.nombre);readln (regmae.apellido);
		writeln ('DIA MES Y ANIO'); readln (regmae.dia);readln (regmae.mes);readln (regmae.anio);
		writeln ('MONTO');readln (regmae.monto);
	end;
end;

procedure crearMaestro (var mae:maestro);
var
	regmae:infoMaestro;
begin
	assign (mae,'maestro.dat');
	rewrite(mae);
	leerReg(regmae);
	while (regmae.codCliente <> valoralto)do
		begin
			write (mae,regmae);
			leerReg(regmae);
		end;
	close (mae);
end;

procedure leer (var mae:maestro;var regmae: infoMaestro);
begin
	if (not eof (mae))then
		read(mae,regmae)
	else
		regmae.codCliente := valoralto;
end;
procedure crearReporte (var mae:maestro);
var
	regmae:infoMaestro;
	regaux:infoMaestro;
	montoT:real;
	montom:real;
begin
	reset(mae);
	leer(mae,regmae);
	while (regmae.codCliente <> valoralto)do
		begin
			writeln ('CODIGO DEL CLIENTE' ,regmae.codCliente);
			montoT:=0;
			regaux:=regmae;
			while (regmae.codCliente = regaux.codCliente)do
				begin
					montom:=0;
					while (regmae.codCliente=regaux.codCliente) and (regmae.mes = regaux.mes)do
						begin
							montoT:= montoT + regmae.monto;
							montom:= montom + regmae.monto;
							leer(mae,regmae);
						end;
					writeln ('MONTO DEL MES ' , regaux.mes , ' ES : ', montom:2:2);
				end;
			writeln ('MONTO TOTAL ' , regaux.anio, ' ES : ', montoT:2:2);
		end;
	close (mae);
end;

var
	mae:maestro;
BEGIN
	crearMaestro(mae);
	crearReporte(mae);
END.


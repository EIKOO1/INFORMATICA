{
   Una cadena de tiendas de indumentaria posee un archivo maestro no ordenado con
la información correspondiente a las prendas que se encuentran a la venta. De cada
prenda se registra: cod_prenda, descripción, colores, tipo_prenda, stock y
precio_unitario. Ante un eventual cambio de temporada, se deben actualizar las
prendas a la venta. Para ello reciben un archivo conteniendo: cod_prenda de las
prendas que quedarán obsoletas. Deberá implementar un procedimiento que reciba
ambos archivos y realice la baja lógica de las prendas, para ello deberá modificar el
stock de la prenda correspondiente a valor negativo.

Adicionalmente, deberá implementar otro procedimiento que se encargue de
efectivizar las bajas lógicas que se realizaron sobre el archivo maestro con la
información de las prendas a la venta. Para ello se deberá utilizar una estructura
auxiliar (esto es, un archivo nuevo), en el cual se copien únicamente aquellas prendas
que no están marcadas como borradas. Al finalizar este proceso de compactación
del archivo, se deberá renombrar el archivo nuevo con el nombre del archivo maestro
origina
   
}


program EJERCICIO6;
const
	valoralto = 9999;
type
	cadena = String[30];

	regmaestro=record
		cod_prenda:integer;
		descripcion:cadena;
		colores:cadena;
		tipo_prenda:cadena;
		stock:integer;
		precio_unitario:real;
	end;

maestro = file of regmaestro;
detalle = file of regmaestro;	
	
procedure leerPrenda(var reg:regmaestro);
begin
	writeln('INGRESE');
	write('Codigo de prenda:  ');readln(reg.cod_prenda);
	if (reg.cod_prenda <>valoralto)then
		begin
			write('Descripcion : ');readln(reg.descripcion);
			write('Colores : ');readln(reg.colores);
			write('Tipo de prenda : ');readln(reg.tipo_prenda);
			write('Stock actual : ');readln(reg.stock);
			write('Precio Unitario : ');readln(reg.precio_unitario);
		end;
end;

procedure crearMaestro(var mae:maestro);
var
	reg:regmaestro;
begin
	
	rewrite(mae);
	reset(mae);
	leerPrenda(reg);
	while (reg.cod_prenda <> valoralto)do
		begin
			write(mae,reg);
			leerPrenda(reg);
		end;
	close (mae);
end;

procedure crearDetalle(var det:detalle);
var
	reg:regmaestro;
begin
	rewrite(det);
	reset(det);
	leerPrenda(reg);
	while (reg.cod_prenda <> valoralto)do
		begin
			write(det,reg);
			leerPrenda(reg);
		end;
	close(det);
end;

procedure Compactar (var mae:maestro);
var
	regmae:regmaestro;
	nuevoArchivo:file of regmaestro;
begin
	assign (nuevoArchivo,'ArchivoAux');
	rewrite(nuevoArchivo);
	reset(mae);
	while (not eof(mae))do
		begin
			read(mae,regmae);
			if(regmae.cod_prenda<0)then
				write(nuevoArchivo,regmae);		
		end;
	writeln('aa');
	close(mae);
	close(nuevoArchivo);
	erase(mae);
	rename(nuevoArchivo,'maestro.dat');
end;

procedure darDeBajaPrendas(var mae:maestro;var det:detalle);
var
	regmae:regmaestro;
	regdet:regmaestro;
begin
	reset(mae);
	reset(det);
	while (not eof(det))do
		begin
			read(det,regdet);
			read(mae,regmae);
			while (not eof(mae) and (regmae.cod_prenda<>regdet.cod_prenda))do
				read(mae,regmae);
			if (regmae.cod_prenda <> valoralto)then
				begin
					regmae.cod_prenda := regmae.cod_prenda *-1;
					Seek(mae,filePos(mae)-1);
					write(mae,regmae);
					writeln('Prenda eliminada');
				end
			else
				writeln('Prenda no encontranda..');
		Seek(mae,0);
		end;
	Compactar(mae);
end;



procedure ListarMaestro (var mae:maestro);
var
	reg:regmaestro;
begin
	reset(mae);
	while (not eof (mae))do
		begin
			read(mae,reg);
			write('CODIGO DE PRENDA : ' ,reg.cod_prenda );
			write('DESCRIPCION : ' , reg.descripcion);
			write('Colores : ',reg.colores);
			write('Tipo de prenda : ',reg.tipo_prenda);
			write('Stock actual : ',reg.stock);
			write('Precio Unitario : ',reg.precio_unitario);
		end;

end;

var
	mae:maestro;
	det:detalle;
BEGIN
	assign(mae,'maestro.dat');
	assign(det,'detalle.dat');
	//crearMaestro(mae);
	//crearDetalle(det);
	listarMaestro(mae);
	darDeBajaPrendas(mae,det);
	listarMaestro(mae);
END.


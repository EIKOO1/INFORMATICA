{
Las bajas se realizan apilando registros borrados y las altas reutilizando registros
borrados. El registro 0 se usa como cabecera de la pila de registros borrados: el
número 0 en el campo código implica que no hay registros borrados y -N indica que el
próximo registro a reutilizar es el N, siendo éste un número relativo de registro válido.
a. Implemente el siguiente módulo:
Abre el archivo y agrega una flor, recibida como parámetro
manteniendo la política descrita anteriormente
procedure agregarFlor (var a: tArchFlores ; nombre: string;
codigo:integer);
b. Liste el contenido del archivo omitiendo las flores eliminadas. Modifique lo que
considere necesario para obtener el listado.
}


program untitled;
const
	valoralto=9999; 
type

	reg_flor = record
		nombre: String[45];
		codigo: integer;
	end;
	
tArchFlores = file of reg_flor;

procedure leerFlor(var flor:reg_flor);
begin
	writeln('Ingrese codigo de la flor');readln(flor.codigo);
	if (flor.codigo <> valoralto)then
		writeln('Ingrese nombre de la flor');readln(flor.nombre);
	end;
	
procedure leer(var mae:tArchFlores;var r:reg_flor);
begin
	if (not eof(mae))then
		read(mae,r)
	else
		r.codigo:=valoralto;
end;
procedure agregarFlor(var mae:tArchFlores);
var
	flor:reg_flor;  //agregar
	cabecera:reg_flor;  //indice a los registro eliminados
begin
	reset(mae);
	leerFlor(flor);
	leer(mae,cabecera);
	if (flor.codigo<>valoralto)then
	begin
		if (cabecera.codigo=0)then
			begin
				Seek(mae,FileSize(mae));
				write(mae,flor);
				writeln('AGREGUE AL FINAL');
			end
		else
			begin
				Seek(mae,cabecera.codigo*-1);  //como no es cero me posiciono en el archivo
				read(mae,cabecera);		//leo lo que esta en el registro // paso lo q estaba en el registro a negativo si es 0 no pasa nada
				Seek(mae,filePos(mae)-1); //vuelvo pa tra
				write(mae,flor);	//escribo el dato nuevo
				Seek(mae,0);	//cabecera
				write(mae,cabecera);	//escribo la nueva cabecera-
			end;	
		end;
	close(mae);
end;

procedure eliminarFlor(var mae:tArchFlores);
var
	nro:integer;
	regFLor:reg_flor;
	cabecera:reg_flor;
begin
	assign(mae,'flores.dat');
	reset(mae);
	writeln('Ingrese el codigo de la flor a eliminar');readln(nro);
	leer(mae,cabecera);
	leer(mae,regFlor);
	while ((regFlor.codigo <>valoralto)and (regFlor.codigo <> nro))do
		leer(mae,regFlor);
	if(regFlor.codigo = nro)then
		begin
			Seek(mae,FilePos(mae)-1);  //como no es cero me posiciono en el archivo
 			write(mae,cabecera);		//leo lo que esta en el registro
			cabecera.codigo := (FilePos(mae)-1)*-1; // paso lo q estaba en el registro a negativo si es 0 no pasa nada
			Seek(mae,0);	//cabecera
			write(mae,cabecera);	//escribo la nueva cabecera-
			writeln('ELIMINADO');	
		end;
	close(mae);
end;
procedure crearArch(var mae:tArchFlores);
var
	r:reg_flor;
begin
	r.codigo:=0;
	r.nombre:=' ';
	reset (mae);
	write(mae,r);
	close(mae);
end;

procedure Listar(var mae:tArchFlores);
var
	r:reg_flor;
begin
	reset(mae);
	while (not eof(mae))do
		begin
			read(mae,r);
			writeln('CODIGO DE FLOR : ',r.codigo);
			writeln('NOMBRE : ',r.nombre);
		end;
	close(mae);
end;
var
	mae:tArchFlores;
	ok:boolean;
	n:integer;
BEGIN
	ok:=true;
	assign(mae,'flores.dat');
	rewrite(mae);
	crearArch(mae);
	while (ok)do
	begin
		writeln('INGRESE 1 PARA AGREGAR FLOR');
		writeln('INGRESE 2 PARA ELIMINAR UNA FLOR');
		writeln('INGRESE 3 PARA LISTAR');
		writeln('INGRESE 4 PARA SALIR');
		readln(n);
		case n of 
			1:agregarFlor(mae);
			2:eliminarFlor(mae);
			3:Listar(mae);
			4:ok:=false;
		end;
	end;
END.


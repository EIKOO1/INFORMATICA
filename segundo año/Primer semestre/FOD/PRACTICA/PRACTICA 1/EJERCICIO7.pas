{
   Crear un archivo binario a partir de la información almacenada en un archivo de
texto. El nombre del archivo de texto es: “novelas.txt”. La información en el
archivo de texto consiste en: código de novela, nombre, género y precio de
diferentes novelas argentinas. Los datos de cada novela se almacenan en dos
líneas en el archivo de texto. La primera línea contendrá la siguiente información:
código novela, precio y género, y la segunda línea almacenará el nombre de la
novela.
   
}


program untitled;

type
	cadena = string[34];
	novela = record
		cod:integer;
		nombre:cadena
		genero:cadena;
		precio:real;
	end;
	
archivo_logico= file of novela;

procedure crearBinario(var arch:archivo_logico);
var
	nov:novela;
	archFisico:String;
	archText:Text;
begin
	assign(archText,'novelas.txt');
	writeln('....INGRESE EL NOMBRE QUE DE SEA PONERLE AL ARCHIVO....');
	readln(archFisico);
	assign(arch,archFisico);
	rewrite(arch);
	while (not eof(archText))do
		begin
			read(archText,nov.cod,nov.precio,nov,genero);
			read(archText,nov.nombre);
			write(arch,nov);
		end;
	close(archText);
	close(arch);
end;

procedure actualizar(var arch:archivo_logico);
var
	nov:novela
	archivofisico:string;
begin
	writeln('INGRESE CON QUE ARCHIVO SE VA A TRABAJAR');
	readln(archivofisico);   
	assign(arch,archivofisico);   //asigna
	reset(archivo);
	seek(arch,fileSize);
	while (nov.cod <> 0) do
		begin
			writeln('INGRESE');
			writeln('CODIGO DE NOVELA')
		end;
end;

procedure actualizar (var arch:archivo_logico);
var
	nov:novela;
begin
	
end;

var
	ok:boolean;
	n:integer;
	arch:archivo_logico;
	archivofisico:string;
BEGIN
	ok:=true;
	while (ok)dO
		begin
			writeln('INGRESE 1 PARA CREAR ARCHIVO BINARIO EN BASE DE (novelas.txt)');
			writeln('INGRESE 2 PARA ACTUALIZAR EL ARCHIVO BINARIO (AGREGAR O ACTUALIZAR');
			writeln;
			writeln('...');
			readln(n);
			case n of 
			1:crearBinario(arch);
			2:actualizar(arch);
			end;
		
		end;
		
	
END.


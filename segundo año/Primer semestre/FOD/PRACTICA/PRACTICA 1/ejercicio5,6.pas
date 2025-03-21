{Crear un archivo de registros no ordenados de celulares y cargarlo con datos
ingresados desde un archivo de texto denominado “celulares.txt”. Los registros
correspondientes a los celulares deben contener: código de celular, nombre,
descripción, marca, precio, stock mínimo y stock disponible.
* NOTA 1: El nombre del archivo binario de celulares debe ser proporcionado por el
usuario.
NOTA 2: El archivo de carga debe editarse de manera que cada celular se especifique
en tres líneas consecutivas. En la primera se especifica: código de celular, el precio y
marca, en la segunda el stock disponible, stock mínimo y la descripción y en la tercera
nombre en ese orden. Cada celular se carga leyendo tres líneas del archivo
“celulares.txt”.}

program untitled;
type
	cadena = String[20];
	celular = record
		cod:integer;
		nombre:cadena;
		descripcion:String;
		marca:cadena;
		precio:real;
		stockMin:integer;
		stockDis:integer;
	end;
	
archivo_logico = file of celular;

procedure cargarArchText(var archText:Text);
var
	c:celular;
begin
	assign(archText,'celulares.txt');  //asigno el arch
	rewrite(archText);  //lo creo
	writeln('ingrese codigo de celular');readln(c.cod);
	while (c.cod <> 0) do
		begin
			writeln('nombre');readln(c.nombre);
			writeln('descripcion');readln(c.descripcion);
			writeln('marca');readln(c.marca);
			writeln('precio');readln(c.precio);
			writeln('stockMin');readln(c.stockMin);
			writeln('stockDisponible');readln(c.stockDis);
			writeln(archText,c.cod,' ',c.precio,' ',c.marca, ' ');
			writeln(archText,c.stockDis,' ',c.stockMin, ' ', c.descripcion, ' ');
			writeln(archText,c.nombre,' ');
			writeln('ingrese otro codigo de celular');readln (c.cod);
		end;
	close(archText);
end;

procedure cargarBinario(var arch:archivo_logico;var archText:Text);
var
	c:celular;
	nombreArch:string;
begin
	writeln('INGRESE EL NOMBRE DEL ARCHIVO....');readln(nombreArch);
	assign(arch,nombreArch);   //asigno
	rewrite (arch);    //abro
	reset(archText);  //lectura escritura de text.
	writeln(' ----');
	while (not eof(archText))do
		begin
			readln(archText,c.cod,c.precio,c.marca);
			readln(archText,c.stockDis,c.stockMin,c.descripcion);
			readln(archText,c.nombre);
			write(arch,c);
		end;
	close(arch);
	close(archText);
	writeln('Archivo Binario creado correctamente...');
	
end;

procedure listar(c:celular);
begin
	writeln('CODIGO DE CELULAR: ',c.cod);
	writeln('PRECIO: ' ,c.precio);
	writeln('MARCA : ',c.marca);
	writeln('STOCK DISPONIBLE :', C.stockDis);
	writeln('STOCK MINIMO:' , c.stockMin);
	writeln('DESCRIPCION : ' ,c.descripcion);
	writeln('NOMBRE: ',c.nombre);
end;

procedure listarMinimo(var arch:archivo_logico);
var
	c:celular;
begin
	reset (arch);
	while (not eof(arch)) do
		begin
			read(arch,c);
			if (c.stockDis < c.stockMin)then
				listar(c);
			
		end;
	close(arch);
end;

var 
	arch:archivo_logico;
	archText:Text;
	n:integer;
	ok:boolean;
BEGIN
	ok:=true;
	while(ok)do
	begin
	writeln('---------------------------------------');
	writeln('INGRESE 1 PARA CREAR EL ARCHIVO DE TEXTO');
	writeln('INGRESE 2 PARA CREAR EL ARCHIVO BINARIO DESDE EL ARCHIVO (celulares.txt)');
	writeln('INGRESE 3 PARA LISTAR LOS CELULARES STOCK MENOR AL MINIMO');
	readln(n);
	case n of 
	1:cargarArchText(archText);
	2:cargarBinario(arch,archText);
	3:listarMinimo(arch);
	end;
	end;
END.


{Modificar la edad de un empleado dado.}

program Ejercicio3;
type
	comando = 1..9;
	empleado = record
		num:integer;
		apellido:String[20];
		nombre:String[20];
		edad:integer;
		dni:integer;
	end;
	
	archivo_logico = file of empleado;

procedure leerEmpleado(var e:empleado);
begin
	writeln('apellido' );readln(e.apellido);
	if (e.apellido <> 'fin')then
		begin
			writeln('numero de empleado ');readln(e.num);
			writeln('nombre ');readln(e.nombre);
			writeln('edad ');readln(e.edad);
			writeln('dni ');readln(e.dni);
		end;
end;

procedure crearArchivo(var arch:archivo_logico);   //crear archivo desde 0
var
	e:empleado;
begin
	rewrite(arch);      //creo el archivo.
	leerEmpleado(e);
	while (e.apellido <> 'fin')do
		begin
			write(arch,e);    //cargo el archivo
			leerEmpleado(e);
		end;
	close(arch);   //cierro el archivo
end;

procedure mostrarEmpleado(e:empleado);
begin
	writeln('----------');
	writeln(e.num);
	writeln(e.apellido);
	writeln(e.nombre);
	writeln(e.edad);
	writeln(e.dni);
	writeln('----------');
end;

procedure mostarListaApellido(var arch:archivo_logico);
var
	apellido:string[20];
	e:empleado;
begin
	reset(arch);
	writeln('ingrese apellido que desea ver');
	readln(apellido);
	while (not eof(arch)) do
	begin
		read(arch,e);
		if (e.apellido = apellido)then
			mostrarEmpleado(e);
	end;
	close(arch);
end;
procedure mostrarTodos(var arch:archivo_logico);
var
	e:empleado;
begin
	reset(arch); //abro el archivo;
	while (not eof(arch))do
		begin
			read(arch,e);   //copio el valor;
			mostrarEmpleado(e);
		end;
	close(arch);   //cierro el archivo.

end;
	
procedure mostrarmayores(var arch:archivo_logico);	
var
	e:empleado;
begin
	reset(arch);
	while (not eof(arch))do
		begin
			read(arch,e);
			if(e.edad>70)then
				mostrarEmpleado(e);
		end;
	close(arch);
end;

procedure estaEnElArchivo(var arch:archivo_logico;var ok:boolean;cod:integer);
var
	e:empleado;
begin
	while (not eof(arch) and (ok))do
		begin
			read(arch,e);
			if (e.num = cod)then
				ok:=false;//osea que esta en el archivo.
		end;

end;

procedure agregarEmpleado(var arch:archivo_logico);	  
var
	e:empleado;
	ok:boolean;
begin
	reset(arch); //abro el archivo;	
	leerEmpleado(e);
	while (e.apellido <> 'fin')do
		begin
			ok:=true;
			estaEnElArchivo(arch,ok,e.num);
			if (ok=true)then
				write(arch,e)
			else
				writeln('el empleado ya se encuentra en el archivo');
			leerEmpleado(e);
		end;
	close(arch);
end;
procedure modificarEdad(var arch:archivo_logico);	
var
	e:empleado;
	numEmple:integer;
begin
	writeln('ingrese num de empleado para sumar edad');
	readln(numEmple);
	reset (arch);
	read(arch,e);
	while (not eof(arch)and (numEmple <> e.num))do
		read(arch,e);
	e.edad:= e.edad+1;
	Seek(arch,FilePos(arch)-1);
	write(arch,e);
	Seek(arch,0);
	close(arch);
end;
procedure exportarTexto(var arch:archivo_logico);
var
	cargaText:Text;
	e:empleado;
begin
	assign(cargaText,'todos_empleados.txt');
	rewrite(cargaText);
	reset (arch);  //abro el archivo
	while (not eof(arch))do
		begin
			read(arch,e);
			with e do writeln(cargaText,'|CODIGO EMPLEADO : ',num, ' EDAD: ' ,edad,' DNI: ',dni,' NOMBRE: ',nombre,' APELLIDO: ',apellido,'|');
		end;
	writeln('Archivo Exportado.....');
	close(arch);
	close(cargaText);
end;

procedure exportarDni00(var arch:archivo_logico);
var
	e:empleado;
	archtext:Text;
begin
	assign(archtext,'faltaDNIEmpleado.txt');
	rewrite(archtext);
	reset (arch);
	while (not eof(arch))do
		begin
			read (arch,e);
			if (e.dni = 00 )then
				begin
					with e do writeln(archtext,'|CODIGO EMPLEADO : ',num, ' EDAD: ' ,edad,' DNI: ',dni,' NOMBRE: ',nombre,' APELLIDO: ',apellido,'|');
				end;
		end;
	close(arch);
	close(archtext);

end;

var 
	archFisico:String[20];
	arch:archivo_logico;
	ok:boolean;
	n:comando;
BEGIN
	ok:=true;
	writeln('INGRESE EL NOMBRE DEL ARCHIVO');readln(archFisico);
	assign(arch,archFisico);
	while (ok) do
		begin
			writeln;
			writeln;
			writeln('INGRESE');   
			writeln('1 PARA CREAR UN ARCHIVO');   //lesto
			writeln('2 PARA MOSTRAR LISTA CON UN APELLIDO');  //
			writeln('3 PARA MOSTRAR LOS EMPLEADOS');
			writeln('4 PARA MOSTRAR empleados mayores de 70 años, próximos a jubilarse');
			writeln('5 PARA AGREGAR UN EMPLEADO');
			writeln('6 PARA MODIFICAR EDAD EMPLEADO');
			writeln('7 PARA EXPORTAR ARCHIVO');
			writeln('8 PARA EXPORTAR ARCHIVOS CON DNI 00');
			writeln('9 PARA SALIR');
			readln(n);
			writeln;
			writeln;
			case n of
				1:crearArchivo(arch);
				2:mostarListaApellido(arch);
				3:mostrarTodos(arch);
				4:mostrarmayores(arch);
				5:agregarEmpleado(arch);
				6:modificarEdad(arch);
				7:exportarTexto(arch);
				8:exportarDni00(arch);
				9:ok:=false;
		end;
	
end;
end.


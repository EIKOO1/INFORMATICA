

program Ejercicio3;
type
	comando = 1..4;
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
			writeln('INGRESE');   
			writeln('1 PARA CREAR UN ARCHIVO');   //lesto
			writeln('2 PARA MOSTRAR LISTA CON UN APELLIDO');  //
			writeln('3 PARA MOSTRAR LOS EMPLEADOS');
			writeln('4 PARA MOSTRAR empleados mayores de 70 años, próximos a jubilarse');
			readln(n);
			case n of
				1:crearArchivo(arch);
				2:mostarListaApellido(arch);
				3:mostrarTodos(arch);
				4:mostrarmayores(arch);
		end;
	
end;
end.


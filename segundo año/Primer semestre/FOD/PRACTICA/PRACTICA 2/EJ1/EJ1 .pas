program ejercicio1p2;

const
	valorAlto =  999;

type

	empleados = record
		cod : integer;
		nombre:String[30];
		monto:real;
	end;

archivo = file of empleados;	



procedure cargardetalle (var detalle:archivo);
var
	emp:empleados;
	carga:text;
begin
	assign (carga,'empleados.txt');
	reset(carga);
	rewrite(detalle);	
		while (not eof(carga))do
			begin
				readln(carga,emp.cod,emp.monto,emp.nombre);
				writeln(emp.nombre);
				write(detalle,emp);	
			end;
			
writeln ('...ARCHIVO CREADO...');
close (carga);
close (detalle);
			
end;

procedure leer (var detalle:archivo;var emp:empleados);
begin
	if (not eof (detalle))then
		read (detalle,emp)
	else
		emp.cod:= valorAlto;
end;

procedure cargarMaestro (var maestro:archivo ; var detalle:archivo);
var
	empTotal,emp:empleados;
	codActual:integer;
	total:real;
begin
	reset (detalle);      //abro el detalle 
	assign (maestro,'maestroCompactado.dat');    //assigno al maestro 
	rewrite (maestro);  //creo el maestro
	leer (detalle,emp);   //leo 
	while (emp.cod <> valorAlto)do   //comparo con el final
		begin
			empTotal:= emp;				// cargo el empleado
			codActual:= emp.cod;
			total:= 0;		// cod actual
			while (emp.cod = codActual)do		
				begin
					total:=total + emp.monto;    //suma acumulativa
					leer(detalle,emp);
				end;
			empTotal.monto := total;
			write (maestro,empTotal);   //Cargo en el maestro el empleado
		end;
	close(detalle);
	close (maestro);
end;


var
	nombre:String;
	maestro,detalle:archivo;
begin
	writeln('...Ingrese el nombre del archivo a crear...');
	readln (nombre);
	assign (detalle,nombre);
	cargardetalle (detalle);
	cargarMaestro(maestro,detalle);
	
end.


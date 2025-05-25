{
 3. Realizar un programa que genere un archivo de novelas filmadas durante el presente
año. De cada novela se registra: código, género, nombre, duración, director y precio.
El programa debe presentar un menú con las siguientes opciones:

b. Abrir el archivo existente y permitir su mantenimiento teniendo en cuenta el
inciso a), se utiliza lista invertida para recuperación de espacio. En
particular, para el campo de “enlace” de la lista (utilice el código de
novela como enlace), se debe especificar los números de registro
referenciados con signo negativo, . Una vez abierto el archivo, brindar
operaciones para:
i. Dar de alta una novela leyendo la información desde teclado. Para
esta operación, en caso de ser posible, deberá recuperarse el
espacio libre. Es decir, si en el campo correspondiente al código de
novela del registro cabecera hay un valor negativo, por ejemplo -5,
se debe leer el registro en la posición 5, copiarlo en la posición 0
(actualizar la lista de espacio libre) y grabar el nuevo registro en la
posición 5. Con el valor 0 (cero) en el registro cabecera se indica
que no hay espacio libre.
ii. Modificar los datos de una novela leyendo la información desde
teclado. El código de novela no puede ser modificado.
iii. Eliminar una novela cuyo código es ingresado por teclado. Por
ejemplo, si se da de baja un registro en la posición 8, en el campo
código de novela del registro cabecera deberá figurar -8, y en el
registro en la posición 8 debe copiarse el antiguo registro cabecera.
c. Listar en un archivo de texto todas las novelas, incluyendo las borradas, que
representan la lista de espacio libre. El archivo debe llamarse “novelas.txt”
   
}

program Ejercicio3Prac3;
const
	valoralto = 9999;
type
	
	novela=record
		codigo:integer;
		genero:string;
		nombre:string[20];
		duracion:integer;
		directo:string;
		precio:real;
	end;

maestro = file of novela;

procedure leerNovela(var n:novela);
begin
	writeln('INGRESE ');
	write('CODIGO : '); readln(n.codigo);
	if (n.codigo <> 0)then
		begin
			write('GENERO : ');readln(n.genero);
			write('NOMBRE : ');readln(n.nombre);
			write('DURACION : ');readln(n.duracion);
			write('DIRECTO : ');readln(n.directo);
			write('PRECIO : ' );readln(n.precio);
		end;
end;		

procedure LeerNovelas(var mae:maestro);
var
	nov:novela;
begin
	assign (mae,'novelas.dat');
	rewrite(mae);
	nov.codigo := 0;   //cabecera
	write(mae,nov);

	leerNovela(nov);
	while (nov.codigo <> 0)do
		begin
			write(mae,nov);
			leerNovela(nov);
		end;
	close(mae);
end;

procedure darAlta(var mae:maestro);
var
	n:novela;
	nov:novela;
begin
	reset(mae);
	read(mae,n);
	leerNovela(nov);
	if (n.codigo=0)then
		begin
			Seek(mae,fileSize(mae)-1);
			write(mae,nov);
		end
	else
		begin
			Seek(mae,n.codigo*-1);
			read(mae,n);
			Seek(mae,FilePos(mae)-1);
			write(mae,nov);
			Seek(mae,0);
			write(mae,n);
		end;
	close(mae);
end;

procedure ModificarNovela(var mae:maestro);
var
	nov:novela;	
	n:novela;
begin
	reset(mae);
	leerNovela(nov);
	read(mae,n);
	while ((not eof (mae)) and (nov.codigo<>n.codigo))do
		begin
			read(mae,nov);
		end;
	if (nov.codigo = n.codigo)then
		begin
			nov.genero := n.genero;
			nov.nombre := n.nombre;
			nov.duracion:= n.duracion;
			nov.directo := n.directo;
			nov.precio := n.precio;
			Seek(mae,FilePos(mae)-1);
			write(mae,nov);
		end;
	close(mae);
end;

{	write('CODIGO : '); readln(n.codigo);
			write('GENERO : ');readln(n.genero);
			write('NOMBRE : ');readln(n.nombre);
			write('DURACION : ');readln(n.duracion);
			write('DIRECTO : ');readln(n.directo);
			write('PRECIO : ' );readln(n.precio);}
procedure leer(var mae:maestro; var n:novela);
begin
    if(not eof(mae)) then
        read(mae,n)
    else
        n.codigo := valoralto;
end;

procedure EliminarNovela(var mae:maestro);
var
	nAct,cabecera:novela;
	cod:integer;
begin
	reset(mae);
	writeln('INGRESE EL CODIGO');readln(cod);
	leer(mae,cabecera);
	leer(mae,nAct);
	while ((nAct.codigo <> valoralto) and (nAct.codigo <> cod))do;
		leer(mae,nAct);
		
	if (nAct.codigo = cod)then
		begin
			Seek(mae,filePos(mae)-1); //me posiciono en una anterior
			write(mae,cabecera);		//escribo lo que esta en la cabecera
			cabecera.codigo:= (filePos(mae)-1) *-1;	// lo paso a negativo
			Seek(mae,0);	//me posiciono en la cabecera
			write(mae,cabecera);	

		end
	else
		writeln('El codigo no existe');
	close(mae);		
end;

procedure mantenimiento (var mae:maestro);
var
	ok:boolean;
	n:integer;
begin
	assign (mae,'novelas.dat');
	while (ok) do
		begin
			writeln('INGRESE 1 PARA DAR ALTA A UNA NOVELA');
			writeln('INGRESE 2 PARA MODIFICAR UNA NOVELA');
			writeln('INGRESE 3 PARA ELIMINAR UNA NOVELA');
			writeln('INGRESE 4 PARA SALIR');
	
			read(n);	
			case (n) of
				1:darAlta(mae);
				2:ModificarNovela(mae);
				3:EliminarNovela(mae);
				4:ok:=false;
			end;
		end;
end;
var
	mae:maestro;

begin
	
	LeerNovelas(mae);
	mantenimiento(mae);
end.



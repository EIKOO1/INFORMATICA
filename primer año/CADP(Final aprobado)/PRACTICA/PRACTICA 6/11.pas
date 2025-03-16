 {
 * La Facultad de Informática debe seleccionar los 10 egresados con mejor promedio a los que la UNLP les
entregará el premio Joaquín V. González. De cada egresado se conoce su número de alumno, apellido y
el promedio obtenido durante toda su carrer
* Implementar un programa que:
a. Lea la información de todos los egresados, hasta ingresar el código 0, el cual no debe procesarse.
b. Una vez ingresada la información de los egresados, informe el apellido y número de alumno de los
egresados que recibirán el premio. La información debe imprimirse ordenada según el promedio
del egresado (de mayor a menor).
* }
program once;
const
dimf = 10;
type
cadena= string[20];
alumno = record
num:integer;
apellido:cadena;
promedio:real;
end;
lista = ^nodo;
nodo = record
dato:alumno;
sig:lista;
end;
vec =  array [1..dimf]of alumno;
procedure insertarordenado (var l:lista ; a:alumno);
var
nuevo:lista;
begin
new (nuevo);
nuevo^.dato:= a;
nuevo^.sig:= nil;
if (l =  nil)then
	l:= nuevo
	else
	nuevo^.sig:=l;
	l:=nuevo;
end;
procedure cargaralumno (var a:alumno);
begin
	writeln ('INGRESE CODIGO DEL ALUMNO ' ); readln (a.num);
	if (a.num <> 0 )then
	begin
	writeln ('INGRESE apellido ='); READLN (a.apellido);
	writeln ('INGRESE PROMEDIO= '); readln (a.promedio);
	end;
end;
procedure cargarlista (var l:lista);
var
a:alumno;
begin
	cargaralumno(a);
		while (a.num <> 0) do
			begin
				insertarordenado(l,a);
				cargaralumno(a);
			end;
end;
procedure vectormaximos (l:lista);
var
aux:lista; //para recorrer la lista
i:integer;
v:vec;
j:integer;
begin
v[1].promedio:= -1;
aux:= l;
while (aux<> nil) do
begin
for i := 1 to dimf do
begin
	if (aux^.dato.promedio > v[i].promedio)then
	begin
	for j:= dimf downto i do
		v[j+1]:= v[i];
	end;

end;
writeln ('aca es el problema');
v[i]:= aux^.dato;
aux:= aux^.sig;
end;


for i:= 1 to dimf do 
	writeln (v[i].num);
	writeln (v[i].apellido);
	writeln (v[i].promedio);
	end;
	
var
l:lista;
begin
l:=nil;
cargarlista(l);

vectormaximos (l);
end.

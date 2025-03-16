{Una cátedra dispone de información de sus alumnos (a lo sumo 1000). De cada alumno se conoce nro de
alumno, apellido y nombre y cantidad de asistencias a clase. Dicha información se encuentra ordenada por
nro de alumno de manera ascendente. Se pide:
a. Un módulo que retorne la posición del alumno con un nro de alumno recibido por parámetro. El
alumno seguro existe. //listo //
b. Un módulo que reciba un alumno y lo inserte en el vector. //LISTO
c. Un módulo que reciba la posición de un alumno dentro del vector y lo elimine. //LISTOTO
d. Un módulo que reciba un nro de alumno y elimine dicho alumno del vector	//LESTOo
e. Un módulo que elimine del vector todos los alumnos con cantidad de asistencias en 0.w  
Nota: Realizar el programa principal que invoque los módulos desarrollados en los incisos previos con datos
leídos de tecladob}
program encuatro;
const
dimf = 1000;
type 
alu =  record
nroalu:integer;
cantasistencias:integer;
apellido,nombre :string[20];
//registro de alumnos
end;
vec =array [1..dimf] of alu;
procedure leeralu (var v:vec ; var diml:integer );
var
a:alu;
begin
diml:= 0;
writeln ('ingrese numero de alumno');
readln (a.nroalu);
while (diml < dimf) and (a.nroalu <> -1) do begin
//mientras que la dimension logica no supere la fisica y nro de alumnos distinto de -1 leo alumnos
diml:= diml+1;
writeln ('nombre del alumno'); readln( a.nombre);
writeln ('apellido'); readln (a.apellido );
writeln ('cantidad de asistencias'); readln (a.cantasistencias);
v[diml]:= a;
//
writeln ('numero de alumno'); readln (a.nroalu);
//leo otro alumno
end;
end;
function pos( v:vec;diml:integer;nalu:integer):integer;
var
apos:integer;
begin
apos:= 1;
while (v[apos].nroalu < nalu ) do begin
//mientras lo que tengo guardado en el vector sea menor estricto a el numero de alumno que busco 
apos:= apos+1;
//apos le sumo uno 
end;
if  (apos <= diml) and (v[apos].nroalu = nalu) then 
	//si la posicion es menor a la dimension logica y en la posicion en la que quedo el vector es = a el numero
	pos:= apos
	//retorno el valor de mi funcion la posicion en la que quedo
	else
	pos:=-1;
	//sino retorno -1 como que no lo encontre
end;
procedure insertaralu (var v:vec; var diml:integer);
var
a:alu;
pos:integer;
i:integer;
begin
writeln ('ingrese en que posicion desea ingresar a el alumno');
 readln (pos);
 if ((diml+1)<= dimf) then begin
 //si la dimension logica más uno no supera la dimension fisica
 for i := diml downto pos do 
 //voy desde la dimension logica hasta la posicion  (del revez)
 begin
	v[i+1]:= v[i];
	//realizo un corrimiento a la posicion del vector desde el ultimo mas uno le asigno lo que habia lo anterior
 end;
 writeln ('ingrese numero de alumno');
readln (a.nroalu);
writeln ('nombre del alumno'); readln( a.nombre);
writeln ('apellido'); readln (a.apellido );
writeln ('cantidad de asistencias'); readln (a.cantasistencias);
v[pos]:= a;
diml:= diml+1;
//inserto el registo del alumno y aumento la cantidad de elementos
end;
end;
procedure eliminar ( var v:vec; var diml:integer ; ealu:integer);
//. Un módulo que reciba la posición de un alumno dentro del vector y lo elimine.
var 
i:integer;
begin
if (ealu >= 1 ) and (ealu <= diml)then begin
	//si el alumno esta dentro del rango del vector cargado
for i := ealu to diml do
	//desde la posicion hasta la dimension logica
begin
v[i]:= v[i+1];
	//desde la posicion le coloco lo que esta la posicion siguiente
end;
diml:= diml-1;
//decremento la dimension logica
writeln ('lo elimine');
end
else
writeln ('no lo elimine');
end;
procedure elinroalu(var v:vec;var diml:integer; nroalu:integer);
var
posicion:integer;
begin 
posicion:= pos(v,diml,nroalu);
//a mi variable le asigno lo que salga de la funcion
eliminar (v,diml,posicion);
//llamo al procedimeinto eliminar y mando la posicion
end;
procedure asistencias0(var v:vec;var diml:integer);
var
i,j:integer;
//dos variables para el for
begin
for i := 1 to diml do begin
//recorre el vec
	if (v[i].cantasistencias = 0)then
	//si en la posicion del vector cantasistencias vale 0
		begin
		for j := i to diml do 
		//inicia otro for desde la posicion i hasta el final de mi arreglo
		v[j]:= v[j+1];
		diml:= diml-1
	end;
end; 
end;
procedure mostrarv (v:vec;diml:integer);
var
i:integer;
begin
for i := 1 to diml do begin
	writeln ('alumno numero = ' , i );
		writeln ('numero de alumno es = ' ,v[i].nroalu);
		writeln ('la cantidad de asistencias = ', v[i].cantasistencias);
		writeln ('apellido = ',v[i].apellido);
		writeln ('nombre = ',v[i].nombre);
		end;
end;
var
v:vec;
diml:integer;
nalu:integer;
ealu:integer;
nroalu:integer;
begin
leeralu (v,diml);
writeln ('ingrese un numero de alumno para buscar'); //modulo a
readln (nalu);
writeln ('el alumno esta en la posicion = ',pos(v,diml,nalu));
insertaralu (v,diml);
writeln ('ingrese la posicion que desea eliminar');
readln (ealu);
eliminar(v,diml,ealu);
writeln ('ingrese el nro de alumno que desea eliminar');
readln(nroalu);
elinroalu(v,diml,nroalu);// Un módulo que reciba un nro de alumno y elimine dicho alumno del vector
asistencias0(v,diml);//Un módulo que elimine del vector todos los alumnos con cantidad de asistencias en 0.
 mostrarv (v,diml);
end.

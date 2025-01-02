{Una cátedra dispone de información de sus alumnos (a lo sumo 1000). De cada alumno se conoce nro de
alumno, apellido y nombre y cantidad de asistencias a clase. Dicha información se encuentra ordenada por
nro de alumno de manera ascendente. Se pide:
a. Un módulo que retorne la posición del alumno con un nro de alumno recibido por parámetro. El
alumno seguro existe.
b. Un módulo que reciba un alumno y lo inserte en el vector.
c. Un módulo que reciba la posición de un alumno dentro del vector y lo elimine.
d. Un módulo que reciba un nro de alumno y elimine dicho alumno del vector
e. Un módulo que elimine del vector todos los alumnos con cantidad de asistencias en 0.
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
apos:= apos+1;
end;
if  (apos <= diml) and (v[apos].nroalu = nalu) then 
	pos:= apos
	else
	pos:=-1;
end;
	




var
v:vec;
diml:integer;
nalu:integer;
begin
leeralu (v,diml);
writeln ('ingrese un numero de alumno para buscar');
readln (nalu);
writeln ('el alumno esta en la posicion = ',pos(v,diml,nalu));
end.


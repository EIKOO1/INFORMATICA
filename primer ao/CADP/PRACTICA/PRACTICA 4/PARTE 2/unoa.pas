{Realice un programa que resuelva los siguientes incisos:
a. Lea nombres de alumnos y los almacene en un vector de a lo sumo 500 elementos. La lectura finaliza
cuando se lee el nombre ‘ZZZ’, que no debe procesarse.
b. Lea un nombre y elimine la primera ocurrencia de dicho nombre en el vector.
c. Lea un nombre y lo inserte en la posición 4 del vector.
d. Lea un nombre y lo agregue al vector.
Nota: Realizar todas las validaciones necesarias.}
program dos ;
const
	dimf= 500;
type 
	vec  = array [1..dimf] of string[20];
procedure cargarv(var v:vec; var diml:integer);
var
n:string[20];
begin
diml:= 0;
	writeln('ingrese nombre '); readln(n);
	while (diml < dimf) and (n <> 'ZZZ')do begin
		diml:= diml+1;
		v[diml]:= n;
		writeln('ingrese otro nombre');
		readln(n);
end;
end;
procedure mostrarv(v:vec;diml:integer);
var
i:integer;
begin
	for i := 1 to diml do 
	writeln(v[i]);
end;





procedure eliminar (var v:vec;var diml:integer);

var 
pos,i:integer;
n:string[20];
ok:boolean;
begin
ok:= false;
pos:= 1;
writeln('ingrese nombre a eliminar '); readln (n);
while ( ok = false ) and (pos <= diml)do begin
	if ( v[pos] =n)then begin
		ok:= true;
		diml:= diml-1;
		for i:= pos to diml do 
			v[i]:= v[i+1];
			end
		else 
		pos:= pos+1;
end;
if (ok=true) then
	writeln('lo elimine gil')
	else
		writeln('no lo elimine por gay');
end;
		
	














var
v:vec;
diml:integer;

begin
cargarv ( v,diml);

eliminar (v,diml);
mostrarv(v,diml);
end.

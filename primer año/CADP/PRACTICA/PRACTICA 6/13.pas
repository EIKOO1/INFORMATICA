{
* El Portal de Revistas de la UNLP está estudiando el uso de sus sistemas de edición electrónica por parte
de los usuarios. Para ello, se dispone de información sobre los 3600 usuarios que utilizan el portal. De
cada usuario se conoce su email, su rol (1: Editor; 2. Autor; 3. Revisor; 4. Lector), revista en la que
participa y cantidad de días desde el último acceso.
a. Imprimir el nombre de usuario y la cantidad de días desde el último acceso de todos los usuarios
de la revista Económica. El listado debe ordenarse a partir de la cantidad de días desde el último
acceso (orden ascendente).
b. Informar la cantidad de usuarios por cada rol para todas las revistas del portal.
c. Informar los emails de los dos usuarios que hace más tiempo que no ingresan al portal.
* 																							}
program trece;
const
dimf =  2;
dimc= 4;
type
subrango =  1..4;
usuarios = record
email: string[30];
rol:subrango;
revista:string;
cantdias:integer;
end;
veccontador = array [subrango] of integer;
vec = array [1..dimf]of usuarios;
lista =  ^nodo;
nodo= record
dato:usuarios;
sig:lista;
end;
procedure cargarvector (var v:vec);
var
u:usuarios;
i:integer;
begin
for i := 1 to dimf do
begin
writeln ('email = ' ); readln (u.email);
writeln ('rol = '); readln (u.rol);
writeln ('revista a la que pertenece '); readln (u.revista);
writeln ('Cantidad de dias del ultimo acceso'); readln (u.cantdias);
v[i]:= u;

end;
end;
procedure insertarordenado (var l:lista;v:usuarios);
//ingreso en orden los elementos que cumplan la condicion 
var 
nuevo,anterior,actual:lista;
begin
new (nuevo);
nuevo^.dato:= v;
anterior:= l;
actual:= l;
//preparo mis punteros
while (actual <> nil) and (v.cantdias < actual^.dato.cantdias) do
//mientras actual no se pase de la lista y cantidad de dias sea menor a lo esta en mi lista
begin
anterior:= actual;
actual:= actual^.sig;
end;
if (actual = anterior)then
	l:= nuevo
else
anterior^.sig:= nuevo;
nuevo^.sig:= actual;
end;


procedure inicializarvc(var vc:veccontador);
var
i:integer;
begin
	for i := 1 to 4 do
		vc[i]:= 0;
end;
procedure actualizarmaximos (v:usuarios; var max1,max2:usuarios);
begin
if (v.cantdias > max1.cantdias) then
begin
max2:= max1;
max1:= v;
end
else
if (v.cantdias > max1.cantdias)then
max2:= v;
end;
procedure mostrarvectorcontador (vc:veccontador);
var
i:integer;
begin
for i := 1 to dimc do
	writeln (' la cantidad de gente en el rol ',i , ' es = ',vc[i]);
	end;
procedure contarenvector (var vc:veccontador; r:integer);
begin
vc[r]:= vc[r]+1;
end;
procedure recorrervec(v:vec;var l:lista; var vc:veccontador);

var
i: integer;
max1,max2:usuarios;
begin
inicializarvc(vc);
max1.cantdias:= -1;
max2.cantdias:= -1;
for i := 1 to dimf do
begin
	if (v[i].revista = 'Economica') then
	
	insertarordenado(l,v[i]);	
		contarenvector (vc,v[i].rol);
	actualizarmaximos (v[i],max1,max2);
end;
writeln ('los emails de los dos con mas cantidad de dias sin conectarse son ', max1.email,' y ' , max2.email);
mostrarvectorcontador(vc);
end;




procedure mostrarlista(l:lista);
var
aux:lista;
begin
aux:= l;
while (aux <> nil) do begin
writeln (aux^.dato.email);
writeln (aux^.dato.cantdias);
aux:= aux^.sig;
end;

end;


var
v:vec;
l:lista;
vc:veccontador;
begin
cargarvector(v); //se dispone
recorrervec(v,l,vc);
mostrarlista (l);
end.


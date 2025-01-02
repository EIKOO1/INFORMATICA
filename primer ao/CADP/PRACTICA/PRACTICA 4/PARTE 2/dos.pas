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
	//mientras que la dimension logica sea menos o igual a dimension fisica y el nombre no sea 'ZZZ' 
		diml:= diml+1;
		v[diml]:= n;
		writeln('ingrese otro nombre');
		readln(n);
		//incremento la dimension logica y a esa posicion le asigno el nombre 
			//leo otro nombre
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
//recorro el vector desde un principio para encontrar el nombre que debo eliminar porque esta desordenado
writeln('ingrese nombre a eliminar '); readln (n);
while ( ok = false ) and (pos <= diml)do begin
//mientras no encuentre el nombre que busco y posicion sea menor o igual a la dimension logica 
	if ( v[pos] =n)then begin
	 //si lo que hay en la posicion  es el nombre que busco
		ok:= true;
		diml:= diml-1;
		//ok se hace true haciendo que termine el while y decremento la dimension logica
		for i:= pos to diml do 
		// recorro desde la posicion del nombre que elimino hasta lo que hay al final de mi arreglo 
			v[i]:= v[i+1];
			// lo que hay en esa posicion le asigno lo que hay en la siguiente
			end
		else 
		pos:= pos+1;
		// sino le sumo 1 a pos para leer lo que hay en la siguiente posicion del vector
end;
//termina el while
if (ok=true) then
	//si ok sale de el while en verdadero
	writeln('lo elimine gil')
	else
		writeln('no lo elimine por gay');
end;
procedure insertar  (var v:vec; var diml:integer);
// c. Lea un nombre y lo inserte en la posición 4 del vector.
var
n:string[20];
i:integer;
begin
pude:= false;
writeln ('ingrese el nombre que desea insertar'); 
	readln(n);
	if ( diml+1 <= dimf)then
	begin
	//mientras la dimension logica más un elemento sea menor o igual a el espacio del vector
	for i := diml downto 4 do  
		v[i+1]:= v[i];
		pude:=true;
		v[4]:= n;
			//en la posicion siguiente le inserto lo que estaba en la posicion anterior
			//la posicion le inserto el valor una vez hago el corrimiento
		diml:= diml+1;
			//incremento la dimension logica 
	end
else 
writeln('no hay espacio en el vector');
end;
procedure agregar (var v:vec; var diml:integer);
var
n:string;
begin
writeln (' ingrese el valor que desea agregar ' );
readln (n);
if (diml+1 <= dimf)then 
begin
diml:= diml+1;
v[diml]:= n + ' <---- agregado';
end;
end;
var
v:vec;
diml:integer;

begin
cargarv ( v,diml); // cargo el vector con los nombres inciso a 
eliminar (v,diml); //inciso b
insertar (v,diml);//inciso c
agregar(v,diml);//inciso d
mostrarv(v,diml);//muestro el vector con todos los incisos
//GG
end.

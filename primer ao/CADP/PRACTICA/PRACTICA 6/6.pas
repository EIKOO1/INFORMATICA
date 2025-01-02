program seis;
type
cadena = string[20];
subrango = 1..7;
sonda = record
nombre:cadena;
duracion:integer;
costoc,costom:real;
rango:subrango;
end;

vc =  array [subrango] of integer;


lista =  ^nodo;

nodo = record
dato: sonda;
sig:lista;
end;

procedure leersonda (var s:sonda);
begin
writeln ('ingrese nombre ') ; readln (s.nombre);
writeln (' ingrese duracion ' ); readln (s.duracion);
writeln (' ingrese costo de construccion ' ); 
readln (s.costoc);
writeln (' ingrese costo de mantenimiento ' );
 readln (s.costom);
writeln ('ingrese rango');
readln (s.rango);
end;
procedure agregaradelante(var l:lista; s:sonda);
var
nuevo:lista;
begin
new(nuevo);
nuevo^.dato:= s;
nuevo^.sig:= l;
l:= nuevo;
end;
procedure cargarlista(var l:lista);
var
s:sonda;
begin
	repeat
	leersonda (s);
	agregaradelante(l,s);
	until (s.nombre = 'GAIA');
end;

procedure inicializar (var v:vc);
var
i:subrango;
begin
for i := 1 to 7 do 
	v[i]:= 0;
	
end;
procedure actualizarmax ( aux:lista; var cost:real;var nommax:string);
var
result:real;
begin
result:= (aux^.dato.costoc)+(aux^.dato.costom);
	if (result>cost)then
	begin
			cost:= result;
			nommax:= aux^.dato.nombre;
			end;
end;
procedure recorrolista1(l:lista;var v:vc;var dd:real; var cc:real);
{a. El nombre de la sonda más costosa (considerando su costo de construcción y de mantenimiento). //MODULO HECHO
b. La cantidad de sondas que realizarán estudios en cada rango del espectro electromagnético.
c. La cantidad de sondas cuya duración estimada supera la duración promedio de todas las sondas. // 2 recorrida
d. El nombre de las sondas cuyo costo de construcción supera el costo promedio entre todas las
sondas.}
var
aux:lista;
t:integer;
begin
aux:=l;
dd:= 0;
cc:= 0;
t:= 0;
while (aux <> nil) do begin
	t:= t+1;
	v[aux^.dato.rango]:= v[aux^.dato.rango] +1; //cargo el vector para el inciso b
	dd:= dd+ aux^.dato.duracion;
	cc:= cc+aux^.dato.costoc;
		aux:= aux^.sig;
	end;
dd:= dd/t;
cc:= cc/t;
end;



procedure recorrerlista2(l:lista; dd:real; cc:real);
var
cantduracion:integer;
aux:lista;
cost:real;
nommax:string[20];
begin 
aux:= l;
cost:= -1;
cantduracion:= 0;
	while (aux <> nil) do 
	begin
		actualizarmax (aux,cost,nommax);
			
		if (aux^.dato.duracion > dd)then
			cantduracion:= cantduracion+1;
		if (aux^.dato.costoc > cc)then
			writeln ('SUPERA EL COSTO PROMEDIO DE CONSTRUCCION = ' ,aux^.dato.nombre);
		aux:= aux^.sig;
	end;
writeln ('la cantidad de sondas cuya duracion estimada supera la duracion promedio = ', cantduracion);
writeln ('el maximo es ', nommax);
end;
procedure mostrav (v:vc);
var
i:subrango;
begin
for i := 1 to 7 do 
begin
	writeln ('en el rango', i ,' la cantidad de sondas es = ' , v[i]);
end;


end;
//programa principal
var
l:lista;
v:vc;
dd,cc:real; //dd duraciontotal cc costoconstruccion
begin
l:= nil;
inicializar(v);
cargarlista (l);
recorrolista1(l,v,dd,cc);
recorrerlista2(l,dd,cc);
mostrav(v);
end.

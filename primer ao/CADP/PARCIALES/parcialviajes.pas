{una empresa de ventas de pasajes en colectivo esta analizando la informacion de los viajes realizados a mar del plata en el ultimo año.para ello se dispone de una
estructura de datos con la infomracion de todos los viajes realizados, de cada viaje se conoce el codigo de viaje,el numero de coche (entre 1000 y 2500),el mes en que
se realizo el viaje,cantidad de pasajes vendidos y el dni deel chofer.La informacion no se encuentra ordenada por ningun criterio.
ademas, la empresa dispone de una estructura de datos con informacion sobre la capacidad maxima de cada coche.
Realizar un programa que procese la informacion de los viajes:
A.INFORME EL NUMERO DE COCHE CON EL CUAL SE REALIZARON MAS VIAJES //vector maximos
B.GENERE UNA LISTA CON LOS VIAJES REALIZADOS EN EL MES 2 POR UN CHOFER CON
DNI MULTIPLO DE 10,DONDE LA CANTIDAD DE PASAJES VENDIDOS NO ALCANZA LA CAPACIDAD
MAXIMA DEL COCHE
C.PARA CADA COCHE,INFORME EL PROMEDIO DE PASAJEROS QUE VIAJARON ENTRE TODOS SUS VIAJES} 

program parcialmardel;
TYPE
meses =  1..12;
subrango =1000..2500;
viajes =  record;
	cod:integer;
	num:subrango;
	mes:meses;
	cantpasajes:integer;
	dni:integer;
	end;

lista = ^nodo;

nodo = record
	dato:viajes;
	sig:lista;
	end;
	
vcapacidad = array [subrango] of integer;

infocoche = record
	cantpasajeros:integer;
	cantviajes:integer;
	end;	
vcoche = array [subrango] of infocoche;

procedure inicializarvectorcontador (var vc:vcoche);
var
i:integer;
begin
	for i := 1000 to 2500 do
	begin
		v[i].cantpasajeros:=0;
		v[i].cantviajes:=0;
	end;
end;

procedure agregaradelante (var l2:lista;d:viajes);
var
nuevo:lista;
begin
	new (nuevo);
	nuevo^.dato:= d;
	nuevo^.sig:= nil;
	if (l2=nil) then
		l2:=nuevo
	else
		begin
		nuevo^.sig:= l2;
		l2:=nuevo;
		end;
end;

procedure recorrerlista (l:lista;var l2:lista;var vc:vcoche;v:vcapacidad);
var
aux:lista;
pasajes:integer;
c:integer;
begin
	aux:= l;
	l2:=nil;
	while (aux<>nil) do 
	begin
		pasajes:= aux^.dato.cantpasajes;
		c:= aux^.dato.cod;
		vc[c].cantpasajeros:= vc[c].pasajeros + pasajes;
		vc[c].cantviajes:= vc[c].cantviajes+1;
		if (aux^.dato.mes =2) and ((aux^.dato.dni) mod 10 = 0) and (aux^.dato.cantpasajes < v[c]) //B
			agregaradelante(l2,aux^.dato);
		aux:= aux^.sig;
	end;
end;

function calcularpromedio (cantp:integer;cantv:integer);
begin
	calcularpromedio:= cantp/cantv;
end;

procedure calcularmax(i:integer;cantv:integer,var max:integer,var posmax:integer);
begin
	IF (cantv>max)then
	begin
		max:= cantv;
		posmax:=i;
	end:
end;

procedure recorrervector (vc:vcoche)
var
i:integer
max:integer;
posmax:integer;
begin
	max:-1;
	for i:= 1000 to 2500 do 
	begin
		writeln ('el promedio de pasajeros en el coche ', i ,'son = ',(calcularpromedio(v[i].cantpasajeros,v[i].cantviajes):2:2); 
		calcularmax(i,v[i].cantviajes,max,posmax);
	end;
	writeln ('el coche con el que se realizaron mas viajes es ',posmax);
end;
  
var
l:lista;
v:vcapacidad;
vc:vcoche;
begin
l:= nil;
cargarlista(l); //dispone
inicializarvectorcontador(vc);
recorrerlista (l,l2,vc,v);
recorrervector (vc);
end;

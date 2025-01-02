{Una empresa desarrolladora de juegos para teléfonos celulares con Android dispone de información de
todos los dispositivos que poseen sus juegos instalados. De cada dispositivo se conoce la versión de
Android instalada, el tamaño de la pantalla (en pulgadas) y la cantidad de memoria RAM que posee
(medida en GB). La información disponible se encuentra ordenada por versión de Android. Realizar un
programa que procese la información disponible de todos los dispositivos e informe:
a. La cantidad de dispositivos para cada versión de Android.
b. La cantidad de dispositivos con más de 3 GB de memoria y pantallas de a lo sumo a 5 pulgadas.
c. El tamaño promedio de las pantallas de todos los dispositivos.}
program doce ;
type 
android =  record
version:integer;
pantalla:real;
ram:integer;
end;

lista = ^nodo;

nodo =  record
dato:android;
sig:lista;
end;
procedure ingresardispositivo (var a:android);
begin
	writeln ('INGRESE VERSION DE DISPOSITIVO'); readln (a.version);	
		if (a.version <> -1) then
		begin
	writeln ('INGRESE PULGADAS DE LA PANTALLA'); readln (a.pantalla);
	writeln ('INGRESE CANTIDAD DE MEMORIA RAM ' ); READLN (a.ram);
	end;
end;
procedure agregaradelante (var l,ult:lista ; a:android);
var
nuevo:lista;
begin
new (nuevo);
nuevo^.dato := a;
nuevo^.sig:= nil;
	if (l = nil ) then
	begin
		l:= nuevo;
		ult:= nuevo;
	end
	else
		ult^.sig:= nuevo;
		ult:= nuevo;
end;
procedure cargarlista (var l,ult:lista );
var
a:android;
begin
	ingresardispositivo(a);
		while (a.version <> -1) do
		begin
			agregaradelante (l,ult,a);
			ingresardispositivo (a);
		end;
end;
procedure cortecontrol (l:lista);
var
cantdispositivo:integer;
cantb:integer;
cantc:integer;
cantpantalla:real;
versionactual:integer;
aux:lista;
begin
aux:= l;
cantc:=0;
cantb:=0;
cantpantalla:= 0;
	while (aux <> nil ) do 
	begin
		versionactual:= aux^.dato.version;
		cantdispositivo:= 0;
		while (aux<>nil) and(aux^.dato.version = versionactual) do 
		begin
		if (aux^.dato.ram > 3) and (aux^.dato.pantalla >= 5) then
		begin
			cantb:= cantb+1;
			end;
		cantc:= cantc+1;
		cantpantalla:= cantpantalla+ l^.dato.pantalla;
		cantdispositivo:= cantdispositivo+1;
		
aux:= aux^.sig;
end;
	writeln (' la cantidad de celulares leidos de la version ', versionactual, ' es  = ',cantdispositivo);
	end;
writeln ('la cantidad de dispositivo con mas 3 de memoria y pantalla de a lo sumo 5 pulgadas es = ',cantb);
writeln('el tamaño promedio de las pantallas es = ', (cantpantalla/cantc):2:2);
end;

procedure mostrarlista (l:lista);
var
aux:lista;
begin
aux:= l;
while (aux <> nil) do 
begin
	writeln (aux^.dato.version);
	writeln (aux^.dato.pantalla:2:2);
	writeln (aux^.dato.ram);
	aux:= aux^.sig;
end;
end;
var
l:lista;
ult:lista;
begin
l:= nil;

ult:=nil;
cargarlista (l,ult);
mostrarlista(l);
cortecontrol(l);

end.
{b. La cantidad de dispositivos con más de 3 GB de memoria y pantallas de a lo sumo a 5 pulgadas.
c. El tamaño promedio de las pantallas de todos los dispositivos.}

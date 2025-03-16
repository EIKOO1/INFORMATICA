{un teatro esta analizando la informacion de los tickets vendidos durante el año 2022 para ello, se dispone de una estructura de datos con la informacion de todos 
los tickets vendidos.De cada ticket se conoce el codigo del evento,dni del comprador,mes de la funcion (entre 1 y 12) y
ubicacion (1:palco,2:pullman,3:platea alta;4:platea baja).
LA INFORMACION SE ENCUENTRA ORDENADA POR CODIGO DE EVENTO.
Ademas,la empresa dispone de una estructura de datos con informacion del costo del ticket por ubicacion
realizar un programa que procese la informacion de los viajes y:
A. genere una lista qeu tanga por cada codigo de evento,la cantidad de tickets vendidos
B.Informe el mes con mayor monto recaudado
C. COMPLETO Informe el promedio recaudado por cada evento entre todos sus tickets.}
program PARCIALTEATRO;
type
teatro=1..4;
meses = 1..12;

//lista 1

ticket = record
	cod:integer;
	dni:integer;
	mes:meses;
	ubicacion:teatro;
	end;

lista = ^nodo;

nodo =  record
dato:ticket;
sig:lista;
	end;

//lista 2

evento = record
	codevento:integer;
	tickets:integer;
	end;
	
lista2= ^nodo2;

nodo2= record
	datos:evento;
	sig:lista2;
	end;

vecubicacion = array [teatro] of real;

vmes =  array [meses] of real;

procedure agregaradelante (var l2:lista2;cant:integer;cod:integer);
var
nuevo:lista2;
d:evento;
begin
	d.codevento:= cod;
	d.tickets:= cant;
	new (nuevo);
	nuevo^.dato:= d;
	nuevo^.sig:=nil;
	if (l2=nil)then
		l2:= nuevo;
	else
		begin
		nuevo^.sig:= l2;
		l2:= nuevo;
		end;
end;
	
procedure inicializarvector(var vecmes);
var
i:integer;
begin
	for i := 1 to 12 do
		begin
			v[i]:=0;
		end;
	
end:

function promedio (cantticket:integer; montototal:real):real;
begin
	promedio:= montototal/cantticket;
end;

procedure recorrerlista (l:lista; var l2:lista2; v:vecubicacion,var vecmes:vmes);
var
aux:lista;
codactual:integer;
cantticket:integer;
t:ticket;
montototal:real;
begin
	aux:= l;
		while (aux <> nil) do
		begin
			codactual:= aux^.dato.cod;
			cantticket:=0;
			montototal:=0;
				while (aux <> nil) and (aux^.dato.cod = codactual) do
				begin
					t:= aux^.dato;
					cantticket:= cantticket+1;
					vecmes[t.mes]:= vecmes[t.mes]+v[t.ubicacion]);
					montototal:= montototal+v[t.ubicacion]);
					aux:= aux^.sig;	
				end;
			agregaratras(l2,cantticket,t.cod); //A
			writeln ('el promedio recaudado es de = ',( promedio(cantticket,montototal)):2:2);	//C
		end;
end;	

procedure calcularmax (monto:real;i:integer;var max:real; var posmax:integer);
begin
	if (monto > max) then
	begin
		max:=monto;
		posmax:= i;
	end;
end;
procedure recorrervector(vecmes:vmes);
var
i:integer;
max:real;
posmax:integer;
begin
	max:=0;
	for i := 1 to 12 do
	begin
		calcularmax(v[i].mes,i,max,posmax);
	end;
	Writeln ('el mes que mas recaudo fue ' , i , 'con = $',max);
end;
var
l:lista;
l2:lista2;
vubi:vecubicacion;
vecmes:vmes;
begin
	l:= nil;
	l2:=nil;
	cargarlista(v); //se dispone
	cargarvectorubicacion(vubi); //se dispone
	inicializarvector (vecmes)
	recorrerlista(l,l2,vubi,vecmes);
	recorrervector(vecmes); //B
end;
A. genere una lista q tenga por cada codigo de evento,la cantidad de tickets vendidos
B.Informe el mes con mayor monto recaudado
C. COMPLETO Informe el promedio recaudado por cada evento entre todos sus tickets.}

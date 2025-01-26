{
*Un comercio dispone de la informacion de sus clientes. De ada cliente se conoce DNI,fecha y monto de la compra.La informacion está 
ordenada por el dni del cliente.Se pide implementar un programa que genere una estructura de datos que contenga DNI del cliente,
la cantidad de compras que realizo y el monto total de las compras.Solo con los clientes que realizaron mas de 5 compras
}

program FinalComercio;
type

fec= record
	dia:integer;
	mes:integer;
	ano:integer;
	end;
	
cliente = record
	dni:integer;
	fecha:fec;
	montoTotal:integer;
	end;

lista = ^nodo;

nodo = record
	dato:cliente;
	sig:lista;
	end;
cli=  record
	dni:integer;
	montoT:integer;
	end;
lista2= ^nodo2;

nodo = record
	dato:cli;
	sig:lista2;
	end;
procedure agregarAdelante(var l2:lista2;dniActual:integer;montoT:integer);
var
	nuevo:lista2;
begin
	new (nuevo);
	nuevo^.dato.dni:=dniActual;
	nuevo^.dato.montoT:=montoT;
	nuevo^.sig:=l2;
	l2:=nuevo;
end;	
	
procedure procesarLista(l:lista; var l2:lista2);
var
	cantVenta:integer;
	dniActual:integer;
	montoT:integer;
begin
	while (l<>nil)do
		begin
		cantVenta:=0;
		dniActual:=l^.dato.dni;
		montoT:=0;
		while ((l<>nil) and (dniActual=l^.dato.dni)) do
			begin
				cantVenta:=cantVenta+1;
				montoT:=montoT+l^.dato.montoTotal;
				l:=l^.sig;
			end;
		if (cantVenta>5)then
			agregarAdelante(l2,dniActual,montoT);
		end;
	
end;	

var
	l:lista;
	l2:lista2;
BEGIN
	l:=nil;
	l2:=nil;
	cargarLista(l); //se dispone
	procesarLista(l,l2);
	
	
END.


program FinalTarjetayEfectivo;
type

ventas =  record
	num:integer;
	cantP:integer;
	tipoPago:String;
end;

lista =  ^nodo;

nodo = record
	dato:ventas;
	sig:lista;
end;

procedure agregarAdelante(var l:lista; v:ventas);
var
	nuevo:lista;
begin
	new (nuevo);
	nuevo^.sig:=nil;
	nuevo^.dato:=v;
	if (l=nil)then
		l:=nuevo
	else
		begin
			nuevo^.sig:=l;
			l:=nuevo;
		end;
end;

procedure cargarLista(var l:lista);
var
	v:ventas;
begin
	writeln('Ingrese numero de venta'); readln(v.num);
	while (v.num <> -1) do
		begin
		writeln('Ingrese cantidad de productos'); readln(v.cantP);
		writeln('ingrese tipo de pago'); readln (v.tipoPago);
			agregarAdelante(l,v);
		writeln ('numero de venta'); readln (v.num);
end;
end;
function masPares(num:integer):boolean;
var
	dig:integer;
	pares,impares:integer;
begin
	pares:=0;
	impares:=0;
	while ( num <> 0) do
		begin
			dig:= num mod 10;
			if ( dig mod 2 = 0)then
				pares:=pares+1
			else
				impares:=impares+1;
		num:= num div 10;
		end;
	if (pares <impares)then
		masPares:=false;
end;

procedure agregarAtras(var l2:lista;v:ventas);
var
	nuevo:lista;
	aux:lista;
begin
	new (nuevo);
	nuevo^.dato:=v;
	nuevo^.sig:=nil;
	if (l2=nil)then
		l2:=nuevo
	else
		begin
			aux:=l2;
			while (aux^.sig <> nil)do
				aux:=aux^.sig;
			aux^.sig:=nuevo;
		end;
end;
procedure procesarLista(l:lista;var l2:lista);

begin
	while (l <> nil)do
		begin
			if (masPares(l^.dato.cantP))then
				if (l^.dato.tipoPago = 'Efectivo')then
					agregarAdelante(l2,l^.dato)
				else
					agregarAtras(l2,l^.dato);
			l:=l^.sig;
		end;
end;
procedure mostrarLista(l:lista);
begin
	while (l<> nil)do
		begin
			writeln (' NUMERO DE VENTA ' , l^.dato.num);
			writeln (' CANTIDAD DE PRODUCTOS',l^.dato.cantP);
			writeln ('Tipo de producto',l^.dato.tipoPago);
			l:=l^.sig;
		end;
end;
var
l:lista;
l2:lista;
begin
	l:=nil;
	l2:=nil;
	cargarLista(l); //cargar lista se dispone tecnicamente;
	procesarLista(l,l2);
	writeln ('Lista 1');
	mostrarLista(l);
	writeln('Lista 2');
	mostrarLista(l2);
end.

program FinalVentas;
type

fec =  record
	dia:integer;
	mes:integer;
	ano:integer;
	end;

venta =  record
	codP:integer;
	dni:integer;
	fecha:fec;
	cantidad:integer;
	precUnit:integer;
	end;

lista = ^nodo;

nodo=record
	dato:venta;
	sig:lista;		// se dispone tecnicamente;
	end;

cliente = record
	dni:integer;
	montoTotal:integer;
	end;
	
lista2 = ^nodo2;

nodo2=record
	dato:cliente;
	sig:lista2;
	end;

procedure ingresarFecha(var f:fec);
begin
	writeln ('DIA'); readln (f.dia);
	writeln('MES'); readln (f.mes);
	writeln('AÑO'); readln (f.ano);
end;

procedure agregarLista(var l:lista;v:venta);
var
	nuevo:lista;
begin
	new (nuevo);
	nuevo^.sig:=nil;
	nuevo^.dato:=v;
	if (l = nil)then
		l:=nuevo
	else
		begin
			nuevo^.sig:=l;
			l:=nuevo;
		end;
end;

procedure cargarLista(var l:lista);
var
	v:venta;
begin
	writeln ('INGRESE CODIGO DE PRODUCTO : ');readln(v.codP);
		while (v.codP <> 0) do
			begin
				writeln ('INGRESE DNI CLIENTE : ');readln(v.dni);
				ingresarFecha(v.fecha);
				writeln('CANTIDAD DE PRODUCTOS : ');readln(v.cantidad);
				writeln('Precio Unitario : ');readln(v.precUnit);
				agregarLista(l,v);
				writeln ('INGRESE CODIGO DE PRODUCTO : ');readln(v.codP);
			end;
end;

procedure agregarAlaLista(var l2:lista2;dato:venta);
var
	nuevo:lista2;
	anterior,actual:lista2;
begin
	anterior:=l2;
	actual:=l2;
	while((actual <>nil)and(actual^.dato.dni<>dato.dni))do
		begin
			anterior:=actual;
			actual:=actual^.sig;
		end;
	if (actual = nil)then
		begin
			new (nuevo);
			nuevo^.sig:=nil;
			nuevo^.dato.dni:=dato.dni;				//crea un usuario nuevo
			nuevo^.dato.montoTotal:=0;
			anterior^.sig:=nuevo;
		end
	else
		if (actual^.dato.dni=dato.dni)then
			actual^.dato.montoTotal:=(actual^.dato.montoTotal+(dato.precUnit*dato.cantidad));
end;
		
		
procedure procesarLista(l:lista;var l2:lista2);
begin
	while (l <>nil)do
		begin
			agregarAlaLista(l2,l^.dato);
			l:=l^.sig;
		end;
end;

procedure mostarLista(l2:lista2);
begin
	while (l2<>nil)do
		begin
			writeln ('DNI DEL CLIENTE', l2^.dato.dni);
			writeln('MONTO TOTAL ', l2^.dato.montoTotal);
		end;
end;


var
	l:lista; l2:lista2;
begin
l:=nil;
l2:=nil;
cargarLista (l);
procesarLista(l,l2);
mostarLista(l2);
end.

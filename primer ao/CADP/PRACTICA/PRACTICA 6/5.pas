{Realizar un programa que lea y almacene la información de productos de un supermercado. De cada
producto se lee: código, descripción, stock actual, stock mínimo y precio. La lectura finaliza cuando se
ingresa el código -1, que no debe procesarse. Una vez leída y almacenada toda la información, calcular
e informar:
a. Porcentaje de productos con stock actual por debajo de su stock mínimo.
b. Descripción de aquellos productos con código compuesto por al menos tres dígitos pares.
c. Código de los dos productos más económicos}
program cinco;
type
producto = record
codigo:integer;
descripcion:string;
stockac:integer;
stockmin:integer;
precio:real;
end;
lista = ^nodo;
nodo =  record
datos:producto;
sig:lista;
end;
procedure max (p:producto;var min1,min2:producto);
begin
if (min1.precio < p.precio)then
begin
	min2:= min1;
	min1:=p ;
	end
	else
	if (min2.precio<p.precio)then
	min2:=p;
end;

procedure ingresardatos (var p:producto);
//ingresa datos del producto
begin
	writeln ('ingrese codigo = '); readln (p.codigo);
	if (p.codigo <> -1) then
	begin
			writeln ('ingrese descripcion = '); readln (p.descripcion);
			writeln ('ingrese stock actual ='); readln (p.stockac);
			writeln ('ingrese stock minimo = '); readln (p.stockmin);
			writeln ('ingrese precio = '); readln (p.precio); 
		end;
		end;
procedure agregaratras(var l:lista;var ult:lista;p:producto);
var
nuevo:lista;
begin
new (nuevo);
nuevo^.datos:= p;
nuevo^.sig:= nil;
if (l = nil) then
	begin
	l:= nuevo ;
	ult:= nuevo;
	end
else
	begin
	ult^.sig:= nuevo;
	ult:= nuevo;
	end;
end;
procedure cargarlista (var l:lista;var ult:lista; var cantprod,cantd:integer;var min1,min2:producto);
var
p:producto;
begin
ingresardatos(p);
	while (p.codigo <> -1) do 
	begin
	cantprod:= cantprod+1;
	max(p,min1,min2);
		agregaratras(l,ult,p);
		if (p.stockac < p.stockmin) then
			cantd:= cantd+1;
		ingresardatos(p);
	end;
end;
function par (l:lista):boolean;
var
num:integer;
cantpares:integer;
resto:integer;
espar:boolean;
begin
num:= l^.datos.codigo;
cantpares:= 0;

while (num <> 0 ) do 
begin
resto:= num mod 10;
	if (resto mod 2 = 0) then
		cantpares:= cantpares+1;
num:= num div 10;
end;

if (cantpares >=3) then
	espar:= true
	else
	espar:= false;
par:= espar;
end;


procedure mostrardatos(l:lista);
var
aux:lista;
begin
aux:= l;	
	while ( aux <> nil )do 
	begin
	writeln ('el codigo es = ' ,l^.datos.codigo);
	writeln (' descripcion = ', l^.datos.descripcion);
		if (par(aux)= true) then 
			writeln ('la descripcion del producto con codigo compues por al menos tres digitos pares  = ',aux^.datos.descripcion)
				else
					writeln ('no capo');
			writeln (' stock actual = ',l^.datos.stockac);
			writeln (' stock minimo = ',l^.datos.stockmin);
			writeln (' precio = ',(l^.datos.precio):2:2);
			aux:= aux^.sig;
	end;
end;
var
l:lista;
ult:lista;
cantprod:integer;
	cantd:integer;
min1,min2:producto;
begin
l:= nil;
ult:=nil;
min1.precio:=10000;
min2.precio:=10000;
cantprod:=0;
cantd:=0;
cargarlista(l,ult,cantprod,cantd,min1,min2);
writeln ('el porcentaje de producto debajo de su stock minimo es  ' , (cantd/cantprod*100):2:2); //EJERCICIO A
mostrardatos(l);
end.
{
a. Porcentaje de productos con stock actual por debajo de su stock mínimo. 
b. Descripción de aquellos productos con código compuesto por al menos tres dígitos pares. //EEEEEEEEEEEEEEEEEEEEEEEEEEJERCICIO B
c. Código de los dos productos más económicos.	//gogo
												}

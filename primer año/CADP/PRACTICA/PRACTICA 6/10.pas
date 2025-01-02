{Una empresa de sistemas está desarrollando un software para organizar listas de espera de clientes. Su
funcionamiento es muy sencillo: cuando un cliente ingresa al local, se registra su DNI y se le entrega un
número (que es el siguiente al último número entregado). El cliente quedará esperando a ser llamado
por su número, en cuyo caso sale de la lista de espera. Se pide:
a Definir una estructura de datos apropiada para representar la lista de espera de clientes.
//una lista con agregar atras y guardo un ultimo elemento miau
b. Implementar el módulo RecibirCliente, que recibe como parámetro el DNI del cliente y la lista de
clientes en espera, asigna un número al cliente y retorna la lista de espera actualizada.
c. Implementar el módulo AtenderCliente, que recibe como parámetro la lista de clientes en espera,
y retorna el número y DNI del cliente a ser atendido y la lista actualizada. El cliente atendido debe
eliminarse de la lista de espera.
d. Implementar un programa que simule la atención de los clientes. En dicho programa, primero
llegarán todos los clientes juntos, se les dará un número de espera a cada uno de ellos, y luego se
los atenderá de a uno por vez. El ingreso de clientes se realiza hasta que se lee el DNI 0, que no
debe procesarse.}
program diez;
type
cliente = record
dni:integer;
num:integer;
end;
lista=  ^nodo;
nodo= record
dato : cliente;
sig:lista;
end;


procedure agregaratras(var l,ult:lista;d:integer);
var
nuevo:lista;
begin
new (nuevo);
nuevo^.dato.dni:= d;
nuevo^.sig:=nil;
	if (l = nil ) then
		begin
			l:= nuevo;
			ult:= nuevo;
		end
	else
		l^.sig:= nuevo;
ult:= nuevo;

end;
procedure cargarlista (var l,ult:lista;var dni:integer);
//INGRESA EL CLIENTE
begin
writeln ('INGRESE DNI '); READLN (dni);
	while (dni <> 0)do 
	begin
		agregaratras (l,ult,dni);
		writeln ('INGRESE DNI');
		 readln (dni);
	end;
	//INGRESA EL CLIENTE

end;
procedure mostrarlista(l:lista);
var
aux:lista;
begin
aux:= l;
while (aux <> nil)do
begin
Writeln (aux^.dato.dni);
writeln (aux^.dato.num);
aux:= aux^.sig;
end;
end;
procedure atendercliente (var l:lista);
var
aux:lista;
n:integer;
begin
aux:= l;
	writeln ('cliente numero  =  ',aux^.dato.num);
writeln ('el cliente a ser atendido sera = ' , aux^.dato.dni);
	l:= l^.sig;
		writeln ('INGRESE 1 SI EL CLIENTE YA FUE ATENDIDO');readln(n);
		if (n = 1)then
	dispose(aux);

end;
var
l,ult:lista;
dni:integer;
begin
l:=nil;
ult:=nil;
cargarlista(l,ult,dni);
atendercliente (l);
	while (l <> nil) do
	begin
	atendercliente(l);
	end;
end.

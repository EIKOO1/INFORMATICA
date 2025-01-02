program JugamosConListas;
type
lista = ^nodo;
nodo = record
num : integer;
sig : lista;
end;
procedure armarNodo(var l: lista; v: integer);
var
aux : lista;
nuevo:lista;
begin
new(nuevo);
//genero un nuevo espacio en memoria dinamica
nuevo^.num := v;
//nuevo le asigno el valor que ingreso por teclado
nuevo^.sig := nil;
//la direccion a la que apunta es nil
if (l = nil) then 
	//si es el primer elemento 
l:= nuevo
//la direcion es la de nuevo
else

begin
aux:= l;
//posiciono a aux en la primera posicion de la lista
while (aux^.sig <> nil ) do
//mientras a lo que apunta aux sea distinto a nil
aux:= aux^.sig;
//aux recorre todo la lista
aux^.sig:= nuevo;
//al salir del while es porque aux^.sig es = nil entonces a esa direccion le asigno el nuevo elemento
end;
end;



procedure sumarvalores (l:lista;n:integer);
begin
while (l<> nil )do
begin
l^.num:=(l^.num)+n;
l:= l^.sig;
end;
end;



procedure leerl(l:lista);
begin
while (l <> nil )do 
begin
writeln (l^.num);
l:= l^.sig;
end;
end;


var
pri : lista;
valor : integer;
num:integer;
begin
pri := nil;
writeln('Ingrese un numero');
readln(valor);
while (valor <> 0) do begin
armarNodo(pri, valor);
writeln('Ingrese un numero');
read(valor);
end;
write ('ingrese el valor que desea sumar ' );read (num);
sumarvalores(pri,num);	
leerl(pri);
end.
{3. Utilizando el programa del ejercicio 1, realizar los siguientes cambios:
a. Modificar el módulo armarNodo para que los elementos se guarden en la lista en el orden en que
fueron ingresados (agregar atrás).
b. Modificar el módulo armarNodo para que los elementos se guarden en la lista en el orden en que
fueron ingresados, manteniendo un puntero al último ingresado}

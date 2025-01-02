program JugamosConListas;
type
lista = ^nodo;
nodo = record
num : integer;
sig : lista;
end;
procedure armarNodo(var L: lista; v: integer);
var
aux : lista;
begin
new(aux);
aux^.num := v;
aux^.sig := L;
L := aux;
end;



procedure sumarvalores (l:lista;n:integer);

begin
while (l<> nil)do
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

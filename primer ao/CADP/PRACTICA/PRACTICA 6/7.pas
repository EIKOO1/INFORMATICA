program JugamosConListas;
 type
  lista = ^nodo; 
  nodo = record 
  num : integer;
sig : lista;
end;
procedure armarNodo(var l: lista; v: integer); 
var 
aux:lista;
actual : lista;
anterior: lista;
begin 
new(aux);
aux^.num:= v;
actual:= l;
anterior:= l;
while (actual <> nil ) and ( v > actual^.num) do 
begin
anterior:= actual;
actual:= actual^.sig;
end;
if (actual = anterior) then
	l:= aux
	else
	anterior^.sig:= aux;
	aux^.sig:=actual;
end;
procedure mostrarlist(pri:lista);
var
aux:lista;
begin
aux:= pri;
while (aux <> nil ) do 
begin
	writeln (aux^.num);
	aux:= aux^.sig;
end;
end;
var
pri : lista; 
valor : integer;
begin
pri := nil;
writeln('Ingrese un numero'); read(valor);
while (valor <> 0)do
 begin
  armarNodo(pri, valor);
   writeln('Ingrese un numero');
read(valor);
end;
mostrarlist(pri);
 end.


program uno;
type
rango =  1..5;
casting = record
dni:integer;
nombre,apellido:string[20];
edad:integer;
genero:rango;
end;
vcontador =  array [rango] of integer;
lista = ^nodo;

nodo = record
dato:casting;
sig:lista;
end;

procedure cargandoactor (var c:casting);
begin
	writeln ('INGRESE EL DNI'); readln (c.dni);
	writeln ('APELLIDO'); readln (c.apellido);
	writeln ('NOMBRE');readln (c.nombre);
	writeln ('edad'); readln (c.edad);
	writeln ('GENERO DE ACTUACION'); readln (c.genero);
end;
	
procedure agregaradelante (var l:lista ; c:casting);
var
nuevo:lista;
begin
	new (nuevo); //genero espacio
	nuevo^.dato:= c;
	nuevo^.sig:= nil;
	if (l = nil) then //si es el primer elemento
		l:= nuevo	 //la lista deja de apuntar a nil y apunta al primer y nuevo nodo
	else			//sino
		begin
			nuevo^.sig:= l; // el siguiente elemento apuntara a el primer elemento de la lista
			l:=nuevo;	//y nuevo pasa a ser mi primer elemento de la lista;
		end;
end;

procedure crearlista (var l:lista);
var
c:casting;
begin
repeat
	cargandoactor (c); //cargo el registro
	agregaradelante (l,c); //lo ingreso en la lista
until (c.dni=3355);
end;

procedure descomponerdni (n:integer; var cantidadpares:integer);
var
par,impar:integer;
digito:integer;
begin
par:=0;
impar:=0;
	while (n <> 0) do
	begin
	digito:= n mod 10;	//Me quedo con el ultimo digito del dni
		if (digito mod 2= 0)then	
			par:= par+1
		else
			impar:= impar+1;
	n:= n div 10;
	end;
	if (par > impar)then
		cantidadpares:= cantidadpares +1;
end;

procedure inicializarvector ( var v:vcontador);
var
i:rango;
begin
	for i := 1 to 4 do 
		v[i]:= 0;
end;

procedure cargarvector (var v:vcontador; g:rango);
begin
	v[g]:= v[g]+1;
end;

procedure recorrerlista (l:lista;var v:vcontador);
{a.Informar la cantidad de personas cuyo DNI contiene más dígitos pares que impares. }
var
aux:lista;
n:integer;
cantidadpares:integer;
begin
	cantidadpares:= 0; 
	aux:=l ;//utilizo la variable lista para recorrer el lista
	while (aux <> nil) do 
	begin
		n:= aux^.dato.dni;
		descomponerdni (n,cantidadpares); //A
		cargarvector (v,aux^.dato.genero); 
		
		aux:= aux^.sig;
	end;
	writeln ('la cantidad de personas con mas digitos pares que impares son = ', cantidadpares);
end;

procedure actualizarmaximos (v:vcontador);
var
max1,max2:integer;
posmax1,posmax2:integer;
i:rango;
begin
	max1:= -1;
	max2:=-1;
	posmax1:=-1;
	posmax2:=-1;
	for i := 1 to 4 do
	begin
		if (v[i] > max1)then
			begin
				max2:= max1;
				posmax2:=posmax1;
				max1:= v[i];
				posmax1:=i;
			end
		else
			if (v[i]>max2) then
				begin
					max2:= v[i];
					posmax2:= i;
				end;
	end;
writeln ('la categoria mas elegida fue la : ', posmax1);
writeln ('la segunda mas elegida fue :',posmax2);
end;

procedure eliminardnilista(var l:lista; dni:integer);
var
anterior,actual:lista;
pude:boolean;
begin
	pude:=false;
	anterior:=l;
	actual:= l;
	while (actual<> nil) and (actual^.dato.dni <> dni) do
	begin
		anterior:= actual;
		actual:= actual^.sig;
	end;
	if (actual <>nil) then
		begin
			if (actual=anterior)then
				BEGIN//si es el primer elemento
				l:=l^.sig;
				pude:=true;
				END
			else
				begin
					anterior^.sig:= actual^.sig;
					pude:=true;
				end;
			dispose (actual);	
		end;
	if (pude =  true) then
		writeln ('LO ELIMINE')
	else
		writeln ('NO LO ELIMINE');
end;

procedure mostrarlista (l:lista);
var
aux:lista;
c:casting;
begin
	aux:=l;
	while (aux <> nil) do
	begin
		c:= aux^.dato;
		writeln (c.dni);
		writeln (c.apellido);
		writeln (c.nombre);
		writeln (c.edad);
		writeln(c.genero);
		aux:= aux^.sig;
	end;
end;
var
l:lista;
v:vcontador;
DNI:integer;
begin
	l:= nil;
	inicializarvector(v);
	crearlista(l);
	recorrerlista(l,v);
	actualizarmaximos(v);
	writeln ('ingrese dni para eliminar'); 
		readln (dni);
		eliminardnilista(l,dni);
	mostrarlista (l);
end.

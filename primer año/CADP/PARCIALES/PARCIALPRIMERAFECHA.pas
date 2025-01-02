program parcialbiza;
const
categoriamusica =  5;
type
musical=1..categoriamusica;
sesion = record
	titulo:string[20];
	nombre:string[20];
	genero:musical;
	ano:integer;
	cantspotify:integer;
	end;

lista = ^nodo;

nodo= record
	dato:sesion;
	sig:lista;
	end;

vec= array [musical]of integer;

procedure inicializarvector(var v:vec);
var
i:integer;
begin
	for i:= 1 to categoriamusica do
		v[i]:=0;
end;

procedure leersesion (var s:sesion);
begin
	writeln ('TITULO');readln (s.titulo);
	writeln ('NOMBRE DEL ARTISTA'); readln (s.nombre);
	writeln ('GENERO MUSICAL'); readln (s.genero);
	writeln ('AÑO DE ESTRENO'); READLN (s.ano);
	writeln ('CANTIDAD DE REPRODUCCIONES'); readln(s.cantspotify);
end;

procedure agregaradelante (var l:lista; s:sesion);
var
nuevo:lista;
begin
	new (nuevo);
	nuevo^.dato:= s;
	nuevo^.sig:=nil;
	if (l=nil)then
		l:=nuevo
	else
		begin
			nuevo^.sig:=l;
			l:= nuevo;
		end;

end;

procedure cargarlista(var l:lista);
var
s:sesion;
begin
	leersesion(s);
	while (s.ano <> 0) do
	begin
		agregaradelante(l,s);
		leersesion (s);
	end;
end;

function cumple (c:integer):boolean;
var
ok:boolean;
suma:integer;
dig:integer;
begin
	suma:= 0;
	while (c<>0)do
	begin
		dig:= c mod 10;
		suma:= suma+dig;
		c:= c div 10;
	end;
	
	if (suma mod 5 =  0) then
		ok:= true
		
	else
		ok:=false;
		
	cumple:=ok;
end;

procedure insertarordenado (d:sesion;var l2:lista);
var
nuevo:lista;
actual,anterior:lista;
begin
	new (nuevo);
	nuevo^.dato:= d;
	actual:= l2;
	anterior:=l2;
		while (actual <> nil) and (d.ano>l2^.dato.ano)  do 
		begin
			anterior:=actual;
			actual:= actual^.sig;
		end;
	
		if (actual = anterior)then
		l2:= nuevo
		else
			anterior^.sig:= nuevo;
		nuevo^.sig:= actual;

end;

procedure recorrerlista(l:lista; var v:vec; var l2:lista);
var
aux:lista;
genero:musical;
begin
	aux:= l;
	
	while (aux <> nil) do
	begin
		genero:= aux^.dato.genero;
		v[genero]:= v[genero]+aux^.dato.cantspotify;
		
		IF (genero=3)or(genero=1)and (cumple(aux^.dato.cantspotify)=true)then
			insertarordenado(aux^.dato,l2); //B
			
	aux:= aux^.sig;
	end;
end;

procedure actualizarmaximos(v:integer; i:integer;var max1,max2:integer; var posmax1,posmax2:integer);
begin
	if(v>max1)then
		begin
			max2:= max1;
			posmax2:= posmax1;
			max1:= v;
			posmax1:= i;
		end
	else
		begin
			if (v > max2)then
				begin
					max2:= v;
					posmax2:=i;
				end;
		end;
end;

procedure calcularmaximos (v:vec);
var
i:integer;
max1,max2:integer;
posmax1,posmax2:integer;
begin
	max1:= -1;
	max2:= -1;
	posmax1:=-1;
	posmax2:=-1;
	for i:= 1 to categoriamusica do
	begin
		actualizarmaximos(v[i],i,max1,max2,posmax1,posmax2);
	end;
	writeln ('la categoria mas elegida es = ', posmax1);
	writeln ('la segunda categoria mas elegida es = ',posmax2);
end;

procedure recorrerlistaordenada (l2:lista);
var
anoactual:integer;
cantsesiones:integer;
cantreproducciones:integer;

begin
	while (l2 <> nil) do
	begin
	writeln ('hola2');
	anoactual:= l2^.dato.ano;
	cantsesiones:=0;
	cantreproducciones:=0;
	writeln ('antes del segundo while ');
		while (l2 <> nil) and (l2^.dato.ano=anoactual)do
		begin
			cantsesiones:= cantsesiones+1;
			cantreproducciones:= cantreproducciones+ l2^.dato.cantspotify;
			l2:=l2^.sig;
		end;
	writeln ('la cantidad de sesiones en el año ',anoactual,'son = ',cantsesiones);
	writeln ('cantidad de reproducciones ',cantreproducciones);
	end;
end;
procedure mostrarlista2(l2:lista);
var
aux:lista;
begin
	aux:=l2;
	while (aux <> nil)do 
	begin
		writeln(aux^.dato.cantspotify);
		aux:=aux^.sig;
	end;
end;
var
l:lista;
l2:lista;
v:vec;
begin
	l:= nil;
	l2:=nil;
	inicializarvector(v); 
	cargarlista(l);//se dispone
	recorrerlista (l,v,l2);
	calcularmaximos (v); 
	mostrarlista2(l2);
	recorrerlistaordenada(l2);
end.

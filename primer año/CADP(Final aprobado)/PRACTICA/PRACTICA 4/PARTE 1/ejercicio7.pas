{Realizar un programa que lea números enteros desde teclado hasta que se ingrese el valor -1 (que no
debe procesarse) e informe:
a. La cantidad de ocurrencias de cada dígito procesado. *
b. El dígito más leído.
c. Los dígitos que no tuvieron ocurrencias.}
program siete;


type
 rango = 0..9;
vec = array [rango] of integer;


procedure iniciarvec ( var v:vec);
var
i:integer;
begin
for i := 0 to 9 do
	v[i]:= 0;
end;

procedure descomponernum ( var v:vec; num :integer);
var
dig:integer;
begin

while (num <> 0) do begin
	dig:= num mod 10;
		v[dig]:= v[dig]+1;
		num:= num div 10;
	
end;
end;

procedure informo(v:vec);
var
i:rango;
begin
for i := 0 to 9 do 
if (v[i] >0 ) then
writeln('numero', i ,'=',v[i]);
end;


function max (v:vec):rango;
var
	i,digmax:rango;
	maxn:integer;
	begin
	maxn:= -1;
	for i :=0 to 9 do 
		if ( v[i]>maxn ) then begin
			maxn:= v[i];
			digmax:= i ;
	end;
	max:= digmax;
	end;
	
procedure sinocurrencias ( v:vec) ;
var
i:integer;
begin
writeln ('los numeros sin ocurrencias son');
	for i:= 0 to 9 do 
		if (v[i] = 0 ) then
			write ( i );
end;
var

num:integer;

var
v:vec;
begin
iniciarvec(v);
writeln('ingrese un numero');
read(num);
while (num <> -1) do begin
	descomponernum (v,num);
	writeln ('ingrese otro numero'); readln(num);
end;
writeln ('el digito que mas aparecio es ', max(v));
	informo(v);
	sinocurrencias (v);
end.

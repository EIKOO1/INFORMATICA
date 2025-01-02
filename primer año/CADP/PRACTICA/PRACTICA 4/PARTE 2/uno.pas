{Dado un vector de enteros de a lo sumo 500 valores, realice un módulo que reciba dicho vector y un valor
n y retorne si n se encuentra en el vector o no.}
program uno;
const
DimF =500;
type
vec =  array [1..DimF] of integer;




procedure cargarvec(var v:vec; var diml:integer);
var
n:integer;
begin 		
diml:= 0;
writeln('ingrese un numero');
readln(n);
while (diml < DimF ) and (n <>-1)do begin
diml:= diml+1;
v[diml]:= n;
writeln('ingrese un numero');
readln(n);
end;												//cargo el vector  
end;








procedure mostrarv (v:vec;diml:integer);
var
i:integer;
begin
for i := 1 to diml do 
 writeln (v[i]);
end;




function buscav(v:vec;n,diml:integer):boolean;
var
ok:boolean;
pos:integer;
begin
ok:= false;
pos:= 1;
while (pos <=diml) and (not ok) do begin
if (v[pos] = n) then
	ok:=true
else
	pos:= pos+1;
end;
buscav:= ok;


end;



var
v:vec;
n,diml:integer;
begin
cargarvec(v,diml);
writeln('ingrese el numero de va a buscar'); readln(n);
if (buscav(v,n,diml)) then
	writeln('el numero se encontro')
	else 
writeln (' no se encontro');

mostrarv (v,diml);
end.

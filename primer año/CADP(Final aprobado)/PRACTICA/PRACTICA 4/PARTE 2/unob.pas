{Modifique el módulo del inciso a. considerando ahora que el vector se encuentra ordenado de manera
ascendente}
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


function buscarv(v:vec;n:integer;diml:integer):boolean;
var
pri,ult,medio:integer;
ok:boolean;
begin
pri:=1;
ult:=diml;
medio:= (pri+ult) div 2;
while (pri<=ult) and (n <> v[medio]) do 
begin
if ( n < v[medio]) then
	ult:= medio-1
else
	pri:= medio+1;

medio:= (pri+ult) div 2;

if (pri <= ult ) and (n = v[medio])then
ok:=true;	
end;
buscarv:= ok;
end;



var
v:vec;
n,diml:integer;
begin
cargarvec(v,diml);
writeln('ingrese el numero de va a buscar'); readln(n);
if (buscarv(v,n,diml)) then
	writeln('el numero se encontro')
	else 
writeln (' no se encontro');

 
mostrarv (v,diml);
end.

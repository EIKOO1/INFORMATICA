{Se dispone de un vector con números enteros, de dimensión física dimF y dimensión lógica dimL.
a. Realizar un módulo que imprima el vector desde la primera posición hasta la última.
b. Realizar un módulo que imprima el vector desde la última posición hasta la primera.
c. Realizar un módulo que imprima el vector desde la mitad (dimL DIV 2) hacia la primera posición, y
desde la mitad más uno hacia la última posición.
d. Realizar un módulo que reciba el vector, una posición X y otra posición Y, e imprima el vector desde
la posición X hasta la Y. Asuma que tanto X como Y son menores o iguales a la dimensión lógica. Y
considere que, dependiendo de los valores ría de X e Y, podser necesario recorrer hacia adelante o
hacia atrás.
e. Utilizando el módulo implementado en el inciso anterior, vuelva a realizar los incisos a, b y c.}
program uno;
const 
DimF = 4;
type
vec = array [1..DimF] of integer;
procedure imprimirmitad ( v:vec; DimL:integer); 
var
i,doble:integer;
begin
doble:= DimL div 2 ;
writeln ('mitad del vectos es ' , doble);
for i := doble downto 1 do 
	writeln(v[i]);
for i := doble+1 to DimL do
	writeln (v[i]);
end;
procedure leer (var v:vec; var DimL:integer); 
var
n:integer;
begin
while (DimL < DimF )do begin
	write('ingrese n') ; read(n);
	DimL:= DimL+1;
	 v[DimL]:= n;
end;
end;
procedure imprimir(v:vec;DimL:integer);
var
i: integer;
begin
for i := DimL downto 1 do 
writeln(v[i]);
end;
procedure vectorxy(v:vec; DimL:integer);
var
x,y,i:integer;
begin
writeln('ingrese num 1 ');readln(x);
writeln('ingrese num 2 ' ) ; readln(y);
	if (x > y ) then begin
		for i :=  x downto y do 
			writeln(v[i]);
			end
			else 
			for i:= x to y do
				writeln (v[i]);
end;
var
v:vec;
DimL:integer;
begin
DimL:= 0;
leer ( v,DimL);//a y b 
imprimirmitad(v,DimL); // c
vectorxy(v,DimL);
end.	

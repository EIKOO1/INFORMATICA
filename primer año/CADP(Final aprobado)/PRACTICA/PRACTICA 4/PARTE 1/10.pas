{Realizar un programa que lea y almacene el salario de los empleados de una empresa de turismo (a lo
sumo 300 empleados). La carga finaliza cuando se lea el salario 0 (que no debe procesarse) o cuando
se completa el vector. Una vez finalizada la carga de datos se pide:
a. Realizar un módulo que incremente el salario de cada empleado en un 15%. Para ello, implementar
un módulo que reciba como parámetro un valor real X, el vector de valores reales y su dimensión
lógica y retorne el mismo vector en el cual cada elemento fue multiplicado por el valor X.
b. Realizar un módulo que muestre en pantalla el sueldo promedio de los empleados de la empresa.}
program diez;
const
DimF = 300;
type 
vec = array [1..DimF] of real;

procedure leersalarios ( var v:vec;var diml:integer) ;
var
salario:real;
begin
diml:=0;
writeln ('ingrese el salario'); readln (salario);
while (diml < DimF) and (salario <> 0 ) do begin
diml:= diml+1;
	v[diml]:= salario;
writeln ('ingrese el salario'); readln (salario);
end;
end;
procedure mostrar(v:vec; diml:integer);
var
i:integer;
begin
for i := 1 to diml do 
	writeln (v[i]:2:2);
end;


procedure  incrementar (v:vec; diml:integer);
var
num,i:integer;
begin
writeln ('ingrese el valor a incrementar'); readln (num);
for i := 1 to diml do 
	v[i]:= v[i]*num;
	mostrar(v,diml);
end;

function promedio ( v:vec; diml:integer):real;
var
suma:real;
i:integer;
begin
suma:= 0;
for i := 1 to diml do 
	suma:= suma + v[i];
promedio:= suma/diml;
end;



var
v:vec;
diml:integer;
begin
diml:=0;
leersalarios(v,diml);
incrementar(v,diml);
writeln ('el valor promedio es =' ,promedio(v,diml):2:3);
end.
{Realizar un módulo que incremente el salario de cada empleado en un 15%. Para ello, implementar
un módulo que reciba como parámetro un valor real X, el vector de valores reales y su dimensión
lógica y retorne el mismo vector en el cual cada elemento fue multiplicado por el valor X.}

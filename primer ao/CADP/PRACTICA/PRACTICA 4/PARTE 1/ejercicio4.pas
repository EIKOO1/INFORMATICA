 {Se dispone de un vector con 100 números enteros. Implementar los siguientes módulos:
a. posicion: dado un número X y el vector de números, retorna la posición del número X en dicho
vector, o el valor -1 en caso de no encontrarse.
b. intercambio: recibe dos valores x e y (entre 1 y 100) y el vector de números, y retorna el mismo
vector donde se intercambiaron los valores de las posiciones x e y.
c. sumaVector: retorna la suma de todos los elementos del vector.
d. promedio: devuelve el valor promedio de los elementos del vector.
e. elementoMaximo: retorna la posición del mayor elemento del vector
f. elementoMinimo: retorna la posicion del menor elemento del vector}
program cuatro;
const
DimF =  4;
type 
vec =array [1..DimF] of integer; 

procedure sumaVector ( v:vec); 
var
suma,i:integer;
begin
suma:= 0;
for i := 1 to DimF do begin
	suma:= suma + v[i];
	end;
writeln(' la suma es ',suma);
end;

procedure leer ( var v:vec);
var
i:integer;
begin
for i := 1 to DimF do begin
writeln('ingresa numeros uachin');
readln(v[i]);
end;
end;


procedure imprimir (v:vec);
var
i:integer;
begin
for i := 1 to DimF do 
	writeln(v[i]);
end;



procedure posicion ( v:vec );
var
i,aux,x: integer;
begin
aux:= -1;
writeln (' ingrese el numero que desea buscar'); readln(x);

for i:= 1 to DimF do begin
	if (v[i]=X)then 
		aux:= i;
end;
	writeln('el numero', x , ' estaba en la posicion ', aux );
end;


procedure intercambio (v:vec);
var
x,y,g :integer;
begin
writeln('ingrese x') ; readln(x);
writeln('ingrese y ' ) ; readln(y);
g:= v[x];
v[x]:= v[y];
v[y]:= g;
imprimir(v);
end;
procedure promedio(v:vec);
var
i:integer;
prom:real;
begin
prom:=0;
for i := 1 to DimF do begin
	prom:= prom+v[i];
end;
writeln('el promedio es  :', prom/DimF); 
end;
procedure maximoyminimo ( v:vec);
var
max,min,i:integer;
begin
max:= -1;
min:=DimF;
for i := 1 to DimF do begin
	if ( v[i] > max ) then 
		max:= v[i];
	if ( v[i]<min) then
	min:= v[i];

end;
writeln (' el maximo numero es ', max);
writeln('el minimo es  ',min);
end;
var
v:vec ;
begin
leer (v);
posicion(v);
intercambio(v);
sumavector(v);
promedio(v);
maximoyminimo(v);
end.


{ Se dispone de un vector con 100 números enteros. Implementar los siguientes módulos:
a. posicion: dado un número X y el vector de números, retorna la posición del número X en dicho
vector, o el valor -1 en caso de no encontrarse.
b. intercambio: recibe dos valores x e y (entre 1 y 100) y el vector de números, y retorna el mismo
vector donde se intercambiaron los valores de las posiciones x e y.
c. sumaVector: retorna la suma de todos los elementos del vector.
d. promedio: devuelve el valor promedio de los elementos del vector.
e. elementoMaximo: retorna la posición del mayor elemento del vector
f. elementoMinimo: retorna la posicion del menor elemento del vector}
program Vamooo;
const
DimF = 10;
type 
Vector = array [1..DimF] of integer;





procedure Leer ( var v:vector);
var
i:integer;
begin
for i := 1 to DimF do begin
 writeln('ingrese el valor a guardar'); 
 readln(v[i]);
 end;
 for i := DimF downto 1 do begin
	writeln (v[i] );
 end;
end;








var
v:Vector;
begin
Leer(v);

end.

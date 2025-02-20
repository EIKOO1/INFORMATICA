{
Se lee informacion de inmuebles.De cada inmueble se lee direcccion, cantidad de habitaciones y codigo de venta.
se pide realizar un programa que genere una estrcutra donde los inmuebles cuyo codigo de venta tiene mas digitos pares que impares
(o iguales tambien se considera) queden almacenadas antes que los inmuebles cuyo codigo de venta tiene mas digitos impares que pares.
La lectura finaliza cuando se han leido 50 inmuebles o se lea un inmueble con direccion igual a "ZZZ".
}


program finalInmuebles;

const
	dimf =  50;

type

inmueble =  record
	direccion:String;
	cantH:integer;
	codV:integer;
	end;
	
vector = array [1..dimf] of inmueble;

function Espar (num:integer):boolean;
var
	pares,impares:integer;
	dig:integer;
begin
	pares:=0;
	impares:=0;
	while (num <> 0) do
		begin
			dig:=num mod 10;
			if (dig mod 2 =0)then
				pares:=pares+1
			else
				impares:=impares+1;
			num:= num div 10;
		end;
	if (pares >impares)then
		Espar:=true
	else
		Espar:=false;
end;

procedure agregarAdelante(inmu:inmueble;var v:vector; var diml:integer);
var
	i:integer;
begin
	if (diml<dimf)then
		for i := diml downto 1 do
			v[i+1]:=v[i]; //realiza el corrimiento
	v[1]:= inmu;		//agrega adelante del todo
	diml:=diml+1;
end;

procedure insertarAtras(inmu:inmueble;var v:vector; var diml:integer);
begin
	if (diml<dimf)then
		begin
			diml:=diml+1;
			v[diml]:=inmu;
		end;

end;

procedure ingresarInmueble(var inmu:inmueble);
begin
	writeln ('ingresar direccion');readln(inmu.direccion);
	if (inmu.direccion <> 'ZZZ')then
		begin
			writeln ('ingresar cantidad de habitaciones');readln(inmu.cantH);
			writeln ('ingresar codigo de venta'); readln(inmu.codV);
		end;
end;

procedure ingresarDatos(var v:vector;var diml:integer);
var
	inmu:inmueble;
begin
	diml:=0;
	ingresarInmueble(inmu);
	while ((diml < dimf) and (inmu.direccion<> 'ZZZ')) do
		begin
			if (Espar(inmu.codV)) then
				agregarAdelante(inmu,v,diml)
			else
				insertarAtras(inmu,v,diml);
			ingresarInmueble(inmu);		
		end;
end;

procedure mostrarVector(v:vector;diml:integer);
var
	i:integer;
begin
	for i:= 1 to diml do 
		begin
			writeln (v[i].direccion);
			writeln(v[i].cantH);
			writeln(v[i].codV);
		
		end;

end;
var
v:vector;
diml:integer;
BEGIN
	ingresarDatos(v,diml);
	mostrarVector(v,diml);
END.


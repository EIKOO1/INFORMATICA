{Realizar un programa que lea y almacene la información de 400 alumnos ingresantes a la Facultad de
Informática de la UNLP en el año 2020. De cada alumno se lee: nro de inscripción, DNI, apellido,
nombre y año de nacimiento. Una vez leída y almacenada toda la información, calcular e informar:
a. El porcentaje de alumnos con DNI compuesto sólo por dígitos pares.
b. Apellido y nombre de los dos alumnos de mayor edad.}
program ocho;
const
DimF = 2;
type 
alu = record 
ano,dni,num: integer;
apellido,nombre:string;
end;




vec = array [1..DimF] of alu;


function pares (dni:integer):boolean;
var
dig:integer;
begin

	while (dni <> 0 ) do begin
	dig:= dni mod 10;
		if (dig mod 2 = 0 ) then
			pares:= true
			else
			pares:= false;
		
dni:= dni div 10;
	end;
end;





procedure leeralu(var v:vec;var cantp:integer);
var
i:integer;
begin
for i := 1 to DimF do begin
	writeln (' ingrese nro de inscripcion'); readln(v[i].num);
	writeln('ingrese DNI'); readln ( v[i].dni);
			if (pares(v[i].dni)=true )then 
				cantp:= cantp+1;
	writeln ('apellido y nombre '); readln(v[i].apellido);readln(v[i].nombre);
	writeln ('año de nacimiento');readln( v[i].ano);
	writeln (cantp);
	end;
end;


procedure maxalu(v:vec;var vmax1:alu;var vmax2:alu);
var
i:integer;
begin
for i := 1 to DimF do 
		if (v[i].ano < vmax1.ano) then	
		begin
			vmax2:=vmax1;
			vmax1:=v[i];
			end
		else
			if (v[i].ano<vmax2.ano) then
				vmax2:=v[i];
				
end;















procedure informaralu(v:vec);
var
i:integer;
begin
for i := 1 to DimF do begin
	writeln ('nro de inscripcion = ', v[i].num);
	writeln (' DNI  =  ' , v[i].dni);
	writeln ('apellido y nombre  = ', v[i].apellido,'  ' , v[i].nombre);
	writeln ('año de nacimiento = ' , v[i].ano);
	end;
end;


var
v:vec;
vmax1,vmax2:alu;
cantp:integer;
begin
cantp:= 0;
vmax1.ano:= 32767;
vmax2.ano:=32767;
leeralu(v,cantp);
maxalu(v,vmax1,vmax2);
informaralu(v);
writeln (' el porcentaje de alumnos con dni par es ', (cantp/DimF*100):0:0,'%');
//a. El porcentaje de alumnos con DNI compuesto sólo por dígitos pares.
writeln (' los alumnos mas viejos son =', vmax1.nombre,'  ',vmax1.apellido,' y ' , vmax2.nombre,'  ',vmax2.apellido);

end.

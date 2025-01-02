{9. Modificar la solución del punto anterior considerando que el programa lea y almacene la información
de a lo sumo 400 alumnos. La lectura finaliza cuando se ingresa el DNI -1 (que no debe procesarse).}
program ocho;
const
DimF = 4;
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





procedure leeralu(var v:vec;var cantp:integer;var diml:integer);

begin
diml:=0;
while (diml<DimF) and (v[diml].dni<>-1) do begin
diml:=diml+1;
	writeln (' ingrese nro de inscripcion'); readln(v[diml].num);
	writeln('ingrese DNI'); readln ( v[diml].dni);
	if (v[diml].dni<>-1) then begin
			if (pares(v[diml].dni)=true )then 
				cantp:= cantp+1;
		writeln ('apellido y nombre '); readln(v[diml].apellido);readln(v[diml].nombre);
		writeln ('año de nacimiento');readln( v[diml].ano);
		writeln (cantp);
		end;
	end;
end;


procedure maxalu(v:vec;var vmax1:alu;var vmax2:alu;diml:integer);
var
i:integer;
begin
for i := 1 to diml do 
		if (v[i].ano < vmax1.ano) then	
		begin
			vmax2:=vmax1;
			vmax1:=v[i];
			end
		else
			if (v[i].ano<vmax2.ano) then
				vmax2:=v[i];
				
end;















procedure informaralu(v:vec;diml:integer);
var
i:integer;
begin
for i := 1 to Diml do begin
	writeln ('nro de inscripcion = ', v[i].num);
	writeln (' DNI  =  ' , v[i].dni);
	writeln ('apellido y nombre  = ', v[i].apellido,'  ' , v[i].nombre);
	writeln ('año de nacimiento = ' , v[i].ano);
	end;
end;


var
v:vec;
vmax1,vmax2:alu;
diml,cantp:integer;
begin
cantp:= 0;
vmax1.ano:= 32767;
vmax2.ano:=32767;
leeralu(v,cantp,diml);
maxalu(v,vmax1,vmax2,diml);
informaralu(v,diml);
writeln (' el porcentaje de alumnos con dni par es ', (cantp/DimF*100):0:0,'%');
//a. El porcentaje de alumnos con DNI compuesto sólo por dígitos pares.
writeln (' los alumnos mas viejos son =', vmax1.nombre,'  ',vmax1.apellido,' y ' , vmax2.nombre,'  ',vmax2.apellido);
end.

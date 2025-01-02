{12.	En astrofísica, una galaxia se identifica por su nombre, su tipo (1. elíptica; 2. espiral; 3. lenticular; 4. irregular),
*  su masa (medida en kg) y la distancia en pársecs (pc) medida desde la Tierra.
*  La Unión Astronómica Internacional cuenta con datos correspondientes a las 53 galaxias que componen el Grupo Local. 
* Realizar un programa que lea y almacene estos datos y, una vez finalizada la carga, informe:
a.	La cantidad de galaxias de cada tipo.
b.	La masa total acumulada de las 3 galaxias principales (la Vía Láctea, Andrómeda y Triángulo) 
* y el porcentaje que esto representa respecto a la masa de todas las galaxias.
c.	La cantidad de galaxias no irregulares que se encuentran a menos de 1000 pc.
d.	El nombre de las dos galaxias con mayor masa y el de las dos galaxias con menor masa.
}
program doce;
const
dimf = 1;
type 
tipo = 1..4;
galaxia = record
nombre:string;
t : tipo;
masa:real;
distancia:real;
end;
vec = array [1..dimf] of galaxia;



procedure cargar ( var v:vec);
var
i:integer;
begin
for i := 1 to dimf do begin
writeln ('nombre de la galaxia');
readln(v[i].nombre);
writeln('tipo de galaxia');
readln(v[i].t);
writeln('masa de la galaxia');
readln(v[i].masa);
writeln('distancia en parsecs'); 
readln(v[i].distancia);
end;
end;



procedure mostrarv(v:vec);
var
i:integer;
g:galaxia;
begin
for i := 1 to dimf do begin
g:= v[i]; 
writeln('el nombre de la galaxia es = ',g.nombre);
writeln('el tipo de galaxia es = ', g.t);
writeln (' la masa es de = ' ,(g.masa):2:2);
writeln('la distancia en parsecs = ' , (g.distancia):2:2);
end;
end;


var
v:vec;
begin
cargar(v);
mostrarv(v);
end.

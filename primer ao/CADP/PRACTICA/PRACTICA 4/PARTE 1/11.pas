{El colectivo de fotógrafos ArgenPics desea conocer los gustos de sus seguidores en las redes sociales.
Para ello, para cada una de las 200 fotos publicadas en su página de Facebook, cuenta con la siguiente
información: título de la foto, el autor de la foto, cantidad de Me gusta, cantidad de clics y cantidad de
comentarios de usuarios. Realizar un programa que lea y almacene esta información. Una vez
finalizada la lectura, el programa debe procesar los datos e informar:
a. Título de la foto más vista (la que posee mayor cantidad de clics). LISTO
b. Cantidad total de Me gusta recibidas a las fotos cuyo autor es el fotógrafo “Art Vandelay”. LISTO
c. Cantidad de comentarios recibidos para cada una de las fotos publicadas en esa página} 
program once;																									
const
dimf =  2;
type 
foto =  record
autor,titulo: string;
mg,click,comentarios:integer;
end;
vec = array [1..dimf] of foto;



procedure leerfoto (var v:vec;var suma:integer);
var
i:integer;
begin
for i := 1 to DimF do begin
	writeln (' titulo de la foto'); readln(v[i].titulo);
	writeln ('autor'); readln (v[i].autor);
	writeln('cantidad me gustas'); readln(v[i].mg);
		if (v[i].autor =  'Art Vandelay')then 
		suma:= suma + v[i].mg;
	writeln('cantidad de clics'); readln( v[i].click);
	writeln('cantidad comentarios'); readln(v[i].comentarios);
end;
end;



procedure muestra (v:vec);
var
i:integer;
begin
for i := 1 to DimF do begin
	writeln (' titulo de la foto  ' , v[i].titulo);
	writeln ('autor ' , v[i].autor);
	writeln('cantidad me gustas ' ,v[i].mg);
	writeln('cantidad de clics   ' ,v[i].click);
	writeln('cantidad comentarios  ' ,v[i].comentarios);
end;
end;
procedure max(v:vec;var titulo:string );
var
max,i:integer;
begin
max:= -1;
for i := 1 to dimf do begin
	if (v[i].click > max) then
	begin
		max:= v[i].click;
		titulo:= v[i].titulo
end;
end;

end;





var
v:vec;
titulo:string;
suma:integer;
begin
suma:=0;
leerfoto(v,suma);
max(v,titulo);
muestra(v);
writeln ('el titulo de la mayor cantidad de clicks es =  ', titulo); 
writeln ('la cantidad de me gustas de el autor Art Vandelay es = ' , suma);
end.

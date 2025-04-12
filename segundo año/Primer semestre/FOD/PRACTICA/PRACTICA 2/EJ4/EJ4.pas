


program Ejercicio4prac2;
const 
	valoralto =  999;
	dimf = 3; //dimf=30;
type


subrango = 1..dimf;

producto  = record
	cod:integer;
	nombre:String[20];
	descripcion:String;
	stock:integer;
	stockMin:integer;
	precio:real;
	end;

stock = record
	cod:integer;
	cantV:integer;
	end;



archmaestro = file of producto;

archivo = file of stock;

vector = array [subrango] of archivo;

vectorreg = array [subrango]of stock;

procedure crearDetalles(var detalle:archivo);
var
	nombre:String;
	s:stock;
begin
	writeln ('INGRESE NOMBRE DEL ARCHIVO');
	readln(nombre);
	assign (detalle,nombre);
	rewrite(detalle);
	writeln ('INGRESAR CODIGO DE PRODUCTO');
	readln (s.cod);
	while (s.cod <> 0 ) do
		begin
			writeln ('INGRESE CANTIDAD VENDIDA');
			readln (s.cantV);
			write (detalle,s);
			writeln ('INGRESAR CODIGO DE PRODUCTO');
			readln (s.cod);
		end;
	close(detalle);
end;

procedure asignardetalles (var v:vector);
var
	i:integer;
begin
	for i:= 1 to dimf do
		begin
			crearDetalles(v[i]);
		end;
end;


procedure crearMaestro (var maestro:archmaestro);
var
	c:producto;
begin
	rewrite(maestro);
	writeln('INGRESE CODIGO DE PRODUCTO');readln (c.cod);
	while (c.cod <> 0 ) do
		begin
			writeln ('INGRESAR NOMBRE');readln (c.nombre);
			writeln ('INGRESAR DESCRIPCION');readln (c.descripcion);
			writeln ('STOCK DISPONIBLE');readln (c.stock);
			writeln ('STOCK MINIMO');readln (c.stockMin);
			writeln ('PRECIO');readln (c.precio);
			write (maestro,c);
			writeln('INGRESE CODIGO DE PRODUCTO');readln (c.cod);
		end;
	close (maestro);
end;

procedure leer (var detalle:archivo; var r:stock);
begin
	if (not eof (detalle))then
		read (detalle,r)
	else
		r.cod := valoralto;
end;

procedure minimo (var v:vector;var vreg:vectorreg;var min:stock);
var
	pos,i:integer;
begin
	min.cod:=valoralto;
	for i := 1 to dimf do
		begin
			if (vreg[i].cod <min.cod)then
				begin
					min:=vReg[i];
					pos:=i;
				end;
		end;
	if (min.cod <> valoralto)then
		leer (v[pos],vreg[pos]);
		
end;

procedure actualizarMaestro(var maestro:archmaestro;var v:vector);
var
	vreg:vectorreg;
	min:stock;
	i:subrango;
	cant:integer;
	codActual:integer;
	regmas:producto;
begin
	reset (maestro);
	for i:= 1 to dimf do
		begin
			reset (v[i]);
			leer(v[i],vreg[i]);
		end;
	minimo (v,vreg,min);
	while (min.cod <> valoralto)do
		begin
			codActual:=min.cod;
			cant:=0;
			while (min.cod = codActual)do
				begin
					cant:=cant+min.cantV;
					minimo(v,vreg,min);
				end;
			read(maestro,regmas);
			while (regmas.cod <> codActual)do
				read(maestro,regmas);
			regmas.stock := regmas.stock - cant;
			seek (maestro,filepos(maestro)-1);
			write(maestro,regmas);
		end;
		
	for i:= 1 to dimf do
		begin
			close (v[i]);
		end;
	close(maestro);
	
end;

var 
maestro:archmaestro;
v:vector;
BEGIN
	assign (maestro,'congelados.dat');
	crearMaestro(maestro);
	asignardetalles(v);
	actualizarMaestro(maestro,v);
END.


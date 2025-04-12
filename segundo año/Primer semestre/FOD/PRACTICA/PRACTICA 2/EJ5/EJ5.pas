{Suponga que trabaja en una oficina donde está montada una LAN (red local). La misma fue
construida sobre una topología de red que conecta 5 máquinas entre sí y todas las
máquinas se conectan con un servidor central. Semanalmente cada máquina genera un
archivo de logs informando las sesiones abiertas por cada usuario en cada terminal y por
cuánto tiempo estuvo abierta. Cada archivo detalle contiene los siguientes campos:
cod_usuario, fecha, tiempo_sesion. Debe realizar un procedimiento que reciba los archivos
detalle y genere un archivo maestro con los siguientes datos: cod_usuario, fecha,
tiempo_total_de_sesiones_abiertas.}



program untitled;
const
	valoralto = 999;
	dimf = 2;
type
	
	maquina = record
		cod_usuario : integer;
		fecha:String[8];
		tiempo_sesion:real;
		end;
		
	servidor = record
		cod_usuario:integer;
		fecha:String[8];
		tiempoT:real;
		end;
	
detalle = file of maquina;
	
vectorDet = array [1..dimf] of maquina;

vector = array [1..dimf] of detalle;



maestro = file of servidor;

procedure leerUser (var reg:maquina);
begin
	writeln ('INGRESE');
	writeln ('ingrese codigo de usuario '); readln(reg.cod_usuario);
	if (reg.cod_usuario <> valoralto )then
	begin
		writeln ('FECHA'); readln(reg.fecha);
		writeln ('TIEMPO EN SESION '); readln (reg.tiempo_sesion);
	end;
end;

procedure crearD (var d:detalle);
var
	reg:maquina;
	s:String;
begin
	write('INGRESE NUMERO DE DETALLE');readln (s);
	assign (d,(s));
	rewrite (d);
	leerUser(reg);
	while (reg.cod_usuario <> valoralto) do
		begin
			write (d,reg);
			leerUser(reg);
		end;
	close (d)
end;

procedure crearDetalle (var v:vector);
var
	i:integer;
begin
	for i := 1 to dimf do
		begin
			crearD(v[i]);
		end;
end;

procedure leerDetalle (var det:detalle;var reg:maquina);
begin
		if (not eof (det)) then
			read(det,reg)
				//asigno en el registro de detalles el primer elemento de cada detalle
		else
			reg.cod_usuario := valoralto;
end;
	
procedure minimo (var v:vector;var regDet:vectorDet;var min:maquina);
var
	i:integer;
	pos:integer;
begin
	min.cod_usuario:=valoralto;
	min.fecha:= 'ZZZ';
	for i:= 1 to dimf do
		begin
			if (regDet[i].cod_usuario<min.cod_usuario)and (regDet[i].fecha < min.fecha)then
			begin
				min:=regDet[i];
				pos:=i;
			end;
		end;
	if (min.cod_usuario <> valoralto)then
		leerDetalle(v[pos],regDet[pos]);
end;
	
procedure crearMaestro (var mas:maestro;var v:vector);	
var
	regdet:vectorDet;
	regAux:servidor;
	min:maquina;   //registro minimo
	i:integer;
begin
	assign (mas,'master');
	rewrite(mas);
	for i := 1 to dimf do
	begin
		reset(v[i]);
		leerDetalle(v[i],regdet[i]);
	end;
	minimo(v,regdet,min);
	while (min.cod_usuario <> valoralto)do
		begin
			regAux.cod_usuario:= min.cod_usuario;
			regAux.fecha:= min.fecha;
			regAux.tiempoT := 0;
			while (min.cod_usuario=regAux.cod_usuario)and (min.fecha= regAux.fecha)do
				begin
					regAux.tiempoT:= regAux.tiempoT + min.tiempo_sesion;
					minimo(v,regdet,min);
				end;
			write (mas,regAux);
		end;
		
	close (mas);
	for i:=1 to dimf do
		close(v[i]);	
end;

procedure imprimirMaestro (var mas:maestro);
var
	reg:servidor;
begin
	reset (mas);
	while (not eof (mas))do
		begin	
			writeln('--------------------------');
			read(mas,reg);
			writeln ('cod' , reg.cod_usuario);
			writeln ('FECHA',reg.fecha);
			writeln ('TIEMPO',reg.tiempoT);
			writeln('--------------------------');
		end;
end;


var 
	v:vector;
	mas:maestro;
begin
	crearDetalle (v);
	crearMaestro (mas,v);	
	imprimirMaestro(mas);
END.


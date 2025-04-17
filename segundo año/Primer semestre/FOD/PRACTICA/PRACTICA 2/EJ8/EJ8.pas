program ej8;
const
	valoralto = 999;
	dimf = 2;
type
	cadena = String [30];

	infoMaestro = record
		codProv:integer;
		nombreProv:cadena;
		cantHabitantes:integer;
		cantTotal:real
		end;
	
	infoDetalle = record
		codProv:integer;
		cantKilos:real;
		end;
	
maestro = file of infoMaestro;

detalle = file of infoDetalle;

vector  = array  [1..dimf] of detalle; 

vectorReg = array [1..dimf] of infoDetalle;

procedure leerDetalle (var arch:detalle;var reg:infoDetalle);
begin
	if (not eof (arch))then
		read (arch,reg)
	else
		reg.codProv :=  valoralto;

end;

procedure minimo (var v:vector;var vecreg:vectorReg;var min:infodetalle);
var
	i,pos:integer;
begin
	min.codProv := valoralto;
	for i := 1 to dimf do
		begin
			if (vecreg[i].codProv<min.codProv)then
				begin
					min:=vecreg[i];
					pos:=i;
				end;
		end;
	if (min.codProv <> valoralto)then
		leerDetalle(v[pos],vecreg[pos]);
end;


procedure actualizarMaestro (var mas:maestro;var v:vector);
var
	vreg : vectorReg;
	i:integer;
	min:infoDetalle;
	regmas:infoMaestro;	
begin
	for i :=  1 to dimf do
		begin
			reset(v[i]);
			leerDetalle(v[i],vreg[i]);		//ABRO LOS ARCHIVOS
		end;
	
	reset (mas);			//ABRO EL MAESTRO
	
	minimo (v,vreg,min);
	read(mas,regmas);
	while(min.codProv <> valoralto)do
		begin
			while (regmas.codProv <> min.codProv)do
				read(mas,regmas);
			
			while (min.codProv = regmas.codProv)do
				begin
					regmas.cantTotal:=regmas.cantTotal + min.cantKilos;
					minimo(v,vreg,min);
				end;
			seek (mas,filepos(mas)-1);
			write(mas,regmas);
		
		end;
	
	close (mas);
	for i := 1 to dimf do
		close (v[i]);
end;

procedure leerRegDet(var reg:infoDetalle);
begin
	writeln ('INGRESE CODIGO DE PROVINCIA');readln (reg.codProv);
	if (reg.codProv <> valoralto)then
		begin
			writeln ('INGRESE CANTIDAD TOTAL DE KILOS DE YERBA');readln (reg.cantKilos);
		end;
end;

procedure leerRegMas(var reg:infoMaestro);
begin
	writeln ('INGRESE CODIGO DE PROVINCIA');readln (reg.codProv);
	if (reg.codProv <> valoralto)then
		begin
			writeln ('INGRESE NOMBRE DE LA PROVINCIA');readln (reg.nombreProv);
			writeln ('INGRESE CANTIDAD DE HABITANTES');readln (reg.cantHabitantes);
			writeln ('INGRESE CANTIDAD TOTAL DE KILOS DE YERBA');readln (reg.cantTotal);
		end;
end;

procedure crearDetalle (var det:detalle);
var
	reg:infoDetalle;
	st:string;
begin
	writeln ('INGRESE NOMBRE DEL ARCHIVO');readln (st);
	assign (det,st);
	rewrite (det);
	
	leerRegDet(reg);
	while (reg.codProv <> valoralto)do
		begin
			write(det,reg);
			leerRegDet(reg);
		end;
		
close (det);

end;

procedure crearMaestro (var mas:maestro);
var
	regmas:infoMaestro;
begin
	assign (mas,'maestro.dat');
	rewrite (mas);
	leerRegMas(regmas);
	while (regmas.codProv <> valoralto)do
		begin
			write(mas,regmas);
			leerRegMas(regmas);
		end;

close(mas);

end;

procedure crearDetalles(var v:vector);
var
	i:integer;
begin
	for i :=  1 to dimf do 
		begin
			crearDetalle(v[i]);
		end;
end;

procedure imprimirMaestro (var mas:maestro);
var
	regmas:infoMaestro;
begin
	reset(mas);
	while (not eof (mas))do
		begin
			read(mas,regmas);
			writeln ('--------------------------');
			writeln ('CODIGO DE PROVINCIA ',regmas.codProv);
			writeln ('NOMBRE DE LA PROVINCIA ',regmas.nombreProv);
			writeln ('CANTIDAD DE HABITANTES ',regmas.cantHabitantes);
			writeln ('CANTIDAD TOTAL ',regmas.cantTotal);
			writeln ('--------------------------');
		end;
	close(mas);
end;

var 
	mas:maestro;
	v:vector;
BEGIN
//	crearMaestro(mas);
//	crearDetalles(v);
	assign (v[1],'DETALLE1');
	assign (v[2],'DETALLE2');
	assign (mas,'maestro.dat');
	imprimirMaestro(mas);
	actualizarMaestro(mas,v);
	imprimirMaestro(mas);
END.


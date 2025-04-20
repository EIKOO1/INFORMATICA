{

}


program untitled;
const
	dimf = 2;
	valoralto = 9999;
type
	infoMaestro = record
		codprov:integer;
		nombreProv:String[30];
		codLocalidad:integer;
		nombreLocalidad:String[30];
		sinGas:integer;
		sinLuz:integer;
		chapa:integer;
		sinAgua:integer;
		sinSanitarios:integer;
	end;
	
	infoDetalle = record
		codprov:integer;
		codLocalidad:integer;
		conLuz:integer;
		construidas:integer;
		conAgua:integer;
		conGas:integer;
		sanitarios:integer;
	end;

maestro = file of infoMaestro;

detalle = file of infoDetalle;

vector = array [1..dimf] of detalle;

vectorReg = array [1..dimf] of infoDetalle;

procedure leerReg(var det:detalle; var reg:infoDetalle);
begin
	writeln ('INGRESE CODIGO DE PROVINCIA :');readln (reg.codprov);
	if (reg.codprov <> valoralto)then
		begin
			writeln ('INGRESE CODIGO DE LOCALIDAD');readln (reg.codLocalidad);
			writeln ('VIVIENDAS CON LUZ');readln (reg.conLuz);
			writeln('VIVIENDAS CONSTRUIDAS');readln (reg.construidas);
			writeln ('VIVIENDAS CON AGUA');readln (reg.conAgua);
			writeln('CANTIDAD DE SANITARIOS');readln (reg.sanitarios);
		end;
end;

procedure leerRegMaestro(var mae:maestro; var reg:infoMaestro);
begin
	writeln ('INGRESE CODIGO DE PROVINCIA :');readln (reg.codprov);
	if (reg.codprov <> valoralto)then
		begin
			writeln('INGRESE NOMBRE DE PROVINCIA');readln (reg.nombreProv);
			writeln ('INGRESE CODIGO DE LOCALIDAD');readln (reg.codLocalidad);
			writeln ('VIVIENDAS SIN LUZ');readln (reg.sinLuz);
			writeln ('VIVIENDAS SIN GAS');readln (reg.sinGas);
			writeln('VIVIENDAS DE CHAPA');readln (reg.chapa);
			writeln ('VIVIENDAS SIN AGUA');readln (reg.sinAgua);
			writeln('CANTIDAD SIN SANITARIOS');readln (reg.sinSanitarios);
		end;
end;

procedure crearDetalles(var det:detalle);
var
	regdet:infoDetalle;
	st:String;
begin
	writeln('INGRESE NOMBRE DEL DETALLE');readln(st);
	assign (det,st);
	rewrite(det);
	leerReg(det,regdet);
	while (regdet.codProv <>valoralto)do
		begin
			write(det,regdet);
			leerReg(det,regdet);
		end;
	close(det);
end;

procedure crearMaestro (var mae:maestro);
var
	regmae:infoMaestro;
begin
	assign (mae,'maestro.dat');
	rewrite(mae);
	leerRegMaestro(mae,regmae);
	while (regmae.codProv <> valoralto)do
		begin
			write(mae,regmae);
			leerRegMaestro(mae,regmae);
		end;
	close(mae);
end;

procedure crearDetalles(var v:vector);
var
	i:integer;
begin
	for i:= 1 to dimf do
		begin
			crearDetalles(v[i]);
		end;
end;

procedure leerDet(var det:detalle;var reg:infoDetalle);
begin
	if (not eof (det))then
		read(det,reg)
	else
		reg.codprov := valoralto;
end;

procedure minimo (var v:vector;var vecReg:vectorReg;var min:infoDetalle);
var
	i:integer;
	pos:integer;
begin
	min.codprov := valoralto;
	min.codLocalidad:= valoralto;
	for i :=  1 to dimf do
		begin
			if ((vecReg[i].codProv<min.codprov)and (vecReg[i].codLocalidad<min.codLocalidad))then
				begin
					min:= vecReg[i];
					pos:=i;
				end;
		end;
	if (min.codprov <> valoralto)then
		leerDet(v[pos],vecReg[pos]);
end;

procedure leerMaestro(var mae:maestro;var regmae:infoMaestro);
begin
	if (not eof (mae))then
		read(mae,regmae)
	else
		regmae.codProv:= valoralto;
end;

procedure actualizarMaestro(var mae:maestro; var vec:vector);
var
	regmae:infoMaestro;
	vecReg:vectorReg;
	aux:infoMaestro;
	i:integer;
	min:infoDetalle;
begin
	for i := 1 to dimf do
		begin
			reset(vec[i]);
			leerDet(vec[i],vecReg[i]);
		end;
	reset (mae);
	minimo(vec,vecReg,min);
	while (min.codprov <> valoralto)do
		begin
			aux.codprov:=min.codProv;
			writeln('MINIMO',min.codProv);
			leerMaestro(mae,regmae);
			while (regmae.codProv <> min.codProv)do
				begin
				writeln(regmae.codProv);
				leerMaestro(mae,regmae);
				end;
			while (min.codprov = aux.codprov)do
				begin
					aux.codLocalidad := min.codLocalidad;
					writeln('HOLA');
					while (min.codLocalidad = aux.codLocalidad)do
						begin
							regmae.sinLuz := regmae.sinLuz - min.conLuz;
							regmae.sinAgua:= regmae.sinAgua- min.conAgua;
							regmae.sinGas:= regmae.sinGas - min.conGas;
							regmae.sinSanitarios:= regmae.sinSanitarios-min.sanitarios;
							minimo(vec,vecReg,min);
							writeln('HOLA');
						end;
					seek (mae,filepos(mae)-1);
					write(mae,regmae);
				end;
		end;	
	for i := 1 to dimf do
		close (vec[i]);
	close(mae);
end;

procedure imprimirmaestro (var mae:maestro);
var
	reg:infoMaestro;
begin
	reset (mae);
	while (not eof (mae))do
		begin
			read(mae,reg);	
			writeln ('PROVINCIA ',reg.codProv);
			writeln('LOCALIDAD ', reg.codLocalidad);
			writeln ('VIVIENDAS SIN LUZ ',reg.sinLuz);
			writeln ('VIVIENDAS SIN GAS ',reg.sinGas);
			writeln('VIVIENDAS DE CHAPA ',reg.chapa);
			writeln ('VIVIENDAS SIN AGUA ',reg.sinAgua);
			writeln('CANTIDAD SIN SANITARIOS ',reg.sinSanitarios);
		end;	
	close(mae);
end;	
	
var
	mae:maestro;
	vec:vector;
BEGIN
//	crearDetalles(vec);
	crearMaestro(mae);
	assign (mae,'maestro.dat');
	assign (vec[1],'DETALLE1');
	assign(vec[2],'9999');
	actualizarMaestro(mae,vec);
	imprimirmaestro(mae);
END.


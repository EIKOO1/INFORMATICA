{
   
}


program ej10;
const
	valoralto = 9999;
type

	infoMaestro = record 
		codProv:integer;
		codLocalidad:integer;
		numMesa:integer;
		cantVotos:integer;
		end;


maestro =  file of infoMaestro;

procedure leerReg (var reg:infoMaestro);
begin
	writeln ('INGRESE CODIGO DE PROVINCIA');readln (reg.codProv);
	if (reg.codProv <> valoralto)then
		begin
			writeln ('INGRESE CODIGO DE LOCALIDAD'); readln (reg.codLocalidad);
			writeln('INGRESE NUMERO DE MESA');readln (reg.numMesa);
			writeln ('INGRESE CANT VOTOS'); readln (reg.cantVotos);		
		end;
end;

procedure crearMaestro (var mae:maestro);
var
	regmae:infoMaestro;
begin
	assign (mae,'maestro.dat');
	rewrite (mae);
	leerReg(regmae);
	while (regmae.codProv <> valoralto )do
		begin
			write (mae,regmae);
			leerReg(regmae);
		end;
	close (mae);
end;

procedure leerMaestro (var mae:maestro;var regmae:infoMaestro);
begin
	if (not eof (mae))then
		read(mae,regmae)
	else
		regmae.codProv := valoralto;
end;

procedure mostrarMae(var mae:maestro);
var
	regaux,regmae:infoMaestro;
	cantTotal:integer;
	cantLocalidad:integer;
	cantProvincia:integer;
begin
	reset (mae);
	leerMaestro(mae,regmae);
	cantTotal:=0;
	while (regmae.codProv <> valoralto)do
		begin
			writeln ('----------------------------------');
			writeln ('| CODIGO DE PROVINCIA ',regmae.codProv  , '|');
			regaux:= regmae;
			cantProvincia:=0;
			while (regmae.codProv = regaux.codProv)do
				begin
					cantLocalidad:=0;
					while(regmae.codProv = regaux.codProv)and(regmae.codLocalidad = regaux.codLocalidad)do
						begin
							cantLocalidad:= cantLocalidad+regmae.cantVotos ;
							cantProvincia:=  cantProvincia + regmae.cantVotos;
							cantTotal:= cantTotal+ regmae.cantVotos;
							leerMaestro(mae,regmae);
						end;
					writeln ('|Codigo de localidad ',regaux.codLocalidad ,'|', ' TOTAL DE VOTOS: ' , cantLocalidad , '|' );
				end;
			writeln (' TOTAL VOTOS DE PROVINCIA ' , cantTotal);
			writeln ('----------------------------------');
		end;
	writeln ('TOTAL GENERAL DE VOTOS : ' ,cantTotal);
	close(mae);
end;
var
	mae:maestro;

BEGIN
crearMaestro(mae);
mostrarMae(mae);
	
END.


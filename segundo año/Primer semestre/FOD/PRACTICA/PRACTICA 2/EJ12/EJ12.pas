{
La empresa de software ‘X’ posee un servidor web donde se encuentra alojado el sitio web
de la organización. En dicho servidor, se almacenan en un archivo todos los accesos que se
realizan al sitio. La información que se almacena en el archivo es la siguiente: año, mes, día,
idUsuario y tiempo de acceso al sitio de la organización. El archivo se encuentra ordenado
por los siguientes criterios: año, mes, día e idUsuario.
Se debe realizar un procedimiento que genere un informe en pantalla, para ello se indicará
el año calendario sobre el cual debe realizar el informe. El mismo debe respetar el formato
mostrado a continuación:
}


program untitled;
const
	valoralto = 9999;
type
	infoMaestro = record
		anio:integer;
		mes:integer;
		dia:integer;
		idUsuario:integer;
		tiempo:integer;
	end;
	
maestro = file of infoMaestro;

procedure leerReg(var regmae:infoMaestro);
begin
	writeln ('INGRESE ANIO');readln (regmae.anio);
	if (regmae.anio <> valoralto)then
		begin
			writeln ('INGRESE MES');readln (regmae.mes);
			writeln ('INGRESE DIA');readln (regmae.dia);
			writeln ('INGRESE ID USUARIO');readln (regmae.idUsuario);
			writeln ('TIEMPO'); readln (regmae.tiempo);
		end;
end;
	
procedure crearMaestro (var mae:maestro);
var
	regmae:infoMaestro;
begin
	assign (mae,'maestro.dat');
	rewrite(mae);
	leerReg(regmae);
	while (regmae.anio <> valoralto)do
		begin
			write(mae,regmae);
			leerReg(regmae);
		end;
	close(mae);
end;

procedure leerMaestro(var mae:maestro;var regmae:infoMaestro);
begin
	if (not eof (mae))then
		read(mae,regmae)
	else
		regmae.anio := valoralto;
end;

procedure informarMaestro (var mae:maestro);
var
	anioElegido:integer;
	aux:infoMaestro;
	regmae:infoMaestro;
	tiempoDia:integer;
	tiempoMes:integer;
	tiempoAnio:integer;
begin
	write('INGRESE ANIO QUE DESEA INFORMAR');readln (anioElegido);
	reset (mae);
	leerMaestro(mae,regmae);
	while (regmae.anio <> anioElegido)do
		leerMaestro(mae,regmae);
	if (regmae.anio = valoralto)then
		writeln ('NO SE ENCONTRO ESE ANIO')
	else
		begin	
			aux:=regmae;
			tiempoanio:=0;	
			writeln ('| ANIO ',anioElegido ,' | ');
			writeln('----');
			writeln();
			while (regmae.anio = anioElegido)do
				begin
					aux.mes:=regmae.mes;
					writeln ('| MES : ' ,aux.mes ,' | ' );
					writeln ('  -------');
					tiempomes:=0;
					while (regmae.mes = aux.mes) and (regmae.anio = anioElegido)do
						begin
							aux.dia:=regmae.dia;
							tiempoDia:=0;
							while (regmae.anio=anioElegido) and (regmae.mes = aux.mes) and (regmae.dia = aux.dia)do
								begin
									writeln('| idUsuario : ',regmae.idUsuario, ' tiempo total => ',regmae.tiempo,' en el dia :=> ',regmae.dia,' en el mes => ',regmae.mes, ' | ' );
									tiempoDia:=tiempoDia+regmae.tiempo;
									leerMaestro(mae,regmae);
									writeln();
								end;
							tiempoMes:=tiempoMes+tiempoDia;
							writeln ('| TIEMPO TOTAL ACCESO EN EL DIA ', aux.dia , ' ES DE =>' , tiempoDia,' | ');
							writeln ('---------------------------------------------------         	');
							writeln ();
						end;
					tiempoAnio:=tiempoAnio + tiempoMes;
					writeln ('| TIEMPO TOTAL ACCESO EN EL MES ', aux.mes, ' ES DE =>' , tiempoMes,' | ');
					writeln ('--------------------------------------------------        	');	
					writeln();
					writeln();					
				end;
			writeln();
			writeln ('| TIEMPO TOTAL ACCESO EN EL ANIO ', aux.anio, ' ES DE => ' , tiempoAnio,' | ');
			writeln ('------------------------------------------------------ 	');						
		end;	
	close(mae);
end;


var 
	mae:maestro;
BEGIN
//crearMaestro (mae);
assign (mae,'maestro.dat');
informarMaestro(mae);

END.


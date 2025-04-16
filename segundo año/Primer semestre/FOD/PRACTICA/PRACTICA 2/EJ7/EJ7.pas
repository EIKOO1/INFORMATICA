program EJERCICIO7;
const 
	valoralto = 9999;
	
type
	cadena = String [20];
	infoMaestro = record
		codAlu:integer;
		apellido:cadena;
		nombre:cadena;
		cantCurAprob:integer;
		cantMatFinalAprob:integer;
	end;
	
	infoCursadas = record
		codAlu:integer;
		codMat:integer;
		aniocursada:integer;
		resultado:boolean;
	end;
	
	infoFinales= record
		codAlu:integer;
		codMat:integer;
		fecha:integer;
		nota:integer;
	end;
	
archMaestro = file of infoMaestro;

archCursadas = file of infoCursadas;

archFinales = file of infoFinales;

procedure leerFinales (var finales:archFinales;var reg:infoFinales);
begin
	if (not eof (finales))then
		read (finales,reg)
	else
		reg.codAlu:=valoralto;
end;

procedure leerCursada (var cursada:archCursadas;var reg:infoCursadas);
begin
	if (not eof (cursada))then
		read (cursada,reg)
	else
		reg.codAlu := valoralto;
end;

procedure leerMaestro (var mas:archMaestro;var reg:infoMaestro);
begin
	if (not eof (mas))then
		read (mas,reg)
	else
		reg.codAlu := valoralto;
end;

procedure actualizarMaestro (var mas:archMaestro;var archCur:archCursadas; var archFinal:archFinales);
var
	regmas:infoMaestro;
	regcur:infoCursadas;
	regFinal:infoFinales;
begin
	reset (mas);
	reset (archCur);
	reset (archFinal);
	leerMaestro (mas,regmas);
	while (regmas.codAlu <> valoralto)do
		begin
			leerCursada(archCur,regcur);
			while (regcur.codAlu<regmas.codAlu)do
				leerCursada(archCur,regcur);
			
			while  (regcur.codAlu = regmas.codAlu)do
				begin
					if (regcur.resultado = true)then
						regmas.cantCurAprob := regmas.cantCurAprob+1;
					leerCursada(archCur,regcur);
				end;
			
			leerFinales(archFinal,regFinal);
			while (regcur.codAlu < regmas.codAlu)do
				leerFinales(archFinal,regFinal);
				
			while (regFinal.codAlu = regmas.codAlu)do
				begin
					if (regFinal.nota >=4)then
						regmas.cantMatFinalAprob:= regmas.cantMatFinalAprob+1;
					leerFinales(archFinal,regFinal);
				end;
		seek(mas,filepos(mas)-1);
		write (mas,regmas);
	close (mas);
	close(archCur);
	close(archFinal);
	end;
end;

var 
	archmas:archMaestro;
	archCur:archCursadas;
	archFinal:archFinales;	
BEGIN

	actualizarMaestro(archmas,archCur,archFinal);
END.


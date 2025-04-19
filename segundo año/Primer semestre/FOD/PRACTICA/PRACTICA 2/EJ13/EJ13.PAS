{
   
   
}


program ej13;
const
	valoralto = 9999;
type
	
	cadena = String[30];
	
	infoMaestro = record					//log
		nro_usuario:integer;
		nombreUsuario:cadena;
		nombre:cadena;
		apellido:cadena;
		cantMailEnviados:integer;
		end;
	
	infoDetalle = record
		nro_usuario:integer;
		cuentaDestino:integer;
		cuerpoMensaje:String;
		end;
	
		
	maestro = file of infoMaestro;

	detalle = file of infoDetalle;
	
	
procedure leerReg(var r:infoMaestro);
begin
	writeln ('INGRESE NOMBRE DE USUARIO');readln(r.nro_usuario);
	if (r.nro_usuario <> valoralto)then
		begin
			writeln ('NOMBRE');readln (r.nombre);
			writeln ('APELLIDO');readln(r.apellido);
			writeln ('CANTIDAD DE MAIL ENVIADOS');readln(r.cantMailEnviados);
		end;
end;
	
procedure crearMaestro (var mae:maestro);
var
	regmae:infoMaestro;
begin
	assign (mae,'maestro');
	rewrite(mae);
	leerReg(regmae);
	while (regmae.nro_usuario <> valoralto)do
		begin
			write(mae,regmae);
			leerReg(regmae);
		end;
	close(mae);
end;

procedure leerDetalle(var det:detalle;var regdet:infoDetalle);
begin
	if (not eof(det))then
		read(det,regdet)
	else
		regdet.nro_usuario:= valoralto;
end;

procedure leerMaestro(var mae:maestro;var regmae:infoMaestro);
begin
	if (not eof (mae))then
		read(mae,regmae)
	else
		regmae.nro_usuario:= valoralto;
end;

procedure actualizarMaestro(var mae:maestro;var det:detalle);
var
	regmae:infoMaestro;
	regdet:infoDetalle;
	aux:infoMaestro;
begin
	reset (mae);
	reset(det);
	leerDetalle(det,regdet);
	while (regdet.nro_usuario <> valoralto)do
		begin
			leerMaestro(mae,regmae);
			while (regmae.nro_usuario <> regdet.nro_usuario)do		//busca en el maestro el usuario
				leerMaestro	(mae,regmae);
			aux:=regmae;			//
			while (regdet.nro_usuario = aux.nro_usuario)do
				begin
					aux.cantMailEnviados := aux.cantMailEnviados + 1;
					leerDetalle(det,regdet);
				end;	
			seek(mae,filepos(mae)-1);
			write(mae,aux);
		end;
	close(mae);
	close(det);
end;

procedure imprimirmaestro (var mae:maestro);
var
	regmae:infoMaestro;
begin
	reset (mae);
	while (not eof (mae))do
		begin
			read(mae,regmae);	
			writeln ('CODIGO DE USUARIO',regmae.nro_usuario);
			writeln('NOMBRE y APELLIDO', regmae.nombre , ' ', regmae.apellido);
			writeln('CANTIDAD DE MAILS ENVIADOS : ',regmae.cantMailEnviados);
		end;	
	

end;

procedure leerRegDet(var regdet:infoDetalle);
begin
	writeln ('INGRESE NRO DE USUARIO');readln(regdet.nro_usuario);
	if (regdet.nro_usuario<>valoralto)then
		begin
			writeln ('INGRESE CUENTA DESNTINO');readln (regdet.cuentaDestino);
			writeln('INGRESE CUERPO DEL MENSAJE');readln (regdet.cuerpoMensaje);
		end;
end;

procedure crearDetalle(var det:detalle);
var
	regdet:infoDetalle;
begin
	assign(det,'logs.dat');
	rewrite(det);
	leerRegDet(regdet);
	while (regdet.nro_usuario <> valoralto)do
		begin
			write(det,regdet);
			leerRegDet(regdet);
		end;
	close(det);
end;
var
	mae:maestro;
	det:detalle;
BEGIN
	//crearMaestro(mae);
//	crearDetalle(det);
	assign(det,'logs.dat');
	assign (mae,'maestro');
	imprimirmaestro(mae);
	actualizarMaestro(mae,det);
	writeln();
	writeln('...MAESTRO IMPRESION ACTUALIZADA...');
	imprimirmaestro(mae);
END.


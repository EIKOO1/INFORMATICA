{Una compañía aérea dispone de un archivo maestro donde guarda información sobre sus
próximos vuelos. En dicho archivo se tiene almacenado el destino, fecha, hora de salida y la
cantidad de asientos disponibles. La empresa recibe todos los días dos archivos detalles
para actualizar el archivo maestro. En dichos archivos se tiene destino, fecha, hora de salida
y cantidad de asientos comprados. Se sabe que los archivos están ordenados por destino
más fecha y hora de salida, y que en los detalles pueden venir 0, 1 ó más registros por cada
uno del maestro. Se pide realizar los módulos necesarios para:
}


program EJ14;
const
	valoralto= 'ZZZ';
type
	infoMaestro =  record
		destino:String;
		fecha:String;
		hora:String;
		asientosDis:integer;
	end;
		
	infoDetalle=record
		destino:String;
		fecha:string;
		hora:String;
		cantidad:integer;
	end;
	
	

	maestro = file of infoMaestro;

	detalle = file of infoDetalle;
	
procedure leer(var det:detalle;var reg:infoDetalle);
begin
	if (not eof (det))then
		read(det,reg)
	else
		reg.destino := valoralto;
end;


procedure minimo (var det1,det2:detalle;var regdet1,regdet2,min:infoDetalle);
begin
	if (regdet1.destino < regdet2.destino)then
		begin
			min:=regdet1;
			leer(det1,regdet1);
		end
	else
		begin
			min:=regdet2;
			leer(det2,regdet2);
		end;
end;
procedure leerReg(var r:infoMaestro);
begin
	writeln ('INGRESE DESTINO');readln(r.destino);
	if (r.destino <> valoralto)then
		begin
			writeln ('fecha');readln (r.fecha);
			writeln ('hora de salida');readln(r.hora);
			writeln ('CANTIDAD ASIENTOS DISPONIBLES');readln(r.asientosDis);
		end;
end;
	
procedure crearMaestro (var mae:maestro);
var
	regmae:infoMaestro;
begin
	rewrite(mae);
	leerReg(regmae);
	while (regmae.destino <> valoralto)do
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
		regmae.destino:= valoralto;
end;


procedure actualizarMaestro(var mae:maestro;var det1:detalle;var det2:detalle);
var
	regmae:infoMaestro;
	regdet1,regdet2:infoDetalle;
	min:infoDetalle;
	aux:infoMaestro;
begin
	reset (mae);
	reset(det1);
	reset(det2);
	leer(det1,regdet1);
	leer(det2,regdet2);
	minimo(det1,det2,regdet1,regdet2,min);
	while (min.destino <> valoralto)do
		begin
			aux.destino:=min.destino;		
			while (min.destino = aux.destino) do
				begin
					
					aux.fecha := min.fecha;
					while (min.destino = aux.destino)and (min.fecha=aux.fecha)do
						begin				
							aux.hora:= min.hora;
							aux.asientosDis:=0;
							while (min.destino = aux.destino)and (min.fecha=aux.fecha)and (min.hora=aux.hora)do
								begin	
									aux.asientosDis:= aux.asientosDis + min.cantidad;
									minimo(det1,det2,regdet1,regdet2,min);
								end;
							leerMaestro(mae,regmae);
							while (regmae.destino <> min.destino)and (regmae.fecha<>min.fecha) and (regmae.hora <> aux.hora)do
								leerMaestro(mae,regmae);
							regmae.asientosDis := regmae.asientosDis - aux.asientosDis;
							seek(mae,filepos(mae)-1);
							write(mae,regmae);
						end;
				end;	
		end;
	close(mae);
	close(det1);
	close(det2);
end;
procedure leerRegDet(var regdet:infoDetalle);
begin
	writeln ('INGRESE DESTINO');readln(regdet.destino);
	if (regdet.destino<>valoralto)then
		begin
			writeln ('INGRESE FECHA');readln (regdet.fecha);
			writeln('INGRESE HORA DE SALIDA');readln(regdet.hora);
			writeln('INGRESE CANTIDAD ASIENTOS COMPRADOS');readln (regdet.cantidad);
		end;
end;

procedure crearDetalle(var det:detalle);
var
	regdet:infoDetalle;
begin
	rewrite(det);
	leerRegDet(regdet);
	while (regdet.destino <> valoralto)do
		begin
			write(det,regdet);
			leerRegDet(regdet);
		end;
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
			writeln ('DESTINO',regmae.destino);
			writeln('FECHA', regmae.fecha);
			writeln('HORA : ',regmae.hora);
			writeln('ASIENTOS DISPONIBLES' , regmae.asientosDis);
		end;	
	close(mae);
end;	
	
var 
mae:maestro;
det1,det2:detalle;
BEGIN
	assign (mae,'maestro');
	crearMaestro(mae);
	assign(det1,'detalle1');
	assign(det2,'detalle2');
	//crearDetalle(det1);
	//crearDetalle(det2);
	imprimirmaestro(mae);
	actualizarMaestro(mae,det1,det2);
	imprimirmaestro(mae);
	
END.


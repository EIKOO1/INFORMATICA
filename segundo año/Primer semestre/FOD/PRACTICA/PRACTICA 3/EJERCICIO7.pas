{
7. Se cuenta con un archivo que almacena información sobre especies de aves en vía
de extinción, para ello se almacena: código, nombre de la especie, familia de ave,
descripción y zona geográfica. El archivo no está ordenado por ningún criterio. Realice
un programa que permita borrar especies de aves extintas. Este programa debe
disponer de dos procedimientos:

a. Un procedimiento que dada una especie de ave (su código) marque la misma		BAJA LOGICA
como borrada (en caso de querer borrar múltiples especies de aves, se podría
invocar este procedimiento repetidamente).

b. Un procedimiento que compacte el archivo, quitando definitivamente las
especies de aves marcadas como borradas. Para quitar los registros se deberá		COMPACTAR CON EL ULTIMO
copiar el último registro del archivo en la posición del registro a borrar y luego

eliminar del archivo el último registro de forma tal de evitar registros duplicados.
i. Implemente una variante de este procedimiento de compactación del						COMPACTAR CON LOS ULTIMOS truncando UNA SOLA VEZ
archivo (baja física) donde el archivo se trunque una sola vez.
   
}


program Ejercicio7;
const 
	valoralto = 9999;
type
	especies = record
		codigo:integer;
		nombreEspecie:String[30];
		familia:String[30];
		descripcion:String[30];
		zona:String[30];
	end;


maestro =  file of especies;

procedure leerRegistro(var reg:especies);
begin
	writeln('INGRESE CODIGO DE AVE');readln(reg.codigo);
	if (reg.codigo <>  valoralto)then
		begin
			writeln('INGRESE NOMBRE DE LA ESPECIE');readln(reg.nombreEspecie);
			writeln('INGRESE FAMILIA DE LA ESPECIE');readln(reg.descripcion);
			writeln('INGRESE DESCRIPCION');readln(reg.descripcion);
			writeln('INGRESE ZONA DE LA ESPECIE');readln(reg.zona);
		end;
end;

procedure crearMaestro (var mae:maestro);
var
	regmae:especies;
begin
	rewrite(mae);
	reset(mae);
	leerRegistro(regmae);
	while (regmae.codigo <> valoralto)do
		begin
			write(mae,regmae);
			leerRegistro(regmae);
		end;
	close(mae);
end;


procedure leer(var mae:maestro;var reg:especies);
begin
	if (not eof (mae))then
		read(mae,reg)
	else
		reg.codigo:= valoralto;
end;

procedure darBajaLogica(var mae:maestro);
var
	regmae:especies;
	cod:integer;
begin
	reset(mae);
	writeln('-------BORRAR REGISTRO-------');
	writeln('Ingrese codigo de ave a eliminar');readln(cod);
	leer(mae,regmae);
	while (regmae.codigo <>valoralto) and (regmae.codigo <> cod)do
		begin
			leer(mae,regmae);
		end;	
	if (regmae.codigo = cod)then
		begin
			regmae.codigo := regmae.codigo *-1;
			//paso su codigo a negativo
			Seek(mae,FilePos(mae)-1);
			//Me posiciono 1 elemento atras
			write(mae,regmae);
			//escribo en esa posicion
			writeln('Registro Eliminado');
		end
	else
		writeln('Registro no encontrado');
	close(mae);
end;


procedure  compactar(var mae:maestro);
var
	regmae:especies;
	regCopia:especies;
	pos:integer;
begin
	reset(mae);
		//abro el arch
	while (not eof(mae))do
		begin
			read(mae,regmae);
			//leo en el registro
			if(regmae.codigo<0)then
				begin
				pos:=FilePos(mae)-1;
				//Guardo la posicion actual
				Seek(mae,FileSize(mae)-1);
				//voy a la ultima posicFion del archivo;
				read(mae,regCopia);
				//leo el registro
				Seek(mae,pos);
				write(mae,regCopia);
				Seek(mae,FileSize(mae)-1);
				truncate(mae);
				Seek(mae,pos);
				end;
		end;
	close(mae);
end;

procedure listar(var mae:maestro);
var
	reg:especies;
begin
	reset(mae);
	while (not eof (mae))do
		begin
			read(mae,reg);
			writeln('----------------------');
			writeln(' CODIGO DE AVE ',reg.codigo);
			writeln(' NOMBRE DE LA ESPECIE ',reg.nombreEspecie);
			writeln(' FAMILIA DE LA ESPECIE ',reg.descripcion);
			writeln(' DESCRIPCION ',reg.descripcion);
			writeln(' ZONA DE LA ESPECIE ',reg.zona);
			writeln('----------------------');
		end;
	close(mae);
end;

procedure compactarTodos(var mae:maestro);
var
	regaux:especies;
	regmae:especies;
	pos:integer;
	posAc:integer;
begin
	reset(mae); //abro el archivo
	pos:=FileSize(mae); //me quedo con el tamanio 
	read(mae,regmae);             
	writeln(pos);
	while (regmae.codigo <> pos)do;
		begin
			if (regmae.codigo < 0)then
				begin
					posAc:=FilePos(mae);  //posicion donde se encontro el elemento a borrar
					Seek(mae,pos); //final del archivo
					read(mae,regaux); //REGISTRO DEL FINAL DEL ARCHIVO
					Seek(mae,pos);
					write(mae,regmae);
					Seek(mae,posAc); //me posiciono en la que estaba;
					write(mae,regaux);
					pos:= pos-1 //decremento uno el final del archivo
				end;
			read(mae,regmae);
		end;
	Seek(mae,pos);
	truncate(mae);
	close(mae);
end;

var 
	n:integer;
	ok:boolean;
	mae : maestro;
BEGIN
	assign (mae,'maestroAves');
	writeln();
	ok:=true;
	while ok do
		begin
			writeln();
			
			writeln('INGRESE 1 PARA CREAR EL ARCHIVO AVE');
			writeln('INGRESE 2 PARA BORRAR UN AVE POR CODIGO');  //se puede usar mas de una vez
			writeln('INGRESE 3 PARA COMPACTAR EL ARCHIVO DE AVES TRUNCANDO MAS DE UNA VEZ ');	//Compacta mas de una vez
			writeln('INGRESE 4 PARA COMPACTAR EL ARCHIVO DE AVES TRUNCANDO UNA SOLA VEZ');	//compata todo de una sola vez
			writeln('INGRESE 5 PARA LISTAR');
			writeln('6 PARA SALIR');
			writeln();
			
			readln(n);
			case n of
				
				1:crearMaestro(mae);  //hecho
				2:darBajaLogica(mae);	//hecho
				3:compactar(mae);	//hecho
				4:compactarTodos(mae);
				5:listar(mae);
				6:ok:=false;
			end;
		end;
			
END.


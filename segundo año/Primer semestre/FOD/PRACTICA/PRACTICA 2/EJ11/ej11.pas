{
 Se tiene información en un archivo de las horas extras realizadas por los empleados de una
empresa en un mes. Para cada empleado se tiene la siguiente información: departamento,
división, número de empleado, categoría y cantidad de horas extras realizadas por el
empleado. Se sabe que el archivo se encuentra ordenado por departamento, luego por
división y, por último, por número de empleado. Presentar en pantalla un listado con el
siguiente formato:
   
   
}


program untitled;
const
	valoralto = 999;
type

	subrango = 1..15;

	infoMaestro = record
		departamento:integer;
		division:integer;
		numEmple:integer;
		categoria:subrango;
		cantHoras:integer;
	end;

vectorCategorias = array [subrango] of real;

maestro = file of infoMaestro;

procedure leerReg (var regmae:infoMaestro);
begin
	writeln ('INGRESE COD DE DEPARTAMENTO');readln (regmae.departamento);
	if (regmae.departamento <> valoralto)then
		begin
			writeln ('INGRESE DIVISION ');readln (regmae.division);
			writeln ('INGRESE NUMERO DE EMPLEADO');readln (regmae.numEmple);
			writeln ('CATEGORIA ');readln (regmae.categoria);
			writeln ('CANTIDAD DE HORAS');readln (regmae.cantHoras);
		end;
end;

procedure cargarVectorCategorias (var vec:vectorCategorias);
var
	carga:text;
	valor:real;
	categoria:integer;
begin
	assign (carga,'vectorCategorias.txt');
	reset (carga);
	while (not eof (carga))do
		begin
			read (carga,categoria,valor);
			vec[categoria] := valor;	
		end;
	close (carga);
end;

procedure cargarMaestro (var mae:maestro);
var
	regmae:infoMaestro;
begin
	assign (mae,'maestro.dat');
	rewrite(mae);
	leerReg(regmae);
	while (regmae.departamento <> valoralto)do
		begin
			write (mae,regmae);
			leerReg(regmae);
		end;
	close (mae);
end;
	
procedure leer (var mae:maestro;var regmae:infoMaestro);
begin
	if (not eof (mae))then
		read (mae,regmae)
	else
		regmae.departamento := valoralto;
end;	
	
procedure informar (var mae:maestro;vecCategorias:vectorCategorias);
var
	regmae:infoMaestro;
	regaux:infoMaestro;
	montoTotalDivision:real;
	totalHorasDivision:integer;
	totalHorasDep:integer;
	montoTotalDepartamento:real;
begin
	reset (mae);
	leer(mae,regmae);
	while (regmae.departamento <> valoralto)do
		begin
			regaux:=regmae;
			montoTotalDepartamento:=0;
			totalHorasDep:=0;
			writeln ();
			writeln();
			writeln ('DEPARTAMENTO ' , regmae.departamento);
			writeln ('-----------');
			while (regmae.departamento = regaux.departamento)do
				begin
					regaux.division:=regmae.division;
					writeln();

					writeln (' DIVISION ' , regaux.division);
					writeln ('----------');
					totalHorasDivision:=0;
					montoTotalDivision:=0;
					while(regmae.departamento = regaux.departamento)and(regmae.division = regaux.division)do
						begin
							writeln ('| NUMERO DE EMPLEADO : ' , regmae.numEmple,' | Total Horas | :',regmae.cantHoras,' | IMPORTE A COBRAR | $' , (regmae.cantHoras * vecCategorias[regmae.categoria]):2:2);
							totalHorasDivision:= totalHorasDivision+regmae.cantHoras;
							montoTotalDivision:= montoTotalDivision + (regmae.cantHoras * vecCategorias[regmae.categoria]);
							leer(mae,regmae);
							writeln();

						end;
					writeln ('| TOTAL HORAS DIVISION  : ' , totalHorasDivision, ' | ');
					writeln ('----------------------');
					writeln ('| MONTO TOTAL POR DIVISION  : $', montoTotalDivision:2:2,' | ');
					writeln ('--------------------------');
					montoTotalDepartamento:= montoTotalDepartamento + montoTotalDivision;
					totalHorasDep:= totalHorasDep + totalHorasDivision;
				end;
			writeln();
			writeln();
			writeln();
			writeln ('|TOTAL HORAS DEPARTAMENTO  : ' ,totalHorasDep, ' | ');
			writeln ('-------------------------');
			writeln ('|MONTO TOTAL DEPARTAMENTO  $' ,montoTotalDepartamento:2:2 ,' | ');
			writeln ('--------------------------')
		end;
	close(mae);
end;
	

procedure informarMae(var mae:maestro);
var
	regmae:infoMaestro;
begin
	reset (mae);
	while (not eof (mae))do
		begin
		read(mae,regmae);
		writeln ('| NUMERO DE EMPLEADO : ' , regmae.numEmple,'| Total Horas | ',regmae.cantHoras);
		end;
end;

var
	mae:maestro;
	vecCategorias:vectorCategorias;
BEGIN
	cargarVectorCategorias (vecCategorias);
	cargarMaestro(mae);
//	informarMae(mae);
	informar(mae,vecCategorias);
	
END.


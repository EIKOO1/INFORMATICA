{
2. Realizar un algoritmo, que utilizando el archivo de números enteros no ordenados
creado en el ejercicio 1, informe por pantalla cantidad de números menores a 1500 y el
promedio de los números ingresados. El nombre del archivo a procesar debe ser
proporcionado por el usuario una única vez. Además, el algoritmo deberá listar el
contenido del archivo en pantalla.
}


program ejercicio1;
type
	archivo_log = file of integer;
var 
	arch :archivo_log;
	n:integer;
	suma,cant:integer;
	arch_fisico:string[12];
BEGIN
	writeln('Ingrese el nombre del archivo'); readln (arch_fisico);
	assign(arch,arch_fisico);
	reset(arch);
	cant:=0;
	suma:=0;
	while (not eof(arch))do
		begin
			read(arch,n);
			if (n<1500)then
				begin
					cant:=cant+1;	
					suma:= suma+n;
				end;
		end;
	close(arch);
	writeln('cant numeros menos a 1500 : ' ,cant);
	writeln('promedio de numeros ' , suma /FileSize(arch));
END.


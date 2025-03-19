{
  Realizar un algoritmo que cree un archivo de números enteros no ordenados y permita
incorporar datos al archivo. Los números son ingresados desde teclado. La carga finaliza
cuando se ingresa el número 30000, que no debe incorporarse al archivo. El nombre del
archivo debe ser proporcionado por el usuario desde teclado.  
}


program ejercicio1;
type
	archivo_log = file of integer;
var 
	arch :archivo_log;
	n:integer;
	arch_fisico:string[12];
BEGIN
	writeln('Ingrese el nombre del archivo'); readln (arch_fisico);
	assign(arch,arch_fisico);
	rewrite(arch);
	writeln('Ingrese un numero');readln(n);
	while (n <> 30000)do
		begin
			write(arch,n);
			writeln('Ingrese un numero');readln(n);
		end;
	close(arch);
END.


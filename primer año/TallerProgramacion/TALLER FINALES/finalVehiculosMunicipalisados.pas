{
   
}


program FinalVehiculosMunicipalizados;

type
	cadena = String[20];
	vehiculo = record
		patente:cadena;
		marca:cadena;
		anio:integer;
		valorFiscal:real;
		dniPropietario:integer;
		end;
	
	arbol = ^nodo;
	
	nodo = record
		dato:vehiculo;
		hi:arbol;
		hd:arbol;
		end;
		
	lista = ^nodoLista;
	
	nodoLista = record
		dato:vehiculo;
		sig:lista;
		end;

procedure leerAuto (var reg:vehiculo);
begin
	writeln ('Ingrese patente '); readln (reg.patente);
	if (reg.patente <> 'ZZZ')then
		begin
			writeln ('Ingrese marca');readln (reg.marca);
			writeln ('anio de fabricacion');readln (reg.anio);
			writeln ('Valor fiscal');readln (reg.valorFiscal);
			writeln ('dniPropietario');readln (reg.dniPropietario);
		end;
end;




procedure agregar (var a:arbol;reg:vehiculo);
begin
	if (a = nil )then
		begin
			new (a);
			a^.dato := reg;
			a^.hi:=nil;
			a^.hd:=nil;
		end
	else
		if (reg.valorFiscal > a^.dato.valorFiscal)then
			agregar(a^.hd,reg)
		else
			agregar (a^.hi,reg);
end;


procedure crearArbol(var a:arbol);
var
	reg:vehiculo;
begin
	a:= nil;
	leerAuto(reg);
	while (reg.patente <> 'ZZZ')do
		begin
			agregar(a,reg);
			leerAuto(reg);
		end;

end;

function buscarEnRango(var a:arbol;valor1:real;valor2:real):integer;
begin
	if(a=nil)then
		buscarEnRango:=0
	else
		begin
			if (a^.dato.valorFiscal>valor1)then
				if (a^.dato.valorFiscal<valor2)then
					buscarEnRango:= 1+buscarEnRango(a^.hi,valor1,valor2) + buscarEnRango(a^.hd,valor1,valor2)
				else
					buscarEnRango:= buscarEnRango(a^.hi,valor1,valor2)
			else
				buscarEnRango:=buscarEnRango(a^.hd,valor1,valor2);
		end;
end;

procedure agregarALaLista(var l:lista;reg:vehiculo);
var
	nuevo,anterior,actual:lista;
begin
	new (nuevo);
	nuevo^.dato:=reg;
	nuevo^.sig:=nil;
	if (l = nil)then
		l:=nuevo
	else
		begin
			anterior:=l;
			actual:=l;
			while (actual <>nil) and (reg.valorFiscal < l^.dato.valorFiscal)do
				begin
					anterior:=actual;
					actual:=actual^.sig;
				end;
			if (actual = l)then
				begin
					nuevo^.sig:=actual;
					l:=nuevo;
				end
			else
				begin
					anterior^.sig:=nuevo;
					nuevo^.sig:=actual;
				end;	
		end;
end;

procedure cargar(var a:arbol;var l:lista;valorAuto:real);
begin
	if (a <> nil)then
		begin
			if (a^.dato.valorFiscal < valorAuto)then
				agregarALaLista(l,a^.dato);
			cargar(a^.hi,l,valorAuto);
			cargar(a^.hd,l,valorAuto);
		end;	
end;

procedure inciso3 (var a:arbol;var l:lista;valorAuto:real);
begin
	l:=nil;
	cargar(a,l,valorAuto);
end;

procedure imprimirLista(l:lista);
begin
	while (l<>nil)do
		begin
			writeln (l^.dato.patente);
			l:= l^.sig;
		end;
end;

var
	a:arbol;
	valor1,valor2:real;
	l:lista;
	valorAuto:real;
BEGIN
	crearArbol(a);
	writeln ('Ingrese dos valores fiscales');
	readln (valor1);
	readln(valor2);
	writeln('La cantidad de vehiculos en ese rango de valor fiscales es : ', buscarEnRango(a,valor1,valor2));	
	writeln ('Ingrese un valor de auto,para los cuales sean menores se agreguen a una lista');readln (valorAuto);
	inciso3(a,l,valorAuto);
	imprimirLista(l);
END.


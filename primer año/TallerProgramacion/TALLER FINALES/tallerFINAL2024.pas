{
   
   
   
   
}


program untitled;



type


vehiculo = record
	patente:string[20];
	marca:String[30];
	anio:integer;
	color:String[30];
	dni:integer;
	end;
	
arbol = ^nodo;

nodo = record
	dato:vehiculo;
	hi:arbol;
	hd:arbol;
	end;

lista = ^nodol;

nodol =record
	dato:vehiculo;
	sig:lista;
	end;

procedure leerVehiculo  (var reg:vehiculo);
begin
	writeln ('ingrese un vehiculo con :');
	writeln ('patente : ');readln (reg.patente);
	if (reg.patente <> 'ZZZ')then
		begin
			writeln ('marca : ' );readln (reg.marca);
			writeln ('anio de fabricacion');readln (reg.anio);
			writeln ('color');readln (reg.color);
			writeln ('dni del titular');readln (reg.dni);
		end;
	end;
	
procedure agregar (var a:arbol;reg:vehiculo);
begin
	if (a=nil)then
		begin
			new (a);
			a^.dato :=reg;
			a^.hi := nil;
			a^.hd := 	nil;
		end
	else
		if (reg.dni < a^.dato.dni)then
			agregar(a^.hi,reg)
		else
			agregar(a^.hd,reg);
end;
	
procedure cargarArbol (var a:arbol);
var
	reg:vehiculo;
begin
	leerVehiculo(reg);
	while (reg.patente<>'ZZZ')do
		begin
			agregar(a,reg);
			leerVehiculo(reg);
		end;
end;

function cantidadVehiculos(a:arbol;rango1:integer;rango2:integer):integer;

begin
	if (a=nil)then
		cantidadVehiculos := 0
	else
		begin
			if (a^.dato.anio>rango1)then
				if (a^.dato.anio<rango2)then
					cantidadVehiculos := 1+cantidadVehiculos(a^.hi,rango1,rango2) + cantidadVehiculos(a^.hd,rango1,rango2)
				else
					cantidadVehiculos := cantidadVehiculos(a^.hi,rango1,rango2)
			else
				cantidadVehiculos := cantidadVehiculos(a^.hd,rango1,rango2);
		end;
	
end;

procedure agregarALaLista(var l:lista;reg:vehiculo);
var
	nuevo,anterior,actual:lista;
begin
	new (nuevo);
	nuevo^.dato := reg;
	nuevo^.sig := nil;
	
	if (l=nil)then
		l:=nuevo
	else
		begin
			anterior := l;
			actual:=l;
			while((actual <> nil)and(actual^.dato.dni < reg.dni))do
				begin
					anterior:=actual;
					actual:=actual^.sig;
				end;
				
			if (actual=l)then
				begin
					nuevo^.sig:=l;
					l:=nuevo;
				end
				else
					begin
						anterior^.sig := nuevo;
						nuevo^.sig := actual;
					end;
		end
end;

procedure listaVehiculos(var a:arbol;var l:lista;valor:integer);
begin
	if (a<>nil)then
		begin
			if (a^.dato.dni <valor)then
				agregarALaLista(l,a^.dato);
			listaVehiculos(a^.hi,l,valor);
			listaVehiculos(a^.hd,l,valor);
		end;
end;

procedure listar(l:lista);
begin
	while (l<>nil)do
		begin
			writeln ('------------');
			writeln ('Dni del titular : ',l^.dato.dni);
			writeln ('Patente : ', l^.dato.patente);
			writeln ('------------');
			l:=l^.sig;
		end;
end;

var
	a:arbol;
	rango1,rango2:integer;
	l:lista;
	dni:integer;
BEGIN
	a:= nil;
	l:=nil;
	cargarArbol(a); // inciso 1
	writeln ('ingrese dos valores para buscar vehiculo');readln (rango1);readln (rango2);
	if (rango1 <rango2)then
		writeln ('La cantidad de vehiculos en ese rango es de  : ',cantidadVehiculos(a,rango1,rango2)) //inciso 2
	else
		writeln ('el rango es invalido');
	writeln('Ingrese un dni para agregar los vehiculos sean menores a ese DNI');readln(dni);
	listaVehiculos(a,l,dni);  //inciso 3
	listar(l);
	
END.


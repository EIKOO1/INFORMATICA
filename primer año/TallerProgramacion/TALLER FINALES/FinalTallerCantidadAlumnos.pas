{
  
   
}


program final;



type

	cadena = String[20];
	alumno = record
		nombre:cadena;
		legajo:integer;
		cantidad:integer;
		end;

arbol = ^nodo;

nodo = record
	dato:alumno;
	hi:arbol;
	hd:arbol;
	end;
	
lista = ^nodoLista;

nodoLista = record
	dato:alumno;
	sig:lista;
end;

procedure leerAlumno (var reg:alumno);
begin	
	writeln ('Ingrese legajo de alumno');readln (reg.legajo);
	if (reg.legajo <> 0)then
		begin
			writeln ('Ingrese nombre del alumno : ');readln (reg.nombre);
			reg.cantidad:= 0;
		end;
end;

procedure agregar (var a:arbol;reg:alumno);
begin
	if (a=nil)then
		begin
			new (a);
			a^.dato:=reg;
			a^.hi:=nil;
			a^.hd:=nil;
		end
	else
		if (reg.legajo > a^.dato.legajo)then
			agregar(a^.hd,reg)
		else
			agregar(a^.hi,reg);
end;
	
procedure crearArbol (var a:arbol);
var
	reg:alumno;
begin
	a:=nil;
	leerAlumno(reg);
	while (reg.legajo <>0)do
		begin
			agregar(a,reg);
			leerAlumno(reg);
		end;
end;

function incisoB(a:arbol;valor:integer):boolean;
begin
	if (a=nil)then
		incisoB:=false
	else
		if (a^.dato.legajo = valor)then
			begin
			a^.dato.cantidad:=a^.dato.cantidad+1;
			incisoB:=true;
			end
		else
			if (valor > a^.dato.legajo)then
				incisoB:=incisoB(a^.hd,valor)
			else
				incisoB:=incisoB(a^.hi,valor);
end;

procedure insertarOrdenado (var l:lista;reg:alumno);
var
	nuevo,anterior,actual:lista;
begin
	new (nuevo);
	nuevo^.dato:=reg;
	nuevo^.sig:=nil;
	
	if (l=nil)then
		l:=nuevo
	else
		begin
			anterior:=l;
			actual:=l;
			while (actual <> nil ) and (reg.legajo>l^.dato.legajo)do
				begin
					anterior:=actual;
					actual:=actual^.sig;
				end;
			if (actual=l)then
				begin
					actual^.sig:=l;
					l:=actual;
				end
			else
				begin
					anterior^.sig:=nuevo;
					nuevo^.sig:=actual;
				end;
		end;
end;

procedure incisoC2(a:arbol;var l:lista);
begin
	if (a<>nil)then
		begin
			if (a^.dato.cantidad >= 3)then
				insertarOrdenado(l,a^.dato);
			incisoC2(a^.hi,l);
			incisoC2(a^.hd,l);
		end;
end;

procedure imprimirLista(l:lista);
begin
	while (l<>nil)do
		begin
			writeln ('Legajo : ' , l^.dato.legajo);
			writeln ('Cantidad parciales : ' , l^.dato.cantidad);
			writeln ('Nombre : ',l^.dato.nombre);
			l:=l^.sig;
		end;
end;
				
procedure incisoC(a:arbol;var l:lista);
begin
	l:=nil;
	incisoC2(a,l);
	imprimirLista(l);
end;
	
var
	a:arbol;
	valor:integer;
	l:lista;
BEGIN
	crearArbol (a);
	writeln ('Ingrese un legajo para aumentar la cantidad');readln (valor);
	if (incisoB(a,valor))then
		writeln ('Se encontro el alumno')
	else
		writeln ('No se encontro');
	incisoC(a,l);
END.


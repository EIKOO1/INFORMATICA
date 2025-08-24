{
   
}


program untitled;



type

	paquete =  record
		cod:integer;
		dniEmisor:integer;
		dniReceptor:integer;
		cantObjetos:integer;
		pesoPaquete:real;
		end;
		
	paquete2 = record
		dniEmisor:integer;
		cantPaquetes:integer;
		peso:real;
		end;
		
	arbol = ^nodo;
	
	nodo = record
		dato:paquete2;
		hi:arbol;
		hd:arbol;
		end;

lista = ^nodoLista;

nodoLista = record
		dato:paquete2;
		sig:lista;
		end;

		
procedure leerPaquete (var reg:paquete);
begin
	writeln ('ingresar codigo de paquete');readln (reg.cod);
	if (reg.cod <>0 )then
		begin
			writeln('Dni emisor ');readln (reg.dniEmisor);
			writeln ('dni Receptor');readln (reg.dniReceptor);
			writeln ('cantidad de objetos');readln (reg.cantObjetos);
			writeln ('peso paquete');readln (reg.pesoPaquete);
		end;
end;

procedure agregar (var a:arbol;reg:paquete);
begin
	if (a=nil)then
		begin
			new (a);
			a^.dato.dniEmisor:=reg.dniEmisor;
			a^.dato.cantPaquetes := 1;
			a^.dato.peso := a^.dato.peso + reg.pesoPaquete;	
			a^.hi:=nil;
			a^.hd:=nil;
		end
	else
		if (reg.dniEmisor = a^.dato.dniEmisor)then
			begin
				a^.dato.cantPaquetes := a^.dato.cantPaquetes + 1;
				a^.dato.peso := a^.dato.peso + reg.pesoPaquete;
			end
		else
			if (reg.dniEmisor > a^.dato.dniEmisor)then
				agregar(a^.hd,reg)
			else
				agregar(a^.hi,reg);
end;

procedure cargarArbol (var a:arbol);
var
	reg:paquete;
begin
	a:=nil;
	leerPaquete(reg);
	while (reg.cod <> 0)do
		begin
			agregar(a,reg);
			leerPaquete(reg);
		end;
end;

procedure agregarLista (var l:lista;reg:paquete2);
var
	nuevo,actual,anterior:lista;
begin

	new (nuevo);
	nuevo^.dato := reg;
	nuevo^.sig:=nil;
	
	if (l =nil)then
		l:=nuevo	//lista vacia
	else
		begin
			actual:=l;
			anterior:=l;
			while (actual <>nil) and (reg.dniEmisor<actual^.dato.dniEmisor)do
				begin
					anterior:=actual;
					actual:=actual^.sig;
				end;
			if (actual = l)then
				begin
					nuevo^.sig:=l;
					l:=nuevo;			//primer elemento
				end
			else
				begin
					anterior^.sig:=nuevo;		//demas casos
					nuevo^.sig:=actual;	
				end;
		end;
end;
	
	
procedure incisoB(var a:arbol;x:integer;var l:lista);
begin
	if (a <> nil)then	
		begin
			if (a^.dato.cantPaquetes < x)then
				agregarLista(l,a^.dato);
			incisoB(a^.hd,x,l);
			incisoB(a^.hi,x,l);
		end;
end;

procedure imprimirArbol (var a:arbol);
begin
	if (a <> nil)then
		begin
			writeln ('Dni emisor  : ',a^.dato.dniEmisor);
			writeln ('Cantidad Paquetes : ',a^.dato.cantPaquetes);	
			imprimirArbol(a^.hi);
			imprimirArbol(a^.hd);
		end;
end;

procedure imprimirLista(l:lista);
begin
	
	while (l<>nil)do
		begin
			writeln ('Dni emisor : ',l^.dato.dniEmisor);
			writeln ('Cant Paquetes : ', l^.dato.cantPaquetes);
			l:=l^.sig;
			writeln ('aa');
		end;
	

end;

function incisoC(var a:arbol;d:integer):arbol;
begin
	if (a=nil)then
		incisoC:=nil
	else
		begin
			if (a^.dato.dniEmisor =d)then
				incisoC:=a
			else
				if (d > a^.dato.dniEmisor)then
					incisoC := incisoC(a^.hd,d)
				else
					incisoC:=incisoC(a^.hi,d);
		end;
end;
		

var 
	a:arbol;
	d,x:integer;
	l:lista;
	punteroArbol:arbol;
BEGIN
	l:=nil;
	cargarArbol(a);
	imprimirArbol(a);
	writeln('ingrese un x');readln (x);	//inciso b
	incisoB(a,x,l);
	imprimirLista(l);
	writeln ('ingrese d');readln (d);
	punteroArbol := incisoC(a,d);
	if (punteroArbol<>nil)then
		writeln (punteroArbol^.dato.dniEmisor,' cant Paquetes' , punteroArbol^.dato.cantPaquetes)
	else
		writeln ('No se encontro');
	
END.


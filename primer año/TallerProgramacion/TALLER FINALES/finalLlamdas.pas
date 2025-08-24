{

	
}


program untitled;

const
	dimf = 100;
type
nivel = 1..5;

sector = 1..50;

llamada  = record
	nivelImportancia : nivel;
	SectorEmpresa:sector;
	numEmpleado:integer;
	end;
	
lista = ^nodo;

nodo = record
	dato:llamada;
	sig:lista;
	end;
	
vector = array [nivel] of lista;

procedure inicializarVector(var v:vector);
var
	i:integer;
begin
	for i:= 1 to nivelImportancia do
		v[i]:=nil;
end;

procedure leer (var reg:llamada);
begin
	reg.nivelImportancia := Random(5)+1;
	reg.sector := Random(50)+1;
	reg.numEmpleado:= Random(700);  //podrian ser mas o menos Puse de ejemplo
end;

procedure insertarOrdenado (var l:lista; reg:llamada);
var
	nuevo,actual,anterior:lista;
begin
	new (nuevo);
	nuevo^.dato:=reg;
	nuevo^.sih:=nil;
	
	if (l = nil)then
		l:=nuevo
	else
		begin
			actual:=l;
			anterior:=l;
			while (actual <> nil) && (reg.sector < l^.dato.sector)do
				begin
					anterior:=actual;
					actual:=actual^.sig;
				end;
			if (actual=l)then
				begin
					nuevo^.sig:=l;
					l:=actual;
				end
			else
				begin
					anterior^.sig:=nuevo;
					nuevo^.sig:=actual;
				end;
		end;


end;

procedure cargarVector(var v:vector);
var
	reg:llamada;
	i:integer;
	
begin
	inicializarVector(v);
	for i:= 1 to dimf do
		begin
			leer(reg);
			insertarOrdenado(v[reg.nivelImportancia],reg);
		end;
end;

	
var 
	v:vector;
	l:lista;
	nivelImportancia:integer;
BEGIN
	Randomize;
	cargarVector(v);
	writeln ('Ingrese nivel de importancia');readln(nivelImportancia);
	cargarArbol(v[nivelImportancia],a);
END.


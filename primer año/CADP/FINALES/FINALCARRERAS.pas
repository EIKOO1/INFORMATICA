{
 SE DISPONE DE LA INFORMACION DE LOS PARTICIPANTES INSCRIPTOS A UNA CARRERA (A LO SUMO 5000) de cada participante se tiene
 * DNI,NOMBRE  Y APELLIDO,CATEGORIA (1..5) Y FECHA DE INSCRIPCION.SE PIDE IMPLEMENTAR UN PROGRAMA QUE GUARDE EN UNA ESTRUCTURA ADECUADA
 * LOS PARTICIPANTES DE AQUELLAS CATEGORIAS QUE POSEAN A LO SUMO 50 INSCRIPTOS.SE SABE QUE CADA PARTICIPANTE SE PUEDE ANOTAR EN UNA SOLA CATEGORIA
}


program FinalInscriptos;
const
dimf = 5000;

type
categoria = 1..5;

participantes = record
	dni:integer;
	nombre:String;
	apellido:String;
	cat:categoria;
	fecInscrip:integer;
	end;

vector = array [1..dimf] of participantes;

vectorContador = array[categoria] of integer;

lista = ^nodo;

nodo =  record
	dato:participantes;
	sig:lista;
	end;
	
procedure cargarVector(var v:vector; var diml:integer);
var
	p:participantes;
begin
	writeln ('ingrese DNI');readln (p.dni);
	while ((diml < dimf) and (p.dni <> -1))do
		begin
			diml:= diml+1;
			writeln ('ingrese nombre');readln (p.nombre);
			writeln ('ingrese apellido'); readln (p.apellido);
			writeln ('Ingrese categoria'); readln(p.cat);
			writeln ('ingrese fecha inscripcion'); readln(p.fecInscrip);
			v[diml]:=p;
			writeln ('INGRESE UN NUEVO DNI'); readln (p.dni);
		end;
end;


procedure inicializarVectorContador (var vc:vectorContador);
var
	i:integer;
begin
	for i:= 1 to 5 do
		vc[i]:=0;
end;

procedure procesarVector(v:vector ; diml:integer;vc:vectorContador);
var
	i:integer;
begin
	for i :=  1 to diml do
		begin
			vc[v[i].cat]:=vc[vc[v[i].cat]]+1; 
		end;

end;
procedure agregarAdelante(var l:lista;dato:participantes);
var
	nuevo:lista;
begin
	new (nuevo);
	nuevo^.dato:=dato;
	nuevo^.sig:=l;
	l:=nuevo;
end;


procedure cargarLista(v:vector;diml:integer;vc:vectorContador;l:lista);
var
	i:integer;
begin
	for i:= 1 to diml do
		begin
			if (vc[v[i].cat]>50) then
				agregarAdelante(l,v[i]);
		end;
end;

var
 v:vector;
 diml:integer;
 l:lista;
 vc:vectorContador;
 
begin
	l:=nil;
	diml:= 0;
	cargarVector(v,diml); // se dispone
	inicializarVectorContador(vc);
	procesarVector(v,diml,vc);
	cargarLista(v,diml,vc,l);
	end.


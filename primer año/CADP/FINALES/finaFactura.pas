program finalComercio;
const
	dimf  = 2000;
type

factura = record
	codC:integer;
	codSuc:integer;
	montoTotal:integer;
	end;
	
vector =  array [1..dimf] of factura;

procedure cargarVector(var v:vector; var diml:integer); //se dispone

procedure procesarVector (v:vector;diml:integer);
var
	i:integer;
	sucActual:integer;
	cantActual:integer;
	maxSuc:integer;
	maxCantSuc:integer;
begin
	i:=1;
	maxCantSuc:=0
	while (i<diml)do
		begin
			cantActual:=0;
			sucActual:=v[i].
		
		
		
		end;

end;


var
	diml:integer;
	v:vector;
begin
	diml:=0;
	cargarVector(v,diml);  //se dispone
	procesarVector(v,diml);
	
end.



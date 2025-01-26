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

procedure actualizarMaximo(var maxCantSuc:integer;var maxSuc:integer;sucActual:integer;cantActual:integer);
begin
	if (cantActual>maxCantSuc)then
		begin	
			maxCantSuc:=cantActual;			//Actualizamos el maximo
			maxSuc:=sucActual;
		end;
end;


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
			sucActual:=v[i].codSuc;
			while ((i<diml) and (sucActual=v[i].codSuc)do
				begin
					cantActual:=cantActual+1;		//cuenta la cant de cada sucursal y luego actualiza maximo cuando cambia de suc
					i:=i+1;
				end;
			actualizarMaximo(maxCantSuc,maxSuc,sucActual,cantActual);
		end;
	writeln ('La sucursal con max facturas es : ' , maxSuc); 
end;


var
	diml:integer;
	v:vector;
begin
	diml:=0;
	cargarVector(v,diml);  //se dispone
	procesarVector(v,diml);
	
end.



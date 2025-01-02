{
	una panaderia artesanal de la plata vende productos de elaboracion propia.la panaderia agrupa a sus productor en 26 categorias 
(por ej:1.pan;2.medialunas.3.masas finas etc ) para cada categoria se conoce su nombre y el precio por kilo de producto.La panaderia dispone de la
informacion de todas las compras realizadas en el ultimo año.De cada compra se conoce el dni del cliente,la categoria del producto (entre 1 y 26) y 
la cantidad de kilos comprados.La informacion se encuentra ordenada por dni de cliente.

A.realizar un modulo que retorne la informacion de las categorias en una estructura de datos adecuados
informacion se lee por teclado y sin ningun orden en particular.De cada categoria se lee el nombre,el codigo (1 a 26) y el precio por kilo

B Realizar un modulo que reciba la informacion de todas las compras,la informacion de las categoraias y retorne:
1 Dni de cleiinte que mas compras ha realizado.
2.Monto total recaudado por cada categoria.
3.Cantidad total de compras de clientes con dni compuesto por al menos 3 digitos pares.
nota : implementar el programa principal.
*                                                                                                                         }
procedure ParcialPAN;
const 
fincategoria = 26;
type
cat =  1..fincategoria;

categoria =  record
	nombre:string[20];
	precio:real;				//categorias de panes
	end;

compra =  record
	dni:integer;
	cate:cat;		//cadacompra
	cantkilos:real;
	end;
	
	lista = ^nodo;

nodo = record
	dato:compra;
	sig:lista;
	end;
	

vcategoria =  array [1..fincategoria] of categoria;
vectorcontador = array [cat] of real;
procedure cargarvector (var v:vcategoria);
var
i:integer;
c:categoria;
codigo:integer;
begin
	for i := 1 to fincategoria do
		begin
			writeln ('ingrese el nombre de la categoria') ;readln (c.nombre);
			writeln ('ingrese precio por kilo' ); readln (c.precio);
			writeln ('codigo');  readln (codigo);
			v[codigo]:= c;
		end;
end;

	


procedure inicializarvectorcontador (var vc:vectorcontador);
var
i:integer;
begin
	for i := 1 to fincategoria do
		vc[i]:= 0;
end;

procedure cargarmonto ( v:vcategoria;var vc:vectorcontador;d:compra);
var
monto:real;
begin
	monto:= (d.cantkilos) *( v[d.cate].precio);
		vc[d.cate]:= vc[d.cate]+ monto;
end;

function trespares(dni:integer):boolean;
var
dig:integer;
pares:integer;
ok:boolean;
begin
	pares:=0;
	while (dni <> 0)do 
		begin
			dig:= dni mod 10 ;
			if (dig mod 2 = 0) then
				pares:=pares+1;
			dni:= dni div 10;
		end;
	if ( pares >= 3) then
		ok:= true
		else
			ok:=false;
	trespares:= ok;
end;

procedure actualizarmax (var max:integer; var maxdni:integer;dni:integer;cantcompraspordni:integer);
begin
	if (cantcompraspordni>max)then
		begin
			max:=cantcompraspordni;
			maxdni:=dni;
		end;
end;

procedure recorrerlista (l:lista;v:vcategoria;var vc:vectorcontador;var cantclientestrespares:integer;var dnimax:integer);
var
aux:lista; cantcompraspordni:integer;max:integer;
dniactual:integer;
begin
	aux:= l;
	max:=-1;
		while (l <> nil ) do
			begin
				cantcompraspordni:=0;
				dniactual:= aux^.dato.dni;
				while (l <> nil ) and (aux^.dato.dni = dniactual)do
					begin
					cantcompraspordni:= cantcompraspordni+1; //inciso 1
					
					if (trespares(aux^.dato.dni)) then
						cantclientestrespares:=cantclientestrespares+1; // 3
					cargarmonto(v,vc,aux^.dato);//2
					actualizarmax(max,dnimax,aux^.dato.dni,cantcompraspordni); //
					aux:= aux^.sig;
					end;					
			end;
end;

var
l:lista;
v:vcategoria;
vc:vectorcontador;
cantclientestrespares:integer;
dnimax:integer;
begin
	l:= nil;
{cargarvector(v);
cargarlista (l); //se dispone}
	inicializarvectorcontador (vc);
	recorrerlista(l,v,vc,cantclientestrespares,dnimax);
end.

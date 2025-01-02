{Una empresa de transporte de caudales desea optimizar el servicio que brinda a sus clientes. Para ello,
cuenta con información sobre todos los viajes realizados durante el mes de marzo. De cada viaje se cuenta
con la siguiente información: día del mes (de 1 a 31), monto de dinero transportado y distancia recorrida por
el camión (medida en kilómetros).
a. Realizar un programa que lea y almacene la información de los viajes (a lo sumo 200). La lectura finaliza
cuando se ingresa una distancia recorrida igual a 0 km, que no debe procesarse. //REALIZADO//
b. Realizar un módulo que reciba el vector generado en a) e informe:
- El monto promedio transportado de los viajes realizados //REALIZADO//
- La distancia recorrida y el día del mes en que se realizó el viaje que transportó menos dinero.//REALIZADO//
- La cantidad de viajes realizados cada día del mes.
c. Realizar un módulo que reciba el vector generado en a) y elimine todos los viajes cuya distancia
recorrida sea igual a 100 km.
Nota: para realizar el inciso b, el vector debe recorrerse una única vez}
program tres;
const
dimf =  200;
type
dias = 1..31;
viajes =  record
	dia:dias;
	monto:real;
	distancia:real;
	end;
	//registro con todos los datos del cliente 
vec = array [1..dimf]of viajes;
//vector que guarda cada viaje con registros
vecd = array[ dias] of integer;
//un vector para los dias del mes //B3 
procedure inicializard(var vd:vecd);
var
i:integer;
begin
for i := 1 to 31 do 
vd[i]:= 0;
end;
procedure cargarcliente (var v:vec ; var diml:integer; var vd:vecd);
//cargo el vector
var
c:viajes;
begin
diml:= 0;
writeln('ingrese los km  recorridos por el camion ' ); readln (c.distancia);
	while (diml < dimf) and (c.distancia > 0 ) do 
	begin
		diml:= diml+1;
		writeln ('ingrese dia del viaje'); readln (c.dia);
			//le sumo 1 al vector en cada dias por cada viaje realizado
		writeln ('ingrese el monto' ); readln (c.monto);
		v[diml]:= c;
		//paso mi registro a la posicion del vector 
		writeln ('ingrese los km recorridos '); readln (c.distancia);
			//leo otra distancia para analizar 
	end;
end;
function promedio (v:vec;diml:integer):real;
//funcion para devolver el promedio de todos los viajes 
var
i:integer;
suma:real;
begin
suma:= 0;
for i := 1 to diml do begin
//lee todo los registros guardados
	suma:= suma + v[i].monto;
	//suma todos los montos de los viajes realizados
end;
promedio := suma/diml ;
end;
procedure minimo (v:vec;diml:integer; var min:viajes );
var
i:integer;
begin
min.monto:=26756;
//inicializo un maximo que seguro va a modificarse
for i := 1 to diml do begin
	if (v[i].monto < min.monto) then 
	//si lo que esta cargado en el monto en la posicion del vector es menor a mi min.monto
	min := v[i];		
	//asigno mi registro min lo que esta cargador en mi vector de registro en esa posicion
end;
end;
procedure procesardatos (v:vec; diml:integer;vd:vecd);
var
i:integer;
min:viajes;
begin
			//El monto promedio transportado de los viajes realizados 	//B1
writeln(' el promedio total de los viajes es ' ,(promedio (v,diml)):2:2); //B1
			//- La distancia recorrida y el día del mes en que se realizó el viaje que transportó menos dinero. 	//B2
minimo (v,diml,min); //B2
writeln ('informacion del dia con menor monto dia');
writeln (min.dia);
writeln((min.distancia):2:2,' KMS');
writeln ((min.monto):2:2,'$');
//muestro el registro  //B2
for i := 1 to diml do 
	vd[v[i].dia]:= vd[v[i].dia] +1;
	//le asigno a vectordias lo que esta en la en el dia del vector en la posicion i
for i := 1 to 31 do  //B3
	writeln ('el dia ', i , ' se realizaron ', vd[i] , ' viajes ' );//B3
//B3
end;
procedure mostrar(v:vec;diml:integer);
//muestra los vectores cargados
var
i:integer;
begin
for i := 1 to diml do 
begin
writeln (' viaje nro' , i);
 writeln ('el dia del viaje fue = ',v[i].dia);
 writeln ('el monto total fue de = ' ,(v[i].monto):2:2);
 writeln ('la distancia recorrida fue = ',(v[i].distancia):2:2,' KM ');
 end;0'-.ñ.i
 end;
 procedure eliminar100(var v:vec; var diml:integer);
 var
 i:integer;
 begin
 for i := 1 to diml do begin
 if (v[i].distancia <= 100) then begin
	v[i]:= v[i+1];
	diml:= diml-1;
		writeln ('se elimino con exito');
		end;
 end;
 end; 

//programa principal
var
v:vec;
vd:vecd;
diml:integer;
begin
inicializard(vd); //inciso c 
cargarcliente (v,diml,vd); //inciso a 
eliminar100(v,diml);
procesardatos (v,diml,vd); //inciso b
mostrar (v,diml);
end.

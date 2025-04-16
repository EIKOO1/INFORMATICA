{
   EJ6.pas
   
   Copyright 2025 facuv <facuv@EIKO>
   
   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
   MA 02110-1301, USA.
   
   
}


program untitled;
const 
	valoralto = 9999;
	dimf  = 1;

type
		municipio = record
			codL:integer;
			codC:integer;
			cantA:integer;
			cantN:integer;
			cantR:integer;
			cantF:integer;
			end;
		
		ministerio = record
			nomL:String[30];
			codL:integer;
			nomC:String[30];
			codC:integer;
			cantA:integer;
			cantN:integer;
			cantR:integer;
			cantF:integer;
		end;
			
detalle =  file of municipio;
			
vector = array [1..dimf] of detalle ; 

vectorReg= array [1..dimf] of municipio;

maestro =  file of ministerio;

procedure leerReg (var reg:municipio);
begin
	writeln ('INGRESE COD DE LOCALIDAD');readln (reg.codL);
	if (reg.codL <> valoralto)then
		begin
			writeln ('INGRESE COD DE CEPA');readln (reg.codC);
			writeln ('INGRESE CANTIDAD DE ACTIVOS');readln (reg.cantA);
			writeln ('CANTIDAD NUEVOS'); readln (reg.cantN);
			writeln ('CANTIDAD RECUPERADOS');readln (reg.cantR);
			writeln ('CANTIDAD DE FALLECIDOS');readln (reg.cantF);
		end;

end;

procedure crearDetalle (var d:detalle);
var
	reg:municipio;
	st:string;
begin
	writeln ('INGESE NOMBRE DEL DETALLE');readln (st);
	assign (d,st);
	rewrite(d);
	leerReg(reg);
	while (reg.codL <>valoralto)do
		begin
			write (d,reg);
			leerReg(reg);
		end;
	close (d);
	
end;

procedure crearDetalles (var v:vector);
var
	i:integer;
begin
	for i := 1 to dimf  do
		begin
			crearDetalle(v[i]);
		end;
end;

procedure leer (var d:detalle;var reg:municipio);
begin
	if (not eof (d))then
		read (d,reg)
	else
		reg.codL := valoralto;
end;

procedure minimo (var v:vector;var vecreg:vectorReg;var min:municipio);

var
	pos:integer;
	i:integer;
begin
	min.codL:=valoralto;
	min.codC:=valoralto;
	for i := 1 to dimf do
		begin
			if (vecReg[i].codL < min.codL) and (vecReg[i].codC<min.codC)then
				begin
					min:= vecReg[i];
					pos:=i;
				end;
		end;
	if (min.codL <>  valoralto)then
		begin
			leer(v[pos],vecreg[pos]);
		end;
		
end;	


procedure leerRegMaestro(var reg:ministerio);
begin
	writeln ('INGRESE COD DE LOCALIDAD');readln (reg.codL);
	if (reg.codL <> valoralto)then
		begin
			writeln ('INGRESE NOMBRE DE LA LOCALIDAD');readln (reg.nomL);
			writeln ('INGRESE COD DE CEPA');readln (reg.codC);
			writeln ('INGRESE NOMBRE DE LA CEPA');readln (reg.nomC);
			writeln ('INGRESE CANTIDAD DE ACTIVOS');readln (reg.cantA);
			writeln ('CANTIDAD NUEVOS'); readln (reg.cantN);
			writeln ('CANTIDAD RECUPERADOS');readln (reg.cantR);
			writeln ('CANTIDAD DE FALLECIDOS');readln (reg.cantF);
		end;


end;


procedure crearMaestro (var mas:maestro);
var
	reg:ministerio;
begin
	assign (mas,'Maestro');
	rewrite (mas);
	leerRegMaestro(reg);
	while (reg.codL <> valoralto)do
		begin
			write (mas,reg);
			leerRegMaestro(reg);
		end;
	close (mas);	
end;


procedure actualizarMaestro (var mas:maestro;var v:vector);

var
	i:integer;
	vecReg:vectorReg;
	min:municipio;
	masReg:ministerio;
	cantActivos:integer;
begin
	reset (mas);	
	for i:= 1 to dimf do
		begin
			reset (v[i]);
			leer(v[i],vecReg[i]);	//abro los archivos y leo el primer dato en cada uno
		end;
	minimo (v,vecReg,min);	
	cantActivos:=0;		//para contar los mas 50;
	
	read (mas,masReg);					//busco en el maestro
	 
	while (min.codL<>valoralto)do		//si hay archivos por leer;
		begin
			while (masReg.codL<>min.codL)do
			read (mas,masReg);
			while (min.codL = masReg.codL) and (min.codC = masReg.codC) do
				begin
					masReg.cantF:= masReg.cantF+min.cantF;
					masReg.cantR:= masReg.cantR+ min.cantR;
					masReg.cantA:= min.cantA;
					masReg.cantN:= min.cantN;
					minimo(v,vecReg,min);
				end;
		if (masReg.cantA > 50)then
			cantActivos:= cantActivos+1;
		seek(mas,filepos(mas)-1);
		write (mas,masReg);
		end;
		
	writeln ('CANTIDAD DE ACTIVOS  = ' , cantActivos);
	
	close (mas);
	for i:= 1 to dimf do
		close (v[i]);
end;

procedure imprimirMaestro (var m:maestro);
var
	regmas:ministerio;
begin
	reset (m);
	while (not eof (m))do
		begin
			read (m,regmas);
			writeln ('-----------------------------------------------------');
			writeln ('-------LOCALIDAD------- ',regmas.nomL);
			writeln ('--CODIGO DE LOCALIDAD-- ',regmas.codL);
			writeln ('--CODIGO Y NOMBRE DE LA CEPA-- ' ,regmas.codC);
			writeln ('-----CANTIDAD ACTIVOS------ ',regmas.cantA );
			writeln ('-----CANTIDAD NUEVOS -------- ',regmas.cantN);
			writeln ('----CANTIDAD RECUPERADOS ---',regmas.cantR);
			writeln ('------CANTIDAD FALLECIDOS --- ',regmas.cantF);
			writeln ('-----------------------------------------------------');
		end;
end;

var
	mas:maestro;
	v:vector;
 
BEGIN
	crearDetalles(v);
	crearMaestro (mas);
	actualizarMaestro(mas,v);
	imprimirMaestro(mas);
END.


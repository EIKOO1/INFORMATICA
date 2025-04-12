program ej3Practica2;
const
	valoralto='ZZZ';
type
	provincia =  record
		nombre:String[30];
		cantP:Integer;
		total:integer;
		end;
	
	encuesta = record
		nombre:String [30];
		cod:integer;
		cant:integer;
		total:integer;
		end;
		
archivo = file of encuesta;

archprovincia = file of provincia;

procedure leer (var detalle:archivo,var reg:encuesta);
begin
	if (not eof (detalle))then
		read (detalle,reg);
	else
		reg.nombre:=valoralto;
end;	

procedure minimo(var reg1,reg2:encuesta,var min:encuesta,var detalle1,detalle2:archivo);
begin
	if (reg1.nombre<reg2.nombre)then
		begin
			min:=reg1;
			leer(detalle1,reg1);
		end;
	else
		begin
			min:= r2;
			leer(detalle2,reg2)
		end;
end;

procedure actualizarMaestro (var maestro:archprovincia;var detalle1:archivo;var detalle2:archivo);
var
	regdet1,regdet2:encusta;
	min:encuesta;
	regmas:provincia;
	nombreActual:String[30];
	cantA:integer;
	cantE:integer;
begin
	reset (detalle1);
	reset (detalle2);
	reset (maestro);
	leer(detalle1,regdet1);
	leer (detalle2,regdet2);
	minimo(regdet1,regdet2,min);
	while (min.nombre<>valoralto)do
		begin
			cantA:=0;   //analfa
			cantE:=0;	//encu
			nombreActual:=min.nombre;
			while (nombreActual= min.nombre)do
				begin
					cantA:=cantA+min.cant;
					cantE:=cantE+ min.total;
					minimo(regdet1,regdet2,min);
				end;
				
			read (maestro,regmas);
			while (regmas.cod<>nombreActual)do
				read(maestro,regmas);
			
			regmas.cantP:= regmas.cantP + cantA;
			regmas.total:= regmas.total + cantE;
			seek (maestro,filepos(maestro)-1);
			write (maestro,regmas);
			
		end;
end;

var	
	maestro:archprovincia;
	detalle1,detalle2:archivo;
begin

	assign(detalle1,'detalle1.txt');
	assign (detalle2,'detalle2.txt');
	assign (maestro,'maestro.txt');
	
	cargarDetalles(detalle1);
	cargarDetalles(detalle2);
	actualizarMaestro(maestro,detalle1,detalle2)
	
	
	
END.


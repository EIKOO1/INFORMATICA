{
	Una universidad desea organizar toda la informacion referida a sus estudiantes egresados.Para cada egresado se desea
	registrar su nombre,legajo(un numero entero unico para cada estudiante)Id de la facultad a la que asistio (1..17) y promedio academico
	
	a. Un modulo que almacene todos los estudiantes egresados en una estructura que permita la busqueda eficiente de estudiantes por legJJO .La lectura fnaliza hasta leer el estudiante con promedio negativo.
	b. un Modulo que reciba la estrcutura genera en a y devuelva para cada facultad una estrcutura eficeinte para la busqueda por promedio .
	c. Un modulo  que reciba la estructura generada en b Un id de facultlad e imprima nombre y apellido del estudiante con mejor promedio de esa facultad.
}


program Final25Febrero;

const 
	dimf = 17;
	
type
	cadena = String[30];
	
	subrango = 1..17;
	
	estudiante = record
		nombre:cadena;
		legajo:integer;
		facultad:subrango;
		promedio:real;
		end;

	arbol = ^nodo ;

	nodo = record
		dato:estudiante;
		hi:arbol;
		hd:arbol;
		end;
	vector = array [1..dimf] of arbol;
	
procedure leerEstudiante(var reg:estudiante);
begin
	writeln('INGRESE PROMEDIO : ');readln(reg.promedio);
	while (reg.promedio > 0 )do
		begin
			writeln ('INGRESE NOMBRE'); readln (reg.nombre);
			writeln ('INGRESE LEGAJO');readln (reg.legajo);
			writeln ('INGRESE ID DE LA FACULTAD');readln (reg.facultad);		
		end;
end;

procedure agregar (var a:arbol; var reg:estudiante);
begin
	if (a = nil) then 
		begin 
			new (a);
			a^.dato= reg;
			a^.hi = nil;
			a^.hd = nil;
		end;
	else
		begin
			if (reg.legajo > a^.dato.legajo)then
				agregar(a^.hd,reg)
			else
				agregar(a^.hi,reg);
		end;
end;	

procedure crearArbol(var a:arbol)
var
	reg:estudiante;
begin
	a=nil;
	leerEstudiante(reg);
	while (reg.promedio > 0 )do
		begin
			agregar(a,reg);
			leerEstudiante(reg);
		end;
end;
	
procedure agregar2(var a:arbol;reg:estudiante);
begin
	if (a = nil)then
		begin
			a^.dato = reg;
			a^.hi = nil;
			a^.hd = nil;
		end;
	else
		if (reg.promedio > a^.dato.promedio)then
			agregar2(a^.hd,reg)
		else
			agregar2(a^hi,reg);
end;

procedure inicializarVector(var v:vector);
var
	i:integer;
begin
	for i := 1 to dimf do
		v[i] = nil;
end;

procedure incisoB(var a:arbol;var v:vector);
var
	reg:estudiante;
begin
	if (a <> nil)then
		begin
			reg = a^.dato;
			agregar2(v[reg.facultad],reg);
			insisoB(a^.hi,v);
			insisoB(a^.hd,v);
		end;
end;
		
procedure buscarMax(a:arbol;var max:estudiante);
begin
	if (a<>nil)then
		begin
			if (a^.dato.promedio > max.promedio )then
				max=a^.dato;
			buscarMax(a^.hd,max);
		end;
end;

procedure incisoC(v:vector);
var
	max:estudiante;
	id:integer;
begin
	max.nombre = ' ';
	writeln ('ingrese id de la facultad');readln(id);
	buscarMax(v[id],max);
	if (max <> ' ')then
		writeln('Nombre',max.nombre);
	else
		writeln('NO HAY MEJOR PROMEDIO TODOS PETES,estudien educacion fisica');
end;
	
var
	a:arbol;
	v:vector;
BEGIN
	crearArbol(a); //inciso-A
	inicializarVector(v);
	incisoB(a,v);
	incisoC(v);
	
	
END.


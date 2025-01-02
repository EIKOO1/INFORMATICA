{ La empresa Amazon Web Services (AWS) dispone de la información de sus 500 clientes monotributistas más
grandes del país. De cada cliente conoce la fecha de firma del contrato con AWS, la categoría del
monotributo (entre la A y la F), el código de la ciudad donde se encuentran las oficinales (entre 1 y 2400) y el
monto mensual acordado en el contrato. La información se ingresa ordenada por fecha de firma de contrato
(los más antiguos primero, los más recientes últimos).
Realizar un programa que lea y almacene la información de los clientes en una estructura de tipo vector. Una
vez almacenados los datos, procesar dicha estructura para obtener:
a. Cantidad de contratos por cada mes y cada año, y año en que se firmó la mayor cantidad de contratos
b. Cantidad de clientes para cada categoría de monotributo
c. Código de las 10 ciudades con mayor cantidad de clientes
d. Cantidad de clientes que superan mensualmente el monto promedio entre todos los clientes.}
program cinco;
const 
dimf = 500;
type
monotributo = 'A'..'F';
codciudad = 1..2400;

cliente=record
aws:integer;
categoria:monotributo;
codigo:codciudad;
end;


vec = array [1..dimf] of cliente;

procedure cargarvec (var v:vec);
var
i:integer;
begin
for i := 1 to dimf do
begin
writeln ('fecha de firma del contrato = '); readln (v[i].aws);
writeln ('categoria de monotributo = '); readln (v[i].categoria);
writeln ('codigo de ciudad = '); readln (v[i].codigo);
end;
end;

var
v:vec;

begin

cargarvec(v);

end.


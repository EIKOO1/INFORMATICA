using System;
using teoria6;
namespace teoria6;
 class Auto : Automotor 
{
    public TipoAuto Tipo;

    public Auto (string marca,int modelo,TipoAuto tipo) : base(marca,modelo){
        this.Tipo = tipo;
    }
    public override void Imprimir()
    {
        Console.Write($"Auto {Tipo} ");
        base.Imprimir(); //hace referencia a la superclase
    }
class Taxi :Auto{
    public int Pasajeros { get; private set; }
public Taxi(int pasajeros) : base("FORD",2023,TipoAuto.Deportivo) =>this.Pasajeros = pasajeros;
}
}
//algo parecido al ejercicio 4
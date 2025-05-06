using System;

namespace Sistema.Aplicacion.Entidades;

public class Perro : IEsAtendible, IEsVendible,IEsLavable 
{
    public void Vender (Persona p){
        Console.WriteLine ($"Vendiendo perro a persona");
    }
    public void Atiende(){
        Console.WriteLine ($"Atendiendo perro");
    }
    public void Lavar(){
        Console.WriteLine($"Lavando perro");
    }
    public void Secar(){
        Console.WriteLine($"Secando perro");
    }
}

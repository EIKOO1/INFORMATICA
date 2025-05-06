using System;

namespace Sistema.Aplicacion.Entidades;

public class Perro : IEsAtendible, IEsVendible
{
    public void Vender (Persona p){
        Console.WriteLine ($"VENDIENDO PERRO A PERSONA");
    }
    public void Atiende(){
        Console.WriteLine ($"ATENDIENDO A PERRO");
    }
}

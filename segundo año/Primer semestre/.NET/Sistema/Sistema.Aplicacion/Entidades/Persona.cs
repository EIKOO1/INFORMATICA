using System;

namespace Sistema.Aplicacion.Entidades;

public class Persona:IEsAtendible
{
    public void Atiende (){
        Console.WriteLine ("Atendiendo a persona");
    }
}

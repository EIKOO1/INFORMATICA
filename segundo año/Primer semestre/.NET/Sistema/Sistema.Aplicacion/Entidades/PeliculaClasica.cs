using System;

namespace Sistema.Aplicacion.Entidades;

public class PeliculaClasica:Pelicula,IEsAlquilable,IEsVendible
{
    public override void SeAlquila(Persona p)
    {
       Console.WriteLine($"Alquilando pelicula clasica  a persona");
    }
    public override void Devolver(Persona p)
    {
        Console.WriteLine ($"Pelicula clasica devuelta por persona");
    }
    public void Vender (Persona p){
        Console.WriteLine ($"Vendiendo pelicula clasica a persona");
    }
    
}

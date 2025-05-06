using System;

namespace Sistema.Aplicacion.Entidades;

public class Pelicula : IEsAlquilable
{
    public virtual void SeAlquila (Persona p){
        Console.WriteLine ($"Alquilando pelìcula a persona ");
    }
    public virtual void Devolver (Persona p){
        Console.WriteLine($"pelicula devuelta por persona");
    }
}

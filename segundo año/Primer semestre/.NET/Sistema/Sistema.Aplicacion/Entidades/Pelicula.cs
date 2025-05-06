using System;

namespace Sistema.Aplicacion.Entidades;

public class Pelicula : IEsAlquilable
{
    public void SeAlquila (Persona p){
        Console.WriteLine ($"SE ALQUILA A PERSONA");
    }
    public void Devolver (Persona p){
        Console.WriteLine($"PELICULA DEVUELTA POR PERSONA");
    }
}

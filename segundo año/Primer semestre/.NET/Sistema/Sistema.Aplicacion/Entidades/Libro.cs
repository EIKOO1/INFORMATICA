using System;

namespace Sistema.Aplicacion.Entidades;

public class Libro : IEsAlquilable,IEsReciclable
{
    public void SeAlquila (Persona p){
        Console.WriteLine ($"Alquilando libro a persona");
    }
    public void Devolver (Persona p){
        Console.WriteLine($"Libro devuelto por persona");
    }
    public void Reciclar()=> Console.WriteLine("Reciclando libro");
}

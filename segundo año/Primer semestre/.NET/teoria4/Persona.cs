using System;
using System.Numerics;

namespace teoria4;

public class Persona
{
    private String? Nombre;
    private int edad,dni;

public Persona (String nombre, int edad,int dni){
    this.Nombre = nombre;
    this.edad = edad;
    this.dni = dni;
}

public void Imprimir (){
    Console.WriteLine("NOMBRE : " +Nombre + " EDAD : " + edad + "DNI" + dni);
}

public Boolean esMayorQue(Persona p){
    return (this.edad > p.edad);
}

}


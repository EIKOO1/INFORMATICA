using System;

namespace teoria8;

public class Empleado (string nombre,int legajo): IComparable
{
    public string Nombre {get;} = nombre;
    public int legajo {get;} = legajo;
    public void Imprimir (){
        Console.WriteLine ($"Soy { Nombre},legajo {legajo} ");
    }
   public int CompareTo(object? obj)
   {
       int result = 0;
       if (obj is Empleado e)
       {
           int legajo = e.legajo;
           result = this.legajo.CompareTo(legajo);
       }
       return result;
    }
}

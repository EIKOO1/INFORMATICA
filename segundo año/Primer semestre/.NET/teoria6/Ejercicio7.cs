using System;

namespace teoria6;

public class Ejercicio7
{
}

abstract class g {
    public abstract void Imprimir();
}
class a :g {
public override void Imprimir() => Console.WriteLine("Soy una instancia A");
}
class b:g {
public override void Imprimir() => Console.WriteLine("Soy una instancia B");
}
class c:g {
public override  void Imprimir() => Console.WriteLine("Soy una instancia C");
}
class d:g {
public override void Imprimir() => Console.WriteLine("Soy una instancia D");
}
static class Imprimidor
{
public static void Imprimir(params object[] vector)
{
    foreach (g i in vector){
        i.Imprimir();
    }
}
}
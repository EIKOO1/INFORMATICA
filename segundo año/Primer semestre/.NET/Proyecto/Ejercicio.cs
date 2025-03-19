/*

Codificar el método Imprimir para que el siguiente código produzca la salida por consola que se
observa. Considerar que el usuario del método Imprimir podría querer más adelante imprimir otros
datos, posiblemente de otros tipos pasando una cantidad distinta de parámetros cada vez que invoque el
método. Tip: usar params



*/

Imprimir(1,3,5,"HOLA MUNDO",Tamaño.chico);

void  Imprimir(params object[]vec)
{
    foreach(object o in vec)
    {
       Console.WriteLine(o.ToString());
    }
}
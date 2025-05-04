using System;

namespace CalculoSimpple;

public class Logger : ILogger
{
    public void Log (string mensaje)
    {
        Console.WriteLine(mensaje);
    }
}

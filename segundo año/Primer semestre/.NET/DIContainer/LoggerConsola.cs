using System;
using DiContainer;

namespace DIContainer;

public class LoggerConsola : ILogger
{
public void Log(string mensaje)
{
Console.WriteLine($"{DateTime.Now:hh:mm:ss:fff} {mensaje}");
}
}
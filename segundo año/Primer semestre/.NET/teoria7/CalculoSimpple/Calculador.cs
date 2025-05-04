using System;
using System.Reflection.Metadata;

namespace CalculoSimpple;

 class Calculador
{
    ILogger _logger ;

    public Calculador (ILogger logger)
    {
        _logger= logger;
    }

    public void Calcular (int n)
    {
        int result  = (n + 5) * (n+7);
        _logger.Log($"Fin de Calculo - (result = {result})");
    } 
}

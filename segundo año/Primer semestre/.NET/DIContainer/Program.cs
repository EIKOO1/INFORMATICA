using DiContainer;
using DIContainer;
using Microsoft.Extensions.DependencyInjection;

var servicios = new ServiceCollection();  //utilizo para registrar los servicios y generar el constructor
servicios.AddSingleton<ILogger, LoggerNum>();   //Cada vez que se pida genera un uno nuevo de esa Interface
servicios.AddTransient<IServicioX, ServicioX>();    //
var proveedor = servicios.BuildServiceProvider();

var servicioX = proveedor.GetService<IServicioX>();
servicioX?.Ejecutar();

var logger = proveedor.GetService<ILogger>();
logger?.Log("Fin del programa");
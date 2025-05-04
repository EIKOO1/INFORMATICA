using System;
using Almacen.Aplicacion;
namespace Almacen.Repositorios;

public class RepositorioProductoTXT : IRepositorioProducto
{
    readonly string _nombreArch = "productos.txt";
    private static int id = 1;
    public void AgregarProducto(Producto producto)
    {
        using var sw = new StreamWriter(_nombreArch,true);
        sw.WriteLine(id++);
        sw.WriteLine(producto.Nombre);
        sw.WriteLine(producto.Precio);
    }
    public List<Producto> ListarProductos()
    {
        var resultado = new List<Producto>();
        using var sr = new StreamReader(_nombreArch);
        while (!sr.EndOfStream)
        {
            var producto = new Producto();
            producto.Id = int.Parse(sr.ReadLine() ?? "");
            producto.Nombre = sr.ReadLine() ?? "";
            producto.Precio = int.Parse(sr.ReadLine() ?? "");
            resultado.Add(producto);
        }
        return resultado;
    }

    public Producto? GetProducto(int id)
    {
        using var sr = new StreamReader(_nombreArch);
        var producto = new Producto();
        while (!sr.EndOfStream)
        {
            producto.Id = int.Parse(sr.ReadLine() ?? "");
            producto.Nombre = sr.ReadLine() ?? "";
            producto.Precio = int.Parse(sr.ReadLine() ?? "");
            if (producto.Id == id) break;
        }
        return producto;
    }
    public void ModificarProducto(Producto producto)
   {
        List <Producto> lista = ListarProductos();
        using var sw = new StreamWriter (_nombreArch,false);
        foreach (Producto l in lista){
          if (l.Id == producto.Id){
             l.Nombre=producto.Nombre;
              l.Precio = producto.Precio;
          }
        sw.WriteLine(l.Id);
        sw.WriteLine(l.Nombre);
        sw.WriteLine(l.Precio);
        }
   }
   

    public void EliminarProducto(int id)
    {
                List <Producto> lista = ListarProductos();
        using var sw = new StreamWriter (_nombreArch,false);
        foreach (Producto l in lista){
        if (l.Id == id){
            continue;
        }
        sw.WriteLine(l.Id);
        sw.WriteLine(l.Nombre);
        sw.WriteLine(l.Precio);
        }

    }

}
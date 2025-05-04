using System;
using Almacen.Aplicacion;
using Almacen.Aplicacion.Validadores;

namespace Almacen.Aplicacion;

public class AgregarProductoUseCase (IRepositorioProducto repo,ProductoValidador validador)
{
    public void Ejecutar(Producto producto)
    {
        if (!validador.Validar(producto,out String mensajeError))
        {
            throw new Exception (mensajeError);
        }
        repo.AgregarProducto(producto);
    }
}

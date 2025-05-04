using System;

namespace Almacen.Aplicacion.UseCases;

public class EliminarProductoUseCase (IRepositorioProducto repo)
{
    public void Ejecutar (int id){
        repo.EliminarProducto(id);
    }
}

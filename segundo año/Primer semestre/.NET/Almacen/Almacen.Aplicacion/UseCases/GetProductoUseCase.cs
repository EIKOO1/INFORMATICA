using System;


namespace Almacen.Aplicacion;

public class GetProductoUseCase (IRepositorioProducto repo)
{
    public Producto?  ejecutar (int id){
        return repo.GetProducto(id);
    }
}

using Almacen.Aplicacion;
using Almacen.Aplicacion.UseCases;
using Almacen.Aplicacion.Validadores;
using Almacen.Repositorios;
//configuro las dependencias 
IRepositorioProducto repo = new RepositorioProductoTXT();
//creo los casos de uso
var agregarProducto = new AgregarProductoUseCase(new RepositorioProductoTXT(),new ProductoValidador());
var listarProducto = new ListarProductosUseCase(repo);

try
{
    agregarProducto.Ejecutar(new Producto());
}
catch (Exception ex)
{
    Console.WriteLine(ex.Message);
}


//ejecuto los casos de uso

/*
agregarProducto.Ejecutar(new Producto() { Id =2,Nombre="Yerba",Precio=1000});
agregarProducto.Ejecutar(new Producto() { Id = 2,Nombre="Azúcar",Precio=500});
agregarProducto.Ejecutar(new Producto() { Id = 3,Nombre="TERMO",Precio=34000});
var lista = listarProducto.Ejecutar();

foreach(Producto p in lista)
{
Console.WriteLine(p);
}

var modificarproducto = new ModificarProductoUseCase(repo);
Producto produc = new Producto();

produc.Id = 3;
produc.Nombre="FIDEOS";
produc.Precio = 777;
modificarproducto.Ejecutar(produc);
lista=listarProducto.Ejecutar();
foreach(Producto p in lista)
{
Console.WriteLine(p);
}

var EliminarProducto  = new EliminarProductoUseCase (repo);
EliminarProducto.Ejecutar(1);
lista=listarProducto.Ejecutar();
foreach(Producto p in lista)
{
Console.WriteLine(p);
}

*/
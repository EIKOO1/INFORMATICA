using al.Aplicacion;
using AL.Aplicacion.Interfaces;

namespace AL.Aplicacion.UseCases;

public class ListarClientesUseCase(IRepositorioCliente repositorio):ClienteUseCase(repositorio)
{
   public List<Cliente> Ejecutar()
  { 
      return Repositorio.GetClientes();
  }
}
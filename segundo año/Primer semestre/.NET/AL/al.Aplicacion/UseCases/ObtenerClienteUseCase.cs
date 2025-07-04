using System;
using AL.Aplicacion.Interfaces;
using AL.Aplicacion.UseCases;

namespace al.Aplicacion.UseCases;


public class ObtenerClienteUseCase(IRepositorioCliente repositorio):ClienteUseCase(repositorio)
{
  public Cliente? Ejecutar(int id)
  {
     return Repositorio.GetCliente(id);
  }
}

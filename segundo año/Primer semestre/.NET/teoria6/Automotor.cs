using System;
using teoria6;
namespace teoria6;

  abstract class Automotor {
  protected string Marca = "";
   private int _modelo;
  public virtual int Modelo
    {
        get => _modelo;
        protected set => _modelo = (value < 2005) ? 2005 : value;
    }

    public Automotor(){

    }

    public Automotor (string marca,int modelo){
    Marca =marca;
    Modelo = modelo;
  }

  public virtual void  Imprimir()
     => Console.WriteLine($"{Marca} {Modelo}");
}
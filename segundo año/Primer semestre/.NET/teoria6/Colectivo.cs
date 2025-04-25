
namespace teoria6;

 class Colectivo : Automotor
{
    public int CantPasajeros;
     public override int Modelo
    {
        protected set =>
           base.Modelo = (value < 2015) ? 2015 : value;
    }


     public Colectivo (string marca,int modelo,int CantPasajeros) : base(marca,modelo) => this.CantPasajeros = CantPasajeros;
    
    
    public override void Imprimir(){
        Console.WriteLine($"{Marca} {Modelo} ({CantPasajeros} pasajeros)");
}

}
using System;
using System.Runtime.InteropServices;

namespace teoria6;

public class Vendedor:Empleado
{
    private double _comision ;
    public double Comision {
        get {
            return _comision;
        }
        set {
            this._comision = value;
             this._Salario = this._salarioBase + _comision;
        }
        }
    

    public Vendedor (String _Nombre,int DNI,DateTime _fechaIngreso,double salarioBase):base(_Nombre,DNI,_fechaIngreso,salarioBase){}

    public override void AumentarSalario()
    {
          DateTime tiempo = DateTime.Parse("9/4/2022");
        int antiguedad = tiempo.Year - this._FechaDeIngreso.Year-1;
        if (antiguedad <10)
        {
            double porcentaje = this._salarioBase /100*5;
            this._salarioBase +=porcentaje *antiguedad ; 
        this._Salario= this._salarioBase + this.Comision;
        }
        else
        {
            double porcentaje = this._salarioBase /100*10;
              this._salarioBase +=porcentaje *antiguedad ; 
        this._Salario= this._salarioBase + this.Comision;
        }
    }
    public override string ToString (){
        return "Vendedor " + base.ToString();
    }
}

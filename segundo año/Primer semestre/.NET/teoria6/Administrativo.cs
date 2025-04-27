using System;
using System.Data;
using System.Runtime.InteropServices;

namespace teoria6;

public class Administrativo:Empleado
{
    public Administrativo (String _Nombre,int DNI,DateTime _fechaIngreso,double salarioBase):base(_Nombre,DNI,_fechaIngreso,salarioBase){}
    private double _Premio ;
    public double premio {
        get{
            return _Premio;
        }
        set{
            _Premio = value;
            this._Salario = this._salarioBase + _Premio;
        }
    }

    public override void AumentarSalario()
    {   
        DateTime tiempo = DateTime.Parse("9/4/2022");
        int antiguedad = tiempo.Year - this._FechaDeIngreso.Year-1;
        double porcentaje = this._salarioBase /100*1;
        this._salarioBase +=porcentaje *antiguedad ; 
        this._Salario= this._salarioBase + this.premio;
    }
     public override string ToString (){
        return "administrador" + base.ToString();
    }
}

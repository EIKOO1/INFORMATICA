using System;
using System.ComponentModel.DataAnnotations.Schema;

namespace teoria6;

public abstract class Empleado
{
    public String? _Nombre {get;}
    public int dni{get;}
    public DateTime _FechaDeIngreso {get;}
    private double _SalarioBase;
    public double _salarioBase
    {
         get
        {
            return _SalarioBase;
        }
        protected set
        {
            this._SalarioBase = value;
        }
    }

    protected  double _Salario {get;set;}
    public Empleado(String _Nombre,int dni,DateTime _fechaIngreso,double salario)
    {
        this._Nombre= _Nombre;
        this.dni=dni;
        this._FechaDeIngreso=_fechaIngreso;
        this._salarioBase = salario;
    }
    public abstract void AumentarSalario();
    public override string ToString ()
    {
    return  $" Nombre : {this._Nombre}, DNI : {this.dni} antiguedad : {DateTime.Parse("9/4/2022").Year - this._FechaDeIngreso.Year-1} \n Salario base : {this._SalarioBase}, Salario : {this._Salario}";
    }
} 

using System;
using System.Runtime.InteropServices;

namespace teoria4;

public class Cuenta
{
    private double _monto;
    private int _titularDNI;
    private string? _titularNobre;

    public Cuenta (){
        this._monto = 0;
        this._titularDNI=0;
        this._titularNobre="Sin Especificar";
    }
    public Cuenta (int dni):this(){
        _titularDNI=dni;
    }
    public Cuenta(String nombre):this(){
        _titularNobre = nombre;
    }

    public Cuenta (String nom , int dni):this(){
        this._titularDNI=dni;
        this._titularNobre=nom;
    }

    public void Imprimir (){
        Console.WriteLine ($"NOMBRE : {this._titularNobre}DNI : {this._titularDNI}MONTO : {this._monto}");
    }  

    public void Depositar(double p){
        this._monto += p;
        Console.WriteLine("DEPOSITO REALIZADO...");
    }

    public void Extraer (double p){
        if (this._monto >p) this._monto-=p;
        else  
            Console.WriteLine("Fondos insuficientes...");
    }
}

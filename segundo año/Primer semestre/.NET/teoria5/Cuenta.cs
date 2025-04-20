using System;
using System.Data.Common;
using System.Security.Cryptography.X509Certificates;

namespace teoria5;

public class Cuenta
{
    private static int _sCuentas {get;set;} = 0;
    private static int _sDepositos{get;set;} = 0;
    private static int _sExtracciones{get;set;} =0;
    private double _Saldo {get;set;} = 0;
    private  int  _Id {get;set;} =1;
    public Cuenta (){
        Cuenta._sCuentas += 1;
        this._Id = _sCuentas;
        Console.WriteLine($"SE CREO LA CUENTA ID ={_Id}");
    }
    public Cuenta Depositar (double deposito){
        this._Saldo += deposito;
        Console.WriteLine($"SE DEPOSITO {deposito} EN LA CUENTA {this._Id} ( SALDO= {this._Saldo} )");
        return this;
    }
    public Cuenta Extraer (double monto) {
        if (this._Saldo < monto){
            Console.WriteLine  ("OPERACION DENEGADA-SALDO INSUFICIENTE");
            return this;  
            }
        else   
            {
                this._Saldo -= monto;
                Console.WriteLine($"SE EXTRAJO {monto} DE LA CUENTA {this._Id} (SALDO= {this._Saldo} )");
                return this;
            }
    }

}

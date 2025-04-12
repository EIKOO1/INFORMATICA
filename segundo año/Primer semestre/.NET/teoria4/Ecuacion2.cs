using System;

namespace teoria4;

public class Ecuacion2
{
    private Double _a;
    private Double _b;

    private Double _c;

public Ecuacion2 (double a,double b,double c){
    this._a = a;
    this._b=b;
    this._c=c;
}
public double getDiscriminante(){
    return (Math.Pow(this._b,2))-(4*this._a*this._c);
}

public int getCantidadDeRaices(){
    return getDiscriminante() switch {>0 => 2, <0 => 0, _ => 1};
    }

public void ImprimirRaices(){
    int aux = this.getCantidadDeRaices();
    if (aux == 2){
        double x1 = ((-this._b + Math.Sqrt(this.getDiscriminante()))/(2*this._a));
        double x2 = ((-this._b - Math.Sqrt(this.getDiscriminante()))/(2*this._a));
        Console.WriteLine(" X1: "+x1+"   X2: "+x2);
    }
    else if (aux == 1){
        double x = (-this._b)/(2*this._a);
        Console.WriteLine("La raiz de la ecuacion es: " + x);
    }
    else
        Console.WriteLine("No posee soluciones reales");
}
}



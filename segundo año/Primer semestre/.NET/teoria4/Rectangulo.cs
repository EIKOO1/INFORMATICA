using System;

namespace teoria4;

public class Rectangulo
{
    private double _base;
    private double _altura;

    public Rectangulo (double _base, double _altura) {
         this._base = _base;
         this._altura = _altura;
    }

    public double GetArea (){
        return this._base * this._altura;
    }


}

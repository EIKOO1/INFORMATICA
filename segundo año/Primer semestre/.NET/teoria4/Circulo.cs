using System;
using System.Runtime.InteropServices;

namespace teoria4;

public class Circulo
{
    private double _radio;
    public Circulo (double r){
        this._radio = r;
    }

    public double GetArea(){
        return Math.PI*(this._radio*this._radio);
    }
}

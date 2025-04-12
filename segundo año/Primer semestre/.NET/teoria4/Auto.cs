using System;

namespace teoria4;

public class Auto
{
private string? _marca;
private int _modelo;
public Auto (String Marca){
    this._marca = Marca;
}
public Auto(string marca, int modelo) : this (marca)
{
_modelo = modelo;
}
public string GetDescripcion() =>$"Auto {_marca} {_modelo}";
}

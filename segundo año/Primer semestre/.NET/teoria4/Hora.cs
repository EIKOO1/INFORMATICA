using System;

namespace teoria4;

public class Hora
{
    private int horas;
    private double minutos;
    
    private double segundos;

public Hora (int horas,int minutos,int segundos){
    this.horas = horas;
    this.minutos = minutos;
    this.segundos = segundos;
}

public Hora (double horas){   //14,45
    this.horas = (int)horas; //14
    double  parteDecimal = horas-this.horas; //14.45-14 = 0.45
    this.minutos=  Math.Round(parteDecimal*60);
    this.segundos = (((parteDecimal*60)-this.minutos)*60); // 26    
}



public void Imprimir (){
    Console.WriteLine ($"{this.horas} horas {this.minutos} minutos  {this.segundos:f3} segundos");
}
}

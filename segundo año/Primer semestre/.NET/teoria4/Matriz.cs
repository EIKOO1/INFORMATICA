using System;
using System.Dynamic;
using System.Runtime.CompilerServices;

namespace teoria4;

public class Matriz
{
    private double [,] matriz;
    public Matriz (int fila,int columnas){
        this.matriz = new double  [fila,columnas]; 
    }
    public Matriz (double [,] matriz){
        this.matriz = matriz;
    }
    public void SetElemento(int fila,int columna,double elemento){
        this.matriz[fila,columna] = elemento;
    }
    public double getElemento (int fila,int columna){
        return this.matriz [fila,columna];
    }
    
    public void imprimir(){
        for (int i=0;i<this.matriz.GetLength(0)*this.matriz.GetLength(1);i++){
            Console.Write(this.matriz[i/this.matriz.GetLength(1),i%this.matriz.GetLength(1)]);
            Console.Write(i%this.matriz.GetLength(1)==this.matriz.GetLength(1)-1 ? "\n" : " ");
        }
    }
       public void imprimir(String stringFormat){
        for (int i=0;i<this.matriz.GetLength(0)*this.matriz.GetLength(1);i++){
            Console.Write(this.matriz[i/this.matriz.GetLength(1),i%this.matriz.GetLength(1)].ToString(stringFormat));
            Console.Write(i%this.matriz.GetLength(1)==this.matriz.GetLength(1)-1 ? "\n" : " ");
            }
       }
        public double [] GetFila (int fila){
            double [] f = new double [this.matriz.GetLength(1)];
            for (int i=0;i<this.matriz.GetLength(1);i++){
                f[i] = this.matriz[fila,i];
            }
            return f;
        }
        
        public double [] GetColumnas (int columna){
            double [] c = new double [this.matriz.GetLength(0)];
            for (int i =0;i<this.matriz.GetLength(0);i++){
                c[i]=this.matriz[i,columna];
            }
            return c;
        }
        public double [] getDiagonalPrincipal(){
            int f = this.matriz.GetLength(1);
             double [] v = new double [f];
              for (int i=0;i<this.matriz.GetLength(1);i++){
                v[i] = matriz[i,i];
              }
              return v;
        }
          public double [] getDiagonalSecundaria(){
            int f = this.matriz.GetLength(1);
             double [] v = new double [f];
             int j=this.matriz.GetLength(1)-1;
              for (int i=0;i<this.matriz.GetLength(1);i++){
                v[i] = matriz[j--,i];
              }
              return v;
        }
            public void sumarle (Matriz m){
                for (int i=0;i<this.matriz.GetLength(0);i++){
                    for (int j=0;j<this.matriz.GetLength(1);j++){
                        this.matriz[i,j] += m.getElemento(i,j);
                    }
                }
            }
            public void restarle (Matriz m){
                 for (int i=0;i<this.matriz.GetLength(0);i++){
                    for (int j=0;j<this.matriz.GetLength(1);j++){
                        this.matriz[i,j] -= m.getElemento(i,j);
                    }
                }
            }   
            public void multiplicar (Matriz m){
                if (this.matriz.GetLength(1) != this.matriz.GetLength(0))
                    Console.WriteLine("LA MATRIZ NO SE PUEDE MULTIPLICAR");
                else
                    {
                        Matriz mat = new Matriz (this.matriz.GetLength(0),this.matriz.GetLength(0));
                        //F NO TENGO GANAS
                    }
    }
}

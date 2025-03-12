
//) Analizar el siguiente código. ¿Cuál es la salida por consola?

int i = 1;
 if (--i == 0) //DECREMENTA Y LUEGO EVALUA .
 {
 Console.WriteLine("cero");
 }
 if (i++ == 0)   //i sigue siendo 0 evalua y luego incrementa.
 {
 Console.WriteLine("cero");   
 }
 Console.WriteLine(i);  //en este write i ya esta incrementado en 1.

 //IMPRIME CERO,CERO,1
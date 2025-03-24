package EJ5;
/*
 /*
 5. Dado un arreglo de valores tipo entero se desea calcular el valor máximo, mínimo, y promedio 
en un único método. Escriba tres métodos de clase, donde respectivamente: 
a. Devuelva lo pedido por el mecanismo de retorno de un método en Java ("return"). 
b. Devuelva lo pedido interactuando con algún parámetro (el parámetro no puede ser de 
tipo arreglo). 
c. Devuelva lo pedido sin usar parámetros ni la sentencia "return".
 */

public class arrayEnteros {
	public static void main (String []args) { 
		int [] v = {6,3,7,9,10}; //creo el vector
		//System.out.println(Calculos.metodoA(v).toString());
		result r=new result ();
		Calculos.metodoB(v,r);	
		//Calculos.metodoC(v);
		//System.out.println(Calculos.getRes());
		
		
		
		
		
	
	
	
}
}

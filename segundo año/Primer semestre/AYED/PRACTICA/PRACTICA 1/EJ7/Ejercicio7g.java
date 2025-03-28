package tp1.ejercicio7;

import java.util.*;

public class Ejercicio7g {
	public static List<Integer> calcularSucesion (int n){
		ArrayList<Integer> L =new ArrayList<Integer>();
	return sucesion(L,n);
	}
	
	private static  List <Integer> sucesion (ArrayList<Integer>L, int n){
		if (n>1) 
		{
			if (n%2==0) 
				n=n/2;
			else
				n=3*n+1;
			L.add(n);
			sucesion(L,n);
		}
		return L;
		
	}
	public static void main (String []args) {
		Scanner s = new Scanner (System.in);
		int n = s.nextInt();
		System.out.println(calcularSucesion(n).toString());
	
	}
}

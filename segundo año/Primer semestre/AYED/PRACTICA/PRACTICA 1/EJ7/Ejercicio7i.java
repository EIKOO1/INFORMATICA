package tp1.ejercicio7;

import java.util.LinkedList;

/*
Implemente un método recursivo que calcule la suma de los elementos en un 
LinkedList.  
public int sumarLinkedList(LinkedList<Integer> lista)
 */

public class Ejercicio7i {
	public static int  sumarLinkedList(LinkedList <Integer>L) {
		return (sumarLista(L,0));
	}
	private static int sumarLista(LinkedList <Integer>L,int pos) {
		if (pos<L.size()) {
			return (L.get(pos)+sumarLista(L,++pos));
		}
		else
		{
			return 0;
		}
	}
	public static void main (String [ ]args) {
		LinkedList<Integer> L = new LinkedList<Integer>();
		L.add(34);
		L.add(55);
		System.out.println(sumarLinkedList(L));
	}
}

package tp1.ejercicio7;
import java.util.*;
import java.util.Scanner;
public class TestArrayList {
	public static void main (String []args) {
		Scanner s = new Scanner (System.in);
		ArrayList<Estudiante> L = new ArrayList<>();
		Estudiante e = new Estudiante("Michael","JOR",3,"michael@hotmail.com","345");
		L.add(e);
		e = new Estudiante ("AAA","BBB",34,"AAA@hotmail.com","666");
		L.add(e);
		e = new Estudiante ("CCC","EEE",44,"EEE@hotmail.com","7775");
		L.add(e);
		Iterator<Estudiante> it = L.iterator();
		//while (it.hasNext()) {
			//System.out.println(it.next().tusDatos());
			
			// pone el elemento, y hace el unboxing de la clase wrapper Integer
	//	}
		L.get(1).setComision(777);
		//for (Estudiante i:L) {
		//	System.out.println(i.tusDatos());
		
			//PUNTO E
	//	}
		 e = new Estudiante("AAAC","CCA",4,"CCAA@hotmail.com","CAC");
			 if (L.contains(e))
				 System.out.println("YA ESTA EN LA LISTA");
			 else	
				 L.add(e);
		 		
		
		for (Estudiante i:L) {
		System.out.println(i.tusDatos());
		}
	}
}
 
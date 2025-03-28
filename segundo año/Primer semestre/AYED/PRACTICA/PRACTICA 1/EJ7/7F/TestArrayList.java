package tp1.ejercicio7;
import java.util.*;
import java.util.Scanner;
public class TestArrayList {
	public boolean esCapicua(ArrayList<Integer> L) {
		int inicio=0;
		int Final =L.size()-1;
		while (inicio<Final) {
			if (!(L.get(inicio).equals(L.get(Final)))){
				return false;
			}
			inicio++;
			Final--;
				}
		return true;
			}
	public static void main (String []args) {
		TestArrayList test = new TestArrayList();
		ArrayList<Integer> L = new ArrayList<Integer>();
		L.add(2);
		L.add(8);
		L.add(8);
		L.add(2);
		System.out.println(test.esCapicua(L));
		
	}




}

 
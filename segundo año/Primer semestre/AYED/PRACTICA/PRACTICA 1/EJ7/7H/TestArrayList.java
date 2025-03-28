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

	public void invertirArrayList(ArrayList<Integer> L) {
		invertirRecursivo(L,0,L.size()-1);
		}
	
	
	private void invertirRecursivo(ArrayList<Integer>L,int inicio,int fin) {
		if (inicio>=fin)
			return;
			else
			{
				int item = L.get(inicio);
				L.set(inicio,L.get(fin));
				L.set(fin, item);		//intercambia los valores
				invertirRecursivo(L,++inicio,--fin);
			}
		
	}
			
		
		
		public static void main (String []args) {
		TestArrayList test = new TestArrayList();
		ArrayList<Integer> L = new ArrayList<Integer>();
		L.add(1);
		L.add(2);
		L.add(3);
		L.add(4);
		System.out.println("LISTA NORMAL"+ L);
		test.invertirArrayList(L);
		System.out.println("LISTA INVERTIDA" + L);
	}




}

 
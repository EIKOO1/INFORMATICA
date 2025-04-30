package PRACTICA3;/*Dada una clase Caminos que contiene una variable de instancia de tipo GeneralTree de números
enteros, implemente un método que retorne el camino a la hoja más lejana. En el caso de haber
más de un camino máximo retorne el primero que encuentre.
El método debe tener la siguiente firma: public List<Integer> caminoAHojaMasLejana ()*/

import java.util.LinkedList;
import java.util.List;


public class Caminos {
	private GeneralTree<Integer> arbol ;
	
	public Caminos (GeneralTree<Integer>arbol) {
		this.arbol = arbol;
	}
	
	public List<Integer> caminoAHojaMasLejana(){
		List <Integer> resultado = new LinkedList<Integer>();
		if (this.arbol != null && !this.arbol.isEmpty()) {
			caminoAHojaMasLejana2(arbol,new LinkedList<Integer>(),resultado);
		}
		return resultado;
	}	
	private static void caminoAHojaMasLejana2(GeneralTree<Integer>arbol,List<Integer>caminoActual,List<Integer>resultado) {
		caminoActual.add(arbol.getData());
		if (arbol.isLeaf()) {
			if (caminoActual.size()> resultado.size()) {
				resultado.clear();
				resultado.addAll(caminoActual);
			}
		}
		else
		{
			for (GeneralTree<Integer>hijo : arbol.getChildren()) {
				caminoAHojaMasLejana2(hijo, caminoActual, resultado);			
			}
		}
	caminoActual.remove(caminoActual.size()-1);		//backTracking
	}
}
	
package PRACTICA3;
import java.util.*;
public class DentroDeRango {
	private GeneralTree<Integer>arbol;
	
public DentroDeRango(GeneralTree<Integer>arbol) 
{
	this.arbol = arbol;
}

public List <List<Integer>> DentroDerango (GeneralTree<Integer> arbol,int min,int max)
{
	List<List<Integer>> resultado = new LinkedList <List<Integer>>();
	if (arbol !=null && !arbol.isEmpty()&&arbol.getData()>=min&&arbol.getData()<=max)
		caminosConValoresEnRango(arbol,resultado,new LinkedList<Integer>(),min,max);
	return resultado;
}
private static void caminosConValoresEnRango (GeneralTree<Integer> arbol , List<List<Integer>>resultado,List<Integer> caminoActual,int min,int max) {
	caminoActual.add(arbol.getData());
	if (arbol.isLeaf()) resultado.add(new LinkedList<Integer>(caminoActual)); //caso base : camino recorrido
	else
	{					//sino recorro los hijos
		for (GeneralTree<Integer> hijo : arbol.getChildren()) {
			if (hijo.getData() >= min && hijo.getData() <= max)
				caminosConValoresEnRango(hijo, resultado, caminoActual, min, max);
		}
	}
	caminoActual.remove(caminoActual.size()-1);
}

}

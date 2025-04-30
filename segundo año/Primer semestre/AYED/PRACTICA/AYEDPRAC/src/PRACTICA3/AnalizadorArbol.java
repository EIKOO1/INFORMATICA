package PRACTICA3;
import java.util.*;
public class AnalizadorArbol {
	private GeneralTree<AreaEmpresa> arbol ;
	
	
	public AnalizadorArbol (GeneralTree<AreaEmpresa>arbol) {
		this.arbol=arbol;
	}
	public double devolverMaximoPromedio (GeneralTree<AreaEmpresa>arbol) 
	{
		if (this.arbol.isEmpty())return -1;
		
		Queue <GeneralTree<AreaEmpresa>> cola =  new Queue <GeneralTree<AreaEmpresa>>();
		cola.enqueue(this.arbol);
		int max = -1; 
		while (!cola.isEmpty()) {
			
			int cantNodos= cola.size();
			int suma = 0;
			
			for (int i=0;i<cantNodos;i++)
			{
				GeneralTree<AreaEmpresa> aux = cola.dequeue();
				suma += aux.getData().getN();
			
				if (aux.hasChildren()) 
				{
					List <GeneralTree<AreaEmpresa>> children = aux.getChildren();
					for (GeneralTree<AreaEmpresa>hijos :children)
					{
						cola.enqueue(hijos);
					}
				}
			
			}
			max = Math.max(max,suma);	
		}
	return max;
	}
}

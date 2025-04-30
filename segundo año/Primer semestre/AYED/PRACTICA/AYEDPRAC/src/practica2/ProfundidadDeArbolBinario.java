package practica2;
import java.util.LinkedList;
import java.util.Queue;

public class ProfundidadDeArbolBinario {
	private BinaryTree<Integer> b = new BinaryTree<Integer>();

	
public ProfundidadDeArbolBinario(BinaryTree<Integer>b)	{
	this.b=b;
}
	
	

public int	 sumaElementosProfundidad (int p) {  //usare el recorrido por nivel
	//primero verifico que el nivel sea valido 
	if (p < 0||b.isEmpty()) return 0;
	//Como no se la cantidad de niveles que pueda tener el arbol verifico que al menos sea mayor a 0
	else
	{
		Queue <BinaryTree<Integer>> cola = new LinkedList<BinaryTree<Integer>>();
		cola.add(b);
		int nivelAc =0;
		int suma=0;
		while (!b.isEmpty()) {
			
			int nodos = cola.size();
			
			if (nivelAc==p) 
			{	
				for (int i=0;i<nodos;i++) {
					suma += cola.remove().getData();
					}			
			}
			
			else
				{
                                     
				for (int i=0;i<nodos;i++) {
					BinaryTree<Integer>A = cola.remove();
					if (A.hasLeftChild())
						cola.add(A.getLeftChild());
					if (A.hasRightChild())
						cola.add(A.getRightChild());
					}
				}
			nivelAc++;
			if (nivelAc>p) 
				break;
			
			}
	return suma;
	}
}
}
//

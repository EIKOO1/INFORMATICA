package practica2;

public class Transformacion  {
	private BinaryTree<Integer> b = new BinaryTree<Integer>();
	
public Transformacion (BinaryTree<Integer>b) {
	this.b =  b;
}


public BinaryTree<Integer> suma () {
	if (b.isEmpty()) {
		return null;
	}
	else
	{
		//recorro El arbol
		sumarNodos(b);
		return b;
	}
}

private int sumarNodos(BinaryTree<Integer> aux) {
	int aux2 = 0;
	
	if (aux.hasLeftChild())
		aux2 = aux2+ sumarNodos(aux.getLeftChild());   //4 
	if (aux.hasRightChild())
		aux2 = aux2+ sumarNodos(aux.getRightChild());
	if (aux.isLeaf()) {
		aux2 = aux.getData();
		aux.setData(0);
		return aux2;
	}
	aux.setData(aux2);
	return aux2;
		
		
		
		
}
}

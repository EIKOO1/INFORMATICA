package practica2;


public class ParcialArboles {
	
	private BinaryTree<Integer> b = new BinaryTree<Integer>();
	
public ParcialArboles(BinaryTree<Integer>aux) {
	this.b = aux;
}

private boolean unSoloHijo(BinaryTree<Integer> aux) {
	System.out.println((aux.hasLeftChild() && !aux.hasRightChild()) || (!aux.hasLeftChild() && aux.hasRightChild()));
    return (aux.hasLeftChild() && !aux.hasRightChild()) || (!aux.hasLeftChild() && aux.hasRightChild());
}

public boolean isLeftTree (int num) {
	if (b.isEmpty()) {				//si el arbol es vacio retorna falso
		return false;
}
	else //sino
	{
		BinaryTree<Integer>aux= buscarNum(this.b,num);   //busco el numero en el arbol 
		
		if (aux != null) {// Si no es null significa que encontre el nodo con el mismo num
			return contar1hijo(aux);   //return false o true
		}
		else
			return false;
	}	
	} 
private boolean contar1hijo(BinaryTree<Integer>aux) { 
	 int izq = 0; //inicializo para contar
	 int der =0;
		if(aux.hasLeftChild())	//pregunto si tiene hijo izquierdo
			izq = contarCantHijosUno(aux.getLeftChild());	
		if (aux.hasRightChild())
			der = contarCantHijosUno(aux.getRightChild());
		System.out.println(izq+ "DER " + der);
		return izq>der;
}

private int contarCantHijosUno(BinaryTree<Integer>aux) {
	int cont = 0;
	System.out.println(aux.getData());
	if (unSoloHijo(aux))	
		++cont;
	if (aux.hasLeftChild())
		cont+=contarCantHijosUno(aux.getLeftChild());
	if (aux.hasRightChild())
		cont+=contarCantHijosUno(aux.getRightChild());
	return cont;
}

private BinaryTree<Integer> buscarNum(BinaryTree<Integer> aux, int num) {
    if (aux == null) { 
        return null; // Caso base: si el nodo actual es nulo
    }
    
    if (aux.getData() == num) {
        return aux; // Si encuentras el número, retornas el nodo
    }

    System.out.println(aux.getData()); // Imprimir el dato actual

    // Busca en el hijo izquierdo
    if (aux.hasLeftChild()) {
    BinaryTree<Integer> resultadoIzquierdo = buscarNum(aux.getLeftChild(), num);
    if (resultadoIzquierdo != null) {
        return resultadoIzquierdo; // Si se encontró en el izquierdo, devuelves el nodo
    }
    }

    if (aux.hasLeftChild())// Busca en el hijo derecho
    	return buscarNum(aux.getRightChild(), num);
    System.out.println("AA");// Si no se encontró en el izquierdo, sigues con el derecho
    return null;
}
}


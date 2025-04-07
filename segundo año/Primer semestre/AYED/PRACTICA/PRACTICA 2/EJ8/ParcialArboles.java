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
        return resultadoIzquierdo;
    }
    }

    if (aux.hasLeftChild())
    	return buscarNum(aux.getRightChild(), num);
   
    return null;
}
public boolean esPrefijo(BinaryTree<Integer> arbol1, BinaryTree<Integer> arbol2) {
	
	boolean aux=true;
	
	if (arbol1 == null||arbol2 ==null)return false;   //arboles nulos
	
	if (arbol1.getData()!=arbol2.getData())return false;  //1 caso base datos distintos

	if (arbol1.hasLeftChild()&&!arbol2.hasLeftChild() || arbol1.hasRightChild() &&!arbol2.hasRightChild())return false; //arbol1 distintos nodos

	if (arbol1.hasLeftChild() && arbol2.hasLeftChild())
		aux = esPrefijo(arbol1.getLeftChild(),arbol2.getLeftChild());
																					//recorrido preorden
	if (arbol1.hasRightChild() && arbol2.hasRightChild())
		aux = esPrefijo(arbol1.getRightChild(),arbol2.getRightChild());

	return  aux;
		
	
	
	
	
	
	
	
	
	
}
}



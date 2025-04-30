package practica2;


public class PRACTICA {

	public static void main(String[] args) {
		
		BinaryTree<Integer> nodo1 = new BinaryTree<>(2);
		nodo1.addLeftChild(new BinaryTree<>(7));
		nodo1.addRightChild(new BinaryTree<>(-5));
		nodo1.getLeftChild().addLeftChild(new BinaryTree<>(23));
		nodo1.getLeftChild().getLeftChild().addLeftChild(new BinaryTree<>(-3));
		nodo1.getLeftChild().addRightChild(new BinaryTree<>(6));
		nodo1.getLeftChild().getRightChild().addLeftChild(new BinaryTree<>(55));
		nodo1.getLeftChild().getRightChild().addRightChild(new BinaryTree<>(11));
		nodo1.getRightChild().addLeftChild(new BinaryTree<>(19));
		nodo1.getRightChild().getLeftChild().addRightChild(new BinaryTree<>(4));
		nodo1.getRightChild().getLeftChild().getRightChild().addLeftChild(new BinaryTree<>(18));
		
		nodo1.entreNiveles(1,3);
		/*
		BinaryTree<Integer> arbol2 = new BinaryTree<>(2);
		arbol2.addLeftChild(new BinaryTree<>(7));
		arbol2.addRightChild(new BinaryTree<>(-5));
		ParcialArboles P = new ParcialArboles(nodo1);
		//System.out.println(P.isLeftTree(23));
		boolean ok =P.esPrefijo(arbol2,nodo1);
		if (ok)
			System.out.println("ES ARBOL2 ES PREFIJO DE ARBOL1");
		else
			System.out.println("EL ARBOL 2 NO ES PREFIJO DE ARBOL1");*/
	}  
	

		
	
}

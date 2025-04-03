package practica2;

public class EJ1 {
	public static void main (String[]args) {
		BinaryTree<Integer> B= new BinaryTree<Integer>(15);
		BinaryTree<Integer>hijoIzquierdo= new BinaryTree<Integer>(40);
		hijoIzquierdo.addLeftChild(new BinaryTree<Integer>(48));
		hijoIzquierdo.addRightChild(new BinaryTree<Integer>(60));
		BinaryTree<Integer>hijoDerecho= new BinaryTree<Integer>(4);		
		hijoDerecho.addLeftChild(new BinaryTree<Integer>(30));
		B.addLeftChild(hijoIzquierdo);
		B.addRightChild(hijoDerecho);

		B.entreNiveles(0,4);
		
		// 15
	//40		//4
//48	//60		//30		
		
	}
}

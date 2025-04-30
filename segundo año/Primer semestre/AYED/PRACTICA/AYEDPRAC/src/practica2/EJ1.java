package practica2;

public class EJ1 {
	public static void main (String[]args) {
		BinaryTree<Integer> B= new BinaryTree<Integer>(2);
		
		BinaryTree<Integer>hijoIzquierdo= new BinaryTree<Integer>(7);
		
		BinaryTree<Integer>hijoIzquierdo2= new BinaryTree<Integer>(23);
		
		hijoIzquierdo.addLeftChild(new BinaryTree<Integer>(-5));
		
		hijoIzquierdo.addRightChild(new BinaryTree<Integer>(60));
		
		BinaryTree<Integer>hijoDerecho= new BinaryTree<Integer>(4);		
		
		hijoDerecho.addLeftChild(new BinaryTree<Integer>(30));
		
		B.addLeftChild(hijoIzquierdo);
		B.addRightChild(hijoDerecho);
		
	
		
		// 15
	//40		//4
//48	//60		//30		
	
		ParcialArboles p = new ParcialArboles(B);
		System.out.println(p.isLeftTree(40));
	}
}

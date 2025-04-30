package practica2;


	public class ParcialArbolesalva {
		private BinaryTree<Integer> ab;

	public ParcialArbolesalva(BinaryTree<Integer> ab) {
			super();
			this.ab = ab;
		}		
public boolean isLeftTree (int num){
			if (ab.isEmpty())
				return false;
			else {
				if (ab.hasLeftChild())
					return hijosIzquierdaDerecha(buscarNodo(ab, num));
				else 
					return false;
			}
		}
			
		
		private boolean hasOneChild(BinaryTree<Integer> a) {
			return ((a.hasLeftChild() && !a.hasRightChild())||(!a.hasLeftChild() && a.hasRightChild()));
		}
		
		private int cantHijosCumple(BinaryTree<Integer> a) {
			int cont = 0;
			if(a.hasLeftChild())
				cont += cantHijosCumple(a.getLeftChild());
			if (this.hasOneChild(a))
				 cont++;
			if(a.hasRightChild())
				cont += cantHijosCumple(a.getRightChild());
			return cont;	
		}
		
		private boolean hijosIzquierdaDerecha(BinaryTree<Integer> a) {
			int i = 0, d = 0;
			System.out.println(a.getData());
			if (a.hasLeftChild())
				i = this.cantHijosCumple(a.getLeftChild());
			if (a.hasRightChild())
				d = this.cantHijosCumple(a.getRightChild());
			return i>d;
		}
		

		private BinaryTree<Integer> buscarNodo(BinaryTree<Integer> aux, int n){
			BinaryTree<Integer> a = new BinaryTree<Integer>();
			System.out.println(aux.getData());
			if (aux.getData() == n) {
				return aux;
			}
			if (aux.hasLeftChild()) {
				a=buscarNodo(aux.getLeftChild(), n);
			}
			if (a.isEmpty())	
				return a;
			if (aux.hasRightChild())
				return buscarNodo(aux.getRightChild(), n);
			return a;
		}
		
public static void main (String[]args) {
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
	ParcialArbolesalva p = new ParcialArbolesalva (nodo1);
	System.out.println(p.isLeftTree(7));
}
}
		
	


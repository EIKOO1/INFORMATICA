package practica2;

import java.util.LinkedList;

public class ContadorArbol {

	private BinaryTree<Integer>a ;
	
public ContadorArbol (BinaryTree<Integer> a) {
	this.a = a;
}
public LinkedList<Integer> numerosPares() {
	LinkedList<Integer> l =  new LinkedList<Integer>();
	if (!a.isEmpty()) {
		procesarNodo(a,l);
	}		 
	return l;
}

private LinkedList<Integer> procesarNodo(BinaryTree<Integer> a,LinkedList<Integer> l){
	if (a.getData() % 2 ==0)
		l.add(a.getData());
	if (a.hasLeftChild())
		procesarNodo(a.getLeftChild(),l);
	if (a.hasRightChild())
		procesarNodo(a.getRightChild(), l);
	return l;
}
 

}

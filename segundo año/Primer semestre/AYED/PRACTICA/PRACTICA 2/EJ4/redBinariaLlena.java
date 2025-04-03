package practica2;

public  class redBinariaLlena{

	private BinaryTree<Integer> b;
	
public redBinariaLlena(BinaryTree<Integer> a) {
	this.b = a;
}

public int retardoReenvio() {
	if (b.isEmpty())return 0;
	else
		return contarRetardo(b);
}
public int contarRetardo(BinaryTree<Integer>b) {
	int time = b.getData();
	if (b.hasLeftChild() && b.hasRightChild()) {
		if (b.getLeftChild().getData()>b.getRightChild().getData()) 
			time += contarRetardo(b.getLeftChild());
		
			else
				time+=contarRetardo(b.getRightChild());
		}
	return time;
	}
}

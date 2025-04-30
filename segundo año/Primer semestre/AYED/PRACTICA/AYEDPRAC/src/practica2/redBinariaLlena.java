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
	if (!b.isLeaf()) {	
		
			if (b.getLeftChild().getData()>b.getRightChild().getData())    //4 >2
				time +=	contarRetardo(b.getLeftChild());
			
			else	time+=	contarRetardo(b.getRightChild());
		}
	
	return time;
	}
}
				//1				--> 1 + ( 16) =17
		//4				//6		-->	6 + ( 10)
	//3		//5		//4		//10   
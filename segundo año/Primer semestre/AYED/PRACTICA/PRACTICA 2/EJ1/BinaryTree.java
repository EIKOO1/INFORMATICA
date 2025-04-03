package practica2;

import java.util.LinkedList;
import java.util.Queue;
import java.util.Stack;


public class BinaryTree <T> {
	
	private T data;
	private BinaryTree<T> leftChild;   
	private BinaryTree<T> rightChild; 

	
	public BinaryTree() {
		super();
	}

	public BinaryTree(T data) {
		this.data = data;
	}

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}
	/**
	 * Preguntar antes de invocar si hasLeftChild()
	 * @return
	 */
	public BinaryTree<T> getLeftChild() {
		return leftChild;
	}
	/**
	 * Preguntar antes de invocar si hasRightChild()
	 * @return
	 */
	public BinaryTree<T> getRightChild() {
		return this.rightChild;
	}

	public void addLeftChild(BinaryTree<T> child) {
		this.leftChild = child;
	}

	public void addRightChild(BinaryTree<T> child) {
		this.rightChild = child;
	}

	public void removeLeftChild() {
		this.leftChild = null;
	}

	public void removeRightChild() {
		this.rightChild = null;
	}

	public boolean isEmpty(){
		return (this.isLeaf() && this.getData() == null);
	}

	public boolean isLeaf() {
		return (!this.hasLeftChild() && !this.hasRightChild());

	}
		
	public boolean hasLeftChild() {
		return this.leftChild!=null;
	}

	public boolean hasRightChild() {
		return this.rightChild!=null;
	}
	@Override
	public String toString() {
		return this.getData().toString();
	}

	public  int contarHojas() {		
		int cantHojas=0;
		if (this.isEmpty())
			return 0;
		if (this.isLeaf())
			return 1;
		else
		{	
			if (this.hasLeftChild())
				cantHojas+=this.getLeftChild().contarHojas();
			if(this.hasRightChild())
				cantHojas+=this.getRightChild().contarHojas();
		}
		return cantHojas;
	}
		
		
		
	public BinaryTree<T> espejo(){
		BinaryTree<T> Bc= new BinaryTree<>(this.getData());
		
		if (Bc.isEmpty())
			return Bc;//SI ESTA VACIA
		
		else
		{
			if (this.hasLeftChild())
				Bc.addRightChild(this.getLeftChild().espejo());
			if (this.hasRightChild())
				Bc.addLeftChild(this.getRightChild().espejo());
		}
		return Bc;
			
		
	
								///CODEAR
	}
	public void entreNiveles(int n, int m) {
       //Compruebo de que los rangos sean validos;
		if (this.isEmpty()|| n<0 || n>m) {
			System.out.println("HOLA");
			return ;
		}
		Queue <BinaryTree<T>> cola =  new LinkedList<BinaryTree<T>>();  //la cola
		cola.offer(this);   //encolo la raiz
		int nivelAc=0;     //nivel en el que estoy
		while (!cola.isEmpty()) {    //La cola no este vacia
		
			int nodos = cola.size();
			//cantidad de elementos encolados;
			if (nivelAc>=n && nivelAc<=m) { 
											//si es el elemetno que busco dentro del rango
			for (int i=0;i<nodos;i++) {  		//for desde 0 hasta la cantidad que hay en el nive;l
				BinaryTree <T> nodo = cola.remove();		//genero un nodo y a ese nodo le asigno lo que quito el primer el elemento de la cola
				System.out.print("|" + nodo.getData()+"|");		//muestro el dato del nodo
				if (nodo.hasLeftChild())cola.offer(nodo.getLeftChild());		//si ese nodo tiene hijo izquierdo lo pongo en la fila
				if (nodo.hasRightChild())cola.offer(nodo.getRightChild());	//si ese nodo tiene hijo derecho lo pongo en la fila
			}
			
			System.out.println();  //espacio blanco
			}
			
			else		//SI NO ESTA DENTRO DEL RANGO
			{
				for (int i=0;i<nodos;i++) {	  //for desde 0 hasta toda la cantidad de nodos en ese nivel
					BinaryTree<T> nodo =cola.remove();		//genero un nodo que le asigno lo que este en la fila
					if (nodo.hasLeftChild())cola.offer(nodo.getLeftChild());	//si tiene hijo izquierdo lo pongo en la fila
					if (nodo.hasRightChild())cola.offer(nodo.getRightChild());
					System.out.println("a");//si tiene hijo derecho lo pongo en la fila
					}
			}
		nivelAc++;
		if (nivelAc>m) break;
		}
	}
}
			
			
			
			
			
		


					//entreNiveles(int n, m) Imprime el recorrido por niveles de los elementos del árbol
		 		//receptor entre los niveles n y m (ambos inclusive). (0≤n<m≤altura del árbol)
	


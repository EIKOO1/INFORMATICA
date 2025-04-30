	package PRACTICA3;
import java.util.*;

public class GeneralTree<T>{

	private T data;
	private List<GeneralTree<T>> children = new LinkedList<GeneralTree<T>>(); 

	public GeneralTree() {
		
	}
	public GeneralTree(T data) {
		this.data = data;
	}

	public GeneralTree(T data, List<GeneralTree<T>> children) {
		this(data);
		this.children = children;
	}	
	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}

	public List<GeneralTree<T>> getChildren() {
		return this.children;
	}
	
	public void setChildren(List<GeneralTree<T>> children) {
		if (children != null)
			this.children = children;
	}
	
	public void addChild(GeneralTree<T> child) {
		this.getChildren().add(child);
	}

	public boolean isLeaf() {
		return !this.hasChildren();
	}
	
	public boolean hasChildren() {
		return !this.children.isEmpty();
	}
	
	public boolean isEmpty() {
		return this.data == null && !this.hasChildren();
	}

	public void removeChild(GeneralTree<T> child) {
		if (this.hasChildren())
			children.remove(child);
	}
	
	public int altura() {	 
		if (this.isEmpty()) 
		{
			return -1;
		}
		
		
		int max = -1;
		List <GeneralTree<T>> children = this.getChildren();
		
		for (GeneralTree<T> child : children) {
			int altura = child.altura();
			if (altura > max) {
				max = altura;
			}
		}
		return max +1;
	}
	
	public int nivel(T dato){
		if (this.isEmpty())return 0;
		
		int nivelAc = 0 ;
		
		Queue <GeneralTree<T>>cola=new Queue <GeneralTree<T>> ();		
		cola.enqueue(this);
		cola.enqueue(null);
		while (!cola.isEmpty())
		{
			GeneralTree<T> aux = cola.dequeue();
			if (aux !=null)
			{
				if (aux.getData().equals(dato))
					return nivelAc;
				
					List <GeneralTree<T>> children = aux.getChildren();
					for (GeneralTree<T> hijo:children) 
						cola.enqueue(hijo);
			}
			else if (!cola.isEmpty()) {
                cola.enqueue(null);
                nivelAc++;
			}
		}
		return -1;
	}
	
	public int ancho()
	{
		if (this.isEmpty())return -1;
		
	Queue <GeneralTree<T>> cola = new Queue <GeneralTree<T>> ();
	cola.enqueue(this);
	int max = -1;
	while (!cola.isEmpty())
	{
		int cantNodos = cola.size();
		max = Math.max(max, cantNodos);
		for (int i=0;i<cantNodos;i++) {
			GeneralTree<T> aux =  cola.dequeue();
			if (aux.hasChildren()) {
			List <GeneralTree<T>> children =  aux.getChildren();
			for (GeneralTree<T> hijos :children) {
				cola.enqueue(hijos); 
				}
			}			
		}
	}
	return max;
}
	
	//----------------------------------------------------------
	public boolean esAncestro (GeneralTree<T> a,GeneralTree<T>b) {
	if (this != null && !this.isEmpty())
	{
		GeneralTree<T>subarbolA = buscar(this,a);
		if (subarbolA == null )return false;
		return buscar(subarbolA,b) != null;
	}
	return false;
	}
	
	private GeneralTree<T> buscar (GeneralTree<T>arbol , GeneralTree<T>a) 
	{	
		if (arbol.equals(a)) return arbol;  //si es el dato retorno
		Iterator <GeneralTree<T>> it = arbol.getChildren().iterator();   //iterator xd
		GeneralTree<T> nodo = null;		
		while (it.hasNext() && nodo ==null)   //mientras tenga siguiente y nodo sea null;
		{
			nodo=buscar(it.next(),a);	//nodo es la recursion de el siguiente elemento. fedo dobal
		}
		return nodo;
	}
	
}

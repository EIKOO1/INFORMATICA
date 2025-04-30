package PRACTICA3;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

public  class RecorridosAG {

	public static  List <Integer>numeroImparesMayoresQuePreOrden (GeneralTree<Integer>a,Integer n){
		List<Integer> aux = new LinkedList <Integer>();
		if (!a.isEmpty())
		{
			imparesPreOrden(a,n,aux);
		}
		return aux;
	}
	private static void imparesPreOrden(GeneralTree <Integer>a,Integer n,List<Integer>aux) {
		if (a.getData() % 2 != 0 && a.getData() > n)
		{
			aux.add(a.getData());
		}
		if (a.hasChildren()) {
			
			List <GeneralTree<Integer>> childrens=a.getChildren();
		
			for (GeneralTree<Integer> chil : childrens)
			{
				imparesPreOrden(chil,n,aux);
			}	
		}
	}
	public List  <Integer> numerosImparesMayoresQueInOrden(GeneralTree <Integer>a,Integer n){
		List <Integer> aux = new LinkedList<Integer>();
		if (!a.isEmpty())
		{
			imparesInOrden(a,n,aux);
			
		}
		return aux;
	}
	private static void imparesInOrden (GeneralTree <Integer>a,Integer n,List<Integer>aux) 
	{
		if (a.hasChildren())
		{
			Iterator<GeneralTree<Integer>> it = a.getChildren().iterator();
			
			while (it.hasNext())
			{
				GeneralTree <Integer>nodo = it.next();
				if (nodo.getData() % 2 != 0 && nodo.getData() > n )
				{
					System.out.println(nodo.getData());	
				}
				
			}
		}
		
	}
	
}

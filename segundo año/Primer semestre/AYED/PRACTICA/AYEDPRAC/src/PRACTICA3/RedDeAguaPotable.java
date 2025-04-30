package PRACTICA3;

import java.util.List;

public class RedDeAguaPotable {

	private GeneralTree<Character>arbol ;
	
	public RedDeAguaPotable (GeneralTree<Character>arbol)
	{
		this.arbol=arbol;
	}
	
	public double minimoCaudal(double caudal)
	{
		if (arbol ==null  && arbol.isEmpty()) 
		{
			return -1;
		}
		else
		{
			return minimoCaudal2(arbol,caudal,caudal);
		}
	}
	
	private double minimoCaudal2(GeneralTree<Character> a ,double caudal,double min)
	{
		if (a.hasChildren())
		{
			List <GeneralTree<Character>> lista = a.getChildren();
			caudal =caudal/ lista.size();
			if (caudal<min)
				min =caudal;
			for (GeneralTree<Character>hijos :lista)
			{
			min=minimoCaudal2(hijos,caudal,min);
			}
		}
	return min;	
	}
	
}

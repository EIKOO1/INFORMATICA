package PRACTICA3;
	
public class ParcialArboles {

	public static boolean esDeSeleccion (GeneralTree<Integer>arbol) {
		if (arbol != null && !arbol.isEmpty()){
			boolean resultado=esDeSeleccion2(arbol);
			return resultado;
		}
		return false;
	}
	private static boolean esDeSeleccion2(GeneralTree<Integer>arbol) {
		boolean resultado =false;				//acumulacion de resultado 
		if (arbol.isLeaf()) {					//caso base llegue al final del recorrido con el mismo resultado
			return true;
		}
		else			//sino mientras sea el mismo dato en los hijos  resultado va a ser igual a false hasta que llegue a una hoja con el dato de la raiz
		{
			for (GeneralTree<Integer>hijo : arbol.getChildren()) {
				
			if (hijo.getData()<arbol.getData()) {			//si es el mismo dato del hijo que de la raiz
				 resultado=esDeSeleccion2(hijo);			
				}
			}
		}
		return resultado;
	}
}

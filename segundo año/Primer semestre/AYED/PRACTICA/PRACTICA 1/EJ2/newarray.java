package EJ2;

public class newarray {

static int [] generar (int n) {
	int [] aux = new int [n];
	for (int i=0;i<n;i++) {
		aux[i]= n* (i+1);
	}
	return aux;
}
}

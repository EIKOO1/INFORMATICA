package EJ5;

public class Calculos {
	static String res ;
	
	
public static result metodoA (int [] v) {
		int min=Integer.MAX_VALUE;
		int max=Integer.MIN_VALUE;
		int suma=0;
		for (int i=0;i<v.length;i++) {
			if (v[i]<min) {
				min=v[i];
			}
			if (v[i]>max);
				max=v[i];
			suma += v[i];
		}
		int promedio= suma / v.length;
		return new result(max,min,promedio);	
			
}
public static void metodoB(int[]v,result r) {
	int min = Integer.MAX_VALUE;
	int max = Integer.MIN_VALUE;
	int suma=0;
	for (int i=0;i<v.length;i++) {
			if (v[i]<min);
				min=v[i];
			if (v[i]>max);
				max=v[i];
			suma += v[i];
		}
	int prom = suma / v.length;
	r.setMax(max);
	r.setMin(min);
	r.setProm(prom);
	}

public static void metodoC(int[]v) {
	int min = Integer.MAX_VALUE;
	int max = Integer.MIN_VALUE;
	int suma=0;
	for (int i=0;i<v.length;i++) {
			if (v[i]<min);
				min=v[i];
			if (v[i]>max);
				max=v[i];
			suma += v[i];
		}
	double prom = suma / v.length;
	res = "MAX: " + max + "MIN : " + min + "PROMEDIO : " + prom;
}
public static  String getRes() {
	return res;
}

}


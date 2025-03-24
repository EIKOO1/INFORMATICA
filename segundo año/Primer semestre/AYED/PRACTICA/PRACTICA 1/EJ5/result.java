package EJ5;

public class result {
private	int min,max;
private double prom;
public  result (int min,int max,double prom) {
	this.max=max;
	this.min=min;
	this.prom=prom;
}
public result() {
}
public int getMin() {
	return min;
}
public void setMin(int min) {
	this.min = min;
}
public int getMax() {
	return max;
}
public void setMax(int max) {
	this.max = max;
}
public double getProm() {
	return prom;
}
public void setProm(double prom) {
	this.prom = prom;
}
public String toString() {
    return "Resultado: {" + "Valor máximo=" + max + ", Valor mínimo:=" + min + ", Promedio=" + prom + '}';
}
}

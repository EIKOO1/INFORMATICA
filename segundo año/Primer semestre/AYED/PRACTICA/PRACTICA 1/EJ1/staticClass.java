package EJ1;

public class staticClass {

static void recorrerFor(int a,int b) {
	for (int i=a;i<=b;i++) {
		System.out.println(i);
	}
}
static void recorrerWhile(int a,int b) {
	while (a<=b) {
		System.out.println(a++);
	}
}
static void recorrerRecursivo(int a,int b) {
	if (a<=b) {
	System.out.println(a);
	recorrerRecursivo(++a, b);
		}
	}
}	


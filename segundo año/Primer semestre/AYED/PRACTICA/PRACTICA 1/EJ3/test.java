package EJ3;
import java.util.Scanner;
public class test {
	public static void main (String []args) {
		Scanner s = new Scanner(System.in);
		Estudiante [] e = new Estudiante[2];
		Profesor [] p = new Profesor[3];
	
	for (int i=0;i<2;i++) {
		e[i]= new Estudiante();
		System.out.println("INGRESE UN NOMBRE PARA ALUMNO");
		e[i].setNombre(s.next());
		System.out.println("INGRESE UN APELLIDO PARA ALUMNO");
		e[i].setApellido(s.next());
		System.out.println("INGRESE UN COMISION PARA ALUMNO");
		e[i].setComision(s.nextInt());
		System.out.println("INGRESE UN EMAIL PARA ALUMNO");
		e[i].setEmail(s.next());
		System.out.println("INGRESE UN DIRECCION PARA ALUMNO");
		e[i].setDireccion(s.next());
		}
	
	for (int i=0;i<3;i++) {
		p[i]= new Profesor();
		System.out.println("INGRESE UN NOMBRE PARA PROFESOR");
		p[i].setNombre(s.next());
		System.out.println("INGRESE UN APELLIDO PARA PROFESOR");
		p[i].setApellido(s.next());
		System.out.println("INGRESE UN CATEDRA PARA PROFESOR");
		p[i].setCatedra(s.nextInt());
		System.out.println("INGRESE UN EMAIL PARA PROFESOR");
		p[i].setEmail(s.next());
		System.out.println("INGRESE UN FACULTAD PARA PROFESOR");
		p[i].setFacultad(s.next());
	}
	for (int i=0;i<2;i++) {
		System.out.println(e[i].tusDatos());
		
	}
	for (int i=0;i<3;i++) {
		System.out.println(p[i].tusDatos());
		
	}
}
}
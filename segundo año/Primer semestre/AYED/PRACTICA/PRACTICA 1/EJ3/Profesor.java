
package EJ3;

public class Profesor {
	private String nombre;
	private String apellido;
	private String email;
	private int catedra;
	private String facultad;
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getApellido() {
		return apellido;
	}
	public void setApellido(String apellido) {
		this.apellido = apellido;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getCatedra() {
		return catedra;
	}
	public void setCatedra(int catedra) {
		this.catedra = catedra;
	}
	public String getFacultad() {
		return facultad;
	}
	public void setFacultad(String facultad) {
		this.facultad = facultad;
	}
	
	public String tusDatos() {
		return "ESTUDIANTE : "+ this.getNombre() + "  " + this.getApellido()+ "/n" + "CATEDRA:" + this.getCatedra()+"/n" + "EMAIL: " + this.getEmail()+ "/n"+"FACUTLAD : " +this.getFacultad();
		
	}}

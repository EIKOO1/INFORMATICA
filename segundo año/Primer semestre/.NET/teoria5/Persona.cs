namespace teoria5;

public class Persona
{
    public  String? Nombre {get;set;}
    public  char? Sexo {get;set;}

    public int Dni{get;set;} 
    
    public DateTime FechaNacimiento {get;set;}

    public int edad {get;}
    public Persona(){

    }
    public Persona (String nombre,char sexo,int dni,DateTime FechaNacimiento,int edad){
        this.Nombre = nombre;
        this.Sexo  = sexo;
        this.Dni = dni;
        this.FechaNacimiento = FechaNacimiento;
        this.edad= edad;
    }
    
    public  Object this [int i]{
        get 
            {
                if (i==0)return this.Nombre;
                if (i==1)return this.Sexo ;
                if (i==2)return this.Dni;
                if (i==3)return this.FechaNacimiento;
                if (i==4)return this.edad;
                return null;
            }
        set
        {
            switch (i)
            {
                case 0 : 
                    this.Nombre = (string)value;
                    break;
                case 1 :
                    this.Sexo = (char)value;
                    break;
                case 2 : 
                    this.Dni = (int)value;
                    break;
                case 3:
                    this.FechaNacimiento = (DateTime) value;
                    break;
                default :  
                    Console.WriteLine("NO SE MODIFICA");
                    break;
            }  
        }

    }
    }


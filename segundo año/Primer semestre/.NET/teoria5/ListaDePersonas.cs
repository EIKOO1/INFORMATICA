using System;
using System.Reflection;

namespace teoria5;

public class ListaDePersonas
{
    public static List <Persona> _sl {get;} = new List<Persona>();
    
    public static List <String> _slnombre {get;} = new List<string>();
    public void Agregar(Persona p ){
       _sl.Add(p);
    }       

    public Persona this [int dni]
    {
        get
        {
            foreach (Persona p in _sl)
                {
                    if (p.Dni ==dni)
                    {
                        return p;
                    }
                }
            return null;
        }
    }


    public List <String> this [Char c] {
        get
        {
            List <String> laux = new List<string>();
            foreach (String p in _slnombre)
            {  
                if (p[0] == c)
                {
                    laux.Add (p);
                }
            }
            return laux;
        }
    }
}

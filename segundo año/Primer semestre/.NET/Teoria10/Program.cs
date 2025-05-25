/*List<int> numeros = [1, 10, 7, 3, 11];
Mostrar(numeros);
var mayores6 = numeros.Where(n => n > 6);
Mostrar(mayores6);
var reverso = mayores6.Reverse();   
Mostrar(reverso);
var ordenados = reverso.OrderBy(n => n); //ordenados bajo un criterio
Mostrar(ordenados);

var suma = ordenados.Sum();   //suma
var promedio = ordenados.Average(); //Calcula 
Console.WriteLine($"suma: {suma} promedio:{promedio:0.00}");

List<int> lista1 = [1,2,3,4,5,1,2,3,4,5];
List<int> lista2 = [4,5,6,4,5,6];
var concat = lista1.Concat(lista2);
Mostrar(concat);
 lista1 = [1,2,3,4,5,1,2,3,4,5];
 lista2 = [4,5,6,4,5,6];
concat = lista1.Concat(lista2);
Mostrar(concat);
var union = lista1.Union(lista2);
Mostrar(union);


void Mostrar<T>(IEnumerable<T> secuencia)
{
   foreach (T elemento in secuencia)
   {
       Console.Write(elemento + " ");
   }
   Console.WriteLine();
}
*/
using Teoria10;

var personas = Persona.GetLista();
personas.ForEach(p => Console.WriteLine(p));

Console.WriteLine();
personas.Where(p => p.Edad >= 18).ToList().ForEach(p => Console.WriteLine(p));
namespace Escuela;
public class EscuelaSqlite
{
public static void Inicializar()
{
using var context = new EscuelaContext();
if (context.Database.EnsureCreated())
{

}
}
}
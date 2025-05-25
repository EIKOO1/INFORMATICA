using Escuela;
EscuelaSqlite.Inicializar();

using (var context = new EscuelaContext())
{
Console.WriteLine("-- Tabla Alumnos --");
foreach (var a in context.Alumnos)
{
Console.WriteLine($"{a.Id} {a.Nombre}");
}
Console.WriteLine("-- Tabla Exámenes --");
foreach (var ex in context.Examenes)
{
Console.WriteLine($"{ex.Id} {ex.Materia} {ex.Nota}");
}
}
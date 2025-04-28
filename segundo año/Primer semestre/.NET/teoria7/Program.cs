using teoria7;

StreamReader? sr = null;
StreamWriter? sw = null;
try
{
sr = new StreamReader("fuente.txt");
sw = new StreamWriter("destino.txt");
sw.Write(sr.ReadToEnd());
}
catch (Exception e)
{
Console.WriteLine(e.Message);
}
finally
{
sr?.Dispose();
sw?.Dispose();
}
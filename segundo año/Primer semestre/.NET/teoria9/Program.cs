using System.Numerics;

int i = Mayor<int>(100, 55);
Console.WriteLine(i);
string st = Mayor<string>("hola", "mundo");
Console.WriteLine(st);
Console.WriteLine(Mayor<char>('A', 'B'));

T Mayor<T>(T a, T b) where T : IComparable
{
   if (a.CompareTo(b) > 0)
   {    
       return a;
   }
   return b;
}
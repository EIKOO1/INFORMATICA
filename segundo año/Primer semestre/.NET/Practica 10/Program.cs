int[] vector = { 1, 3, 4, 5, 9, 4, 3, 4, 5, 1, 1, 4, 9, 4, 3, 1 };

var resultado = vector.GroupBy(n => n)
                      .Select(grupo => new { Numero = grupo.Key, Cantidad = grupo.Count() })
                      .OrderBy(obj => obj.Cantidad)
                      .ToList();

resultado.ForEach(obj => Console.WriteLine(obj));

using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Demo01.Clases;

public class Linq01
{
    List<string> libros = new List<string>(){
        "VB.Net Tutorial",
        "c# Tutorial",
        "TypeScript e-book",
    };
    public IEnumerable<string> ListaLibrosByNombre(string criterio){
        return libros.Where(x => x.Contains(criterio));
    }
    public void PrintData(){
    Console.WriteLine("Ingrese el criterio de busqueda");
        string criterio = Console.ReadLine();
        var resultado = ListaLibrosByNombre(criterio);
        foreach (var item in resultado)
        {
            Console.WriteLine($"Se encontro : {item}");
        }
        Console.ReadKey();
    }
    public void Query(){
        Console.WriteLine("Ingrese el criterio de busqueda");
        string criterio = Console.ReadLine();
        var expre = from x in libros where x.Contains(criterio) select x;
        List<string> result = expre.ToList();
        result.ForEach(x => Console.WriteLine($"Se encontro el libro : {x}"));
    }
}

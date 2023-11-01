using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Threading.Tasks;

namespace Demo01.Clases
{
    public class Linq02
    {
        List<Student> _students = new List<Student>(){
            new Student (){id = 1,name = "Juan",age = 20},
            new Student (){id = 2,name = "Pedro",age =19},
            new Student (){id = 3,name = "Maria",age = 18}
        };
        public void PrintData(){
            var teenPerson = _students.Where(s =>s.age > 12 && s.age<20).ToList<Student>();
            teenPerson.ForEach(tp => Console.WriteLine($"{tp.name}"));
        }
        public void PrintDateNameAge(){
            var person = (from s in _students select(s.id,s.name)).ToList();
            person.ForEach(p => Console.WriteLine($"ID:{p.id} y Nombre:{p.name}"));
        }
        public void PrintDataV2(){
            var expre = from s in _students select new {s.id,s.name};
            foreach (var item in expre){Console.WriteLine($"ID:{item.id} y Nombre:{item.name}");}
        }
    }
}
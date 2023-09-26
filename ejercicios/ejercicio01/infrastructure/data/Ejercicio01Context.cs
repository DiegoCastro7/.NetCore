using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;

namespace infrastructure.data
{
    public class Ejercicio01Context : DbContext
    {
        public Ejercicio01Context(DbContextOptions<Ejercicio01Context> options) : base(options)
        {
        }
    }
}
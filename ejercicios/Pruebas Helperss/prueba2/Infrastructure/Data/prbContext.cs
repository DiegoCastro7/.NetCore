using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Threading.Tasks;
using Core.Entities;
using Microsoft.EntityFrameworkCore;

namespace Infrastructure.Data
{
    public class prbContext : DbContext
    {
        public prbContext(DbContextOptions options) : base(options)
        {
        }

        DbSet<Bien> Biens { get; set; }
        DbSet<Daniel> Daniels { get; set; }
        DbSet<die> dies { get; set; }
        DbSet<Diego> Diegos { get; set; }
        DbSet<ed> eds { get; set; }
        DbSet<er> ers { get; set; }
        DbSet<fr> frs { get; set; }
        DbSet<fr1> fr1s { get; set; }
        DbSet<fr2> fr2s { get; set; }
        DbSet<go> gos { get; set; }
        DbSet<mariana> marianas { get; set; }
        DbSet<paola> paolas { get; set; }
        DbSet<pruebasss> pruebassss { get; set; }
        DbSet<qas> qass { get; set; }
        DbSet<ti> tis { get; set; }
        DbSet<trew> trews { get; set; }
        DbSet<ty> tys { get; set; }
        DbSet<wert> werts { get; set; }
        DbSet<yt> yts { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
            modelBuilder.ApplyConfigurationsFromAssembly(Assembly.GetExecutingAssembly());
        }
    }
}

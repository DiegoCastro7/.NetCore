using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Threading.Tasks;
using Core.Entities;
using Microsoft.EntityFrameworkCore;

namespace Infrastructure.Data
{
    public class AnimalsContext : DbContext
    {
        public AnimalsContext(DbContextOptions options) : base(options)
        {
        }

        DbSet<Cita> Citas { get; set; }
        DbSet<Ciudad> Ciudades { get; set; }
        DbSet<Cliente> Clientes { get; set; }
        DbSet<ClienteDireccion> ClienteDirecciones { get; set; }
        DbSet<ClienteTelefono> ClienteTelefonos { get; set; }
        DbSet<Departamento> Departamentos { get; set; }
        DbSet<Mascota> Mascotas { get; set; }
        DbSet<Pais> Paises { get; set; }
        DbSet<Raza> Razas { get; set; }
        DbSet<Servicio> Servicios { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
            modelBuilder.ApplyConfigurationsFromAssembly(Assembly.GetExecutingAssembly());
        }
    }
}

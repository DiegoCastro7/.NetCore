# noti-App
# veterinariaNet
# Creación de Solución

```
dotnet new sln
```

# Creación de proyectos

## Creacion proyecto ClassLib

```
dotnet new classlib -o Core
dotnet new classlib -o Infrastructure
```

## Creacion Proyecto WebApi

```
dotnet new webapi -o FolderDestino
```

El folder destino corresponde a la carpeta donde se creara el proyecto. Se recomienda que el nombre tenga la palabra Api Por ej. ApiAnimals.

# Agregar proyectos a la solucion

```
dotnet sln add ApiAnimals
dotnet sln add Core
dotnet sln add Infrastructure
```

# Agregar referencia entre Proyectos

Nota. Recuerde que las referencias se establecen desde el proyecto que contiene la referencia

```
dotnet add reference ..\Infrastructure
dotnet add reference ..\Core
```

# Instalacion de paquetes

## Proyecto WebApi

```
dotnet add package Microsoft.AspNetCore.Authentication.JwtBearer --version 7.0.10
dotnet add package Microsoft.EntityFrameworkCore --version 7.0.10
dotnet add package Microsoft.EntityFrameworkCore.Design --version 7.0.10
dotnet add package Microsoft.Extensions.DependencyInjection --version 7.0.0
dotnet add package System.IdentityModel.Tokens.Jwt --version 6.32.3
dotnet add package Serilog.AspNetCore --version 7.0.0
dotnet add package AutoMapper.Extensions.Microsoft.DependencyInjection --version 12.0.1

```

## Proyecto Infrastructure

```
dotnet add package Pomelo.EntityFrameworkCore.MySql --version 7.0.0
dotnet add package Microsoft.EntityFrameworkCore --version 7.0.10
dotnet add package CsvHelper --version 30.0.1

```
## Paquete Para el control de peticiones //Va en el API

```
dotnet add package AspNetCoreRateLimit --version 5.0.0

```
![image](https://drive.google.com/uc?export=view&id=1pst95gYdKZcRnal7iGLq47HFKBkr4lsm)

# Conexion Base de datos
```
 "ConnectionStrings": {
    "MySqlConex":"server=localhost;user=xxx;password=xxx;database=petShop"
  }
  
```
# Carpetas Infrastructure 
```
 -Data
    -Configuration
 -Repositories
 -UnitOfWork
```
# Carpetas Core
```
 -Entities
 -Interfaces
```
# Carpetas Api
```
 -Extensions
 -Profiles
 -Dtos
 -Helpers
```

# Apllication Service Extension 
Es lo que nos va a permitir mantener el control de nuestros endpoints 

```
 public static void ConfigureCors(this IServiceCollection services) =>
            services.AddCors(options =>
            {
                options.AddPolicy(
                    "CorsPolicy",
                    builder =>
                        builder
                            .AllowAnyOrigin() //WithOrigins("https://domini.com")
                            .AllowAnyMethod() //WithMethods(*GET", "POST")
                            .AllowAnyHeader()
                ); //WithHeaders(*accept*, "content-type")
            });

       public static void AddApplicationServices(this IServiceCollection services)
        {
            services.AddScoped<IUnitOfWork, UnitOfWork>();
        }

        public static void ConfigureRatelimiting(this IServiceCollection services)
        {
            services.AddMemoryCache();
            services.AddSingleton<IRateLimitConfiguration, RateLimitConfiguration>();
            services.AddInMemoryRateLimiting();
            services.Configure<IpRateLimitOptions>(options =>
            {
                options.EnableEndpointRateLimiting = true;
                options.StackBlockedRequests = false;
                options.HttpStatusCode = 429;
                options.RealIpHeader = "X-Real-IP";
                options.GeneralRules = new List<RateLimitRule>
                {
                    new RateLimitRule
                    {
                        Endpoint = "*",
                        Period = "10s",
                        Limit = 2
                    }
                };
            });
        }

```

Se tiene que hacer inyeccion de dependencias en el contenedor de dependencias program.cs
```

builder.Services.AddControllers();
builder.Services.ConfigureRatelimiting();

builder.Services.AddAutoMapper(Assembly.GetEntryAssembly());
builder.Services.ConfigureCors();
builder.Services.AddApplicationServices();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();


app.UseCors("CorsPolicy");

app.UseHttpsRedirection();

app.UseIpRateLimiting();

app.UseAuthorization();

app.MapControllers();

app.Run();
```
# Repositorio generico, Unidad de trabajo

Genere una clase de tipo Interface y nombrela IGenericRepository

```
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;
using Core.Entities;

namespace Core.Interfaces
{
public interface IGenericRepository<T> where T : BaseEntity
{
        Task<T> GetByIdAsync(int id);
        Task<IEnumerable<T>> GetAllAsync();
        IEnumerable<T> Find(Expression<Func<T, bool>> expression);
        Task<(int totalRegistros, IEnumerable<T> registros)> GetAllAsync(int pageIndex, int pageSize,string search);
        void Add(T entity);
        void AddRange(IEnumerable<T> entities);
        void Remove(T entity);
        void RemoveRange(IEnumerable<T> entities);
        void Update(T entity);        
}
}
```

Implemente los metodos definidos en la clase IGenericRepository

```
using System.Threading.Tasks;
using Core.Entities;
using Core.Interfaces;
using Infrastructure.Data;
using Microsoft.EntityFrameworkCore;

namespace Infrastructure.Repositories
{
    public class GenericRepository<T> : IGenericRepository<T>
        where T : BaseEntity
    {
        private readonly AnimalsContext _context;

        public GenericRepository(AnimalsContext context)
        {
            _context = context;
        }

        public virtual void Add(T entity)
        {
            _context.Set<T>().Add(entity);
        }

        public virtual void AddRange(IEnumerable<T> entities)
        {
            _context.Set<T>().AddRange(entities);
        }

        public virtual IEnumerable<T> Find(Expression<Func<T, bool>> expression)
        {
            return _context.Set<T>().Where(expression);
        }

        public virtual async Task<IEnumerable<T>> GetAllAsync()
        {
            return await _context.Set<T>().ToListAsync();
            //return (IEnumerable<T>)await _context.Paises.FromSqlRaw("SELECT * FROM pais").ToListAsync();
        }

        public virtual async Task<T> GetByIdAsync(int id)
        {
            return await _context.Set<T>().FindAsync(id);
        }

        public virtual async Task<T> GetByIdAsync(string id)
        {
            return await _context.Set<T>().FindAsync(id);
        }
        public virtual void Remove(T entity)
        {
            _context.Set<T>().Remove(entity);
        }
        public virtual void RemoveRange(IEnumerable<T> entities)
        {
            _context.Set<T>().RemoveRange(entities);
        }
        public virtual void Update(T entity)
        {
            _context.Set<T>().Update(entity);
        }
        public virtual async Task<(int totalRegistros, IEnumerable<T> registros)> GetAllAsync(
            int pageIndex,
            int pageSize,
            string _search)
        {
            var totalRegistros = await _context.Set<T>().CountAsync();
            var registros = await _context
                .Set<T>()
                .Skip((pageIndex - 1) * pageSize)
                .Take(pageSize)
                .ToListAsync();
            return (totalRegistros, registros);
        }
    }
}
```
# Controlador de guia 

``` 
public class ModuloNotificacionController : BaseControllerApi
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapper _mapper;

        public ModuloNotificacionController(IUnitOfWork unitOfWork, IMapper mapper)
        {
            _unitOfWork = unitOfWork;
            _mapper = mapper;
        }

        /* Get all Auditors in the database */
        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<ActionResult<IEnumerable<ModuloNotificacionDto>>> Get()
        {
            var moduloNoti = await _unitOfWork.ModuloNotificaciones.GetAllAsync();
            /* return Ok(auditors); */
            return _mapper.Map<List<ModuloNotificacionDto>>(moduloNoti);
        }
        [HttpPost]
        [ProducesResponseType(StatusCodes.Status201Created)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<ActionResult<ModuloNotificacion>> Post(ModuloNotificacionDto moduloNotificacionDto)
        {
            var moduloNoti = _mapper.Map<ModuloNotificacion>(moduloNotificacionDto);
            this._unitOfWork.ModuloNotificaciones.Add(moduloNoti);
            await _unitOfWork.SaveAsync();
            if (moduloNoti == null)
            {
                return BadRequest();
            }
            moduloNotificacionDto.Id = moduloNoti.Id;
            return CreatedAtAction(nameof(Post), new { id = moduloNotificacionDto.Id }, moduloNotificacionDto);
        }
        [HttpGet("{id}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<ActionResult<ModuloNotificacionDto>> Get(int id)
        {
            var moduloNoti = await _unitOfWork.ModuloNotificaciones.GetByIdAsync(id);
            if (moduloNoti == null)
            {
                return NotFound();
            }
            return _mapper.Map<ModuloNotificacionDto>(moduloNoti);
        }
        [HttpPut("{id}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<ActionResult<ModuloNotificacionDto>> Put(int id, [FromBody] ModuloNotificacionDto moduloNotificacionDto)
        {
            if (moduloNotificacionDto == null)
                return NotFound();
            var moduloNoti = _mapper.Map<ModuloNotificacion>(moduloNotificacionDto);
            _unitOfWork.ModuloNotificaciones.Update(moduloNoti);
            await _unitOfWork.SaveAsync();
            return moduloNotificacionDto;
        }

        [HttpDelete("{id}")]
        [ProducesResponseType(StatusCodes.Status204NoContent)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<IActionResult> Delete(int id)
        {
            var moduloNoti = await _unitOfWork.ModuloNotificaciones.GetByIdAsync(id);
            if (moduloNoti == null)
            {
                return NotFound();
            }
            _unitOfWork.ModuloNotificaciones.Remove(moduloNoti);
            await _unitOfWork.SaveAsync();
            return NoContent();
        }
    }

```

# Pager
```
    public class Pager<T> where T : class
    {
        public string Search { get; set; }
        public int PageIndex { get; set; }
        public int PageSize { get; set; }
        public int Total { get; set; }
        public List<T> Registers { get; private set; }

        public Pager() { }

        public Pager(List<T> registers, int total, int pageIndex, int pageSize, string search)
        {
            Registers = registers;
            Total = total;
            PageIndex = pageIndex;
            PageSize = pageSize;
            Search = search;
        }

        public int TotalPages
        {
            get { return (int)Math.Ceiling(Total / (double)PageSize); }
            set { this.TotalPages = value; }
        }

        public bool HasPreviousPage
        {
            get { return (PageIndex > 1); }
            set { this.HasPreviousPage = value; }
        }

        public bool HasNextPage
        {
            get { return (PageIndex < TotalPages); }
            set { this.HasNextPage = value; }
        }
    }
```

# Params

```
  public class Params
    {
        private int _pageSize = 5;
        private const int MaxPageSize = 50;
        private int _pageIndex = 1;
        private string _search;
        public int PageSize
        {
            get => _pageSize;
            set => _pageSize = (value > MaxPageSize) ? MaxPageSize : value;
        }
        public int PageIndex
        {
            get => _pageIndex;
            set => _pageIndex = (value <= 0) ? 1 : value;
        }
        public string Search
        {
            get => _search;
            set => _search = (!String.IsNullOrEmpty(value)) ? value.ToLower() : "";
        }
    }
```
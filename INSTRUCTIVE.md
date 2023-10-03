# .NetCore ![.Net](https://img.shields.io/badge/.NET-5C2D91?style=&logo=.net&logoColor=white)
## :memo: Instructivo .NetCore
### Preparacion del equipo
---
- `Instalacion .Net`: https://dotnet.microsoft.com/en-us/download , SDK 7.0 64(x64) bits
    + dotnet --version
- `Tools .Net`: Instalacion de herramientas
    + dotnet tool install --global dotnet-ef
    + dotnet tool list --global
### Estructura del proyecto
---
- `Carpeta contenedora`: Creacion de la carpeta contenedora del proyecto con mkdir
    + Ingresar a la carpeta y crear la solucion en la carpeta:
        - dotnet new sln
- `Estructura de 3 capas`: api, core, infraestructure
    + `api`:
    + Creacion del proyecto webApi
        - dotnet new webapi -o api
    + Asociacion del proyecto api con la solución global
        - dotnet sln add api
    + `core`:
    + Creacion
        - dotnet new classlib -o core
    + Asociacion del proyecto core con la solución global
        - dotnet sln add core
    + `infrastructure`:
    + Creacion
        - dotnet new classlib -o infrastructure
    + Asociacion del proyecto infrastructure con la solución global
        - dotnet sln add infrastructure
    + `Asociacion de carpetas`:
    + infraestructure depende de core, ingresando a la carpeta infraestructure
        - dotnet add reference ../core
    + api depende de infraestructure, ingresando a la carpeta api
        - dotnet add reference ../infrastructure
### Paquetes de entity framework
---
- `Desde NuGet Gallery`:
    + `Microsoft.EntityFrameworkCore`: Instalar en infraestructure version 7.0.10
    + `Pomelo.EntityFrameworkCore.MySql`: Instalar en infraestructure version 7.0.0
### Creacion del Proyecto
---
- `Entidades`: Se debe crear la carpeta core/**entities** para almacenarlas
- `Clase de contexto`: Se debe crear la carpeta infraestructure/**data** para la conexión a la base de datos
    + Dentro de la carpeta crear la clase con el nombre del proyecto acompañada de Context: NomProyectContext
    + Heredar de DbContext:
        - public class NomProyectContext : DbContext
        - Añadir using Microsoft.EntityFrameworkCore;
    + Crear el constructor de la clase:
        - public NomProyectContext(DbContextOptions<NomProyectContext> options) : base(options)

        
    + Referenciar entidades: Referenciar cada una de las entidades creadas
        - public DbSet<Entidad> Entidades { get; set; }

------- pagina 24 md





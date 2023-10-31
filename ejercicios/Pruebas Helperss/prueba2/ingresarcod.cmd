setlocal enabledelayedexpansion

:Menu
cls
echo Seleccione una opción:
echo 1. Context
echo 2. Repository
echo 3. Unit of Work
echo 4. DTOs
echo 5. Extension
echo 6. Helpers
echo 7. Services
echo 8. Salir
set /p "opcioncod=Ingrese el número de opción deseada: "
echo !opcioncod!
cls

if %opcioncod%==1 (
    echo Ha seleccionado Context.

        REM Genera el contenido del archivo C#

        echo using System;> !ubicacionguardada!Infrastructure\Data\!proyecto!Context.cs
        echo using System.Collections.Generic;>> !ubicacionguardada!Infrastructure\Data\!proyecto!Context.cs
        echo using System.Linq;>> !ubicacionguardada!Infrastructure\Data\!proyecto!Context.cs
        echo using System.Reflection;>> !ubicacionguardada!Infrastructure\Data\!proyecto!Context.cs
        echo using System.Threading.Tasks;>> !ubicacionguardada!Infrastructure\Data\!proyecto!Context.cs
        echo using Core.Entities;>> !ubicacionguardada!Infrastructure\Data\!proyecto!Context.cs
        echo using Microsoft.EntityFrameworkCore;>> !ubicacionguardada!Infrastructure\Data\!proyecto!Context.cs
        echo.>> !ubicacionguardada!Infrastructure\Data\!proyecto!Context.cs
        echo namespace Infrastructure.Data>> !ubicacionguardada!Infrastructure\Data\!proyecto!Context.cs
        echo {>> !ubicacionguardada!Infrastructure\Data\!proyecto!Context.cs
        echo     public class !proyecto!Context : DbContext>> !ubicacionguardada!Infrastructure\Data\!proyecto!Context.cs
        echo     {>> !ubicacionguardada!Infrastructure\Data\!proyecto!Context.cs
        echo         public !proyecto!Context^(DbContextOptions options^) : base^(options^)>> !ubicacionguardada!Infrastructure\Data\!proyecto!Context.cs
        echo         {>> !ubicacionguardada!Infrastructure\Data\!proyecto!Context.cs
        echo         }>> !ubicacionguardada!Infrastructure\Data\!proyecto!Context.cs
        echo.>> !ubicacionguardada!Infrastructure\Data\!proyecto!Context.cs

        REM Itera a través de los archivos en el directorio

        for %%f in ("%~dp0Core\Entities\*") do (
            set "nombre=%%~nf"
            if not "!nombre!"=="BaseEntity" (
                echo         DbSet^<!nombre!^> ^!nombre^!s ^{ get; set; ^}>> !ubicacionguardada!Infrastructure\Data\!proyecto!Context.cs
            )
        )

        REM Generar el contenido faltante del codigo

        echo.>> !ubicacionguardada!Infrastructure\Data\!proyecto!Context.cs
        echo         protected override void OnModelCreating^(ModelBuilder modelBuilder^)>> !ubicacionguardada!Infrastructure\Data\!proyecto!Context.cs
        echo         {>> !ubicacionguardada!Infrastructure\Data\!proyecto!Context.cs
        echo             base.OnModelCreating^(modelBuilder^);>> !ubicacionguardada!Infrastructure\Data\!proyecto!Context.cs
        echo             modelBuilder.ApplyConfigurationsFromAssembly^(Assembly.GetExecutingAssembly^(^)^);>> !ubicacionguardada!Infrastructure\Data\!proyecto!Context.cs
        echo         }>> !ubicacionguardada!Infrastructure\Data\!proyecto!Context.cs
        echo     }>> !ubicacionguardada!Infrastructure\Data\!proyecto!Context.cs
        echo }>> !ubicacionguardada!Infrastructure\Data\!proyecto!Context.cs

    goto :Menu
)
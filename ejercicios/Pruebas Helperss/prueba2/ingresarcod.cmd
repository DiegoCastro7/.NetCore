setlocal enabledelayedexpansion

:Menu

echo Seleccione una opción:
echo 1. Context
echo 2. IUnitOfWork
echo 3. MappingProfiles
echo 4. DTOs
echo 5. Extension
echo 6. Helpers
echo 7. Services
echo 8. Salir
set /p "opcioncod=Ingrese el número de opción deseada: "
echo !opcioncod!


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
) else if %opcioncod%==2 (
    echo Ha seleccionado IUnitOfWork.
    
        REM Genera el contenido del archivo C#

        echo using System;> !ubicacionguardada!Core\Interfaces\IUnitOfWork.cs
        echo using System.Collections.Generic;>> !ubicacionguardada!Core\Interfaces\IUnitOfWork.cs
        echo using System.Linq;>> !ubicacionguardada!Core\Interfaces\IUnitOfWork.cs
        echo using System.Threading.Tasks;>> !ubicacionguardada!Core\Interfaces\IUnitOfWork.cs
        echo.>> !ubicacionguardada!Core\Interfaces\IUnitOfWork.cs
        echo namespace Core.Interfaces;>> !ubicacionguardada!Core\Interfaces\IUnitOfWork.cs
        echo public interface IUnitOfWork >> !ubicacionguardada!Core\Interfaces\IUnitOfWork.cs
        echo {>> !ubicacionguardada!Core\Interfaces\IUnitOfWork.cs
        echo.>> !ubicacionguardada!Core\Interfaces\IUnitOfWork.cs

        REM Itera a través de los archivos en el directorio

        for %%f in ("%~dp0Core\Entities\*") do (
            set "nombre=%%~nf"
            if not "!nombre!"=="BaseEntity" (
                echo     I!nombre!Repository ^!nombre^!s ^{ get; ^}>> !ubicacionguardada!Core\Interfaces\IUnitOfWork.cs
            )
        )

        REM Generar el contenido faltante del codigo

        echo.>> !ubicacionguardada!Core\Interfaces\IUnitOfWork.cs
        echo     Task^<int^> SaveAsync^(^);>> !ubicacionguardada!Core\Interfaces\IUnitOfWork.cs
        echo }>> !ubicacionguardada!Core\Interfaces\IUnitOfWork.cs

    goto :Menu
) else if %opcioncod%==3 (

REM Agrega las directivas using al archivo
echo using System;> API\Profiles\MappingProfiles.cs
echo using System.Collections.Generic;>> API\Profiles\MappingProfiles.cs
echo using System.Linq;>> API\Profiles\MappingProfiles.cs
echo using System.Threading.Tasks;>> API\Profiles\MappingProfiles.cs
echo using API.Dtos;>> API\Profiles\MappingProfiles.cs
echo using AutoMapper;>> API\Profiles\MappingProfiles.cs
echo using Core.Entities;>> API\Profiles\MappingProfiles.cs
echo.>> API\Profiles\MappingProfiles.cs
echo namespace API.Profiles>> API\Profiles\MappingProfiles.cs
echo {>> API\Profiles\MappingProfiles.cs
echo     public class MappingProfiles : Profile {>> API\Profiles\MappingProfiles.cs
echo         public MappingProfiles^(^) ^{>> API\Profiles\MappingProfiles.cs
echo.>> API\Profiles\MappingProfiles.cs

REM Itera a través de los archivos en el directorio

for %%f in ("%~dp0Core\Entities\*") do (
    set "nombre=%%~nf"
    if not "!nombre!"=="BaseEntity" (
        echo             CreateMap^<!nombre!, ^!nombre^!Dto^>^(^).ReverseMap^(^);>> API\Profiles\MappingProfiles.cs
    )
)

REM Generar el contenido faltante del codigo

echo.>> API\Profiles\MappingProfiles.cs
echo         }>> API\Profiles\MappingProfiles.cs
echo     }>> API\Profiles\MappingProfiles.cs
echo }>> API\Profiles\MappingProfiles.cs

goto :Menu
)
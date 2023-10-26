@echo off
setlocal enabledelayedexpansion

:menu
cls
echo Seleccione una opcion:
echo 1. Proyecto 3 Capas
echo 2. Proyecto 4 Capas
echo 3. Salir
choice /c 123 /n /m "Elija una opcion (1/2/3): "
set "eleccion=%errorlevel%"
if "!eleccion!"=="" (
    goto :menu
)
if "!eleccion!"== 3 (
    goto :eof
)
if "!eleccion!"== 1 (
    :menu1
    cls
    echo Seleccione una opcion:
    echo 1. Creacion del Proyecto
    echo 2. Creacion de Archivos
    echo 3. Salir
    choice /c 123 /n /m "Elija una opcion (1/2/3): "
    set "eleccion=%errorlevel%"
    if "!eleccion!"=="" (
        goto :menu1
    )
    if "!eleccion!"== 3 (
        goto :eof
    )
    if "!eleccion!"== 1 (
        REM Captura la elección del usuario
        set "eleccion=%errorlevel%"
        REM Muestra las ubicaciones predeterminadas según el idioma
        echo.
        echo Ubicaciones predeterminadas:
        echo 1. Descargas
        echo 2. Documentos
        echo 3. Escritorio
        echo 4. Ubicacion Actual Sin Carpeta Contenedora
        echo 5. Ubicacion Actual Con Carpeta Contenedora

        REM Pregunta al usuario por la ubicación deseada
        choice /c 12345 /n /m "Elija una ubicacion predeterminada (1/2/3/4/5): "
        set "eleccion=%errorlevel%"

        if !eleccion! == 3 (
            set "ubicacion=Desktop"
        ) else if !eleccion! == 2 (
            set "ubicacion=Documents"
        ) else if !eleccion! == 1 (
            set "ubicacion=Downloads"
        ) else (
            set "ubicacion=%cd%"
        )

        REM Muestra la ubicación seleccionada
        echo.
        echo Ha seleccionado "!ubicacion!" como su ubicacion predeterminada.
        if not !eleccion! == 4 (
            set /p "ubicacion2=Introduce la ruta complementaria del proyecto (deje vacio para usar la ubicacion !ubicacion! como predeterminada): "
        )
        REM Validación si la ubicación es vacía
        if "!ubicacion2!"==" " (
            set "ubicacion=!UserProfile!\!ubicacion!\"
            
        ) else if !elecion! == 4 or !elecion! == 5(
            set "ubicacion=!ubicacion!"
        ) else (
            set "ubicacion=!UserProfile!\!ubicacion!\!ubicacion2!\"
        )

        echo "!ubicacion!"

        if not !eleccion! == 4 (
            REM Pregunta al usuario el nombre del proyecto
            set /p "proyecto=Introduce el nombre de tu proyecto: "
            if not !eleccion! == 5 (
                REM Crea el directorio del proyecto en la ubicación especificada
                cd "!ubicacion!"    
            )
            mkdir "!proyecto!"
            cd "!proyecto!"
        )

        REM Pregunta al usuario el nombre del proyecto
        set /p "NameContext=Introduce el nombre de tu contexto: "
        REM Crea el directorio del proyecto en la ubicación especificada

        REM Continúa con la creación del proyecto
        dotnet new sln
        dotnet new webapi -o API
        dotnet sln add API
        dotnet new classlib -o Core
        dotnet sln add Core
        dotnet new classlib -o Infrastructure
        dotnet sln add Infrastructure
        cd API
        del WeatherForecast.cs
        mkdir Controllers
        cd Controllers
        echo.>BaseController.cs
        del WeatherForecastController.cs
        cd ..
        mkdir Dtos
        mkdir Extension
        cd Extension
        echo.>ApplicationServiceExtension.cs
        cd ..
        mkdir Profiles
        cd Profiles
        echo.>MappingProfiles.cs
        cd ..
        dotnet add package AspNetCoreRateLimit --version 5.0.0
        dotnet add package Microsoft.AspNetCore.Authentication.JwtBearer --version 7.0.10
        dotnet add package Microsoft.EntityFrameworkCore --version 7.0.10
        dotnet add package Microsoft.EntityFrameworkCore.Design --version 7.0.10
        dotnet add package Microsoft.Extensions.DependencyInjection --version 7.0.0
        dotnet add package System.IdentityModel.Tokens.Jwt --version 6.32.3
        dotnet add package Serilog.AspNetCore --version 7.0.0
        dotnet add package AutoMapper.Extensions.Microsoft.DependencyInjection --version 12.0.1
        dotnet add package AspNetCore.RateLimit --version 5.0.0
        dotnet add reference ..\Infrastructure
        cd ..
        cd Infrastructure
        del Class1.cs
        dotnet add package Pomelo.EntityFrameworkCore.MySql --version 7.0.0
        dotnet add package Microsoft.EntityFrameworkCore --version 7.0.10
        dotnet add package CsvHelper --version 30.0.1
        mkdir Data\Configuration
        cd Data
        echo.>!NameContext!Context.cs
        cd ..
        mkdir Repositories
        cd Repositories
        echo.>GenericRepository.cs
        cd ..
        mkdir UnitOfWork
        cd UnitOfWork
        echo.>UnitOfWork.cs
        cd ..
        dotnet add reference ..\Core
        cd ..
        cd Core
        del Class1.cs
        mkdir Entities
        cd Entities
        echo.>BaseEntity.cs
        cd ..
        mkdir Interfaces
        cd Interfaces
        echo.>IGenericRepository.cs
        echo.>IUnitOfWork.cs
        cd ..
        cd ..
        dotnet build
        dotnet restore
        code .
    ) else if "!eleccion!"== 2 (
        REM Pregunta al usuario por el numero de entidades
        set /p "num_entidades=Introduce el numero de entidades: "

        REM Ciclo para crear las entidades
        set "count=0"
        set /a "count2=count + 1"
        :loop
        if %count% lss %num_entidades% (
            set /p "nombre_entidad=Introduce el nombre de la entidad %count2%: "
            
            REM Crea la entidad en Core\Entities
            echo.>Core\Entities\!nombre_entidad!.cs

            REM Crea la interfaz en Core\Interfaces
            echo.>Core\Interfaces\I!nombre_entidad!Repository.cs

            REM Crea el controlador en API\Controllers
            echo.>API\Controllers\!nombre_entidad!Controller.cs

            REM Crea el Dto en API\Dtos
            echo.>API\Dtos\!nombre_entidad!Dto.cs

            REM las configuraciones en Infrastructure\Data\Configuration
            echo.>Infrastructure\Data\Configuration\!nombre_entidad!Configuration.cs

            REM las configuraciones en Infrastructure\Repositories
            echo.>Infrastructure\Repositories\!nombre_entidad!Repository.cs

            set /a "count+=1"
            goto :loop
        )
    ) else (
    echo Opcion no valida.
    )

    goto :menu1



) else if "!eleccion!"== 2 (
    goto :eof
) else (
    echo Opcion no valida.
)

goto :menu
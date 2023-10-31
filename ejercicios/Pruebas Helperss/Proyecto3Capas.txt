@echo off
setlocal enabledelayedexpansion

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
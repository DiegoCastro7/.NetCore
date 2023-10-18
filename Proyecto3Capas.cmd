::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAnk
::fBw5plQjdG8=
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSDk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
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
echo 4. Ubicacion Actual

REM Pregunta al usuario por la ubicación deseada
choice /c 1234 /n /m "Elija una ubicacion predeterminada (1/2/3/4): "
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

REM Pregunta al usuario el nombre del proyecto
set /p "proyecto=Introduce el nombre de tu proyecto: "

REM Validación si la ubicación es vacía
if "!ubicacion2!"==" " (
	set "ubicacion=!UserProfile!\!ubicacion!\"
    
) else if !elecion! == 4 (
	set "ubicacion=!ubicacion!"
)else (
    	set "ubicacion=!UserProfile!\!ubicacion!\!ubicacion2!\"
)

echo "!ubicacion!"

REM Crea el directorio del proyecto en la ubicación especificada
cd "!ubicacion!"
mkdir "!proyecto!"
cd "!proyecto!"

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
dotnet add reference ..\Infrastructure
cd ..
cd Infrastructure
del Class1.cs
dotnet add package Pomelo.EntityFrameworkCore.MySql --version 7.0.0
dotnet add package Microsoft.EntityFrameworkCore --version 7.0.10
dotnet add package CsvHelper --version 30.0.1
mkdir Data\Configuration
mkdir Repository
mkdir UnitOfWork
dotnet add reference ..\Core
cd ..
cd Core
del Class1.cs
mkdir Entities
mkdir Interfaces
cd ..
dotnet build
dotnet restore
code .
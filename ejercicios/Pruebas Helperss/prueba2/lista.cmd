@echo off
setlocal enabledelayedexpansion

REM Borra la lista temporal existente
del lista_temporal.txt

REM Itera a través de los archivos en el directorio
for %%f in ("%~dp0Core\Entities\*") do (
    set "nombre=%%~nf"
    if not "!nombre!"=="BaseEntity" (
        echo !nombre!>>lista_temporal.txt
    )
)

REM Muestra la lista de nombres de archivo en la consola
type lista_temporal.txt

REM Puedes utilizar la lista como desees, por ejemplo, procesarla en tu script.

REM Itera a través de las líneas del archivo lista_temporal.txt
for /f "delims=" %%a in (lista_temporal.txt) do (
    echo Nombre del archivo: %%a
)

REM Pausa la consola para que no se cierre automáticamente
pause
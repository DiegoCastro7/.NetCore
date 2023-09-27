# .NetCore ![.Net](https://img.shields.io/badge/.NET-5C2D91?style=&logo=.net&logoColor=white)
## :hammer:Aprendiendo .NetCore
### Documentación
---
- `MD_NetCore`: Megadocumento de .NetCore
### Practicas
---
- `Practica 01`: 25/09/23 Tienda Campus - Replica Farmacampus - Acompañamiento e Instrucciones Trainer
### Ejercicios
---
- `Ejercicio 01`: 26/09/23 Tienda Campus - Replica Farmacampus - Sin Acompañamiento
    + https://github.com/trainingLeader/tiendacampus2023
### Comandos
---
-- // Migracion de datos
-	dotnet ef migrations add InitialCreate --project ./Infrastructure/ --startup-project ./API/ --output-dir ./Data/Migrations

-- // Creacion de la base de datos
- dotnet ef database update --project ./Infrastructure/ --startup-project ./API/

-- // Montar servidor API con endpoints
- dotnet run --project API/
```
InitialCreate: Nombre de la migracion
./Infrastructure/: Carpeta donde esta la migracion
./API/: Carpeta donde esta el API
./Data/Migrations: Donde se va a crear la migracion
```
### Recursos
---
- https://www.entityframeworktutorial.net/code-first/fluent-api-in-code-first.aspx
- Snippets: Abreviaciones y comandos para escribir lineas de codigo preconfiguradas
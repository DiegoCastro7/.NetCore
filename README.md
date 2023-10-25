# .NetCore ![.Net](https://img.shields.io/badge/.NET-5C2D91?style=&logo=.net&logoColor=white)
## :hammer:Aprendiendo .NetCore
### Documentación
---
- `MD_NetCore`: Megadocumento de .NetCore
### Practicas
---
- `Practica 01`: 25/09/23 Tienda Campus - Replica Farmacampus - Acompañamiento e Instrucciones Trainer
- `Practica 02`: 01/10/23 Animals App - Replica Petshop - Acompañamiento e Instrucciones Trainer
- `Practica 03`: 19/10/23 Shop Online App - Nuevo Proyecto 4 Capas - Acompañamiento e Instrucciones Trainer
### Ejercicios
---
- `Ejercicio 01`: 26/09/23 Tienda Campus - Replica Farmacampus - Sin Acompañamiento
    + https://github.com/trainingLeader/tiendacampus2023
- `Ejercicio 02`: 02/10/23 Animals App - Replica Petshop - Sin Acompañamiento
    + https://github.com/trainingLeader/animals-app.git
- `NotiApp-Diego`: 18/10/23 Noti App - Projecto Filtro
    + https://github.com/DiegoCastro7/NotiApp-Diego.git
- `DiegoC-Ropa`: 20/10/23 Noti App - Examen Filtro
    + https://github.com/DiegoCastro7/diegoc-ropa.git
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
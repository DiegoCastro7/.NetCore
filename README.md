# .NetCore ![.Net](https://img.shields.io/badge/.NET-5C2D91?style=&logo=.net&logoColor=white)
## :hammer:Aprendiendo .NetCore
### Documentación
---
- `MD_NetCore`: Megadocumento de .NetCore
### Practicas
---
- `Practica 01`: 25/09/23 Tienda Campus - Replica Farmacampus
### Ejercicios
---
- `Ejercicio 01`: --/--/-- Comment
### Comandos
---
-- // Migracion de datos
-	dotnet ef migrations add InitialCreate --project ./Infrastructure/ --startup-project ./API/ --output-dir ./Data/Migrations

-- // Creacion de la base de datos
- dotnet ef database update --project ./Infrastructure/ --startup-project ./API/
### Recursos
---
- https://www.entityframeworktutorial.net/code-first/fluent-api-in-code-first.aspx
- Snippets: Abreviaciones y comandos para escribir lineas de codigo preconfiguradas
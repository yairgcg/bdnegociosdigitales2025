# Ejercicios del Mongolo
```json

//Muestra todos los libros de la colección.
db.libros.find()

// Muestra solo el titulo y precio de todos los libros (sin mostrar _id).
db.libros.find({},{titulo: 1, precio: 1, _id: 0})

// Muestra el titulo, editorial y cantidad, pero oculta _id.
db.libros.find({},{titulo: 1,editorial: 1,cantidad: 1, _id: 0})

// Muestra los libros con precio mayor a 100
db.libros.find({precio:{$gt:100}})

//Muestra los libros con precio menor o igual a 150
db.libros.find({precio:{$lte:150}})

//Muestra los libros con cantidad mayor o igual a 10
db.libros.find({cantidad:{$gte:10}})

//Muestra los libros con cantidad menor a 5
db.libros.find({cantidad:{$lt:5}})

//Muestra los libros con precio igual a 90
db.libros.find({precio: 90})

//Muestra los libros con cantidad distinta de 10
db.libros.find({cantidad:{$ne:10}})

//Muestra los libros cuya editorial sea "Planeta" o "TechBooks"
db.libros.find({editorial: ["Planeta", "Biblio"]})
db.libros.find({ editorial: { $in: ["Planeta", "TechBooks"] } })

//Muestra los libros cuyo precio sea 100, 180 o 200
db.libros.find({precio: [100, 180, 200]})
db.libros.find({ precio: { $in: [100, 180, 200] } })

//Muestra los libros que no tengan como editorial "Biblio" ni "Terra"
db.libros.find(
    {
        editorial:
        {
            $ne: ["Biblio", "Terra"]
        }
    }
)
db.libros.find({
  editorial: { $nin: ["Biblio", "Terra"] }
})
//Muestra los libros cuyo precio no sea 90 ni 150
db.libros.find(
    {
        precio: 
        {
            $ne: [90, 150]
        }
    }
)
db.libros.find({
  precio: { $nin: [90, 150] }
})
```
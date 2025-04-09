Claro, Yair 😊 Aquí tienes tu documentación corregida, mejorada y con estilo Markdown para que luzca mucho más ordenada y profesional:

---

# 🟢 **MongoDB CRUD**

## 📁 Crear una base de datos

> ⚠️ *Una base de datos solo se crea si contiene al menos una colección.*

```js
use basededatos
```
 ## 📂 Mostrar bases de datos existentes
```js
show dbs
```


```js
use bd1
db.createCollection('Empleado')
```

---

## 📂 Crear una colección

```js
use bd1
db.createCollection('Empleado')
```

---

## 📋 Mostrar colecciones

```js
show collections
```

---

## 📝 Inserción de un documento

```js
db.Empleado.insertOne({
  nombre: 'Soyla',
  apellido: 'Vaca',
  edad: 32,
  ciudad: 'San Miguel de las Piedras'
})
```

---

## 🧩 Documento más complejo con arrays

```js
db.Empleado.insertOne({
  nombre: 'Iván',
  apellido: 'Vasaltar',
  aficion: ['Cerveza', 'Cannabis', 'Penes', 'Mentir']
})
```

> ⚠️ **Nota:** No puedes repetir dos veces el mismo campo (`apellido`). Solo se conserva uno.

---

## ❌ Eliminar una colección

```js
db.nombreColeccion.drop()
```

Ejemplo:

```js
db.ejemplo.drop()
```

---

## 🧠 Documento con estructuras anidadas y arrays

```js
db.alumno.insertOne({
  nombre: 'José Luis',
  apellido1: 'Herrera',
  apellido2: 'Gallardo',
  edad: 41,
  estudios: [
    'Ingeniería en Sistemas Computacionales',
    'Maestría en Administración de Tecnologías de Información'
  ],
  experiencia: [
    {
      lenguaje: 'SQL',
      SGBD: 'SQL Server',
      añosExperiencia: 20
    }
  ]
})
```

---

## 🆔 Insertar documento con ID manual

```js
db.alumno.insertOne({
  _id: 3,
  nombre: 'Sergio',
  apellido1: 'Ramos',
  equipo: 'Monterrey',
  aficiones: ['Dinero', 'Hombres', 'Fiesta'],
  talentos: {
    futbol: true,
    bañarse: false
  }
})
```

---

## 📄 Insertar múltiples documentos

```js
db.alumno.insertMany([
  {
    _id: 12,
    nombre: 'Oswaldo',
    apellido: 'Venado',
    edad: 20
  },
  {
    nombre: 'Maritza',
    apellido: 'Rechicken',
    edad: 21,
    habilidades: ['Ser víbora', 'Ilusionar', 'Caguamear'],
    direccion: {
      calle: 'Del Infierno',
      numero: 666
    },
    esposos: [
      {
        nombre: 'Joshua',
        edad: 20,
        pension: -34,
        hijos: ['Iván', 'José']
      },
      {
        nombre: 'Leo',
        edad: 20,
        pension: 100,
        hijos: ['Carlos', 'Ramón'],
        complaciente: true
      }
    ]
  }
])
```

> 💡 **Cuando lleva llaves `{}` es un documento.**

---

# 🔎 Búsquedas y condiciones simples

## 📚 Método `find()`

### 1. Seleccionar todos los documentos de la colección `libros`

```js
db.libros.find({})
```

### 2. Buscar por editorial

```js
db.libros.find({ Editorial: 'biblio' })
```

### 3. Buscar por precio

```js
db.libros.find({ precio: 25 })
```

### 4. Buscar por título exacto

```js
db.libros.find({ titulo: 'JSON para todos' })
```

---

## ⚖️ Operadores de comparación

🔗 [Referencia oficial de operadores](https://www.mongodb.com/docs/manual/reference/operator/query/)

### 1. Precio mayor a 25

```js
db.libros.find({ precio: { $gt: 25 } })
```

### 2. Precio igual a 25

```js
db.libros.find({ precio: { $eq: 25 } })
```

### 3. Cantidad menor a 5

```js
db.libros.find({ cantidad: { $lt: 5 } })
```

### 4. Editorial sea *biblio* o *planeta*

```js
db.libros.find({ Editorial: { $in: ['biblio', 'planeta'] } })
```

### 5. Precio sea 20 o 25

```js
db.libros.find({ precio: { $in: [20, 25] } })
```

### 6. Precio distinto a 20 o 25

```js
db.libros.find({ precio: { $nin: [20, 25] } })
```

---

## 🔗 Operadores lógicos

🔗 [Referencia oficial de operadores lógicos](https://www.mongodb.com/docs/manual/reference/operator/query-logical/)

### Ejemplo con `$or`

> Mostrar libros con precio mayor a 25 **o** cantidad menor a 15

```js
db.libros.find({
  $or: [
    { precio: { $gt: 25 } },
    { cantidad: { $lt: 15 } }
  ]
})
```

### Ejemplo con `$and` y `$or` combinados

> Mostrar libros de editorial *Biblio* con precio mayor a 40 **o** libros de *Planeta* con precio mayor a 30

```js
db.libros.find({
  $and: [
    {
      $or: [
        { editorial: 'Biblio' },
        { precio: { $gt: 40 } }
      ]
    },
    {
      $or: [
        { editorial: 'Planeta' },
        { precio: { $gt: 30 } }
      ]
    }
  ]
})
```

---

## 🔍 Proyección (mostrar solo ciertos campos)

> Sintaxis: `db.coleccion.find(filtro, campos)`

### Mostrar solo el título (sin el `_id`)

```js
db.libros.find({}, {
  titulo: 1,
  _id: 0
})
```

### Otro ejemplo:

```js
db.getCollection('libros').find(
  { editorial: 'Planeta' },
  { _id: 0, titulo: 1, editorial: 1, precio: 1 }
)
```

---

## 📦 Operador `$exists`

> Verifica si un campo existe o no en los documentos

```js
db.libros.find({
  nombreCampo: { $exists: true }
})
```

---

-- Buscar todos los documentos que no tengan cantidad
```js
db.libros.find({
  cantidad: { $exists: false }
})
```

## Operador Type 
Permite solicitar a MongoDB si un campo corresponde a un tipo
[Operador Type](https://www.mongodb.com/docs/manual/reference/operator/query/type/)


db.libros.find({
  precio:{$type:16}
})

-- Mostrar todos los documentos donde el precio sea de tipo doble o entero o cualquier otro tpo de dato
```js
db.libros.find({
  precio: {$type: 16 }
})

db.libros.insertMany({
  _id: 12,
  titulo: 'IA',
  editorial: 'Terra',
  precio: 125,
  cantidad: 20
},
{
  _id: 13,
  titulo: 'Python para todos',
  editorial: 2001,
  precio: 200,
  cantidad: 30
}
)

```
-- Insertar los documentos de libros donde los valores de la editorial sean strings 
```js
db.libros.find({
  editorial: {$type:2}
})

db.libros.find({
  editorial: {$type:16}
})
```

## Modificando documentos
### Comandos importantes
1. UpdateOne -> Modifica un solo documento
1. UpdateManu -> Modificar multiples documentos
1. ReplaceOne .> Sustituir el contenido completo de un documento

Tiene el siguiente formato
```json
db.collection.updateOne(
{
  filtro
},
{
  operador:
}
)
```
[Operadores Update](https://www.mongodb.com/docs/manual/reference/operator/update/)
**Operador Set**
1. Modificar un documento
```json
  db.libros.updateOne({
    titulo: 'Python para todos'
  },
  {
    $set: {titulo: 'Java para todos'}
  })
```

- Modificar el documento de ID 10, estableciendo el precio y la cantidad en 50

```js
db.libros.find({
  editorial: {$type:2}
})

db.libros.find({
  editorial: {$type:16}
})
```

-- Mutiplicar todos los libros donde la cantidad sea mator a 20, multiplicar la cantidad por 2. Me ayudas con este ejercicio? Mi BD se llama 
```json
  db.libros.updateOne({
    titulo: 'Python para todos'
  },
  {
    $set: {titulo: 'Java para todos'}
  })
```
-- Actualizar todos los libros multiplicando por 2 la cantidad, el precio de todos aquellos libros donde el precio sea mayor a 20

## Reemplazar Documento (replaceOne)
-- Actualizar todo el documento del id 2 por el titulo De la Tierra a la Luna, autor Julio Berte, editorial Tierra, precio 100

db.libros.replaceOne(
  { _id: 2 }, 
  {
    _id: 2,
    titulo: 'De la Tierra a la Luna',
    autor: 'Julio Verne',
    editorial: 'Terra',
    precio: 100
  }
)


## Borrar documentos
1. deleOne -> Elimina un solo documento
2. deleteMany -> Elimina multiples documentos

-- Eliminar el documento con el ID 2
deleteOne

```json
  db.libros.deleteOne(
  {
    cantidad:($gt:150)
  })
```
-- Eliminar todos los libros donde la cantidad es mayor a 150

```json
db.libros.deleteMany(
  {
    
  }
  )
```
## Expresiones Regulares
-- Seleccionar todos los libros que contengan una t minúscula
```json
db.libros.find({(Titulo:t)})
```
-- Seleccionar todos los libros que en el título contenga la palabra json
```json
db.libros.find({
  (Titulo:json)})
```


-- Seleccionar todos los documentos que en el título terminen con tos
```json
db.libros.find({
  (Titulo:/tos/)})
```

-- Seleccionar todos los libros que en el titulo comiencen con j
```json
db.libros.find({
  (Titulo:/tos/)})
```

## Expresiones $regex
[Operador Regex](https://www.mongodb.com/docs/manual/reference/operator/query/regex/)
```json

```
## Operador Reggex

-- Seleccionar todos los titulos que contengan la palabra json
```json
db.libros.find({
  titulo: { $regex: /^j/i }
})
```
-- Seleccionar todos los documentos de libros donde el titulo comience con j y no distinga entre mayúsculas y minúsculas
```json
db.libros.find({
  titulo: { $regex: /es^/i }
})
```


-- Seleccionar todos los documentos de libros donde el titulo termine con es y no distinga entre mayúsculas y minúsculas

## Método sort (Ordenar documentos)
-- Ordenar los libros de manera ascendente por el precio
```json
db.libros.find(
  {},
  { _id: 0, titulo: 1, precio: 1 }
).sort({ precio: 1 })
```
-- Ordenar los libros de manera descendente por el precio
```json
db.libros.find(
  {},
  { _id: 0, titulo: 1, precio: 1 }
).sort({ precio: -1 })

```
## Otros métodos (skip, limit, size)

# Borrar colecciones 

1. Cargar el archivo empleados.json

2. Utilizar la base de datos curso

3. Buscar todos los empleados que trabajen en google


4. Empleados que vivan en peru
![alt text](../img/p2_4.png)
5. Empleados que ganen mas de 8000 dolares
![alt text](../img/p2_5.png)
6. Empleados con ventas inferiores a 10000

![alt text](../img/p2_6.png)

7. Realizar la consulta anterior pero devolviendo una sola fila

![alt text](../img/p2_7.png)

8. Empleados que trabajan en google o en yahoo con el operador $in
![alt text](../img/p2_8.png)

9. Empleados de amazon que ganen mas de 9000 dolares

![alt text](../img/p2_9.png)
10. Empleados que trabajan en Google o en Yahoo con el operador $or

![alt text](../img/p2_10.png)

11. Empleados que trabajen en Yahoo que ganen mas de 6000 o empleados que trabajen en Google que tengan ventas inferiores a 20000
```json
    db.productos.find({$or:[{
        $and: [
    { empresa: "Yahoo"},
    { salario: 6000}
    ]},
    {
        $and: [
    {empresa: "Google"},
    {ventas: {$lt :200000}}
        ]
    }
    ]    
    })
```
![alt text](../img/p2_11.png)

12. Visualizar el nombre, apellidos y el país de cada empleado
```json
db.productos.find({},{nombre: 1, apellidos: 1, pais: 1, _id:0})
```
![alt text](../img/p2_12.png)
PRACTICA DE MODELADO DE DATOS Y SQL

Se pide crear un software para registrar los préstamos y el inventario de películas de un videoclub.

Requisitos funcionales:


1. Registrar los socios del videoclub. Al menos su nombre y apellidos,
fecha de nacimiento, telefono y su numero de identificacion (DNI, Pasaporte, o el nombre
que reciba en tu país), y nosotros le asignaremos un numero de socio que usaremos para
hacer carnets.

2. Registrar la dirección de correspondencia de los socios para, eventualmente,
hacer campanas de publicidad. Pero no es un requisito obligatorio que un socio nos de
esa informacion. Con el codigo postal, calle, numero y piso es suficiente,
sobreentendemos que sera de la misma ciudad donde esta el videoclub.

3. Registrar las películas. Puedo tener mas de una copia de cada una. De cada
película necesito registrar el título, genero, director y sinopsis.

4. Saber a que socio le he prestado cada copia y cuando. Es decir, registrar la
fecha en la que se la ha llevado y la fecha de la devolucion. Cuando una película no tiene
fecha de devolucion, la consideramos prestada.

5. Consultar a menudo que películas estan disponibles para
alquilar en este momento (no estan prestadas). Necesito saber el título de la película y el
numero de copias disponibles.



Condicion para que esta practica sea un APTO:

Se entregarán dos partes:
1. Diagrama Entidad/Relacion en formato draw.io
2. Script SQL que debe crear un nuevo esquema, crear todas las tablas, cargar datos y la
consulta que se pide.

Para conseguir el apto:
- El script se debe ejecutar del tiron y sin fallos.
- Se debe aplicar normalizacion siempre que se pueda.

Se proporciona también un set de datos de prueba, pero su utilización es opcional.




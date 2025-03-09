drop schema if exists laura cascade;

create schema laura;

set schema 'laura';

-- A continuación creo todas las tablas:

create table socio(
    id_socio serial primary key,
    dni varchar(10) not null,
    nombre varchar(50) not null,
    apellido_1 varchar(50) not null,
    apellido_2 varchar(50),
    fecha_nacimiento date not null,
    telefono int
);

create table direccion(
    id_direccion serial primary key,
    id_socio int not null,
    calle varchar(80) not null,
    numero int not null,
    piso varchar(10) not null,
    codigo_postal int not null
);

create table pelicula(
    id_pelicula serial primary key,
    titulo varchar(200) not null,
    genero varchar(50) not null,
    director varchar(100) not null,
    sinopsis varchar(3000) not null
);

create table copia(
    id_copia int primary key,
    id_pelicula int not null,
    estado varchar(50)
);

create table prestamo (
    id_prestamo serial primary key,
    id_socio int not null,
    id_copia int not null,
    fecha_prestamo date not null,
    fecha_devolucion date
);

-- A continuación inserto todas las claves foraneas en las tablas:

alter table direccion
add constraint direccion_socio_fk
foreign key (id_socio)
references socio(id_socio);

alter table copia
add constraint copia_pelicula_fk
foreign key (id_pelicula)
references pelicula(id_pelicula);

alter table prestamo
add constraint prestamo_socio_fk
foreign key (id_socio)
references socio(id_socio);

alter table prestamo
add constraint prestamo_copia_fk
foreign key (id_copia)
references copia(id_copia);


-- A continuación inserto los datos en las tablas. No he metido todos los datos del csv proporcionado. Solo unos pocos para asegurarme de que la colsulta final se ejecuta correctamente

INSERT INTO socio (dni, nombre, apellido_1, apellido_2, fecha_nacimiento, telefono)
VALUES 
('7281621M', 'Jorge', 'Mendez', 'Alvarez', '2002-05-26', '615944300'),
('4426152D', 'Adrian', 'Gil', 'Fernandez', '1985-10-22', '987654321'),
('9707193C', 'Aitor', 'Herrera', 'Roman', '1992-04-23', '646020411'),
('2475849Z', 'Adrian', 'Santiago', 'Roman', '2006-12-20', '699684082'),
('6121885K', 'Joaquin', 'Gil', 'Diaz', '2009-07-29', '610203487'),
('7402615L', 'Eva', 'Hidalgo', 'Cortes', '2010-09-02', '666238181'),
('1124603H', 'Ivan', 'Santana', 'Mediana', '2005-02-15', '694804631'),
('1396452F', 'Maria Carmen', 'Crespo', 'Reyes', '2000-11-17', '607425989');

select * from socio;

INSERT INTO direccion (id_socio, calle, numero, piso, codigo_postal)
VALUES 
(1, 'Calle Sol', 56, '3 izq', '47006'),
(2, 'Calle Francisco de Goya', 64, '4 A', '47002'),
(3, 'Calle Rosalia de castro', 77, '3 izq', '47000'),
(4, 'Calle Agustina de Aragon', 44, '1 D', '47001'),
(5, 'Calle Miguel de Cervantes', 13, '4 A', '47005'),
(6, 'Calle Fuente', 57, '2 A', '47003'),
(7, 'Calle Francisco Pizarro', 6, ' 3 D', '47007'),
(8, 'Calle Francisco de Goya', 58, '1 A', '47005');

select * from direccion;

INSERT INTO pelicula (titulo, genero, director, sinopsis)
VALUES 
('Cadena perpetua', 'Drama', 'Frank Darabont', 'Acusado del asesinato de su mujer, Andrew Dufresne, tras se condenado...'),
('Cadena perpetua', 'Drama', 'Frank Darabont', 'Acusado del asesinato de su mujer, Andrew Dufresne, tras se condenado...'),
('Cadena perpetua', 'Drama', 'Frank Darabont', 'Acusado del asesinato de su mujer, Andrew Dufresne, tras se condenado...'),
('Cadena perpetua', 'Drama', 'Frank Darabont', 'Acusado del asesinato de su mujer, Andrew Dufresne, tras se condenado...'),
('Cadena perpetua', 'Drama', 'Frank Darabont', 'Acusado del asesinato de su mujer, Andrew Dufresne, tras se condenado...'),
('El padrino', 'Drama', 'Francis Ford Coppola', 'Don Vito Corleone, conocido dentro de los circulos de hampa como El Padrino...' ),
('El padrino', 'Drama', 'Francis Ford Coppola', 'Don Vito Corleone, conocido dentro de los circulos de hampa como El Padrino...' ),
('El padrino', 'Drama', 'Francis Ford Coppola', 'Don Vito Corleone, conocido dentro de los circulos de hampa como El Padrino...' );

select * from pelicula;

INSERT INTO copia (id_copia, id_pelicula, estado)
VALUES 
(1, 1, 'disponible'),
(2, 2, 'disponible'),
(3, 3, 'alquilada'),
(4, 4, 'disponible'),
(5, 5, 'alquilada'),
(6, 6, 'disponible'),
(7, 7, 'alquilada'),
(8, 8, 'disponible');

select * from copia;

INSERT INTO prestamo (id_socio, id_copia, fecha_prestamo, fecha_devolucion)
VALUES 
(1, 1, '2024-01-10', '2024-01-11'),
(2, 2, '2024-01-27', '2024-01-28'),
(3, 3, '2024-01-28', null),
(4, 4, '2024-01-31', '2024-02-01'),
(5, 5, '2024-02-02', null),
(6, 6, '2024-01-14', '2024-01-15'),
(7, 7, '2024-01-28', null),
(8, 8, '2024-01-30', '2024-01-31');

select * from prestamo;

select p.titulo, count (c.id_copia) as copias_disponibles from pelicula p
inner join copia c on p.id_pelicula = c.id_pelicula
where c.estado = 'disponible' 
group by p.titulo;

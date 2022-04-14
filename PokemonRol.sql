\c joseph
DROP DATABASE pokerols;
CREATE DATABASE pokerols;
\c pokerols

CREATE TABLE rol(
    id SERIAL,
    nombre VARCHAR(50),
    descripcion VARCHAR,
    PRIMARY KEY (id)
);
SELECT * FROM rol;

CREATE TABLE usuario(
    rut VARCHAR(12),
    nombre VARCHAR(20),
    telefono INT,
    mail VARCHAR(30),
    genero VARCHAR(30),
    fecha_nacimiento DATE,
    rol_id INT,
    FOREIGN KEY (rol_id) REFERENCES rol(id)
);
SELECT * FROM usuario;

INSERT INTO rol (nombre, descripcion)
VALUES ('administrador','control total');
INSERT INTO rol (nombre, descripcion)
VALUES ('marketing','editar y crear anuncios');
INSERT INTO rol (nombre, descripcion)
VALUES ('editor','editar articulos');
INSERT INTO rol (nombre, descripcion)
VALUES ('subscriptor','leer aticulos');
SELECT * FROM rol;

INSERT INTO usuario (rut, nombre, telefono, mail, genero, fecha_nacimiento, rol_id)
VALUES('1-9', 'Juan Soto', 9999999, 'juan.soto@gmail.com','M', '2000-06-24', 1);
INSERT INTO usuario (rut, nombre, telefono, mail, genero, fecha_nacimiento, rol_id)
VALUES('2-7', 'Jorge Perez', 8888888, 'jorge.perez@gmail.com','M', '1998-03-12', 4);
INSERT INTO usuario (rut, nombre, telefono, mail, genero, fecha_nacimiento)
VALUES('2-7', 'Sara Morales', 7777777, 'sara.morales@gmail.com','F', '1990-02-11');


SELECT * FROM rol INNER JOIN usuario ON rol.id = usuario.rol_id;
SELECT * FROM rol JOIN usuario ON rol.id = usuario.rol_id;
-- que roles tienen los de genero m
-- selecciona el nombre de la tabla rol donde el usuario tenga genero M
-- nombre esta en la tabla rol
-- genera está en la tabla usuario
-- SELECT rol.nombre FROM rol JOIN usuario ON rol.id = usuario.rol_id WHERE usuario.genero = 'M';
SELECT rol.nombre 
FROM rol JOIN usuario 
ON rol.id = usuario.rol_id 
WHERE usuario.genero = 'M';

SELECT A.nombre AS rol_ejemplo2
FROM rol AS A
JOIN usuario AS B
ON A.id = B.rol_id
WHERE B.genero = 'M';


--join
SELECT * FROM usuario
JOIN rol
ON usuario.rol_id = rol.id;

-- left join desde usuario
SELECT * FROM usuario
LEFT JOIN rol
ON usuario.rol_id = rol.id;

--left join desde rol
SELECT * FROM rol
LEFT JOIN usuario
ON rol.id = usuario.rol_id;

---------------------
-- vamos a traer los roles que no tengan usuario
-- NULL es la ausencia de valor
-- blank es que está en blanco, por ejemplo al borrar un dato de una tabla

-- SELECT rol.*
-- FROM rol
-- LEFT JOIN usuario
-- ON rol.id = usuario.rol_id
-- WHERE usuario.rol_id IS NULL;

-- --ejemplo de full outer join
-- SELECT *
-- FROM rol
-- FULL OUTER JOIN usuario
-- ON rol.id = usuario.rol_id;

--full outer join con datos vacios
SELECT *
FROM usuario
FULL OUTER JOIN rol
ON usuario.rol_id = rol.id;
WHERE usuario.rol_id IS NULL
OR rol.id IS NULL;
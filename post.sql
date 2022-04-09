-- La academia está trabajando en mejorar su plataforma de estudio y planea crear un espacio
-- que sirva como una red social entre estudiantes y docentes, por lo que necesita almacenar
-- en una base de datos los post y comentarios que se generen.

-- 1. Crear una base de datos con nombre “Posts”. (1 Punto)
\c ludovico
DROP DATABASE posts;
CREATE DATABASE posts;
\c posts
-- 2. Crear una tabla “post”, con los atributos id, nombre de usuario, fecha de creación,
-- contenido y descripción. (1 Punto)
CREATE TABLE post(
    id SERIAL,
    userName VARCHAR(30),
    createAt DATE,
    content VARCHAR,
    descripción VARCHAR,
    PRIMARY KEY (id)
);
\dt
-- 3. Insertar 3 post, 2 para el usuario "Pamela" y uno para "Carlos". (0.6 Puntos)
INSERT INTO post(userName, createAt, content, descripción)
VALUES('Pamela', '2021-04-07', 'TD-MALLOCO', 'contratado');
INSERT INTO post(userName, createAt, content, descripción)
VALUES('Pamela', '2021-04-30', 'TD-CALERA', 'traslado');
INSERT INTO post(userName, createAt, content, descripción)
VALUES('Carlos', '2021-04-09', 'AD-ISLAMAIPO', 'contratado');
SELECT * FROM post;
-- 4. Modificar la tabla post, agregando la columna título. (1 Punto)
ALTER TABLE post ADD title VARCHAR(100);
SELECT * FROM post;
-- 5. Agregar título a las publicaciones ya ingresadas. (1 Punto)
UPDATE post SET title = 'Incorporación programa mujer' WHERE id = 1;
UPDATE post SET title = 'agrega trayectoria laboral' WHERE  id = 2;
UPDATE post SET title = 'incorporacion por temporada' WHERE id = 3;
SELECT * FROM post;
-- 6. Insertar 2 post para el usuario "Pedro". (0.4 Puntos)
INSERT INTO post(userName, createAt, content, descripción, title)
VALUES('Pedro', '2021-04-15', 'CM-MALLOCO', 'contratado', 'monte 5');
INSERT INTO post(userName, createAt, content, descripción, title)
VALUES('Pedro', '2021-04-20', 'AD-ISLAMAIPO', 'trasladado','alerta');
SELECT * FROM post;

-- 7. Eliminar el post de Carlos. (1 Punto)

DELETE FROM post WHERE userName = 'Carlos';
SELECT * FROM post;
-- 8. Ingresar un nuevo post para el usuario "Carlos". (0.6 Puntos)
INSERT INTO post (userName, createAt, content, descripción, title)
VALUES ('Carlos', '2021-04-21', 'SECCION31', 'trasladado', 'enviado al NCC-1701-D');
SELECT * FROM post;

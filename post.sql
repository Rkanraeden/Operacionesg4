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

-- Parte 2
-- 1. Crear una nueva tabla llamada “comentarios”, con los atributos id, fecha, hora de
-- creación y contenido, que se relacione con la tabla posts. (1 Punto)

CREATE TABLE comentarios(
    id SERIAL,
    post_id INT,
    createDAt TIMESTAMP,
    content VARCHAR,
    FOREIGN KEY (post_id) REFERENCES post (id)
);
\dt

-- 2. Crear 2 comentarios para el post de "Pamela" y 4 para "Carlos". (0.4 Puntos)
INSERT INTO comentarios(post_id, createDAt, content)
VALUES(2, '2021-05-02 00:30:00', 'Practica Aeromodelismo');
INSERT INTO comentarios(post_id, createDAt, content)
VALUES(2, '2021-05-30 15:10:00', 'Obtuvo dos estrellas');
INSERT INTO comentarios(post_id, createDAt, content)
VALUES(6,'2021-05-30 12:10:58','Compro dos cajas de huevos de chocolate');
INSERT INTO comentarios(post_id, createDAt, content)
VALUES(6, '2021-06-01 20:35:38', 'consiguió descuento en lucas bar');
INSERT INTO comentarios(post_id, createDAt, content)
VALUES(6, '2021-06-02 20:00:38', 'consiguió descuento en casino enjoy');
INSERT INTO comentarios(post_id, createDAt, content)
VALUES(6, '2021-06-14 01:35:38', 'compro juguetes royal enfield');

SELECT * FROM comentarios;

-- 3. Crear un nuevo post para "Margarita". (1 Punto)

INSERT INTO post (userName, createAt, content, descripción, title)
VALUES('Margarita', '2021-07-19', 'TD-ANIME', 'contratado', 'Area 51');
-- 4. Ingresar 5 comentarios para el post de Margarita. (1 Punto)

SELECT * FROM post;

INSERT INTO comentarios(post_id, createDAt, content)
VALUES(7, '2021-08-18 12:10:48', 'llamó al 912');
INSERT INTO comentarios(post_id, createDAt, content)
VALUES(7, '2021-08-20 15:10:48', 'viatico por 1000 usd');
INSERT INTO comentarios(post_id, createDAt, content)
VALUES(7, '2021-09-12 18:10:45', 'contrató a Franco Escamilla');
INSERT INTO comentarios(post_id, createDAt, content)
VALUES(7, '2021-09-18 00:30:22', 'abrió fonda en el trapiche');
INSERT INTO comentarios(post_id, createDAt, content)
VALUES(7, '2021-09-19 09:00:35', 'contrató a Chico Trujillo');

SELECT * FROM comentarios;
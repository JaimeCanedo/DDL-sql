/*Para acceder a la base de datos */
      
/* Para crear a la base de datos */
CREATE DATABASE blog;
/*Designar la base de datos que se va a utilizar*/
USE blog;
/*Crear la tabla de la base de datos*/ 
CREATE TABLE IF NOT EXISTS usuarios (
    usuarios_id INTEGER UNSIGNED AUTO_INCREMENT,
    login VARCHAR(30) NOT NULL,
    password  VARCHAR(30) NOT NULL,
    nickname VARCHAR(30) NOT NULL,
    email VARCHAR(40) NOT NULL UNIQUE,
    PRIMARY KEY (usuarios_id)
);


CREATE TABLE IF NOT EXISTS categorias (
    categorias_id INTEGER UNSIGNED AUTO_INCREMENT,
    categoria VARCHAR(30),
    PRIMARY KEY (categorias_id)
);



CREATE TABLE IF NOT EXISTS etiquetas (
    etiquetas_id INTEGER UNSIGNED AUTO_INCREMENT,
    nombre_etiqueta VARCHAR(30),
    PRIMARY KEY (etiquetas_id)
);

CREATE TABLE IF NOT EXISTS posts (
    idPosts INTEGER PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(150) NOT NULL,
    fecha_publicacion TIMESTAMP NOT NULL,
    contenido TEXT NOT NULL,
    estatus CHAR(8) NOT NULL,
    usuarios_id INTEGER);

ALTER TABLE posts ADD FOREIGN KEY (usuarios_id) REFERENCES usuarios(idUsuario);

ALTER TABLE posts ADD (categorias_id INTEGER);

ALTER TABLE posts ADD FOREIGN KEY (categorias_id) REFERENCES categorias(idCategoria);

CREATE TABLE IF NOT EXISTS postEtiquetas(idPostEtiquetas INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT, post_id INTEGER,
etiqueta_id INTEGER);

ALTER TABLE postEtiquetas ADD FOREIGN KEY (post_id) REFERENCES posts(idPosts);

ALTER TABLE postEtiquetas ADD FOREIGN KEY (etiqueta_id) REFERENCES etiquetas(idEtiqueta);

CREATE TABLE comentarios(idComentarios INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
comentario TEXT NOT NULL,
usuarios_id INTEGER,
posts_id INTEGER);

ALTER TABLE comentarios ADD FOREIGN KEY (usuarios_id) REFERENCES usuarios(idUsuario);

ALTER TABLE comentarios ADD FOREIGN KEY (posts_id) REFERENCES posts(idPosts);


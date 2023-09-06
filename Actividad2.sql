/*Para acceder a la base de datos */
/* mysql -h localhost -u root -p   */     
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

ALTER TABLE posts 
ADD FOREIGN KEY (usuarios_id) REFERENCES usuarios(idUsuario);

ALTER TABLE posts 
ADD (categorias_id INTEGER);

ALTER TABLE posts 
ADD FOREIGN KEY (categorias_id) REFERENCES categorias(idCategoria);

CREATE TABLE IF NOT EXISTS postEtiquetas(idPostEtiquetas INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT, post_id INTEGER,
etiqueta_id INTEGER);

ALTER TABLE postEtiquetas 
ADD FOREIGN KEY (post_id) REFERENCES posts(idPosts);

ALTER TABLE postEtiquetas 
ADD FOREIGN KEY (etiqueta_id) REFERENCES etiquetas(idEtiqueta);

CREATE TABLE comentarios(idComentarios INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
comentario TEXT NOT NULL,
usuarios_id INTEGER,
posts_id INTEGER);

ALTER TABLE comentarios 
ADD FOREIGN KEY (usuarios_id) REFERENCES usuarios(idUsuario);

ALTER TABLE comentarios 
ADD FOREIGN KEY (posts_id) REFERENCES posts(idPosts);


/*Actividad 4*/
/*Para mas seguridad, se le pide que la tabla usuarios tenga los siguientes campos 
conservando únicamente nickname, password y borrando el campo login. Para validar un único usuario el dueño le
pide que se valide por correo o nickname, es decir, un usuario no puede tener el mismo correo con dos cuentas o
el mismo nickname de otras cuentas.*/

ALTER TABLE usuarios 
DROP COLUMN login;

ALTER TABLE usuarios 
ADD COLUMN Nombre varchar(50) NOT NULL;

ALTER TABLE usuarios 
ADD COLUMN Apellido varchar(50) NOT NULL;

ALTER TABLE usuarios 
ADD COLUMN Empresa varchar(50) NOT NULL;

ALTER TABLE usuarios 
ADD COLUMN Telefono varchar(10) NOT NULL;

ALTER TABLE usuarios 
ADD COLUMN pais varchar(30) NOT NULL;

ALTER TABLE usuarios 
ADD COLUMN codigo_Postal int(5) NOT NULL;

ALTER TABLE usuarios 
ALTER COLUMN nickname VARCHAR(30) NOT NULL UNIQUE;

ALTER TABLE usuarios 
MODIFY nickname VARCHAR(30) NOT NULL UNIQUE;

/*En la tabla posts, el dueño de Myblog.com ve que podría copiar a X y solo dejar que el contenido del
post sea de 250 caracteres y le pide hacer el cambio.*/

ALTER TABLE posts 
MODIFY contenido VARCHAR(250) NOT NULL;

/*Además, como Myblog.com no tiene censura los usuarios deben ser mayores de 18 años, así que
agregue un atributo llamado Age y configure en tipo int, aplique un constrain para que solo
permita mayores de 18 años la tabla, revise:*/

ALTER TABLE usuarios 
ADD edad int(3) CHECK (edad>=18);

/*Por otra parte el Myblog quiere que un ecosistema mas cercano, entonces propone mensajería, por
lo que la tabla debe tener: id, emisor, receptor, fecha de creación.*/

CREATE TABLE IF NOT EXISTS mensajeria (
    idMensajeria INTEGER PRIMARY KEY AUTO_INCREMENT,
    emisor INTEGER NOT NULL,
    receptor varchar(50) NOT NULL,
    fecha_de_creacion TIMESTAMP NOT NULL);

ALTER TABLE mensajeria 
ADD FOREIGN KEY (emisor) REFERENCES usuarios(idUsuario);


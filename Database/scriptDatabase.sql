CREATE DATABASE GVWA;

USE GVWA;

CREATE TABLE [dbo].[Conexion] (
    [IdConexion] INT           NOT NULL,
    [Sitio]      VARCHAR (500) NULL,
    [Usuario]    VARCHAR (50)  NULL,
    [Contrasena] VARCHAR (50)  NULL
);

INSERT INTO Conexion(IdConexion,Sitio,Usuario,Contrasena) VALUES (1,'http://192.168.1.2/dvwa/login.php','admin','password');

CREATE TABLE [dbo].[Curso] (
    [IdCurso]     INT           NOT NULL,
    [Descripcion] VARCHAR (200) NULL,
    [Profesor]    VARCHAR (50)  NULL,
    [Resumen]     VARCHAR (50)  NULL
);

INSERT INTO Curso (IdCurso,Descripcion,Profesor,Resumen) VALUES (1,'Ofimatica 1','Juan Quiroz','Ofimatica');
INSERT INTO Curso (IdCurso,Descripcion,Profesor,Resumen) VALUES (2,'Ofimatica 2','Juan Quiroz','Ofimatica');
INSERT INTO Curso (IdCurso,Descripcion,Profesor,Resumen) VALUES (3,'Ofimatica 3','Juan Quiroz','Ofimatica');
INSERT INTO Curso (IdCurso,Descripcion,Profesor,Resumen) VALUES (4,'Ofimatica 5','Juan Quiroz','Ofimatica');
INSERT INTO Curso (IdCurso,Descripcion,Profesor,Resumen) VALUES (5,'Redes 1','Miguel Perez','Redes');
INSERT INTO Curso (IdCurso,Descripcion,Profesor,Resumen) VALUES (6,'Redes 2','Miguel Perez','Redes');
INSERT INTO Curso (IdCurso,Descripcion,Profesor,Resumen) VALUES (7,'Redes 3','Miguel Perez','Redes');
INSERT INTO Curso (IdCurso,Descripcion,Profesor,Resumen) VALUES (8,'Photoshop 1','Juan Angeles','Diseño');
INSERT INTO Curso (IdCurso,Descripcion,Profesor,Resumen) VALUES (9,'Photoshop 2','Juan Angeles','Diseño');
INSERT INTO Curso (IdCurso,Descripcion,Profesor,Resumen) VALUES (10,'Programación','Javier Caceda','Programación');
INSERT INTO Curso (IdCurso,Descripcion,Profesor,Resumen) VALUES (11,'Análisis Forense','Chema Alonso','Hacking');


CREATE TABLE [dbo].[Usuario] (
    [IdUsuario]  VARCHAR (50) NOT NULL,
    [Contrasena] VARCHAR (50) NULL
);

INSERT INTO Usuario (IdUsuario,Contrasena) VALUES ('admin','admin');
INSERT INTO Usuario (IdUsuario,Contrasena) VALUES ('scott','scott');

CREATE PROCEDURE [pa_BuscarCurso]
	@p_Curso varchar(200)
AS
BEGIN
	EXEC('SELECT * FROM Curso WHERE Descripcion LIKE ''%'+@p_Curso+'%''')
END

CREATE PROCEDURE [pa_IniciarSesion]
(
	@p_IdUsuario varchar(50),
	@p_Contrasena varchar(50)
)
AS
BEGIN
	EXEC ('SELECT * FROM Usuario WHERE IdUsuario = '''+@p_IdUsuario+''' AND Contrasena = '''+@p_Contrasena+'''')
END

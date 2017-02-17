CREATE TABLE [dbo].[Usuarios] (
    [email]      NVARCHAR (50) NOT NULL,
    [nombre]     NVARCHAR (50) NULL,
    [apellidos]  NVARCHAR (70) NULL,
    [pregunta]   NVARCHAR (50) NULL,
    [respuesta]  NVARCHAR (50) NULL,
    [dni]        NVARCHAR (15) NULL,
    [numconfir]  INT           NULL,
    [confirmado] BIT           NULL,
    [grupo]      NVARCHAR (50) NULL,
    [tipo]       NVARCHAR (50) NULL,
    [pass]       NVARCHAR (50) NULL,
    CONSTRAINT [PK__Usuarios__0000000000000095] PRIMARY KEY CLUSTERED ([email] ASC)
);
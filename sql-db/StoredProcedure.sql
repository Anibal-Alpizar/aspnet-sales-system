CREATE PROC sp_RegisterUser(
    @Nombres varchar(100),
    @Apellidos varchar(100),
    @Correo varchar(100),
    @Clave varchar(100),
    @Activo bit,
    @Mensaje varchar(100) OUTPUT,
    @Resultado int OUTPUT
)
AS
BEGIN
    SET @Resultado = 0
    IF NOT EXISTS(SELECT * FROM Usuario WHERE Correo = @Correo)
    BEGIN
        INSERT INTO Usuario(Nombres,Apellidos,Correo,Clave,Activo) VALUES(@Nombres,@Apellidos,@Correo,@Clave,@Activo)
        SET @Resultado = SCOPE_IDENTITY()
    END
    ELSE
    SET @Mensaje = 'El correo ya existe'
END

CREATE PROC sp_EditUser(
    @IdUsuario int,
    @Nombres varchar(100),
    @Apellidos varchar(100),
    @Correo varchar(100),
    @Activo bit,
    @Mensaje varchar(100) OUTPUT,
    @Resultado bit OUTPUT
)
AS
BEGIN
    SET @Resultado = 0
    IF NOT EXISTS(SELECT * FROM Usuario WHERE Correo = @Correo AND IdUsuario != @IdUsuario)
    BEGIN
        UPDATE TOP(1) Usuario SET Nombres = @Nombres, Apellidos = @Apellidos, Correo = @Correo, Activo = @Activo WHERE IdUsuario = @IdUsuario
        SET @Resultado = 1
    END
    ELSE
    SET @Mensaje = 'El correo ya existe'
END
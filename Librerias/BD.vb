Imports System.Data.SqlClient

Public Class BD

    Private Shared conexion As New SqlConnection
    Private Shared comando As New SqlCommand

    Public Const INSERTADO As String = "INSERTADO"
    Public Const PASSACTUALIZADA As String = "PASSACTUALIZADA"


    Public Shared Function conectarDB() As String
        Try
            conexion.ConnectionString = "Data Source=158.227.106.20;Initial_Catalog=g004611.HADS19_Usuarios.dbo;Integrated_Security=False;_UserID=HADS19;Password=serpiente;_Connect Timeout=15;Encrypt=False;TrustServerCertificate=False"
            conexion.Open()
        Catch ex As Exception
            Return "ERROR DE CONEXIÓN: " + ex.Message
        End Try
        Return "CONECTADO"
    End Function

    Public Shared Sub cerrarconexionDB()
        conexion.Close()
    End Sub

    Public Shared Function insertarUsuario(ByVal email As String, ByVal nombre As String, ByVal apellidos As String, ByVal pregunta As String, ByVal respuesta As String, ByVal DNI As String, ByVal numconfir As Integer, ByVal confirmado As Boolean, ByVal grupo As String, ByVal tipo As String, ByVal pass As String) As String
        Dim st = "insert into Usuarios values ('" & email & "','" & nombre & "','" & apellidos & "','" & DNI & "','" & pregunta & "','" & respuesta & "','" & DNI & "'," & numconfir & "," & confirmado & "," & grupo & "," & tipo & "," & pass & " )"
        Dim numregs As Integer
        comando = New SqlCommand(st, conexion)
        Try
            numregs = comando.ExecuteNonQuery()
        Catch ex As Exception
            Return ex.Message
        End Try
        Return INSERTADO
    End Function

    Public Shared Function existeUsuario(ByVal email As String) As Boolean

        Dim st = "select count(*) from Usuarios where email ='" & email & "'"
        comando = New SqlCommand(st, conexion)

        If comando.ExecuteScalar() = 1 Then
            Return True
        Else
            Return False
        End If

    End Function

    Public Shared Function login(ByVal email As String, ByVal pass As String) As Boolean

        Dim st = "select count(*) from Usuarios where Email ='" & email & "' and Password='" & pass & "' "
        comando = New SqlCommand(st, conexion)

        'cuando haya algún usuario que coincida
        If comando.ExecuteScalar() = 1 Then
            Return True
        Else
            Return False
        End If
    End Function

    Public Shared Function cambiarPassword(ByVal numConf As Integer, ByVal email As String, ByVal pass As String) As String
        Dim st = "update Usuarios set Password = '" & pass & "' where Email ='" & email & "' and NumeroConfirmacion=" & numConf & ""
        Dim numregs As Integer
        comando = New SqlCommand(st, conexion)

        Try
            numregs = comando.ExecuteNonQuery()
        Catch ex As Exception
            Return ex.Message
        End Try
        If numregs = 1 Then
            Return "Tu contraseña ha sido modificada"
        Else
            Return "Error al actualizar contraseña."
        End If

    End Function

    Public Shared Function getUsuario(ByVal email As String) As SqlDataReader
        Dim st = "select * from Usuarios where Email = '" & email & "'"
        comando = New SqlCommand(st, conexion)
        Return (comando.ExecuteReader())
    End Function



End Class


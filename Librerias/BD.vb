Imports System.Data.SqlClient

Public Class BD

    Private Shared conexion As New SqlConnection
    Private Shared comando As New SqlCommand

    Public Const INSERTADO As String = "INSERTADO"
    Public Const CONFIRMADO As String = "CONFIRMADO"
    Public Const NOCONFIRMADO As String = "NOCONFIRMADO"
    Public Const PASSACTUALIZADA As String = "PASSACTUALIZADA"


    Public Shared Function conectarDB() As String
        Try
            'conexion.ConnectionString = "Data Source=158.227.106.20;Initial Catalog=HADS19_Usuarios;Integrated Security=False;User ID=HADS19;Password=serpiente; Connect Timeout=15;Encrypt=False;TrustServerCertificate=False"
            'conexion.ConnectionString = "Server=tcp:hads19asier.database.windows.net,1433;Initial Catalog=HADS19_Usuarios;Persist Security Info=False;User ID=HADS19@hads19asier;Password=adminSerpiente19;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
            conexion.ConnectionString = "Server=tcp:hads19tareas.database.windows.net,1433;Initial Catalog=HADS19TAREAS;Persist Security Info=False;User ID=asierolatz19;Password=Serpiente19;MultipleActiveResultSets=True;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
            conexion.Open()
        Catch ex As Exception
            Return "ERROR DE CONEXIÓN: " + ex.Message
        End Try
        Return "CONECTADO"
    End Function

    Public Shared Function getconexion() As SqlConnection
        Return conexion
    End Function

    Public Shared Sub cerrarconexionDB()
        conexion.Close()
    End Sub

    Public Shared Function insertarUsuario(ByVal email As String, ByVal nombre As String, ByVal pregunta As String, ByVal respuesta As String, ByVal DNI As String, ByVal numconfir As Integer, ByVal confirmado As Boolean, ByVal grupo As String, ByVal tipo As String, ByVal pass As String) As String
        Dim st = "insert into Usuarios (email,nombre,pregunta,respuesta,dni,confirmado,pass) values ('" & email & "','" & nombre & "','" & pregunta & "','" & respuesta & "','" & DNI & "','" & confirmado & "','" & pass & " ')"
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

        Dim st = "Select count(*) from Usuarios where email ='" & email & "'"
        comando = New SqlCommand(st, conexion)

        If comando.ExecuteScalar() = 1 Then
            Return True
        Else
            Return False
        End If

    End Function

    Public Shared Function login(ByVal email As String, ByVal pass As String) As SqlDataReader
        'Dim st = "select count(*) from Usuarios where email ='" & email & "' and pass='" & pass & "' and confirmado = 1"
        Dim st = "select tipo from Usuarios where email ='" & email & "' and pass='" & pass & "' and confirmado = 'True'"
        comando = New SqlCommand(st, conexion)
        
        Try
            Return comando.ExecuteReader()
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Function

    Public Shared Function ActivarUsuario(ByVal email As String, numeroconfirmacion As Integer) As String
        'Dim st = "update Usuarios set confirmado=True Where (email='" & email & "'and numconfir= '" & numeroconfirmacion & "' and confirmado=False)"
        Dim st = "update Usuarios set confirmado='True' Where (email='" & email & "' and confirmado='False')"

        Dim numregs As Integer
        comando = New SqlCommand(st, conexion)
        numregs = comando.ExecuteNonQuery()

        If numregs = 1 Then
            Return CONFIRMADO
        Else
            Return NOCONFIRMADO
        End If
    End Function

    Public Shared Function cambiarPassword(ByVal email As String, ByVal pass As String) As String
        Dim st = "update Usuarios set pass = '" & pass & "' where email ='" & email & "'"
        Dim numregs As Integer
        comando = New SqlCommand(st, conexion)

        ' Try
        numregs = comando.ExecuteNonQuery()
        'Catch ex As Exception
        'Return ex.Message
        'End Try
        If numregs = 1 Then
            Return CONFIRMADO
        Else
            Return NOCONFIRMADO
        End If

    End Function

    Public Shared Function getUsuario(ByVal email As String) As SqlDataReader
        Dim st = "select * from Usuarios where email = '" & email & "'"
        comando = New SqlCommand(st, conexion)
        Return (comando.ExecuteReader())
    End Function

    Public Shared Function asignaturas() As SqlDataReader
        Dim st = "Select codigo From Asignaturas"
        comando = New SqlCommand(st, conexion)
        Return (comando.ExecuteReader())
    End Function

    Public Shared Function dedicacionAlumnos(ByVal miAsignatura As String) As Double

        Dim media As Double = 0.0
        Dim datareader As SqlDataReader
        Try
            conectarDB()
            Dim st As String = "SELECT AVG(EstudiantesTareas.HReales) AS Media FROM Asignaturas JOIN TareasGenericas ON Asignaturas.codigo = TareasGenericas.CodAsig JOIN EstudiantesTareas ON TareasGenericas.Codigo = EstudiantesTareas.CodTarea WHERE Asignaturas.codigo = '" & miAsignatura & "'"
            Dim comando As New SqlCommand(st, conexion)
            datareader = comando.ExecuteReader()
            While (datareader.Read)
                media = Convert.ToDouble(datareader("Media"))
            End While

        Catch ex As Exception
            MsgBox("Ha ocurrido una fallo al calcular la media")
        End Try
        cerrarconexionDB()
        Return media
    End Function
End Class


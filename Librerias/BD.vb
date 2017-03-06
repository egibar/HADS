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
            conexion.ConnectionString = "Server=tcp:hads19tareas.database.windows.net,1433;Initial Catalog=HADS19TAREAS;Persist Security Info=False;User ID=HADS19@hads19tareas;Password=Serpiente19;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
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

   ' Public Shared Function insertarUsuario(ByVal email As String, ByVal nombre As String, ByVal apellidos As String, ByVal pregunta As String, ByVal respuesta As String, ByVal DNI As String, ByVal numconfir As Integer, ByVal confirmado As Boolean, ByVal grupo As String, ByVal tipo As String, ByVal pass As String) As String
    'Dim st = "insert into Usuarios (email,nombre,apellidos,pregunta,respuesta,dni,numconfir,confirmado,grupo,tipo,pass) values ('" & email & "','" & nombre & "','" & apellidos & "','" & pregunta & "','" & respuesta & "','" & DNI & "','" & numconfir & "','" & confirmado & "','" & grupo & "','" & tipo & "','" & pass & " ')"
    Public Shared Function insertarUsuario(ByVal email As String, ByVal nombre As String, ByVal pregunta As String, ByVal respuesta As String, ByVal DNI As String, ByVal numconfir As Integer, ByVal confirmado As Boolean, ByVal grupo As String, ByVal tipo As String, ByVal pass As String) As String
        Dim st = "insert into Usuarios (email,nombre,pregunta,respuesta,dni,confirmado,grupo,tipo,pass) values ('" & email & "','" & nombre & "','" & pregunta & "','" & respuesta & "','" & DNI & "','" & confirmado & "','" & grupo & "','" & tipo & "','" & pass & " ')"
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

    Public Shared Function login(ByVal email As String, ByVal pass As String) As Boolean
        Dim st = "select count(*) from Usuarios where email ='" & email & "' and pass='" & pass & "' and confirmado = 1"
        comando = New SqlCommand(st, conexion)
        'cuando haya algún usuario que coincida
        If comando.ExecuteScalar() = 1 Then
            Return True
        Else
            Return False
        End If
    End Function

    Public Shared Function ActivarUsuario(ByVal email As String, numeroconfirmacion As Integer) As String
        Dim st = "update Usuarios set confirmado=1 Where (email='" & email & "'and numconfir= '" & numeroconfirmacion & "' and confirmado=0)"
        Dim numregs As Integer
        comando = New SqlCommand(st, conexion)
        Try
            numregs = comando.ExecuteNonQuery()
        Catch ex As Exception
            Return ex.Message
        End Try
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

        Try
            numregs = comando.ExecuteNonQuery()
        Catch ex As Exception
            Return ex.Message
        End Try
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

    Public Shared Function getTablaTareas(ByVal asignatura As String) As DataTable

        Dim adapter As New SqlDataAdapter
        Dim dset As New DataSet
        Dim tabla As New DataTable

        conectarDB()
        ' Dim conexion As SqlConnection = getconexion()
        Dim comando As New SqlCommand("SELECT Codigo,CodAsig,Descripcion,HEstimadas,TipoTarea FROM TareasGenericas WHERE Explotacion='true' AND  CodAsig='" & asignatura & "'", conexion)
        adapter = New SqlDataAdapter(comando)
        adapter.Fill(dset, "tareas")
        tabla = dset.Tables("tareas")
        cerrarconexionDB()
        Return tabla

    End Function
End Class


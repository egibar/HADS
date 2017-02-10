Imports System.Data.SqlClient

Public Class BD
    Private Shared conexion As New SqlConnection
    Private Shared comando As New SqlCommand
    Public Shared Function conectar() As String
        Try
            'comentario
            conexion.ConnectionString = "Data Source=158.227.106.20;Initial_Catalog=Amigos;Integrated_Security=False;_UserID=HADS19;Password=serpiente;_Connect Timeout=15;Encrypt=False;TrustServerCertificate=False"
            conexion.Open()
        Catch ex As Exception
            Return "ERROR DE CONEXIÓN: " + ex.Message
        End Try
        Return "CONEXION OK"
    End Function

    Public Shared Function cambiarPassword(ByVal codigo As Integer, ByVal email As String, ByVal pass As String) As String
        Dim st = "update Usuarios set Password = '" & pass & "', NumeroConfirmacion = -1 where Email ='" & email & "' and NumeroConfirmacion=" & codigo & ""
        
    End Function
    Public Shared Sub cerrarconexion()
        conexion.Close()
    End Sub
End Class

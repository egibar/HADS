Imports System.Data.SqlClient
Public Class BD
    Private Shared conexion As New SqlConnection
    Private Shared comando As New SqlCommand
    Public Shared Function conectar() As String
        Try
            conexion.ConnectionString = "Data Source=158.227.106.20;Initial_
Catalog=Amigos;Integrated_
Security=False;_UserID=HADS;Password=********;_
Connect Timeout=15;Encrypt=False;TrustServerCertificate=False"
            conexion.Open()
        Catch ex As Exception
            Return "ERROR DE CONEXIÓN: " + ex.Message
        End Try
        Return "CONEXION OK"
    End Function
End Class

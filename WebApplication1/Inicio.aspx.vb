Imports Librerias.BD
Imports System.Data.SqlClient

Public Class Inicio
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub ButtonLogin_Click(sender As Object, e As EventArgs) Handles ButtonLogin.Click
        Dim usuario As SqlDataReader
        conectarDB()
        Label1Informativo.Visible = True
        If (login(Email.Text, Password.Text) = True) Then
            usuario = getUsuario(Email.Text)
            usuario.Read()
            If usuario.Item("tipo") = "A" Then
                Session("alumno") = Email.Text
                Label1Informativo.Text = "Enhorabuena ha iniciado sesión" + Email.Text
                Response.Redirect("Alumno.aspx")
            ElseIf usuario.Item("tipo") = "P" Then
                Session("profesor") = Email.Text
                Label1Informativo.Text = "Enhorabuena ha iniciado sesión" + Email.Text
                Response.Redirect("Profesor.aspx")
            End If
            usuario.Close()
        Else
            Label1Informativo.Text = "No esta registrado como usuario, registrese para acceder"
        End If
        cerrarconexionDB()
    End Sub
End Class
Imports Librerias.BD
Imports System.Data.SqlClient

Public Class Inicio
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub ButtonLogin_Click(sender As Object, e As EventArgs) Handles ButtonLogin.Click

        Dim usuario As SqlDataReader
        Dim tipo As String

        conectarDB()
        usuario = login(Email.Text, Password.Text)

        If usuario.HasRows Then
            usuario.Read()
            Session("email") = Email.Text
            tipo = usuario.Item("tipo")
            If tipo = "P" Then
                System.Web.Security.FormsAuthentication.SetAuthCookie("profesor", False)
                Response.Redirect("Profesor/Profesor.aspx")
            Else
                System.Web.Security.FormsAuthentication.SetAuthCookie("alumno", False)
                Response.Redirect("Alumnos/Alumno.aspx")
            End If
            usuario.Close()
        Else
            Label1Informativo.Visible = True
            Label1Informativo.Text = "No esta registrado como usuario, registrese para acceder"
        End If
        cerrarconexionDB()
    End Sub
End Class
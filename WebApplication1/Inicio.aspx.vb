Imports Librerias.BD
Imports System.Data.SqlClient

Public Class Inicio
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub ButtonLogin_Click(sender As Object, e As EventArgs) Handles ButtonLogin.Click

        Dim usuario As SqlDataReader
        Dim tipousu As String
        conectarDB()
        usuario = login(Email.Text, Password.Text)

        If usuario.HasRows Then
            usuario.Read()
            Session("email") = Email.Text
            tipousu = usuario.Item("tipo")
            usuario.Close()

            If tipousu = "P" Then
                Response.Redirect("Profesor.aspx")
            Else
                Response.Redirect("Alumno.aspx")
            End If

        Else
            Label1Informativo.Visible = True
            Label1Informativo.Text = "No esta registrado como usuario, registrese para acceder"
        End If
        cerrarconexionDB()
    End Sub
End Class
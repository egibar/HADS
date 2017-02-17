Imports Librerias

Public Class WebForm1
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub ButtonLogin_Click(sender As Object, e As EventArgs) Handles ButtonLogin.Click
        BD.conectarDB()
        Label1Informativo.Visible = True
        If (BD.login(Email.Text, Password.Text) = True) Then
            Label1Informativo.Text = "Enhorabuena ha iniciado sesión"
        Else
            Label1Informativo.Text = "No esta registrado como usuario, registrese para acceder"
        End If
        BD.cerrarconexionDB()
    End Sub
End Class
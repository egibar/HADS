Imports Librerias.BD
Public Class WebForm3
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim correo As String = Request.QueryString("mail")
        Dim codigo As Integer = Request.QueryString("cod")
        Dim resp As String
        conectarDB()
        resp = ActivarUsuario(correo, codigo)
        If resp = CONFIRMADO Then
            Usuario.Text = correo
        Else
            Label1Informativo.Visible = True
            Label1Informativo.Text = "Error al confirmar su registro"
        End If
    End Sub

    Protected Sub btnVolverInicio_Click(sender As Object, e As EventArgs) Handles btnVolverInicio.Click
        Response.Redirect("Inicio.aspx")

    End Sub
End Class
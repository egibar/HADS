Imports Librerias.BD
Public Class WebForm3
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim correo As String = Request.QueryString("mail")
        Dim codigo As Integer = Request.QueryString("cod")
        Dim respuesta As String

        conectar()
        respuesta = activarUsuario(codigo, correo)
        If respuesta = CONFIRMADO Then
            MsgBox("Bienvenido" + correo)

        Else

            MsgBox("Ocurrio algun problema o el usuario ya esta activo")
        End If
        cerrarconexion()

    End Sub
    Protected Sub btnVolverInicio_Click(sender As Object, e As EventArgs) Handles btnVolverInicio.Click
        Response.Redirect("Inicio.aspx")
    End Sub
End Class
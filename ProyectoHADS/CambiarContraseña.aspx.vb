Imports Librerias
Imports System.Data.SqlClient

Public Class WebForm4
    Inherits System.Web.UI.Page

    Dim usuario As SqlDataReader

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        LabelPregunta.Visible = False
        TextBoxPregunta.Visible = False
        LabelRespuesta.Visible = False
        TextBoxRespuesta.Visible = False
        NuevoPass.Visible = False
        TextBoxPassword.Visible = False
        NuevoPass2.Visible = False
        TextBoxPassword2.Visible = False
    End Sub


    Protected Sub Comprobar_Click(sender As Object, e As EventArgs) Handles Comprobar.Click

        usuario = BD.getUsuario(TextBoxEmail.Text)
        usuario.Read()
        LabelPregunta.Visible = True
        TextBoxPregunta.Text = usuario.Item("pregunta")
        TextBoxPregunta.Visible = True
        LabelRespuesta.Visible = True
        TextBoxRespuesta.Visible = True

        'Obtiene un valor que indica si la DataTableReader contiene una o más filas
        'If usuario.HasRows Then
        usuario.Close()
    End Sub

    Protected Sub btnVolverInicio_Click(sender As Object, e As EventArgs) Handles btnVolverInicio.Click
        Response.Redirect("Inicio.aspx")
    End Sub

    Protected Sub btnComprobar2_Click(sender As Object, e As EventArgs) Handles btnComprobar2.Click

        Dim resp As String = TextBoxRespuesta.Text
        Dim email As String = TextBoxEmail.Text

        usuario = BD.getUsuario(email)
        usuario.Read()

        If resp = usuario.Item("respuesta") Then
            NuevoPass.Visible = True
            TextBoxPassword.Visible = True
            NuevoPass2.Visible = True
            TextBoxPassword2.Visible = True
            btnCambiarContraseña.Visible = True
        Else
            LabelRespCorrecta.Visible = True
            LabelRespCorrecta.Text = "Esa no es la respuesta correcta a la pregunta."
        End If
    End Sub

    Protected Sub btnCambiarContraseña_Click(sender As Object, e As EventArgs) Handles btnCambiarContraseña.Click

        Randomize()
        Dim numConf As Integer = CLng(Rnd() * 9000000) + 1000000
        usuario.Close()

        Dim respu As String = BD.cambiarPassword(numConf, TextBoxEmail.Text, NuevoPass.Text)
        LabelCambio.Visible = True
        LabelCambio.Text = respu

    End Sub

    
End Class
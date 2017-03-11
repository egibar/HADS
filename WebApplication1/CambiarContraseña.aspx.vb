Imports Librerias.BD

Imports System.Data.SqlClient

Public Class CambiarContraseña
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
        RequiredValidatorPassword.Visible = False
        RequiredValidatorPassword2.Visible = False

        conectarDB()
    End Sub

    Protected Sub Comprobar_Click(sender As Object, e As EventArgs) Handles Comprobar.Click
        Dim email As String = TextBoxEmail.Text
        usuario = getUsuario(TextBoxEmail.Text)
        Comprobar.Visible = False
        Try
            If usuario.HasRows() Then
                usuario.Read()
                LabelPregunta.Visible = True
                TextBoxPregunta.Text = usuario.Item("pregunta")
                TextBoxPregunta.Visible = True
                LabelRespuesta.Visible = True
                TextBoxRespuesta.Visible = True
                RequiredFieldValidator1.Enabled = True
                TextBoxEmail.Enabled = False
                btnComprobar2.Visible = True
                usuario.Close()
            Else
                LabelPregunta.Visible = True
                TextBoxPregunta.Text = "No existe ningun usuario"
            End If
        Catch ex As Exception
            LabelPregunta.Visible = True
            TextBoxPregunta.Text = ex.Message
        End Try
    End Sub

    Protected Sub btnVolverInicio_Click(sender As Object, e As EventArgs) Handles btnVolverInicio.Click
        Response.Redirect("Inicio.aspx")
    End Sub

    Protected Sub btnComprobar2_Click(sender As Object, e As EventArgs) Handles btnComprobar2.Click

        Dim resp As String = TextBoxRespuesta.Text
        Dim email As String = TextBoxEmail.Text

        usuario = getUsuario(email)
        usuario.Read()
        btnComprobar2.Visible = False

        If resp = usuario.Item("respuesta") Then
            NuevoPass.Visible = True
            TextBoxPassword.Visible = True
            NuevoPass2.Visible = True
            TextBoxPassword2.Visible = True
            btnCambiarContraseña.Visible = True
            RequiredValidatorPassword2.Visible = True
            RequiredValidatorPassword2.Visible = True
        Else
            LabelRespCorrecta.Visible = True
            LabelRespCorrecta.Text = "Esa no es la respuesta correcta a la pregunta."
        End If
        usuario.Close()
    End Sub

    Protected Sub btnCambiarContraseña_Click(sender As Object, e As EventArgs) Handles btnCambiarContraseña.Click

        btnCambiarContraseña.Visible = False
        Dim respu As String = cambiarPassword(TextBoxEmail.Text, TextBoxPassword.Text)
        If respu = CONFIRMADO Then
            LabelCambio.Visible = True
            LabelCambio.Text = "Contraseña cambiada corretamente"
        Else
            LabelCambio.Visible = True
            LabelCambio.Text = "Error al cambiar la contraseña"
        End If

    End Sub
    Protected Sub Page_Unload(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Unload
        cerrarconexionDB()
    End Sub


End Class
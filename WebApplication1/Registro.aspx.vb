Imports Librerias

Public Class Registro
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnRegistrarse_Click(sender As Object, e As EventArgs) Handles btnRegistrarse.Click

        BD.conectarDB()
        Label1Info.Visible = True
        If (BD.existeUsuario(Email.Text) = True) Then
            Label1Info.Text = "Este usuario ya existe en la Base de Datos"
            Label1Info.ForeColor = Drawing.Color.Red
        Else
            Randomize()
            Dim NumConf As Single
            NumConf = CLng(Rnd() * 9000000) + 1000000

            Dim resp As String
            resp = BD.insertarUsuario(Email.Text, Nombre.Text, Pregunta.Text, Respuesta.Text, DNI.Text, NumConf, 0, vbNullString, vbNullString, Password.Text)
            If (resp = BD.INSERTADO) Then
                If (mail(NumConf, Email.Text)) Then
                    Label1Info.ForeColor = Drawing.Color.Green
                    Label1Info.Text = "Se ha enviado un correo a " + Email.Text
                Else
                    Label1Info.ForeColor = Drawing.Color.Red
                    Label1Info.Text = "Ha habido un error al enviar el email"
                End If
            End If
        End If
        BD.cerrarconexionDB()
    End Sub

    Protected Function mail(ByVal num As Integer, ByVal address As String) As Boolean

        Dim subject As String = "Confirmacion de registro"
        Dim url As String = "http://hads19hads.azurewebsites.net/ConfirmarRegistro.aspx?mail=" + address + "&cod=" + num.ToString
        ' Dim url As String = "http://localhost:35845/ConfirmarRegistro.aspx?mail=" + address + "&cod=" + num.ToString

        Dim texto As String = "Bienvenido a nuestra pagina, pulsa en el siguiente enlace para confirmar el registro" +
            "<br/><br/><a href=" + url + ">" + url + "</a> " + "<br/><br/>Un saludo"

        Dim mailSender As New Email
        'MsgBox("HOLA")
        Return mailSender.enviarEmail(address, subject, texto)

    End Function

    Protected Sub btnVolverInicio_Click(sender As Object, e As EventArgs) Handles btnVolverInicio.Click
        Response.Redirect("Inicio.aspx")
    End Sub

End Class
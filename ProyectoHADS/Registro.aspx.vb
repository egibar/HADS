Imports Librerias

Public Class WebForm1
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
    Protected Sub btnRegistrarse_Click(sender As Object, e As EventArgs) Handles btnRegistrarse.Click
        Randomize()
        Dim NumConf As Single
        NumConf = CLng(Rnd() * 9000000) + 1000000
        Dim resp As String
        BD.conectar()
        If (BD.existeUsuario(Email.Text) Then
            MsgBox("Usuario ya existe")
        Else
            resp = BD.insertarUsuario(Email.Text, Nombre.Text, Apellido.Text, Pregunta.Text, Respuesta.Text, DNI.Text, Password.Text, NumConf, 0)
            If resp = BD.INSERTADO Then
                If confirmacion(NumConf, Email.Text) Then
                    MsgBox("Se ha enviado un correo a " + Email.Text)
                Else
                    MsgBox("Ocurrio algun problema con el correo intentelo de nuevo mas tarde")
                End If
            Else
                MsgBox(resp)
            End If
        End If

        BD.cerrarconexion()
    End Sub
    Protected Function confirmacion(ByVal num As Integer, ByVal address As String) As Boolean

        Dim subject As String = "Confirmacion de registro"
        Dim url As String = "http://localhost:49162/Confirmar.aspx?mail=" + address + "&cod=" + num.ToString

        Dim texto As String = "Bienvenido a nuestra pagina, pulsa en el siguiente enlace para confirmar el registro" +
            "<br/><br/><a href=" + url + ">" + url + "</a> " + "<br/><br/>Un saludo"
        Dim mailSender As New Email

        Return mailSender.enviarEmail(address, subject, texto)

    End Function
    Protected Sub btnVolverInicio_Click(sender As Object, e As EventArgs) Handles btnVolverInicio.Click
        Response.Redirect("Inicio.aspx")
    End Sub
End Class
Imports Librerias.BD
Imports Librerias
Imports Librerias.Seguridad

Imports System.Security.Cryptography

Public Class Registro
    Inherits System.Web.UI.Page

    Dim estaMatriculado As New matriculas.Matriculas
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Label1Info.Text = " "
        Label1Info.Visible = False
    End Sub

    Protected Sub btnRegistrarse_Click(sender As Object, e As EventArgs) Handles btnRegistrarse.Click

        'Mirar si el usuario existe entre los matriculados

        Label1Info.Visible = True
        Dim permitirReg As Boolean = False

        If (estaMatriculado.comprobar(Email.Text) = "SI") Then
            permitirReg = True
            Label1Info.Text = " "
        Else
            Label1Info.Visible = True
            Label1Info.ForeColor = Drawing.Color.Red
            Label1Info.Text = "El usuario correo no pertenece a un usuario matriculado."
        End If

        'En el caso de que este matriculado continuar con el registro
        If permitirReg Then
            conectarDB()
            If existeUsuario(Email.Text) = False Then
                Randomize()
                Dim NumConf As Single
                NumConf = CLng(Rnd() * 9000000) + 1000000

                'Cifrar el pass antes de meterlo en la BD
                Dim md5Hash As MD5 = MD5.Create()
                Dim passCifrada As String = getMd5Hash(md5Hash, Password.Text)

                'Insertamos el usuario
                Label1Info.Visible = True
                Dim resp As String
                resp = insertarUsuario(Email.Text, Nombre.Text, Pregunta.Text, Respuesta.Text, DNI.Text, NumConf, False, vbNullString, vbNullString, passCifrada)
                If (resp = INSERTADO) Then
                    'si se ha insertado bien se envía un email
                    If (mail(NumConf, Email.Text)) Then
                        Label1Info.ForeColor = Drawing.Color.Green
                        Label1Info.Text = "Se ha enviado un correo a " + Email.Text
                    Else
                        Label1Info.ForeColor = Drawing.Color.Red
                        Label1Info.Text = "Ha habido un error al enviar el email"
                    End If
                End If
            Else

                Label1Info.Text = "El usuario ya existe en la base de datos"
            End If
            cerrarconexionDB()
        End If
    End Sub

    Protected Function mail(ByVal num As Integer, ByVal address As String) As Boolean

        Dim subject As String = "Confirmacion de registro"
        'Dim url As String = "http://hads191617.azurewebsites.net/ConfirmarRegistro.aspx?mail=" + address + "&cod=" + num.ToString
        Dim url As String = "http://localhost:58928/ConfirmarRegistro.aspx?mail=" + address + "&cod=" + num.ToString

        Dim texto As String = "Bienvenido a nuestra pagina, pulsa en el siguiente enlace para confirmar el registro" +
            "<br/><br/><a href=" + url + ">" + url + "</a> " + "<br/><br/>Un saludo"

        Dim mailSender As New Email
        Return mailSender.enviarEmail(address, subject, texto)

    End Function

    Protected Sub btnVolverInicio_Click(sender As Object, e As EventArgs) Handles btnVolverInicio.Click
        Response.Redirect("Inicio.aspx")
    End Sub

End Class
Imports Librerias

Public Class WebForm2
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
            resp = BD.insertarUsuario(Email.Text, Nombre.Text, Apellido.Text, Pregunta.Text, Respuesta.Text, DNI.Text, NumConf, vbNull, vbNullString, vbNullString, Password.Text)

            If (resp = BD.INSERTADO) Then
                Label1Info.ForeColor = Drawing.Color.Green
                Label1Info.Text = "Enhora buena te has registrado, ya eres usuario!"
            Else
                Label1Info.ForeColor = Drawing.Color.Red
                Label1Info.Text = "Ha habido un error al insertar el usuario"
            End If
        End If

        BD.cerrarconexionDB()
    End Sub

    Protected Sub btnVolverInicio_Click(sender As Object, e As EventArgs) Handles btnVolverInicio.Click
        Response.Redirect("Inicio.aspx")
    End Sub

End Class
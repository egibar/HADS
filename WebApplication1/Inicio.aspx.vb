Imports Librerias.BD
Imports System.Data.SqlClient
Imports Librerias.Seguridad
Imports System.Security.Cryptography

Public Class Inicio
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub ButtonLogin_Click(sender As Object, e As EventArgs) Handles ButtonLogin.Click

        Dim usuario As SqlDataReader
        Dim tipo As String
        Dim contraseña As String = Password.Text

        'cifrar la contraseña
        'Dim md5Hash As MD5 = MD5.Create()
        'Dim passCifrada As String = getMd5Hash(md5Hash, contraseña)

        conectarDB()
        usuario = login(Email.Text, contraseña)
        'usuario = login(Email.Text, passCifrada)

        If usuario.HasRows Then
            usuario.Read()
            Session("email") = Email.Text
            tipo = usuario.Item("tipo")
            If tipo = "P" Then
                Session("Rol") = "P"
                FormsAuthentication.SetAuthCookie("profesor", False)
                Response.Redirect("~/Profesor/Profesor.aspx")
            ElseIf tipo = "A" Then
                Session("Rol") = "A"
                FormsAuthentication.SetAuthCookie("alumno", False)
                Response.Redirect("~/Alumnos/Alumno.aspx")
            End If
            usuario.Close()
        Else
            Label1Informativo.Visible = True
            Label1Informativo.Text = "No esta registrado como usuario, registrese para acceder"
        End If
        cerrarconexionDB()
    End Sub
End Class
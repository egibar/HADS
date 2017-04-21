Public Class Alumno
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Label1AlumConec.Text = Session("usuario")
    End Sub

    Protected Sub Button2CerrarSesion_Click(sender As Object, e As EventArgs) Handles Button2CerrarSesion.Click
        Response.Redirect("../CerrarSesion.aspx")
    End Sub
End Class
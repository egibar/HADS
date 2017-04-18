Public Class Coordinador

    Inherits System.Web.UI.Page

    Dim miWebService As New Coordinacion

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'solo "vadillo@ehu.es" tendra permiso para coordinar
        If Session("usuario") <> "vadillo@ehu.es" Then
            MsgBox("No tienes permiso para acceder a este fichero")
            Response.Redirect("../CerrarSesion.aspx")
        End If
    End Sub

    Protected Sub ButtonCalcular_Click(sender As Object, e As EventArgs) Handles ButtonCalcular.Click
        LblResultMedia.Text = miWebService.DedicacionMediaAlumnos(AlumnAsignaturas.SelectedItem.Value)
    End Sub
End Class
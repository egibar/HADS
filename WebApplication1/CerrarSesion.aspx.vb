Public Class CerrarSesion
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If (Session("usuario") Is Nothing) Then
            Response.Redirect("Inicio.aspx")
        Else
            If (Session("Rol") = "A") Then
                Application("numAlums") -= 1
                Application("alumsOnline").Remove(Session("usuario"))
            Else
                Application("numProfes") -= 1
                Application("profesOnline").Remove(Session("usuario"))
            End If
            Session.Remove("usuario")
            Response.Redirect("Inicio.aspx")
        End If

    End Sub

End Class
Public Class WebForm1
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Randomize()
        Dim NumConf As Single
        NumConf = CLng(Rnd() * 9000000) + 1000000
    End Sub


    Protected Sub btnVolverInicio_Click(sender As Object, e As EventArgs) Handles btnVolverInicio.Click
        Response.Redirect("Inicio.aspx")
    End Sub
End Class
Public Class VerTareasconXLST
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        XmlHASoriginal.Visible = True
        XmlCodigo.Visible = False
        XmlDescripcion.Visible = False
        XmlHEstimadas.Visible = False
    End Sub

    Protected Sub lnkCodigo_Click(sender As Object, e As EventArgs) Handles lnkCodigo.Click
        XmlHASoriginal.Visible = False
        XmlCodigo.Visible = True
        XmlDescripcion.Visible = False
        XmlHEstimadas.Visible = False

    End Sub

    Protected Sub lnkDescripcion_Click(sender As Object, e As EventArgs) Handles lnkDescripcion.Click
        XmlHASoriginal.Visible = False
        XmlCodigo.Visible = False
        XmlDescripcion.Visible = True
        XmlHEstimadas.Visible = False

    End Sub

    Protected Sub lnkHEstimadas_Click(sender As Object, e As EventArgs) Handles lnkHEstimadas.Click
        XmlHASoriginal.Visible = False
        XmlCodigo.Visible = False
        XmlDescripcion.Visible = False
        XmlHEstimadas.Visible = True

    End Sub

    Protected Sub Button2CerrarSesion_Click(sender As Object, e As EventArgs) Handles Button2CerrarSesion.Click
        Session.Abandon()
    End Sub

End Class
Imports Librerias.BD
Public Class WebForm2
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        conectar()
        Dim res As String = Login(Email.Text, Password.Text)
        cerrarConexion()
    End Sub

End Class
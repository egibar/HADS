Imports System.Data.SqlClient
Imports System.Xml
Imports Librerias.BD

Public Class ExportarTareas
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub ButtonExpXML_Click(sender As Object, e As EventArgs) Handles ButtonExpXML.Click
        Dim adapt As SqlDataAdapter
        Dim dset As New DataSet
        Dim tbl As DataTable
        Dim xmldoc As New XmlDocument

        Dim email As String
        Dim codAsig As String

        email = Session("email")
        codAsig = DropDownList1.SelectedValue

        adapt = New SqlDataAdapter("select Codigo, Descripcion, Hestimadas, Explotacion, TipoTarea from TareasGenericas where CodAsig='" & codAsig & "'", getconexion())

        dset = New DataSet("tareas")
        adapt.Fill(dset, "tareas")
        tbl = dset.Tables("tareas")

        tbl.Columns(0).ColumnName = "Codigo"
        tbl.Columns(1).ColumnName = "Descripcion"
        tbl.Columns(2).ColumnName = "Hestimadas"
        tbl.Columns(3).ColumnName = "Explotacion"
        tbl.Columns(4).ColumnName = "TipoTarea"

        dset.WriteXml(Server.MapPath("App_Data/" & codAsig & "exportar.xml"))
        Label1Exportar.Text = "XML de " & codAsig & " ha sido exportado correctamente"
    End Sub

    Protected Sub DropDownList1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropDownList1.SelectedIndexChanged

    End Sub
End Class
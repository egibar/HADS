Imports System.Data.SqlClient
Imports Librerias.BD

Public Class InsertarTarea
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub


    Protected Sub Button1AñadirTarea_Click(sender As Object, e As EventArgs) Handles Button1AñadirTarea.Click

        Dim dapTarea As SqlDataAdapter
        Dim dstTarea As New DataSet
        Dim tblTarea As New DataTable
        Dim rowTareas As DataRow

        conectarDB()
        dapTarea = New SqlDataAdapter("select * from TareasGenericas", getconexion())
        Dim Builder As New SqlCommandBuilder(dapTarea)

        dapTarea.Fill(dstTarea, "TareasGenericas")

        tblTarea = dstTarea.Tables("TareasGenericas")
        rowTareas = tblTarea.NewRow()
        rowTareas("Codigo") = TextBox1Codigo.Text
        rowTareas("Descripcion") = TextBox1Descripcion.Text
        rowTareas("CodAsig") = DDList1Asignatura.SelectedItem.Text
        rowTareas("HEstimadas") = TextBox3TipoTarea.Text
        rowTareas("Explotacion") = 0
        rowTareas("TipoTarea") = DDList1TipoTareas.SelectedItem.Text
        tblTarea.Rows.Add(rowTareas)

        dapTarea.Update(dstTarea, "TareasGenericas")
        tblTarea.AcceptChanges()
        cerrarconexionDB()
    End Sub
End Class
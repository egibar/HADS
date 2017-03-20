Imports System.Xml
Imports System.Data.SqlClient
Imports Librerias.BD

Public Class ImportarTareas
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Xml1.DocumentSource = Server.MapPath("App_Data/" & DropDownList1.SelectedValue & ".xml")
        conectarDB()
        Dim xd As New XmlDocument
        xd.Load(Server.MapPath("App_Data/" & DropDownList1.SelectedValue & ".xml"))
        Xml1.TransformSource = Server.MapPath("App_Data/XSLTFile.xsl")
        Dim Tareas As XmlNodeList
        Tareas = xd.GetElementsByTagName("tarea")
        Dim table As New DataTable
        Dim dset As New DataSet
        Dim adapterr As New SqlDataAdapter
        Dim comando As New SqlCommand("SELECT * FROM TareasGenericas", getconexion())
        adapterr = New SqlDataAdapter(comando)
        Dim builder As New SqlCommandBuilder(adapterr)
        adapterr.Fill(dset, "tareas")
        table = dset.Tables("tareas")

        Xml1.Document = xd


        'RECORREMOS LA LISTA DE NODOS Y AÑADIMOS A LA BD LOS REGISTROS
        Dim i As Integer
        For i = 0 To Tareas.Count - 1
            Dim row As DataRow = table.NewRow()
            row("Codigo") = Tareas(i).ChildNodes(0).ChildNodes(0).Value
            row("Descripcion") = Tareas(i).ChildNodes(1).ChildNodes(0).Value
            row("CodAsig") = DropDownList1.SelectedValue
            row("HEstimadas") = Integer.Parse(Tareas(i).ChildNodes(2).ChildNodes(0).Value.ToString)
            row("Explotacion") = Tareas(i).ChildNodes(3).ChildNodes(0).Value
            row("TipoTarea") = Tareas(i).ChildNodes(4).ChildNodes(0).Value

            table.Rows.Add(row)


        Next

        cerrarconexionDB()
    End Sub
End Class
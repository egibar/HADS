Imports System.Xml
Imports System.Data.SqlClient
Imports Librerias.BD

Public Class ImportarTareas
    Inherits System.Web.UI.Page

    Dim xml As String
    Dim tabla As New DataTable
    Dim dset As New DataSet
    Dim adapt As New SqlDataAdapter

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            xml = DDListAsignaturas.SelectedValue & ".xml"
            'Comprobamos que existe el archivo.
            If My.Computer.FileSystem.FileExists(Server.MapPath("../App_Data/" & xml)) Then
                Xml1.DocumentSource = Server.MapPath("../App_Data/" & xml)
                Xml1.TransformSource = Server.MapPath("../App_Data/XSLTFile.xsl")
                LabelMensajes.Text = " "
            Else
                LabelMensajes.ForeColor = Drawing.Color.Red
                LabelMensajes.Text = "No hay ningún XML que mostrar para esta asignatura."
            End If

        Catch ex As Exception
            LabelMensajes.Text = MsgBox(ex.Message)
        End Try
    End Sub

    Protected Sub ButtonImportar_Click(sender As Object, e As EventArgs) Handles ButtonImportar.Click
        Try

            'Xml1.DocumentSource = Server.MapPath("../App_Data/" & DDListAsignaturas.SelectedValue & ".xml")
            'Xml1.TransformSource = Server.MapPath("../App_Data/XSLTFile.xsl")
            conectarDB()
            Dim xd As New XmlDocument
            xd.Load(Server.MapPath("../App_Data/" & DDListAsignaturas.SelectedValue & ".xml"))

            Dim Tareas As XmlNodeList
            Tareas = xd.GetElementsByTagName("tarea")

            Dim comando As New SqlCommand("SELECT * FROM TareasGenericas", getconexion())
            adapt = New SqlDataAdapter(comando)
            Dim builder As New SqlCommandBuilder(adapt)
            adapt.Fill(dset, "tareas")
            tabla = dset.Tables("tareas")

            Xml1.Document = xd

            'RECORREMOS LA LISTA DE NODOS Y AÑADIMOS A LA BD LOS REGISTROS
            Dim i As Integer
            For i = 0 To Tareas.Count - 1
                Dim row As DataRow = tabla.NewRow()
                row("Codigo") = Tareas(i).ChildNodes(0).ChildNodes(0).Value
                row("Descripcion") = Tareas(i).ChildNodes(1).ChildNodes(0).Value
                row("CodAsig") = DDListAsignaturas.SelectedValue
                row("HEstimadas") = Integer.Parse(Tareas(i).ChildNodes(2).ChildNodes(0).Value.ToString)
                row("Explotacion") = Tareas(i).ChildNodes(3).ChildNodes(0).Value
                row("TipoTarea") = Tareas(i).ChildNodes(4).ChildNodes(0).Value

                tabla.Rows.Add(row)
            Next
            adapt.Update(dset, "tareas")
            tabla.AcceptChanges()
            LabelMensajes.ForeColor = Drawing.Color.Green
            LabelMensajes.Text = "Importado correctamente a la base de datos"
            cerrarconexionDB()

        Catch ex As Exception
            LabelMensajes.ForeColor = Drawing.Color.Red
            LabelMensajes.Text = "Hay tareas repetidas con el mismo codigo"
        End Try

    End Sub

    Protected Sub Button2CerrarSesion_Click(sender As Object, e As EventArgs) Handles Button2CerrarSesion.Click
        'Session.Abandon()
        Response.Redirect("../CerrarSesion.aspx")
    End Sub

    Protected Sub DDListAsignaturas_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DDListAsignaturas.SelectedIndexChanged
        Try
            Xml = DDListAsignaturas.SelectedValue & ".xml"
            'Comprobamos que existe el archivo.
            If My.Computer.FileSystem.FileExists(Server.MapPath("../App_Data/" & xml)) Then
                Xml1.DocumentSource = Server.MapPath("../App_Data/" & xml)
                Xml1.TransformSource = Server.MapPath("../App_Data/XSLTFile.xsl")
                LabelMensajes.Text = " "
            Else
                LabelMensajes.ForeColor = Drawing.Color.Red
                LabelMensajes.Text = "No hay ningún XML que mostrar para esta asignatura."
            End If

        Catch ex As Exception
            LabelMensajes.Text = MsgBox(ex.Message)
        End Try
    End Sub
End Class
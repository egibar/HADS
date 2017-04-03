Imports Librerias.BD
Imports System.Data.SqlClient
Imports System.Xml
Imports System.IO

Public Class ImportarTareasDataSet1
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        'cargar en el XML DATASOURCE el XML
        Xml1.DocumentSource = Server.MapPath("../App_Data/" & DropDownList1.SelectedValue & ".xml")

        Try
            'crear documento y cargar el fichero en el documento
            Dim xmldoc As New XmlDocument
            xmldoc.Load(Server.MapPath("../App_Data/" & DropDownList1.SelectedValue & ".xml"))

            'crear lista de nodos y cojer los del tag=<tarea>
            Dim listaTareas As XmlNodeList
            listaTareas = xmldoc.GetElementsByTagName("tarea")

            'variables para la BD
            Dim tabla As New DataTable
            Dim dset As New DataSet
            Dim adapt As New SqlDataAdapter
            Dim comando As New SqlCommand("SELECT * FROM TareasGenericas WHERE CodAsig='" & DropDownList1.SelectedValue & "'", getconexion)
            adapt = New SqlDataAdapter(comando)
            Dim builder As New SqlCommandBuilder(adapt)

            'creamos dataset
            Dim dsetXML As New DataSet

            'llenar el dataset con contenido del XML
            dsetXML.ReadXml(Server.MapPath("../App_Data/" & DropDownList1.SelectedValue & ".xml"))

            'columna que falta porque la estructura del fichero XML y la de la tabla no es la misma
            dsetXML.Tables(0).Columns.Add("CodAsig")

            'recorrer las filas
            Dim fila As DataRow
            For Each fila In dsetXML.Tables(0).Rows
                'COMANDO PARA DEBUGEAR Y VER QUE EFECTIVAMENTE LEE LOS ITEMS
                Debug.Print(fila.Item("Codigo"))
                'añadir CodAsig a cada fila
                fila.Item("CodAsig") = DropDownList1.SelectedValue
            Next

            'solicitud de cambios en la BD
            adapt.Update(dsetXML.Tables(0))
            tabla.AcceptChanges()

            Label1Importar.Text = "Se ha importado correctamente"
            Label1Importar.Visible = True

        Catch ex As Exception
            Label1Importar.Text = ex.Message
        End Try

    End Sub

    Protected Sub Button2CerrarSesion_Click(sender As Object, e As EventArgs) Handles Button2CerrarSesion.Click
        Session.Abandon()
        Response.Redirect("../Inicio.aspx")
    End Sub

    Protected Sub DropDownList1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropDownList1.SelectedIndexChanged, DropDownList1.DataBound
        'CARGAMOS EN EL XML DATASOURCE EL XML
        Dim filepath As String = Server.MapPath("../App_Data/" & DropDownList1.SelectedValue & ".xml")
        If (File.Exists(filepath)) Then
            Xml1.DocumentSource = filepath
            Xml1.TransformSource = Server.MapPath("../App_Data/XSLTFile.xsl")
            lblMensaje.Visible = False
        Else
            lblMensaje.Text = "No existe el XML de la asignatura seleccionada"
            lblMensaje.Visible = True
        End If
    End Sub
End Class
Imports Librerias.BD
Imports System.Data.SqlClient
Imports System.Xml


Public Class ExportarTareas
    Inherits System.Web.UI.Page

    Dim adapt As SqlDataAdapter
    Dim dset As New DataSet
    Dim tbl As DataTable

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Cargar_Datos()

    End Sub

    Protected Sub Cargar_Datos()

        Dim email As String

        Try
            email = Session("email")

            adapt = New SqlDataAdapter("select Codigo, Descripcion, Hestimadas, Explotacion, TipoTarea from TareasGenericas where CodAsig='" & DropDownList1.SelectedValue & "'", getconexion())

            'asignar un nombre al dataset (nodo raiz del XML)
            dset = New DataSet("tareas")

            'llenar el dataset con el adapter y asignamos la tabla
            adapt.Fill(dset, "tarea")
            tbl = dset.Tables("tarea")

            'guardar el dataset en la sesión para poder recuperarlo más tarde
            Session("dataset") = dset

            'asiganar a grid y mostrar
            GridView1.DataSource = tbl
            GridView1.DataBind()
        Catch ex As Exception
            'mostramos errores
            Label1Exportar.Text = ex.Message
        End Try


    End Sub
    Protected Sub ButtonExpXML_Click(sender As Object, e As EventArgs) Handles ButtonExpXML.Click
        Try
            'cojer el dset
            dset = Session("dataset")

            'cambiar nombres de las columnas
            dset.Tables("tarea").Columns(0).ColumnName = "codigo"
            dset.Tables("tarea").Columns(1).ColumnName = "descripcion"
            dset.Tables("tarea").Columns(2).ColumnName = "hestimadas"
            dset.Tables("tarea").Columns(3).ColumnName = "explotacion"
            dset.Tables("tarea").Columns(4).ColumnName = "tipoTarea"

            'Grabar el contenido del dset en el XML
            '-NODO ROOT SERA EL NOMBRE DEL DATASET <tareas>
            '-EL NOMBRE DE LA TABLA ES EL NOMBRE DE CADA ELEMENTO <tarea>
            '-EL NOMBRE DE LOS CAMPOS ES EL ASIGNADO EL NOMBRE QUE TENGA LA COLUMNA EN EL DATASET

            dset.WriteXml(Server.MapPath("~/App_Data/" & DropDownList1.SelectedValue & ".xml"))

            'crear el documento XML y cargar el fichero en el documento
            Dim xmldoc As New XmlDocument
            xmldoc.Load(Server.MapPath("~/App_Data/" & DropDownList1.SelectedValue & ".xml"))

            'crear lista de nodos y cojer todos los nodos con tag=<tareas>
            Dim tareas As XmlNodeList
            tareas = xmldoc.GetElementsByTagName("tareas")

            'crear atributo, asignarle un valor y adjuntar al NODO RAIZ
            Dim attr As XmlAttribute = xmldoc.CreateAttribute("xmlns:has")
            attr.Value = "http://ji.ehu.es/has"
            tareas(0).Attributes.Append(attr)

            'guardar en el xml
            xmldoc.Save(Server.MapPath("~/App_Data/" & DropDownList1.SelectedValue & ".xml"))

            Label1Exportar.Text = "XML de " & DropDownList1.SelectedValue & ".xml ha sido exportado correctamente"
            Label1Exportar.Visible = True

        Catch ex As Exception
            Label1Exportar.Text = ex.Message
        End Try
    End Sub

    Protected Sub AsignaturasProfe_Selecting(sender As Object, e As SqlDataSourceSelectingEventArgs)

    End Sub

    Protected Sub Button2CerrarSesion_Click(sender As Object, e As EventArgs) Handles Button2CerrarSesion.Click
        Session.Abandon()
        Response.Redirect("Inicio.aspx")
    End Sub

    Protected Sub DropDownList1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropDownList1.SelectedIndexChanged
        Label1Exportar.Visible = False
        Label1Exportar.Text = ""

        Cargar_Datos()

    End Sub
End Class
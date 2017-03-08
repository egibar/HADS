Imports Librerias.BD

Imports System.Data.SqlClient

Public Class TareasAlumno
    Inherits System.Web.UI.Page

    Dim dapAlmns As New SqlDataAdapter
    Dim dstAlmns As New DataSet
    Dim tblAlmns As New DataTable
    Dim rowAlmns As DataRow

    Dim asignaturas As New DataTable
    Dim table As New DataTable

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Dim alumno As String = Session("alumno")
            conectarDB()
            dapAlmns = New SqlDataAdapter("SELECT GruposClase.codigoasig FROM GruposClase INNER JOIN EstudiantesGrupo ON EstudiantesGrupo.Grupo=GruposClase.codigo WHERE EstudiantesGrupo.email='" & alumno & "'", getconexion())
            dapAlmns.Fill(dstAlmns, "AsignaturasAlumno")
            DDList1Asig.DataTextField = "codigoasig"
            DDList1Asig.DataSource = dstAlmns.Tables("AsignaturasAlumno")
            DDList1Asig.DataBind()
            cerrarconexionDB()
        End If
    End Sub


    Protected Sub ButtonCerrarSesion_Click(sender As Object, e As EventArgs) Handles ButtonCerrarSesion.Click
        Session.Abandon()
        Response.Redirect("Inicio.aspx")
    End Sub

    Protected Sub Button1VerTareas_Click(sender As Object, e As EventArgs) Handles Button1VerTareas.Click
        table = getTablaTareas(DDList1Asig.Text)
        Session("tabla") = table
        For i = 0 To 4 'cada columna de la tabla que queremos mostrar
            GridView1Tareas.Columns.Item(i + 1).Visible = True

            GridView1Tareas.Items.Item(i).Selected = True
        Next
        GridView1Tareas.DataSource = table
        GridView1Tareas.DataBind()

    End Sub
End Class
Imports Librerias.BD

Imports System.Data.SqlClient

Public Class TareasAlumno
    Inherits System.Web.UI.Page

    Dim table As New DataTable

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (IsPostBack) Then
            '     If Not Page.IsPostBack Then
        Else
            Dim dapAlmns As New SqlDataAdapter
            Dim dstAlmns As New DataSet
            Dim tblAlmns As New DataTable
            Dim alumno As String

            alumno = Session("email")

            conectarDB()
            dapAlmns = New SqlDataAdapter("select GruposClase.codigoasig from GruposClase, EstudiantesGrupo where EstudiantesGrupo.Grupo=GruposClase.codigo and EstudiantesGrupo.email='" & alumno & "'", getconexion())

            dapAlmns.Fill(dstAlmns, "AsignaturasAlumno")
            DDList1Asig.DataSource = dstAlmns.Tables("AsignaturasAlumno")
            DDList1Asig.DataTextField = "codigoasig"
            DDList1Asig.DataBind()
        End If
    End Sub
    Protected Sub Page_Unload(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Unload
        cerrarconexionDB()
    End Sub

    Protected Sub Button1VerTareas_Click(sender As Object, e As EventArgs) Handles Button1VerTareas.Click

        Dim dapTarea As New SqlDataAdapter
        Dim dstTarea As New DataSet
        Dim tblTarea As New DataTable
        Dim alumno As String
        Dim asigSelected As String

        alumno = Session("email")
        asigSelected = DDList1Asig.SelectedItem.Text

        dapTarea = New SqlDataAdapter("select TareasGenericas.Codigo, TareasGenericas.Descripcion, TareasGenericas.HEstimadas, TareasGenericas.TipoTarea from TareasGenericas where Explotacion='true' AND TareasGenericas.codAsig='" & asigSelected & "'", getconexion())
        dapTarea.Fill(dstTarea, "TareasAlumno")
        tblTarea = dstTarea.Tables("TareasAlumno")
        Session("table") = tblTarea

        GridView1Tareas.DataSource = tblTarea
        GridView1Tareas.DataBind()

    End Sub

    Protected Sub GridView1Tareas_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView1Tareas.SelectedIndexChanged

        Dim codigoTarea As String
        Dim horasEst As String
        codigoTarea = Me.GridView1Tareas.SelectedRow.Cells(1).Text
        horasEst = Me.GridView1Tareas.SelectedRow.Cells(3).Text
        'Response.Redirect("InstanciarTarea.aspx?codigo=Lab4")
        Response.Redirect("InstanciarTarea.aspx?codigo=" & codigoTarea & "&horasEst=" & horasEst & "")

    End Sub

    Protected Sub GridView_Sorting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewSortEventArgs) Handles GridView1Tareas.Sorting
        table = Session("table")
        Dim vista As New DataView(table)
        vista.Sort = e.SortExpression
        GridView1Tareas.DataSource = vista
        GridView1Tareas.DataBind()
    End Sub

    Protected Sub Button2CerrarSesion_Click(sender As Object, e As EventArgs) Handles Button2CerrarSesion.Click
        Session.Abandon()
        Response.Redirect("../Inicio.aspx")
    End Sub
End Class
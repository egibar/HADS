Imports Librerias.BD

Imports System.Data.SqlClient

Public Class TareasAlumno
    Inherits System.Web.UI.Page


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
            'Dim p As SqlDataReader
            'p = asignaturas()
            'While p.Read() = True
            'DDList1Asig.Items.Add(p.Item("codigo"))

            'End While
            'Session.Add("Asig", DDList1Asig.SelectedValue)
            'p.Close()


            'dapAlmns = New SqlDataAdapter("SELECT GruposClase.codigoasig FROM GruposClase INNER JOIN EstudiantesGrupo ON EstudiantesGrupo.Grupo=GruposClase.codigo WHERE EstudiantesGrupo.email='" & alumno & "'", getconexion())
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

    Protected Sub ButtonCerrarSesion_Click(sender As Object, e As EventArgs) Handles ButtonCerrarSesion.Click
        Session.Abandon()
        Response.Redirect("Inicio.aspx")
    End Sub

    Protected Sub Button1VerTareas_Click(sender As Object, e As EventArgs) Handles Button1VerTareas.Click

        Dim dapTarea As New SqlDataAdapter
        Dim dstTarea As New DataSet
        Dim tblTarea As New DataTable
        Dim alumno As String
        Dim asigSelected As String

        alumno = Session("email")
        asigSelected = DDList1Asig.SelectedItem.Text

        dapTarea = New SqlDataAdapter("select TareasGenericas.Codigo, TareasGenericas.Descripcion, TareasGenericas.HEstimadas, TareasGenericas.TipoTarea from TareasGenericas where TareasGenericas.codAsig='" & asigSelected & "'", getconexion())
        dapTarea.Fill(dstTarea, "TareasAlumno")
        tblTarea = dstTarea.Tables("TareasAlumno")
       
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



End Class
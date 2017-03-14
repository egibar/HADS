﻿Imports System.Data.SqlClient
Imports Librerias.BD

Public Class InstanciarTarea
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim Alumno As String

        Dim dapTareas As SqlDataAdapter
        Dim dstTareas As New DataSet
        Dim tblTareas As DataTable

        Alumno = Session("email")

        Label1Usuario.Text = Alumno
        Label2Tarea.Text = Request.QueryString("codigo")
        Label3HEstimadas.Text = Request.QueryString("horasEst")

        dapTareas = New SqlDataAdapter("select * from EstudiantesTareas where Email='" & Alumno & "'", getconexion())
        dapTareas.Fill(dstTareas, "TareasEspecificasAlumno")
        tblTareas = dstTareas.Tables("TareasEspecificasAlumno")

        GridViewTareasAsignatura.DataSource = tblTareas
        GridViewTareasAsignatura.DataBind()
    End Sub


    Protected Sub ButtonCrearTarea_Click(sender As Object, e As EventArgs) Handles ButtonCrearTarea.Click

        Dim Alumno As String
        Dim CodigoTarea As String
        Dim HEstimadas As Integer
        Dim HReales As Integer

        Dim dapTareas As SqlDataAdapter
        Dim dstTareas As New DataSet
        Dim tblTareas As DataTable
        Dim drowTareas As DataRow

        Alumno = Session("email")
        CodigoTarea = Label2Tarea.Text
        HEstimadas = Label3HEstimadas.Text
        HReales = TextBox1HReales.Text

        dapTareas = New SqlDataAdapter("select Email, CodTarea, HEstimadas, HReales from EstudiantesTareas where Email='" & Alumno & "'", getconexion())
        Dim Builder As SqlCommandBuilder = New SqlCommandBuilder(dapTareas)
        ' Code to modify data in DataSet 
        dapTareas.InsertCommand = Builder.GetInsertCommand
        dapTareas.Fill(dstTareas, "TareasEspecificasAlumno")
        tblTareas = dstTareas.Tables("TareasEspecificasAlumno")
        drowTareas = tblTareas.NewRow()

        drowTareas("Email") = Alumno
        drowTareas("CodTarea") = CodigoTarea
        drowTareas("HEstimadas") = HEstimadas
        drowTareas("HReales") = HReales

        tblTareas.Rows.Add(drowTareas)

        Try
            ' Without the SqlCommandBuilder this line would fail.
            dapTareas.Update(dstTareas, "TareasEspecificasAlumno")
            tblTareas.AcceptChanges()

            GridViewTareasAsignatura.DataSource = tblTareas
            GridViewTareasAsignatura.DataBind()

            LabelTareaCreada.Visible = True
            LabelTareaCreada.Text = "Una nueva tarea ha sido creada"
            LabelTareaCreada.ForeColor = Drawing.Color.Green

        Catch ex As Exception

            LabelTareaCreada.Text = "ERROR.No se ha podido crear una nueva tarea"
            LabelTareaCreada.ForeColor = Drawing.Color.Red
            LabelTareaCreada.Visible = True
        End Try
    End Sub

    Protected Sub Button2CerrarSesion_Click(sender As Object, e As EventArgs) Handles Button2CerrarSesion.Click
        Session.Abandon()
        Response.Redirect("Inicio.aspx")
    End Sub
End Class
Public Class Profesor
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Application("numAlums") Is Nothing Then
            label_alu.Text = 0
        Else
            label_alu.Text = Application("numAlums")
            ListBox1Alumn.DataSource = Application("alumsOnline")
            ListBox1Alumn.DataBind()
        End If

        If Application("numProfes") Is Nothing Then
            label_prof.Text = 0
        Else
            label_prof.Text = Application("numProfes")
            ListBox2Profes.DataSource = Application("profesOnline")
            ListBox2Profes.DataBind()
        End If

        'solo "vadillo@ehu.es" tendra permiso para coordinar
        If Session("usuario") = "vadillo@ehu.es" Then
            coordinar.Visible = True
        Else
            coordinar.Visible = False
        End If

        Label1ProfeConec.Text = Session("usuario")
    End Sub

    Protected Sub Button2CerrarSesion_Click(sender As Object, e As EventArgs) Handles Button2CerrarSesion.Click
        Response.Redirect("../CerrarSesion.aspx")
    End Sub

    Protected Sub Timer1_Tick(sender As Object, e As EventArgs) Handles Timer1.Tick

        'Dim profesores As List(Of String)
        ' Dim alumnos As List(Of String)
        'Application.Lock()

        ' alumnos = Application.Contents("alumnos")
        ' label_alu.Text = alumnos.Count.ToString
        'ListBox1Alumn.DataSource = alumnos
        'ListBox1Alumn.DataBind()

        ' profesores = Application.Contents("profesores")
        ' label_prof.Text = profesores.Count.ToString()
        ' ListBox2Profes.DataSource = profesores
        ' ListBox2Profes.DataBind()

        'Application.UnLock()

    End Sub
End Class
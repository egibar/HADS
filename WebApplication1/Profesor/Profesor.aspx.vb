Public Class Profesor
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Button2CerrarSesion_Click(sender As Object, e As EventArgs) Handles Button2CerrarSesion.Click
        Session.Abandon()
        Response.Redirect("../Inicio.aspx")
    End Sub

    Protected Sub Timer1_Tick(sender As Object, e As EventArgs) Handles Timer1.Tick
        Dim profesores As List(Of String)
        Dim alumnos As List(Of String)
        Application.Lock()

        alumnos = Application.Contents("alumnos")
        label_alu.Text = alumnos.Count.ToString
        ListBox1.DataSource = alumnos
        ListBox1.DataBind()

        profesores = Application.Contents("profesores")
        label_prof.Text = profesores.Count.ToString()
        ListBox2.DataSource = profesores
        ListBox2.DataBind()

        Application.UnLock()

    End Sub
End Class
Imports System.Web.SessionState

Public Class Global_asax
    Inherits System.Web.HttpApplication
    ' Dim alumnos As List(Of String)
    'Dim profesores As List(Of String)

    Sub Application_Start(ByVal sender As Object, ByVal e As EventArgs)

        ' Se desencadena al iniciar la aplicación
        Dim alumnosOnline As New Collection
        Dim profesoresOnline As New Collection

        Application("numAlums") = 0
        Application("numProfes") = 0

        Application("alumsOnline") = alumnosOnline
        Application("profesOnline") = profesoresOnline
        ' Fires when the application is started
        '  alumnos = New List(Of String)
        ' profesores = New List(Of String)

        'Application("alumnos") = alumnos
        'Application("profesores") = profesores
    End Sub

    Sub Session_Start(ByVal sender As Object, ByVal e As EventArgs)
        ' Fires when the session is started
    End Sub

    Sub Application_BeginRequest(ByVal sender As Object, ByVal e As EventArgs)
        ' Fires at the beginning of each request
    End Sub

    Sub Application_AuthenticateRequest(ByVal sender As Object, ByVal e As EventArgs)
        ' Fires upon attempting to authenticate the use
    End Sub

    Sub Application_Error(ByVal sender As Object, ByVal e As EventArgs)
        ' Fires when an error occurs
    End Sub

    Sub Session_End(ByVal sender As Object, ByVal e As EventArgs)
        ' Fires when the session ends
        Application.Lock()
        If (Session("Rol") = "A") Then
            Application("numAlums") -= 1
            Application("alumsOnline").Remove(Session("usuario"))
        Else
            Application("numProfes") -= 1
            Application("profesOnline").Remove(Session("usuario"))
        End If
        Application.UnLock()
    End Sub

    Sub Application_End(ByVal sender As Object, ByVal e As EventArgs)
        ' Fires when the application ends
        Application.Lock()
        If (Session("Rol") = "A") Then
            Application("numAlums") -= 1
            Application("alumsOnline").Remove(Session("usuario"))
        Else
            Application("numProfes") -= 1
            Application("profesOnline").Remove(Session("usuario"))
        End If
        Application.UnLock()
    End Sub

End Class
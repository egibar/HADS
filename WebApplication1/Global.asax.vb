﻿Imports System.Web.SessionState

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
        'Application.Lock()

        'alumnos = Application("alumnos")
        'profesores = Application("profesores")
        'If Session("Rol") = "A" Then
        'alumnos.Remove(Session("email"))
        'ElseIf Session("Rol") = "P" Then
        'profesores.Remove(Session("email"))
        'End If
        'Application.UnLock()
    End Sub

    Sub Application_End(ByVal sender As Object, ByVal e As EventArgs)
        ' Fires when the application ends
    End Sub

End Class
Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.ComponentModel
Imports Librerias.BD

' Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente.
' <System.Web.Script.Services.ScriptService()> _
<System.Web.Services.WebService(Namespace:="http://hads191617.azurewebsites.net/")> _
<System.Web.Services.WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)> _
<ToolboxItem(False)> _
Public Class Coordinacion
    Inherits System.Web.Services.WebService

    <WebMethod()> _
    Public Function DedicacionMediaAlumnos(ByVal miAsignatura As String) As Double
        Return dedicacionAlumnos(miAsignatura)
    End Function

End Class
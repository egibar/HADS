Imports System.Security.Cryptography
Imports System.Text

Public Class Seguridad
    Shared Function getMd5Hash(ByVal md5Hash As MD5, ByVal input As String) As String

        'Convierte la entrada en tipo Byte y computa.
        Dim data As Byte() = md5Hash.ComputeHash(Encoding.UTF8.GetBytes(input))

        'Crea una estructura
        Dim sBuilder As New StringBuilder()

        ' Por cada byte del hash y le asigna un valor hexadecimal
        Dim i As Integer
        For i = 0 To data.Length - 1
            sBuilder.Append(data(i).ToString("x2"))
        Next i

        ' Devuelve el resumen MD5 como un string
        Return sBuilder.ToString()

    End Function 'GetMd5Hash
End Class

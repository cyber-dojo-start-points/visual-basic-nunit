
Public Class Checksum

    Public Shared Function SumOf(n As Integer) As Integer
        Dim sum As Integer = 0
        Do While n > 0
            sum += n Mod 10
            n = n \ 10
        Loop
        Return sum
    End Function

End Class

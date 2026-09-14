
Public Class FizzBuzz

    Public Shared Function Say(n As Integer) As String
        If n Mod 15 = 0 Then
            Return "FizzBuzz"
        End If
        If n Mod 3 = 0 Then
            Return "Fizz"
        End If
        If n Mod 5 = 0 Then
            Return "Buzz"
        End If
        Return n.ToString()
    End Function

End Class

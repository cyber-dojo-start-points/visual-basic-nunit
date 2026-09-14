
Public Class Hiker

    Public Shared Readonly Property Answer() As Integer
        Get
            ' The learner put a print inside a loop to see what was happening,
            ' and it prints far more than the 50K the runner keeps of a stream.
            ' The nunit console runner writes its summary on stdout, and this
            ' print lands there too, so the summary is what falls off the end.
            For i As Integer = 0 To 9999
                System.Console.WriteLine("debug: i is " & i.ToString())
            Next
            Return 6 * 7
        End Get
    End Property

End Class

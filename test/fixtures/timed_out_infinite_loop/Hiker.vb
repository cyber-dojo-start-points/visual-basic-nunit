
Public Class Hiker

    Public Shared Readonly Property Answer() As Integer
        Get
            Dim n As Integer = 0
            ' The learner meant to count up to 42 and never moves n.
            Do While n <> 42
            Loop
            Return n
        End Get
    End Property

End Class


Public Class Hiker

    Public Shared Readonly Property Answer() As Integer
        Get
            System.Console.WriteLine("answer was called")
            Return 6 * 7
        End Get
    End Property

End Class

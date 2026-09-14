
Public Class Hiker

    Public Shared Readonly Property Answer() As Integer
        Get
            Return 6 * 9
        End Get
    End Property

    Public Shared Readonly Property DigitCount() As Integer
        Get
            Dim digits() As Integer = {4, 2}
            Return digits(5)
        End Get
    End Property

End Class

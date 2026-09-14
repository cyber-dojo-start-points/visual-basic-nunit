
Public Class Hiker

    Public Shared Readonly Property Answer() As Integer
        Get
            Return 6 * sevn()
        End Get
    End Property

    Private Shared Function Seven() As Integer
        Return 7
    End Function

End Class

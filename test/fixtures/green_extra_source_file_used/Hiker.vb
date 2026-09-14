
Public Class Hiker

    Public Shared Readonly Property Answer() As Integer
        Get
            Return 6 * 7
        End Get
    End Property

    Public Shared Readonly Property AnswerChecksum() As Integer
        Get
            Return Checksum.SumOf(Answer)
        End Get
    End Property

End Class

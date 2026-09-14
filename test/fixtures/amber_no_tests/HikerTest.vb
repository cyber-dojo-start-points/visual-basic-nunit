
Imports NUnit.Framework
Imports NUnit.Framework.Legacy

<TestFixture()>
Public Class HikerTest

    ' The <Test()> attribute is what NUnit gathers, and nothing here carries
    ' one, so the run proves nothing about the code.
    Public Function Expected() As Integer
        Return 42
    End Function

End Class

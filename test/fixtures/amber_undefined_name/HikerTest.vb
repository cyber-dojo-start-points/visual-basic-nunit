
Imports NUnit.Framework
Imports NUnit.Framework.Legacy

<TestFixture()>
Public Class HikerTest

    <Test()>
    Public Sub life_the_universe_and_everything()
        ClassicAssert.AreEqual(42, Hiker.Ansewr)
    End Sub

End Class

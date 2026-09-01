
Imports NUnit.Framework
Imports NUnit.Framework.Legacy

<TestFixture()>
Public Class HikerTest

    <Test()>
    Public Sub life_the_universe_and_everything()
        Rem a simple example to start you off
        ClassicAssert.AreEqual(42, Hiker.Answer)
    End Sub

End Class

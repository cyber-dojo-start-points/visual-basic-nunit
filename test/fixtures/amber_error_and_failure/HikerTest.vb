
Imports NUnit.Framework
Imports NUnit.Framework.Legacy

<TestFixture()>
Public Class HikerTest

    <Test()>
    Public Sub life_the_universe_and_everything()
        ClassicAssert.AreEqual(42, Hiker.Answer)
    End Sub

    <Test()>
    Public Sub the_answer_is_two_digits_long()
        ClassicAssert.AreEqual(2, Hiker.DigitCount)
    End Sub

End Class

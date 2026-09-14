
Imports NUnit.Framework
Imports NUnit.Framework.Legacy

<TestFixture()>
Public Class HikerTests

    <Test()>
    Public Sub the_answer_is_two_digits_long()
        ClassicAssert.AreEqual(2, Hiker.Answer.ToString().Length
    End Sub

End Class

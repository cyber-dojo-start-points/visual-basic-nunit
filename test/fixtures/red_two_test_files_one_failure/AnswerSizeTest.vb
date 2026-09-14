
Imports NUnit.Framework
Imports NUnit.Framework.Legacy

<TestFixture()>
Public Class AnswerSizeTest

    <Test()>
    Public Sub the_answer_is_three_digits_long()
        ClassicAssert.AreEqual(3, Hiker.Answer.ToString().Length)
    End Sub

End Class

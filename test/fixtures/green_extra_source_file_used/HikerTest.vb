
Imports NUnit.Framework
Imports NUnit.Framework.Legacy

<TestFixture()>
Public Class HikerTest

    <Test()>
    Public Sub the_digits_of_the_answer_add_up_to_six()
        ClassicAssert.AreEqual(6, Hiker.AnswerChecksum)
    End Sub

End Class

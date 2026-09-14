
Imports NUnit.Framework
Imports NUnit.Framework.Legacy

<TestFixture()>
Public Class HikerTest

    <Test()>
    Public Sub life_the_universe_and_everything()
        ClassicAssert.AreEqual(42, Hiker.Answer)
    End Sub

    <Test()>
    Public Sub the_answer_is_a_multiple_of_seven()
        ClassicAssert.AreEqual(0, Hiker.Answer Mod 7)
    End Sub

    <Test()>
    Public Sub the_answer_reads_as_forty_two()
        ClassicAssert.AreEqual("42", Hiker.Answer.ToString())
    End Sub

End Class

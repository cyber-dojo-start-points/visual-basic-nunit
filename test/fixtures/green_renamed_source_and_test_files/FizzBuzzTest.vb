
Imports NUnit.Framework
Imports NUnit.Framework.Legacy

<TestFixture()>
Public Class FizzBuzzTest

    <Test()>
    Public Sub fifteen_says_fizz_buzz()
        ClassicAssert.AreEqual("FizzBuzz", FizzBuzz.Say(15))
    End Sub

End Class

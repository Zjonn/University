

Module Module1

    Sub Main()
        Dim prime As Integer
        Dim a As NetLib.Prime
        a = New NetLib.Prime


        Console.WriteLine("Podaj X")
        prime = Console.ReadLine()
        Console.WriteLine(a.Prime(prime))


    End Sub

End Module

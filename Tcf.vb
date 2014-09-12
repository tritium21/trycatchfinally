Imports System

Public Class Test
    Public Shared Sub Main()
        Try
            Try
                Throw New Exception("Foo")
            Catch ex as Exception
                Console.WriteLine("Inner Catch")
                Throw
            Finally
                Console.WriteLine("Inner Finally")
            End Try
        Catch ex as Exception
            Console.WriteLine("Outer Catch")
        Finally
            Console.WriteLine("Outer Finally")
        End Try
    End Sub
End Class

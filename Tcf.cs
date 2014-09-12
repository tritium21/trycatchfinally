using System;

public class Test
{
	public static void Main()
	{
		try {
			try {
				throw new Exception("Foo");
			}
			catch (Exception ex) {
				Console.WriteLine("Inner Catch");
				throw ex;
			}
			finally {
				Console.WriteLine("Inner Finally");
			}
		}
		catch (Exception ex) {
			Console.WriteLine("Outer Catch");
		}
		finally {
			Console.WriteLine("Outer Finally");
		}
	}
}

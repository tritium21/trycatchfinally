public class Tcf
{
	public static void main (String[] args) throws java.lang.Exception
	{
		try {
			try {
				throw new Exception("Foo");
			}
			catch (Exception ex) {
				System.out.println("Inner Catch");
				throw ex;
			}
			finally {
				System.out.println("Inner Finally");
			}
		}
		catch (Exception ex) {
			System.out.println("Outer Catch");
		}
		finally {
			System.out.println("Outer Finally");
		}
	}
}

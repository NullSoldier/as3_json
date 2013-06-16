package  
{
	public class Assert 
	{
		public static function NotNull (v:*) : void
		{
			if (v == null)
				throw new Error ("Cannot be null");
		}
		
		public static function IsNull (v:*) : void
		{
			if (v != null)
				throw new Error ("Must be null");
		}
		
		public static function ZeroLength (v:*) : void
		{
			if (v.length != 0)
				throw new Error ("Length must be zero");
		}
		
		public static function HasLength (v:*, length:int) : void
		{
			if (v.length != length)
				throw new Error ("Length must be equal to " + length);
		}
		
		public static function IsEqual (v1:*, v2:*) : void
		{
			if (v1 != v2)
				throw new Error ("Items must be equal");
		}
		
		public static function IsNotEqual (v1:*, v2:*) : void
		{
			if (v1 === v2)
				throw new Error ("Items must not be equal");
		}
	}
}
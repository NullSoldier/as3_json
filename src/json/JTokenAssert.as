package json 
{
	public class JTokenAssert 
	{
		public static function ParseError (json:String) : void
		{
			try {
				JTokenizer.Tokenize (json);
			} catch (e:JParseError) {
				return;
			}
			throw new Error ("Parse error was expected.");
		}
	}
}
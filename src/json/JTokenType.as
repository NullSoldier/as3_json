package json 
{
	public class JTokenType
	{
		public static var LPAREN:JTokenType = new JTokenType (LPAREN);
		public static var RPAREN:JTokenType = new JTokenType (RPAREN);
		public static var VALUE:JTokenType = new JTokenType (VALUE);
		
		public static var OBJECT:JTokenType = new JTokenType (OBJECT);
		public static var ARRAY:JTokenType = new JTokenType (ARRAY);
		public static var NUMBER:JTokenType = new JTokenType (NUMBER);
		public static var STRING:JTokenType = new JTokenType (STRING);
		public static var NULL:JTokenType = new JTokenType (NULL);
		public static var TRUE:JTokenType = new JTokenType (TRUE);
		public static var FALSE:JTokenType = new JTokenType (FALSE);
		
		public function JTokenType (type:JTokenType)
		{
		}
	}
}
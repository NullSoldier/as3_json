package json 
{
	public class JTokenType
	{
		public static var LBRACE:JTokenType = new JTokenType (LBRACE);
		public static var RBRACE:JTokenType = new JTokenType (RBRACE);
		public static var COLON:JTokenType = new JTokenType (COLON);
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
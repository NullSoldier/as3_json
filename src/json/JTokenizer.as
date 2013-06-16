package json
{
	public class JTokenizer
	{
		public function JTokenizer (data:String) : void
		{
			this.data = data;
		}
		
		private var data:String;
		private var pos:int = 0;
		
		public function ReadToken() : JToken
		{
			return null;
		}
		
		public static function Tokenize (json:String) : Vector.<JToken>
		{
			var tokenizer:JTokenizer = new JTokenizer (json);
			var tokens:Vector.<JToken> = new <JToken> [];
			var current:JToken;
			while (current = tokenizer.ReadToken()) {
				tokens.push (current);
			}			
			return tokens;
		}
		
		public static function FirstToken (json:String) : JToken
		{
			var tokenizer:JTokenizer = new JTokenizer (json);
			return tokenizer.ReadToken();
		}
	}
}
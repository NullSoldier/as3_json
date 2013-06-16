package json
{
	public class JTokenizer
	{		
		public static function Tokenize (json:String) : Vector.<JToken>
		{
			var tokenizer:JTokenizer = new JTokenizer (new TokenizerSecret(), json);
			return tokenizer.ReadTokens();
		}
		
		public static function FirstToken (json:String) : JToken
		{
			var tokens:Vector.<JToken> = Tokenize (json);
			return tokens.length > 0 ? tokens[0] : null;
		}
		
		public function JTokenizer (secret:TokenizerSecret, data:String) : void
		{
			this.data = data;
		}
		
		//TODO: col and line are currently inaccurate
		private var data:String;
		private var pos:int = 0;
		private var col:int = 0;
		private var line:int = 0;
		private var posStack:Array = [];
		private var tokens:Vector.<JToken>;
		
		private const NULL:String = "null";
		private const TRUE:String = "true";
		private const FALSE:String = "false";
		private const LBRACE:String = "{";
		private const RBRACE:String = "}";
		private const COLON:String = ":";		
		
		public function ReadTokens() : Vector.<JToken>
		{
			if (tokens != null)
				return tokens;
			
			tokens = new Vector.<JToken>();
			return readValue() 
				? tokens
				: null;
		}
		
		private function readValue() : Boolean
		{
			var result:Boolean = readObject()
				|| readTrue()
				|| readFalse()
				|| readNull()
				|| readArray()
				|| readString()
				|| readNumber();
				
			if (!result)
				throw new JParseError ("Expected value token", pos);
			
			return true;
		}
		
		private function readObject() : Boolean
		{
			if (!readLBrace()) {
				return false;
			}
			// Read in optional KVP pairs
			while (readKVP()) {
			}
			if (!readRBrace()) {
				throw new JParseError ("Expecting right brace", pos);
			}				
			return true;
		}
		
		private function readKVP() : Boolean
		{
			if (!readString())
				return false;
			if (!readColon())
				throw new JParseError ("Missing KVP deliminator :", pos);
			if (!readValue())
				throw new JParseError ("Missing KVP value", pos);
				
			return true;
		}
		
		private function readString() : Boolean
		{
			return false; //TODO: do it
		}
		
		private function readNumber() : Boolean
		{
			return false; //TODO: do it
		}
		
		private function readArray() : Boolean
		{
			return false; //TODO: do it
		}
		
		private function readColon() : Boolean
		{
			if (!tryReadDesired (COLON))
				return false
				
			tokens.push (new JToken (JTokenType.COLON));
			return true;
		}
		
		private function readTrue() : Boolean
		{
			if (!tryReadDesired (TRUE))
				return false;
				
			tokens.push (new JToken (JTokenType.TRUE, true));
			return true;
		}
		
		private function readFalse() : Boolean
		{
			if (!tryReadDesired (FALSE))
				return false;
				
			tokens.push (new JToken (JTokenType.FALSE, false));
			return true;
		}
		
		private function readLBrace() : Boolean
		{
			if (!tryReadDesired (LBRACE))
				return false;
			
			tokens.push (new JToken (JTokenType.LBRACE));
			return true;
		}
		
		private function readRBrace() : Boolean
		{
			if (!tryReadDesired (RBRACE))
				return false;
				
			tokens.push (new JToken (JTokenType.RBRACE));
			return true;
		}
		
		private function readNull() : Boolean
		{
			if (!tryReadDesired (NULL))
				return false;
			
			tokens.push (new JToken (JTokenType.NULL, null));
			return true;
		}
		
		private function skipIgnorable() : void
		{
			while (isIgnorable()) {
				pos++;
			}			
		}
		
		private function isIgnorable() : Boolean
		{
			//TODO: do it
			var char:String = peekChar();
			switch (char) 
			{
				case ' ':
				case '\t':
					return false;
				case '\r':
				case '\n':
					line++;
					col = 0;
					return false;
			}
			return char == ' ' 
				|| char == '\n'
				|| char == '\t';
		}
		
		private function readChar() : String
		{
			col++;
			return data.charAt (pos++);
		}
		
		private function peekChar() : String
		{
			return data.charAt (pos);
		}
		
		private function tryReadDesired (desired:String) : String
		{
			skipIgnorable();
			pushPos();
			
			var result:String = "";
			for (var i:int = 0; i < desired.length; i++) {
				result += readChar();
				if (result.charAt (i) != desired.charAt (i)) {
					popPos();
					return null;
				}
			}
			return result;			
		}
		
		private function pushPos() : void
		{
			posStack.push (this.pos);			
		}
		
		private function popPos() : void
		{
			pos = posStack.pop();
		}
	}
}

// HACK: To protect our constructor. ActionScript cannot
// export multiple public modules but we can use a ghost
// class that gets compile time checked
class TokenizerSecret { };
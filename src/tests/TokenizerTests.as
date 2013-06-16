package tests
{
	import json.*;
	
	public class TokenizerTests extends TestSet
	{		
		public function ReadEmpty() : void
		{
			var tokens:Vector.<JToken> = JTokenizer.Tokenize ("");
			Assert.ZeroLength (tokens);
		}
		
		public function ReadEmptyObject() : void
		{
			var tokens:Vector.<JToken> = JTokenizer.Tokenize ("{}");
			Assert.HasLength (tokens, 2);
			Assert.IsEqual (tokens[0].type, JTokenType.LPAREN);
			Assert.IsEqual (tokens[1].type, JTokenType.RPAREN);
		}
		
		public function ParseNull() : void
		{
			var token:JToken = JTokenizer.FirstToken ("null");
			Assert.IsEqual (token.type, JTokenType.NULL);
			Assert.IsNull (token.value);
		}
		
		public function ParseTrue() : void
		{
			var token:JToken = JTokenizer.FirstToken ("true");
			Assert.IsEqual (token.type, JTokenType.TRUE);
			Assert.IsEqual (token.value, true);
		}
		
		public function ParseFalse() : void
		{
			var token:JToken = JTokenizer.FirstToken ("false");
			Assert.IsEqual (token.type, JTokenType.FALSE);
			Assert.IsEqual (token.value, false);
		}
		
		public function ParseString() : void
		{
			var token:JToken = JTokenizer.FirstToken ("\"Hello world\"");
			Assert.IsEqual (token.type, JTokenType.STRING);
			Assert.IsEqual (token.value, "Hello World");
		}
		
		public function ParseUnterminatedString() : void
		{
			JTokenAssert.ParseError ("\"unterminated");
		}
		
		public function ParseWrongBraces() : void
		{
			JTokenAssert.ParseError ("{{}");
			JTokenAssert.ParseError ("}");
			JTokenAssert.ParseError ("{{}}}");
		}
		
		
	}
}
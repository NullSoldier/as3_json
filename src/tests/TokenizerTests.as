package tests
{
	import json.JToken;
	import json.JTokenizer;
	
	public class TokenizerTests extends TestSet
	{
		public function EmptyRead() : void
		{
			var tokens:Vector.<JToken> = JTokenizer.Tokenize ("");
			
			if (!tokens || tokens.length != 0)
				throw new Error ("Tokens not read successfully.");
		}
	}
}
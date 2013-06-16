package json 
{
	public class JParseError extends Error
	{
		public function JParseError (message:String, position:int)
		{
			_position = position;
			super (message);
		}
		
		public function get position() : int { return _position; }		
		private var _position:int;
	}
}
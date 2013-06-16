package json 
{
	public class JParseError extends Error
	{
		public function JParseError (message:String, position:int = -1, column:int = -1, line:int = -1)
		{
			_position = position;
			_column = column;
			_line = line;
			super (message);
		}
		
		public function get position() : int { return _position; }
		private var _position:int;
		
		public function get column() : int { return _column; }
		private var _column:int;
		
		public function get line() : int { return _line; }
		private var _line:int;
	}
}
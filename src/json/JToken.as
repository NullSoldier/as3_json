package json 
{
	public class JToken
	{
		function JToken (type:JTokenType, value:Object = null)
		{
			this._type = type;
			this._value = value;
		}
		
		public function get type() : JTokenType { return _type; }
		public var _type:JTokenType;
		
		public function get value() : Object { return _value; }
		public var _value:Object;
	}
}
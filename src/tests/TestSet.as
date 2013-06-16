package tests
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.utils.describeType;
	import json.JParseError;
	
	public class TestSet
	{
		public function RunTests() : void
		{
			var classXML:XML = describeType (this);
			var methods:XMLList = classXML.method;
			
			var testCount:int = 0;
			var passedCount:int = 0;
			
			for each (var method:XML in methods) {
				var methodName:String = method.@name;
				var declaredBy:String = method.@declaredBy;
				
				if (declaredBy != "tests::TestSet") {
					passedCount += run (methodName, this[methodName].call);
					testCount++;
				}
			}
			trace ("[" + passedCount + "/" + testCount + "] Tests passed.");
		}
		
		private function run (testName:String, test:Function) : Boolean
		{			
			try {
				test();
			} catch (e:Error) {
				if (e is JParseError) {
					trace (prettyParseError (testName, JParseError (e)))
				} else {
					trace ("Test '" + testName + "' failed: " + e.message);
				}
				return false;
			}
			return true;
		}
		
		private function prettyParseError (testName:String, e:JParseError) : String
		{
			return "Test '" + testName + "' failed: " + e.message
					+ " (line " + e.line + ", col " + e.column;
		}
	}
}
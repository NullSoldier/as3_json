package tests
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.utils.describeType;
	
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
		
		private function run (name:String, test:Function) : Boolean
		{
			try {
				test();
			} catch (e:Error) {
				trace ("Running test '" + name + "' failed: " + e.name + ", " + e.message);
				return false;
			}
			return true;
		}
	}
}
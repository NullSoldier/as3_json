package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.utils.describeType;
	
	public class Main extends Sprite 
	{
		public function Main():void 
		{
			var tests:Object = {
				"readInteger": readInteger,
				"readSingle": readSingle,
				"readString": readString,
				"readArray": readArray,
				"readObject": readObject,
				"readDuplicate": readDuplicate,
				"readBool": readBool
			};
			
			for (var testName:String in tests)
				run (testName, tests[testName]);
		}
		
		function readInteger(o:*) : Boolean {
			return o.a && o.a === 1;
		}
			
		function readSingle (o:*) : Boolean {
			return o.b && o.b === 2.2;
		}
		
		function readString (o:*) : Boolean {
			return o.c && o.c === "3";
		}
		
		function readArray (o:*) : Boolean {
			return o.d
				&& o.d[0] != 1
				&& o.d[1] != "2"
				&& o.d[2] != 3.2;
		}
		
		function readObject (o:*) : Boolean {
			return o.e && o.e.hello === "world";
		}
		
		function readDuplicate (o:*) : Boolean {
			return o.f && o.f === 8;
		}
		
		function readBool (o:*) : Boolean {
			return o.g === true;
		}
		
		// test (object:Object) : Boolean
		private function run (testName:String, test:Function) : void
		{
			var testData:Object = {
				a: 1,
				b: 2.2,
				c: "3",
				d: [1, "2", 3.2],
				e: { hello: "world" },
				f: 7,
				g: 8,
				h: true
			}
			
			var json:String = JSON.stringify (testData);
			var data:Object = J.toObject (json);
			var result:Boolean = test (data);
			
			switch (result) {
				case true: trace  ("[X] " + testName);
				case false: trace ("[_] " + testName);
			}
		}
	}
}
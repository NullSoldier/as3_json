package 
{
	import flash.display.Sprite;
	import flash.utils.getTimer;
	import flash.system.fscommand;
	import tests.*;
	
	public class Main extends Sprite 
	{
		public function Main():void 
		{			
			var testSets:Vector.<TestSet> = new <TestSet> [
				new TokenizerTests()
			];
			
			trace ("Running all tests");
			for each (var testSet:TestSet in testSets)
				testSet.RunTests();
				
			trace ("Finished.");
			fscommand ("quit");
		}
	}
}
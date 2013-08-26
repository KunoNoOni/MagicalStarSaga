package
{
	import org.flixel.*;
	
	[SWF(width="480", height="480", backgroundColor="#000000")]
	[Frame(factoryClass="Preloader")]
		
	public class MagicalStarSaga extends FlxGame
	{
		public function MagicalStarSaga()
		{
			super(240,240,TitleState,2);
			//forceDebugger = true;
			//FlxG.visualDebug = true;
			//FlxG.debug = true;
		}
	}
}
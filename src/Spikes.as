package
{
	import org.flixel.*;
	
	public class Spikes extends FlxSprite
	{
		
		public function Spikes(X:Number=0,Y:Number=0)
		{
			super(X*16,Y*16);
			loadGraphic(Registry.Spikes,false,false,16,16);
	
		}
		
		override public function update():void
		{
		
			super.update();
		}
	}
}
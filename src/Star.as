package
{
	import org.flixel.*;
	
	public class Star extends FlxSprite
	{
		private var tempY:Number;
		private var moveDown:Boolean = true;
		private var moveUp:Boolean = false;
		
		public function Star(X:Number=0,Y:Number=0)
		{
			super(X*16,Y*16);
			loadGraphic(Registry.Stars,false,false,16,16);
			tempY = 0;
	
		} 
		
		override public function update():void
		{			
			if(tempY == 25)
			{
				moveDown = false;
				moveUp = true;
			}
			else if(tempY == -25)
			{
				moveDown = true;
				moveUp = false;
			}
			
			if(moveDown)
			{
				this.velocity.y += 1;
				tempY += 1;
			}
			else if(moveUp)
			{
				this.velocity.y -= 1;
				tempY -= 1;
			}
				
			
			super.update();
		}
	}
}
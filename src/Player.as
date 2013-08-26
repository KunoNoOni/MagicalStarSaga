package
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
		
	public class Player extends FlxSprite
	{
		//Variables got here
		private var jumping:Boolean = false;

		public function Player(X:Number, Y:Number)
		{
			super(X*16,Y*16);
			loadGraphic(Registry.player,true,true,16,16);
			addAnimation("standing",[0],15);
			addAnimation("running",[1,2,3],15,true);
			addAnimation("jumping",[4],15,true);
			
			this.acceleration.y = 450;
			this.offset.x = 5;
			this.offset.y = 8;
			this.width = 5;
			this.height = 8;
		}
		
		override public function update():void
		{
			this.velocity.x = 0;
			
			if(FlxG.keys.LEFT)
			{
				this.facing = LEFT;
				this.velocity.x = -100;
			}
			
			if(FlxG.keys.RIGHT)
			{
				this.facing = RIGHT;
				this.velocity.x = 100;
			}
			
			if(FlxG.keys.justPressed('SPACE') && !jumping)
			{
				jumping = true;
				FlxG.play(Registry.Jump,.8);
				this.velocity.y = -175;
			}
			
			if(this.velocity.y != 0)
				this.play("jumping");
			else if(this.velocity.x == 0)
			{
				this.play("standing");
				jumping = false;
			}
			else
			{
				this.play("running");
				jumping = false;
			}
			
			super.update();
		}
	}
}
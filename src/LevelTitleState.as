package
{
	import org.flixel.*;
		
	public class LevelTitleState extends FlxState
	{
		//Variables got here
		private var title:FlxSprite;
		private var t:FlxTimer = new FlxTimer();
		
		public function LevelTitleState()
		{
			super();
		}
		
		override public function create():void
		{
			Registry.timerSet2 = false;
			
			switch(Registry.currLevel)
			{
				case 1:
				{
					title = new FlxSprite(0,0,Registry.level1TitleScreen);
					break;
				}
				case 2:
				{
					title = new FlxSprite(0,0,Registry.level2TitleScreen);
					break;
				}
				case 3:
				{
					title = new FlxSprite(0,0,Registry.level3TitleScreen);
					break;
				}
				case 4:
				{
					title = new FlxSprite(0,0,Registry.level4TitleScreen);
					break;
				}
				case 5:
				{
					title = new FlxSprite(0,0,Registry.level5TitleScreen);
					break;
				}
			}
			add(title);
		}
		
		override public function update():void
		{		
			
			if(FlxG.keys.justPressed("M"))
			{
				FlxG.music.volume = 0;
				Registry.musicMuted = true;
			}
			
			if(FlxG.keys.justPressed("U"))
			{
				FlxG.music.volume = 1;
				Registry.musicMuted = false;
			}
			
			LevelTitleDelay();
			super.update();
		}
		
		private function LevelTitleDelay():void
		{	
			if(!Registry.timerSet2)
				t.start(2);
			Registry.timerSet2 = true;
			trace("Timer has "+FlxU.floor(t.timeLeft)+" seconds left");
			if(t.finished)
			{
				t.stop();
				Registry.timerSet2 = false;
				FlxG.switchState(new PlayState());
			}			
		}
	}
}
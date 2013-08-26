package
{
	import org.flixel.*;
		
	public class InstructionState extends FlxState
	{
		//Variables got here
		private var instruction:FlxSprite;
		private var t:FlxTimer = new FlxTimer();
		
		public function InstructionState()
		{
			super();
		}
		
		override public function create():void
		{
			switch(Registry.page)
			{
				case 1:
				{
					instruction = new FlxSprite(0,0,Registry.instructionsP1);
					break;
				}
				case 2:
				{
					instruction = new FlxSprite(0,0,Registry.instructionsP2);
					break;
				}
				case 3:
				{
					instruction = new FlxSprite(0,0,Registry.instructionsP3);
					break;
				}
				case 4:
				{
					instruction = new FlxSprite(0,0,Registry.instructionsP4);
					break;
				}
			}

			add(instruction);
			if(!Registry.musicMuted)
			{
				FlxG.playMusic(Registry.titleMusic,1);
			}
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
			
			if(FlxG.keys.X)
			{
				if(Registry.lastPage)
				{
					FlxG.music.volume = 0;
					FlxG.switchState(new LevelTitleState());
				}
				else 
				{
					Registry.page += 1;
					if(Registry.page == 4)
					{
						Registry.lastPage = true;
					}
					FlxG.resetState();
				}
			}
			
			super.update();
		}	
	}
}
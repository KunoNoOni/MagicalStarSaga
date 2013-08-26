package
{
	import org.flixel.*;
		
	public class WinState extends FlxState
	{
		//Variables got here
		private var title:FlxSprite;
		private var sparkleFountain1:FlxEmitter;
		private var sparkleFountain2:FlxEmitter;
		private var sparkleFountain3:FlxEmitter;
		private var t:FlxTimer = new FlxTimer();
		
		public function WinState()
		{
			super();
		}
		
		override public function create():void
		{
			title = new FlxSprite(0,0,Registry.winScreen);
			add(title);
			if(!Registry.musicMuted)
			{
				FlxG.playMusic(Registry.titleMusic,1);
			}
		}
		
		override public function update():void
		{
			sparkleFountainDelay();
			
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
				FlxG.music.volume = 0;
				FlxG.switchState(new TitleState());		
			}
			
			super.update();
		}
		
		private function sparkleFountainDelay():void
		{	
			if(!Registry.timerSet2)
				t.start(2);
			Registry.timerSet2 = true;
			if(t.finished)
			{
				t.stop();
				Registry.timerSet2 = false;
				sparkleFountain1 = new FlxEmitter(40,80);
				sparkleFountain1.setXSpeed(-50,50);
				sparkleFountain1.setYSpeed(-100,0);
				sparkleFountain1.gravity = 150;
				sparkleFountain1.makeParticles(Registry.sparkles,50,0,true,.5);
				add(sparkleFountain1);
				sparkleFountain1.start(true,2);
				
				sparkleFountain2 = new FlxEmitter(200,80);
				sparkleFountain2.setXSpeed(-50,50);
				sparkleFountain2.setYSpeed(-100,0);
				sparkleFountain2.gravity = 150;
				sparkleFountain2.makeParticles(Registry.sparkles,50,0,true,.5);
				add(sparkleFountain2);
				sparkleFountain2.start(true,2);
				
				sparkleFountain3 = new FlxEmitter(120,40);
				sparkleFountain3.setXSpeed(-50,50);
				sparkleFountain3.setYSpeed(-100,0);
				sparkleFountain3.gravity = 150;
				sparkleFountain3.makeParticles(Registry.sparkles,50,0,true,.5);
				add(sparkleFountain3);
				sparkleFountain3.start(true,2);
				
				FlxG.play(Registry.StarPower,.8);
			}			
		}
	}
}
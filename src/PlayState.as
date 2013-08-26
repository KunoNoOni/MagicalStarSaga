package
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	
	public class PlayState extends FlxState
	{
		private var Level:FlxTilemap;
		private var Stars:FlxTilemap;
		private var player:Player;
		private var spikeGroup:FlxGroup = new FlxGroup();
		private var starGroup:FlxGroup = new FlxGroup();
		private var backGround:FlxSprite;
		private var spikes:Spikes;
		private var stars:Star;
		private var startX:int;
		private var startY:int;
		private var endX:int;
		private var endY:int;
		private var lifebarFrame:FlxSprite;
		private var lifebarBG:FlxSprite;
		private var lifebar:FlxSprite;
		private var lifeText:FlxText;
		private var t:FlxTimer = new FlxTimer();
		private var t2:FlxTimer = new FlxTimer();
		private var emitter:FlxEmitter;
		private var sparkleFountain:FlxEmitter;
		private var starsPickedUp:int = 0;
		private var extraHealth:int = 0;

		override public function create():void
		{	
			Registry.timerSet = false;
			Registry.timerSet2 = false;
			Registry.totalStars = 0;
			
			//load the background
			switch(Registry.currLevel)
			{
				case 1:
				{
					backGround = new FlxSprite(0,0, Registry.bg1);
					break;
				}
				case 2:
				{
					backGround = new FlxSprite(0,0, Registry.bg2);
					break;
				}
				case 3:
				{
					backGround = new FlxSprite(0,0, Registry.bg3);
					break;
				}
				case 4:
				{
					backGround = new FlxSprite(0,0, Registry.bg4);
					break;
				}
				case 5:
				{
					backGround = new FlxSprite(0,0, Registry.bg5);
					break;
				}
			}
			add(backGround);
			backGround.scrollFactor.x = .5;
			backGround.scrollFactor.y = .5;
			
			//load the level
			Level = new FlxTilemap(); 
			Level.loadMap(new Registry[Registry.levels[Registry.currLevel]],Registry.buildTile,16,16,0,0,1,2);

			//load the stars
			Stars = new FlxTilemap();
			Stars.loadMap(new Registry[Registry.stars[Registry.currLevel]],Registry.buildTile,16,16,0,0,1,1);

			//switch tilemap blocks for actual sprites
			swapTileForSprite();
			
			//add the levels
			add(Level);
			add(Stars);
			add(player);
			
			//set the camera and worldbounds
			FlxG.worldBounds.x = 0;
			FlxG.worldBounds.y = 0;
			FlxG.worldBounds.width = Level.width;
			FlxG.worldBounds.height = Level.height;
			
			FlxG.camera.setBounds(0, 0, Level.width, Level.height);
			FlxG.worldBounds = new FlxRect(0, 0, Level.width, Level.height);
			FlxG.camera.follow(player, FlxCamera.STYLE_PLATFORMER);		
			
			//set up hud
			showLifeBar();
			if(!Registry.musicMuted)
			{
				switch(Registry.currLevel)
				{
					case 1:
					{
						FlxG.playMusic(Registry.level1Music,1);
						break;
					}
					case 2:
					{
						FlxG.playMusic(Registry.level2Music,1);
						break;
					}
					case 3:
					{
						FlxG.playMusic(Registry.level3Music,1);
						break;
					}
					case 4:
					{
						FlxG.playMusic(Registry.level4Music,1);
						break;
					}
					case 5:
					{
						FlxG.playMusic(Registry.level5Music,1);
						break;
					}
				}
			}
		}
		
		private function swapTileForSprite():void
		{
			var x:int;
			var y:int;
			
			for(x=0;x<Level.width;x++)
			{
				for(y=0;y<Level.height;y++)
				{
					if(Level.getTile(x,y) == 6)
					{
						Level.setTile(x,y,0);
						player = new Player(x,y);
					}
					
					if(Level.getTile(x,y) == 5)
					{
						Level.setTile(x,y,0);
						spikes = new Spikes(x,y);
						spikeGroup.add(spikes);
						add(spikes);
					}

					if(Stars.getTile(x,y) == 1)
					{
						Stars.setTile(x,y,0);
						stars = new Star(x,y);
						Registry.totalStars +=1;
						starGroup.add(stars);
						add(stars);
					}
				}
			}
		}
		
		private function showLifeBar():void
		{
			//here we setup the player's life bar
			lifeText = new FlxText(0,10,75, "Health");
			lifeText.setFormat(null,10,0xFFFFFF, "center");
			lifeText.scrollFactor.x = 0;
			lifeText.scrollFactor.y = 0;
			add(lifeText);
						
			lifebarFrame = new FlxSprite(15,25);
			lifebarFrame.makeGraphic(50,10); 
			lifebarFrame.scrollFactor.x = 0;
			lifebarFrame.scrollFactor.y = 0;
			add(lifebarFrame);
			
			lifebarBG = new FlxSprite(16,26);
			lifebarBG.makeGraphic(48,8,0xff000000);
			lifebarBG.scrollFactor.x = 0;
			lifebarBG.scrollFactor.y = 0;
			add(lifebarBG);
			
			lifebar = new FlxSprite(16,26);
			lifebar.makeGraphic(1,8,0xffff0000);
			lifebar.scrollFactor.x = 0;
			lifebar.scrollFactor.y = 0;
			lifebar.origin.x = 0;
			lifebar.origin.y = 0; 
			lifebar.scale.x = 48;
			add(lifebar);
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
		
			if(Level.getTile(FlxU.floor(player.x/16),FlxU.floor(player.y/16)+1) == 3 && starsPickedUp == Registry.totalStars)
			{
				if(Registry.currLevel == 5)
				{
					FlxG.music.volume = 0;
					FlxG.switchState(new WinState());
				}
				else
				{
					Registry.currLevel += 1;
					FlxG.music.volume = 0;				
					FlxG.switchState(new LevelTitleState());
				}
			}
			
			lifebarDelay();
			
			if(lifebar.scale.x == 0)
			{
				death(player,player);
			}
			
			if(Registry.dying)
			{
				if(!Registry.timerSet2)
					t2.start(2);
				Registry.timerSet2 = true;
				trace("Timer2 has "+FlxU.floor(t2.timeLeft)+" seconds left");
				if(t2.finished)
				{
					t2.stop();
					Registry.timerSet2 = false;
					Registry.dying = false;
					FlxG.resetState();
				}			
			}
			
			FlxG.overlap(player,spikeGroup,death);
			FlxG.overlap(player,starGroup,pickup);

			super.update();
			
			FlxG.collide(Level, player);
		}
		
		private function death(p:FlxSprite,e:FlxSprite):void
		{
			if(!Registry.timerSet2)
			{
				Registry.dying = true;
				p.kill();
				FlxG.play(Registry.death,.8);
				emitter = new FlxEmitter(player.x,player.y-8);
				emitter.setXSpeed(-15,15);
				emitter.setYSpeed(-100,-50);
				emitter.gravity = 150;
				emitter.makeParticles(Registry.blood,50,0,true,.5);
				add(emitter);
				emitter.start(true,2);
			}
			
		}
		
		private function pickup(p:FlxSprite,e:FlxSprite):void
		{
			if(lifebar.scale.x == 48)
			{
				extraHealth += 24;
			}
			if(lifebar.scale.x < 48)
			{
				lifebar.scale.x += 24;
			}
			FlxG.play(Registry.StarPower,.8);
			sparkleFountain = new FlxEmitter(e.x,e.y-8);
			sparkleFountain.setXSpeed(-50,50);
			sparkleFountain.setYSpeed(-100,0);
			sparkleFountain.gravity = 150;
			sparkleFountain.makeParticles(Registry.sparkles,50,0,true,.5);
			add(sparkleFountain);
			sparkleFountain.start(true,2);
			starsPickedUp += 1;
			e.kill();
		}
		
		private function lifebarDelay():void
		{	
			if(!Registry.timerSet)
				t.start(10);
			Registry.timerSet = true;
			if(t.finished)
			{
				t.stop();
				Registry.timerSet = false;
				if(extraHealth != 0)
				{
					extraHealth -= 24;
				}
				else
					lifebar.scale.x -= 24;
			}			
		}
	}
}

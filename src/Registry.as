package
{
	import org.flixel.*;

	public class Registry
	{
		//public static var levelIndex:int = 0;
		public static var onGround:Boolean = true;
		public static var timerSet:Boolean = false;
		public static var timerSet2:Boolean = false;
		public static var dying:Boolean = false;
		public static var musicMuted:Boolean = false;
		public static var lastPage:Boolean = false;
		public static var currLevel:int = 1;
		public static var totalStars:int = 0;
		public static var page:int = 1;
		public static var levels:Array = ["null","level1","level2","level3","level4","level5"];
		public static var stars:Array = ["null","slevel1","slevel2","slevel3","slevel4","slevel5"];

		[Embed(source = 'Sprites/buildTiles.png')] static public var buildTile:Class;
		[Embed(source = 'Sprites/player.png')] static public var player:Class;
		[Embed(source = 'Sprites/background3.png')] static public var bg1:Class;
		[Embed(source = 'Sprites/background4.png')] static public var bg2:Class;
		[Embed(source = 'Sprites/background5.png')] static public var bg3:Class;
		[Embed(source = 'Sprites/background6.png')] static public var bg4:Class;
		[Embed(source = 'Sprites/background7.png')] static public var bg5:Class;
		[Embed(source = 'Sprites/spike.png')] static public var Spikes:Class;
		[Embed(source = 'Sprites/star.png')] static public var Stars:Class;
		[Embed(source = 'Sprites/blood.png')] static public var blood:Class;
		[Embed(source = 'Sprites/sparkles.png')] static public var sparkles:Class;
		[Embed(source = 'Sprites/level1Title.png')] static public var level1TitleScreen:Class;
		[Embed(source = 'Sprites/level2Title.png')] static public var level2TitleScreen:Class;
		[Embed(source = 'Sprites/level3Title.png')] static public var level3TitleScreen:Class;
		[Embed(source = 'Sprites/level4Title.png')] static public var level4TitleScreen:Class;
		[Embed(source = 'Sprites/level5Title.png')] static public var level5TitleScreen:Class;
		[Embed(source = 'Sprites/title.png')] static public var titleScreen:Class;
		[Embed(source = 'Sprites/instructionsP1.png')] static public var instructionsP1:Class;
		[Embed(source = 'Sprites/instructionsP2.png')] static public var instructionsP2:Class;
		[Embed(source = 'Sprites/instructionsP3.png')] static public var instructionsP3:Class;
		[Embed(source = 'Sprites/instructionsP4.png')] static public var instructionsP4:Class;
		[Embed(source = 'Sprites/win.png')] static public var winScreen:Class;
		
		
			
		[Embed(source = 'Maps/mapCSV_Level_Level1.csv', mimeType = 'application/octet-stream')] static public var level1:Class;
		[Embed(source = 'Maps/mapCSV_Level_Level2.csv', mimeType = 'application/octet-stream')] static public var level2:Class;
		[Embed(source = 'Maps/mapCSV_Level_Level3.csv', mimeType = 'application/octet-stream')] static public var level3:Class;
		[Embed(source = 'Maps/mapCSV_Level_Level4.csv', mimeType = 'application/octet-stream')] static public var level4:Class;
		[Embed(source = 'Maps/mapCSV_Level_Level5.csv', mimeType = 'application/octet-stream')] static public var level5:Class;
		[Embed(source = 'Maps/mapCSV_Stars_Level1.csv', mimeType = 'application/octet-stream')] static public var slevel1:Class;
		[Embed(source = 'Maps/mapCSV_Stars_Level2.csv', mimeType = 'application/octet-stream')] static public var slevel2:Class;
		[Embed(source = 'Maps/mapCSV_Stars_Level3.csv', mimeType = 'application/octet-stream')] static public var slevel3:Class;
		[Embed(source = 'Maps/mapCSV_Stars_Level4.csv', mimeType = 'application/octet-stream')] static public var slevel4:Class;
		[Embed(source = 'Maps/mapCSV_Stars_Level5.csv', mimeType = 'application/octet-stream')] static public var slevel5:Class;
		
		[Embed(source = 'sounds/Jump.mp3')] static public var Jump:Class;
		[Embed(source = 'sounds/StarPower.mp3')] static public var StarPower:Class;
		[Embed(source = 'sounds/death.mp3')] static public var death:Class;
		[Embed(source = 'Music/MSS_Title.mp3')] static public var titleMusic:Class;
		[Embed(source = 'Music/MSS_Level1.mp3')] static public var level1Music:Class;
		[Embed(source = 'Music/MSS_Level2.mp3')] static public var level2Music:Class;
		[Embed(source = 'Music/MSS_Level3.mp3')] static public var level3Music:Class;
		[Embed(source = 'Music/MSS_Level4.mp3')] static public var level4Music:Class;
		[Embed(source = 'Music/MSS_Level5.mp3')] static public var level5Music:Class;
		
		//[Embed(source="../assets/celtic-bitty.ttf", fontFamily="Celtic", embedAsCFF="false")] static public var fntCeltic:String;
		
		
		public function Registry()
		{
		}
	}
}
package
{
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import fp.ext.EXTConsole;
	
	[SWF(frameRate=60,width="620",height="380")]
	public class AntiVentures extends Engine
	{
		public function AntiVentures()
		{
			super(620, 380, 60);
			FP.screen.color = 0xff7777;
			EXTConsole.initializeConsole();
		}
		
		override public function init():void
		{
			//FP.world = new AVMapWorld();
			FP.world = new AVAreaWorld();
		}
		
CONFIG::DEBUG
{
		override public function update():void
		{
			super.update();
			EXTConsole.update();
		}
}
	}
}

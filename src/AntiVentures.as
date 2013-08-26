package
{
	import fp.ext.EXTConsole;
	
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	
	[SWF(frameRate=60, width="620", height="380")]
	public class AntiVentures extends Engine
	{
		public function AntiVentures()
		{
			super(620, 380);
			FP.screen.color = 0xff7777;
			EXTConsole.initializeConsole();
		}
		
		override public function init():void
		{
			FP.world = new AVMapWorld();
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

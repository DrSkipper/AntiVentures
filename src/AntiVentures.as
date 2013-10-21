package
{
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import io.arkeus.ouya.ControllerInput;
	import io.arkeus.ouya.controller.Xbox360Controller;
	import net.extendedpunk.ext.EXTConsole;
	
	[SWF(frameRate=60,width="620",height="380")]
	public class AntiVentures extends Engine
	{
		public static var xbox360Controller:Xbox360Controller = null;
		
		public function AntiVentures()
		{
			super(620, 380, 60, true);
			FP.screen.color = 0xff7777;
			EXTConsole.initializeConsole();
		}
		
		override public function init():void
		{
			ControllerInput.initialize(FP.stage);
			FP.world = new AVMapWorld();
			//FP.world = new AVAreaWorld();
		}
		
		override public function update():void
		{
			super.update();
			
CONFIG::debug
{
			EXTConsole.update();
}
			
			if (!_hasAquiredController && ControllerInput.hasReadyController())
			{
				_hasAquiredController = true;
				xbox360Controller = ControllerInput.getReadyController() as Xbox360Controller;
				if (xbox360Controller != null)
					EXTConsole.debug("AntiVentures", "update()", "Aquired Xbox360 Controller");
				else
					EXTConsole.debug("AntiVentures", "update()", "Found unrecognized controller");
			}
		}

		protected var _hasAquiredController:Boolean = false;
	}
}

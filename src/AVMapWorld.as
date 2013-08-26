package
{
	import flash.geom.Point;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import fp.ext.EXTHoverCamera;
	import fp.ext.EXTWorld;
	
	public class AVMapWorld extends EXTWorld
	{
		public var hoverCamera:EXTHoverCamera;
		
		public function AVMapWorld()
		{
			super();
			this.hoverCamera = new EXTHoverCamera();
			this.worldCamera = this.hoverCamera;
		}
		
		override public function begin():void
		{
			super.begin();
			
			var screenSize:Point = this.hoverCamera.currentViewSize();
			var mapImage:Image = new Image(Assets.MAP_BACKGROUND);
			mapImage.x = screenSize.x / 2;
			mapImage.y = screenSize.y / 2;
			mapImage.centerOO();
			
			this.addGraphic(mapImage);
			
			// EXTHoverCamera demo
			this.hoverCamera.enableHovering(10, 10, 0.01);
		}
		
		override public function update():void
		{
			super.update();
			
			if (Input.mousePressed)
				worldCamera.lerpToCameraRelativePosition(Input.mouseX, Input.mouseY);
		}
	}
}
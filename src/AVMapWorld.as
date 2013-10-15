package
{
	import flash.geom.Point;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import fp.ext.EXTHoverCamera;
	import fp.ext.EXTWorld;
	import fp.ext.EXTOffsetType;
	
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
			var mapImage:Image = new Image(Assets.BACKGROUND_MAP);
			mapImage.x = screenSize.x / 2;
			mapImage.y = screenSize.y / 2;
			mapImage.centerOO();
			
			this.addGraphic(mapImage);
			
			// EXTHoverCamera demo
			this.hoverCamera.enableHovering(10, 10, 0.01);
		}
		
		override public function update():void
		{
			if (Input.mousePressed)
				worldCamera.lerpToCameraRelativePosition(Input.mouseX, Input.mouseY);
				
			var mouseWheelDelta:int = Input.mouseWheelDelta;
			if (mouseWheelDelta != 0)
			{
				var newZoom:Number = this.worldCamera.zoom + mouseWheelDelta / 20.0;
				
				if (mouseWheelDelta < 0)
				{
					if (newZoom < 0.5)
						newZoom = 0.5;
				}
				else if (mouseWheelDelta > 0)
				{
					if (newZoom > 2.0)
						newZoom = 2.0;
				}
				
				var zoomDelta:Number = newZoom - this.worldCamera.zoom;
				var mousePoint:Point = new Point(-Input.mouseX / this.worldCamera.zoom, -Input.mouseY / this.worldCamera.zoom);
				this.worldCamera.zoomWithAnchor(zoomDelta, mousePoint, EXTOffsetType.TOP_LEFT);
			}
			
			super.update();
		}
	}
}
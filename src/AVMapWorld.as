package
{
	import flash.geom.Point;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.extendedpunk.ext.EXTHoverCamera;
	import net.extendedpunk.ext.EXTWorld;
	import net.extendedpunk.ext.EXTOffsetType;
	
	public class AVMapWorld extends EXTWorld
	{
		public static const controllerStickThreshold:Number = 0.2;
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
			
			var testDialog:AVGenericDialog = new AVGenericDialog(new Point(0, 0), new Point(200, 200));
			this.staticUiController.rootView.addSubview(testDialog);
			
			// EXTHoverCamera demo
			//this.hoverCamera.enableHovering(10, 10, 0.01);
		}
		
		override public function update():void
		{
			if (Input.mousePressed)
				worldCamera.lerpToCameraRelativePosition(Input.mouseX, Input.mouseY);
			
			// Controller stuff!
			var controllerMovement:Boolean = false;
			if (AntiVentures.xbox360Controller != null)
			{
				var xAmount:Number = AntiVentures.xbox360Controller.leftStick.x;
				var yAmount:Number = AntiVentures.xbox360Controller.leftStick.y;
				
				if (Math.abs(xAmount) > controllerStickThreshold || 
					Math.abs(yAmount) > controllerStickThreshold)
				{
					controllerMovement = true;
					//if (this.hoverCamera.hovering)
						//this.hoverCamera.disableHovering();
					
					if (xAmount > controllerStickThreshold) 
						xAmount -= controllerStickThreshold;
					else if (xAmount < -controllerStickThreshold) 
						xAmount += controllerStickThreshold;
					if (yAmount > controllerStickThreshold) 
						yAmount -= controllerStickThreshold;
					else if (yAmount < -controllerStickThreshold) 
						yAmount += controllerStickThreshold;
					
					this.worldCamera.moveDistance(xAmount * 10.0, 
												 -(yAmount) * 10.0);
				}
			}
			//if (!controllerMovement && !this.hoverCamera.hovering)
			//{
				//this.hoverCamera.enableHovering(10, 10, 0.01);
			//}
			
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
package
{
	import flash.geom.Rectangle;
	
	import fp.ext.EXTOffsetType;
	import fp.ext.EXTUtility;
	import fp.ext.EXTWorld;
	import fp.ui.UIImageView;
	
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Canvas;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;
	
	public class AVAreaWorld extends EXTWorld
	{		
		public function AVAreaWorld()
		{
			super();
		}
		
		override public function begin():void
		{
			super.begin();
			
			var speechBubbleLeftX:Number  = 148;
			var speechBubbleTopY:Number   = 131;
			var speechBubbleWidth:Number  = 221;
			var speechBubbleHeight:Number = 112;
			
			var blackGraphic:Canvas = new Canvas(speechBubbleWidth, speechBubbleHeight);
			blackGraphic.x = speechBubbleLeftX;
			blackGraphic.y = speechBubbleTopY;
			var rectangle:Rectangle = new Rectangle(0, 0, speechBubbleWidth, speechBubbleHeight);
			blackGraphic.fill(rectangle, 0x000000, 0.8);
			addGraphic(blackGraphic);
			
			var cornerImage1:Image = new Image(Assets.UI_SPEECH_BUBBLE_CORNER);
			cornerImage1.x = speechBubbleLeftX;
			cornerImage1.y = speechBubbleTopY;
			var cornerImage2:Image = new Image(Assets.UI_SPEECH_BUBBLE_CORNER);
			cornerImage2.x = speechBubbleLeftX + speechBubbleWidth;
			cornerImage2.y = speechBubbleTopY;
			var cornerImage3:Image = new Image(Assets.UI_SPEECH_BUBBLE_CORNER);
			cornerImage3.x = speechBubbleLeftX;
			cornerImage3.y = speechBubbleTopY + speechBubbleHeight;
			var cornerImage4:Image = new Image(Assets.UI_SPEECH_BUBBLE_CORNER);
			cornerImage4.x = speechBubbleLeftX + speechBubbleWidth;
			cornerImage4.y = speechBubbleTopY + speechBubbleHeight;
			
			var sideImage1:Image = new Image(Assets.UI_SPEECH_BUBBLE_SIDE);
			sideImage1.scaleX = (speechBubbleWidth - cornerImage1.scaledWidth) / sideImage1.width;
			sideImage1.x = cornerImage1.x + (cornerImage1.scaledWidth / 2) + (sideImage1.scaledWidth / 2);
			sideImage1.y = cornerImage1.y;
			var sideImage2:Image = new Image(Assets.UI_SPEECH_BUBBLE_SIDE);
			sideImage2.scaleX = (speechBubbleWidth - cornerImage1.scaledWidth) / sideImage2.width;
			sideImage2.x = cornerImage3.x + (cornerImage1.scaledWidth / 2) + (sideImage2.scaledWidth / 2);
			sideImage2.y = cornerImage3.y;
			var sideImage3:Image = new Image(Assets.UI_SPEECH_BUBBLE_SIDE);
			sideImage3.scaleX = (speechBubbleHeight - cornerImage1.scaledHeight) / sideImage3.width;
			sideImage3.x = cornerImage1.x;
			sideImage3.y = cornerImage1.y + (cornerImage1.scaledHeight / 2) + (sideImage3.scaledWidth / 2);
			sideImage3.centerOO();
			sideImage3.angle = 90;
			var sideImage4:Image = new Image(Assets.UI_SPEECH_BUBBLE_SIDE);
			sideImage4.scaleX = (speechBubbleHeight - cornerImage1.scaledHeight) / sideImage4.width;
			sideImage4.x = cornerImage4.x;
			sideImage4.y = cornerImage1.y + (cornerImage1.scaledHeight / 2) + (sideImage4.scaledWidth / 2);
			sideImage4.centerOO();
			sideImage4.angle = 90;
			
			cornerImage1.centerOO();
			cornerImage2.centerOO();
			cornerImage3.centerOO();
			cornerImage4.centerOO();
			sideImage1.centerOO();
			sideImage2.centerOO();
			addGraphic(cornerImage1);
			addGraphic(cornerImage2);
			addGraphic(cornerImage3);
			addGraphic(cornerImage4);
			addGraphic(sideImage1);
			addGraphic(sideImage2);
			addGraphic(sideImage3);
			addGraphic(sideImage4);
			
			addGraphic(new Text("Sup"), 0, FP.screen.width / 2, FP.screen.height / 2);
			
			// EXTCamera force demo
//			this.worldCamera.applyForce(1.0, 0.0);
			
			var imageViewTestImage:Image = new Image(Assets.UI_SCROLL_ARROW);
			this.staticUiController.rootView.backgroundColor.setColor(1.0, 0.0, 0.0, 0.5);
			this.relativeUiController.rootView.backgroundColor.setColor(0.0, 1.0, 0.0, 0.5);
			var imageView:UIImageView = new UIImageView(EXTUtility.ZERO_POINT, imageViewTestImage);
			imageView.backgroundColor.setColor(0.0, 0.0, 1.0, 0.5);
			this.staticUiController.rootView.addSubview(imageView);
//			this.worldCamera.zoom = 0.5;
		}
		
		override public function update():void
		{
			if (Input.mousePressed)
				worldCamera.lerpToCameraRelativePosition(Input.mouseX, FP.screen.height / 2, EXTOffsetType.CENTER);
			
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
				this.worldCamera.zoomWithAnchor(zoomDelta, EXTUtility.ZERO_POINT, EXTOffsetType.CENTER);
			}
			
			// EXTCamera force demo
//			if (worldCamera.vx >= 5.0)
//				worldCamera.applyForce(-1.0, 0.0);
//			else if (worldCamera.vx <= -5.0)
//				worldCamera.applyForce(1.0, 0.0);
			
			// EXTConsole demo
//			EXTConsole.debug("DefaultWorld", "update()", "Update Called");
			super.update();
		}
	}
}

package
{
	import flash.geom.Point;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.extendedpunk.ext.EXTOffsetType;
	import net.extendedpunk.ext.EXTUtility;
	import net.extendedpunk.ext.EXTWorld;
	import net.extendedpunk.ui.UIImageView;
	
	public class AVAreaWorld extends EXTWorld
	{		
		public function AVAreaWorld()
		{
			super();
		}
		
		override public function begin():void
		{
			super.begin();
			
			// Testing UI in the world
			var testDialog:AVGenericDialog = new AVGenericDialog(new Point(0, 0), new Point(200, 200));
			this.relativeUiController.rootView.addSubview(testDialog);
			
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
			// Don't allow mouse to interact with world if it is over the UI
			if (!this.relativeUiController.rootView.mouseIsOverViewOrSubviews)
			{
				// Camera lerp
				if (Input.mousePressed)
					worldCamera.lerpToCameraRelativePosition(Input.mouseX, FP.screen.height / 2, EXTOffsetType.CENTER);
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

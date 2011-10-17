package view.main
{
	import flash.events.Event;
	
	import mx.events.FlexEvent;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	public class MainApplicationMediator extends Mediator implements IMediator{
		
		public static const NAME:String = "MainApplicationMediator";
		
		public function MainApplicationMediator(viewComponent:Object){
			super(NAME, viewComponent);  
			mainApplication.addEventListener(FlexEvent.CREATION_COMPLETE, init);			
		}
		
		private function init(evt:Event) : void {
		}
		
		override public function handleNotification(notification:INotification):void{ 
			switch (notification.getName()){
				case ApplicationFacade.LOGIN_SUCCESS:
					
					break;
			}
		}
		
		override public function listNotificationInterests():Array{
			return [
				ApplicationFacade.LOGIN_SUCCESS
			];	
		}
		
		public function get mainApplication():MainApplication{  //aggancio il component al mediator
			return viewComponent as MainApplication;
		}
		
	}
}
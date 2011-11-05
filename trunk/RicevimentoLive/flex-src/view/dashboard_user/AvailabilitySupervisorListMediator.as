package view.dashboard_user
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import mx.collections.ArrayCollection;
	import mx.containers.TitleWindow;
	import mx.controls.Alert;
	import mx.events.CloseEvent;
	import mx.managers.PopUpManager;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import view.component.ConfirmBookingWindow;
	import view.component.availabilitySupervisorList;
	
	public class AvailabilitySupervisorListMediator extends Mediator implements IMediator {
		
		public static const NAME:String = "AvailabilitySupervisorListMediator";
		private var confirmBookingTitleWindow:TitleWindow;
		
		public function AvailabilitySupervisorListMediator(viewComponent:Object=null){
			super(NAME, viewComponent);
			//availabilityList.btnPrenota.addEventListener(MouseEvent.CLICK, popUp);
		}		
		private function popUp(evt:Event):void {
			confirmBookingTitleWindow = PopUpManager.createPopUp(availabilityList.parent.parent, ConfirmBookingWindow, true) as TitleWindow;				
			PopUpManager.centerPopUp(confirmBookingTitleWindow);			
			confirmBookingTitleWindow.addEventListener(CloseEvent.CLOSE, confirmBookingTitleWindowClose);
		}
		private function confirmBookingTitleWindowClose(evt:CloseEvent):void {
			PopUpManager.removePopUp(confirmBookingTitleWindow);
		}
		override public function handleNotification(notification:INotification):void{ 
			switch (notification.getName()){				
				case ApplicationFacade.GET_AVAILABILITY_SUPERVISOR_SUCCESS:					
					var availabilities:ArrayCollection = notification.getBody() as ArrayCollection;
					availabilityList.availabilitylist = availabilities;					
					break;				
			}
		}
		override public function listNotificationInterests():Array{
			return [
				ApplicationFacade.GET_AVAILABILITY_SUPERVISOR_SUCCESS				
			];	
		}
		public function get availabilityList():availabilitySupervisorList{
			return viewComponent as availabilitySupervisorList;
		}
	}
}
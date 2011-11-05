package view.dashboard_user
{
	import flash.events.Event;
	import flash.events.FocusEvent;
	import flash.events.MouseEvent;
	
	import mx.controls.Alert;
	import mx.events.CloseEvent;
	import mx.managers.PopUpManager;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import view.component.ConfirmBookingWindow;
	
	
	public class ConfirmBookingWindowMediator extends Mediator implements IMediator{
		
		public static const NAME:String = "ConfirmBookingWindowMediator";
		public function ConfirmBookingWindowMediator(viewComponent:Object=null){
			super(NAME, viewComponent);	
			confirmBookingWindow.taBookingReason.addEventListener(FocusEvent.FOCUS_IN, clearTextArea);
			confirmBookingWindow.btnConfirmBooking.addEventListener(MouseEvent.CLICK, sendBooking);
		}
		private function sendBooking(evt:Event):void{
			Alert.show("Prenotazione inviata con successo");
		}
		private function clearTextArea(evt:Event):void{
			confirmBookingWindow.taBookingReason.text = "";
		}
		
		override public function handleNotification(notification:INotification):void{ 
			switch (notification.getName()){
			}
		}
		override public function listNotificationInterests():Array{
			return [					
			];	
		}
		public function get confirmBookingWindow(): ConfirmBookingWindow{
			return viewComponent as ConfirmBookingWindow;
		}
	}
}
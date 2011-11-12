package view.dashboarduser
{
	import controller.dashboard_user.ConfirmBookingCommand;
	
	import flash.events.Event;
	import flash.events.FocusEvent;
	import flash.events.MouseEvent;
	
	import model.vo.Booking;
	import model.vo.Room;
	import model.vo.Student;
	
	import mx.controls.Alert;
	import mx.events.CloseEvent;
	import mx.managers.PopUpManager;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import view.component.ConfirmBookingWindow;
	import view.component.AvailabilitySupervisorList;
	import view.component.RoomList;
	import view.component.SupervisorListByRoom;
	import view.main.MainApplicationMediator;
	
	public class ConfirmBookingWindowMediator extends Mediator implements IMediator{
		
		public static const NAME:String = "ConfirmBookingWindowMediator";
		public function ConfirmBookingWindowMediator(viewComponent:Object=null){
			super(NAME, viewComponent);	
			confirmBookingWindow.taBookingReason.addEventListener(FocusEvent.FOCUS_IN, clearTextArea);
			confirmBookingWindow.btnConfirmBooking.addEventListener(MouseEvent.CLICK, sendBooking);
			
		}
		private function sendBooking(evt:Event):void{
			facade.sendNotification(ApplicationFacade.CONFIRM_BOOKING, confirmBookingWindow.booking);
		}
		private function clearTextArea(evt:Event):void{
			confirmBookingWindow.taBookingReason.text = "";
		}
		
		override public function handleNotification(notification:INotification):void{ 
			switch (notification.getName()){
				case ApplicationFacade.SEND_DATA_BOOKING:
					var booking:Booking = notification.getBody() as Booking;
					confirmBookingWindow.booking = booking; 
					break;
			}
		}
		override public function listNotificationInterests():Array{
			return [
				ApplicationFacade.SEND_DATA_BOOKING
			];	
		}
		public function get confirmBookingWindow(): ConfirmBookingWindow{
			return viewComponent as ConfirmBookingWindow;
		}
	}
}
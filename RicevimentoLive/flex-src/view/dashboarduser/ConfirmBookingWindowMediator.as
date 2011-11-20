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
	
	import view.MainApplicationMediator;
	import view.component.AvailabilitySupervisorList;
	import view.component.ConfirmBookingWindow;
	import view.component.RoomList;
	import view.component.SupervisorListByRoom;
	
	public class ConfirmBookingWindowMediator extends Mediator implements IMediator{
		
		public static const NAME:String = "ConfirmBookingWindowMediator";
		public function ConfirmBookingWindowMediator(viewComponent:Object=null){
			super(NAME, viewComponent);
			confirmBookingWindow.taBookingReason.addEventListener(FocusEvent.FOCUS_IN, clearTextArea);
			confirmBookingWindow.btnConfirmBooking.addEventListener(MouseEvent.CLICK, sendBooking);
			confirmBookingWindow.addEventListener(CloseEvent.CLOSE, closeConfirmBookingWindow);
		}
		
		private function sendBooking(evt:Event):void{
			if (confirmBookingWindow.taBookingReason.text != ""){
				confirmBookingWindow.booking.reasonBooking = confirmBookingWindow.taBookingReason.text;
				facade.sendNotification(ApplicationFacade.CONFIRM_BOOKING, confirmBookingWindow.booking);	
			}
			else
				Alert.show("E' necessario specificare il motivo del ricevimento!");
		}
		private function clearTextArea(evt:Event):void{
			confirmBookingWindow.taBookingReason.text = "";
		}
		private function closeConfirmBookingWindow(evt:CloseEvent):void {
			facade.removeMediator(ConfirmBookingWindowMediator.NAME);
			PopUpManager.removePopUp(confirmBookingWindow);
		}
		
		override public function handleNotification(notification:INotification):void{ 
			switch (notification.getName()){
				case ApplicationFacade.CONFIRM_BOOKING_SUCCESS:
					Alert.show("Prenotazione eseguita con successo!");
					facade.removeMediator(ConfirmBookingWindowMediator.NAME);
					PopUpManager.removePopUp(confirmBookingWindow);
					var booking:Booking = notification.getBody() as Booking;
					sendNotification(ApplicationFacade.ADD_BOOKING_IN_LIST, booking);
				break;
			}
		}
		override public function listNotificationInterests():Array{
			return [
			 ApplicationFacade.CONFIRM_BOOKING_SUCCESS,
			 ApplicationFacade.CONFIRM_BOOKING_ERROR,
			];	
		}
		public function get confirmBookingWindow(): ConfirmBookingWindow{
			return viewComponent as ConfirmBookingWindow;
		}
	}
}
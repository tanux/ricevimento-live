package view.dashboarduser
{
	import model.vo.Booking;
	import model.vo.Student;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import view.component.UserBookingList;
	
	public class UserBookingListMediator extends Mediator implements IMediator{
		
		public static const NAME:String = "UserBookingListMediator";
		public var student:Student;
		
		public function UserBookingListMediator(viewComponent:Object=null){
			super(NAME, viewComponent);
		}
		
		override public function handleNotification(notification:INotification):void{
			switch (notification.getName()){
				case ApplicationFacade.GET_USER_BOOKINGLIST_SUCCES:
					var bookings:ArrayCollection = notification.getBody() as ArrayCollection;
					bookingList.bookinglist = bookings;
					break;
				case ApplicationFacade.GET_USER_BOOKINGLIST_ERROR:
					Alert.show("Errore in inizializzazione lista prenotazioni");
					break;
			}
		}
		override public function listNotificationInterests():Array{
			return [
				ApplicationFacade.GET_USER_BOOKINGLIST_SUCCES,
				ApplicationFacade.GET_USER_BOOKINGLIST_ERROR
			];	
		}
		
		public function get bookingList():UserBookingList{
			return viewComponent as UserBookingList;
		}
	}
}
package controller.dashboard_user
{
	import model.BookingProxy;
	import model.vo.Booking;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class AddBookingCommand extends SimpleCommand implements ICommand{
		override public function execute(notification:INotification):void{
			var booking:Booking = notification.getBody() as Booking;
			if ( facade.hasProxy(BookingProxy.NAME) ){
				var bookingProxy:BookingProxy = facade.retrieveProxy(BookingProxy.NAME) as BookingProxy;
				bookingProxy.addBooking(booking);	
			}
			else {
				var bookingProxy:BookingProxy = new BookingProxy(BookingProxy.NAME);
				bookingProxy.addBooking(booking);
				facade.registerProxy(bookingProxy);
			}
		}
	}
}
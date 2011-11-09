package controller.dashboard_user
{
	import model.ConfirmBookingProxy;
	import model.vo.Booking;
	
	import mx.controls.Alert;
	
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class ConfirmBookingCommand extends SimpleCommand implements ICommand{
		override public function execute(notification:INotification):void{
			var booking:Booking = notification.getBody() as Booking;			
			if ( facade.hasProxy(ConfirmBookingProxy.NAME) ){
				var confirmBookingProxy:ConfirmBookingProxy = facade.retrieveProxy(ConfirmBookingProxy.NAME) as ConfirmBookingProxy;
				confirmBookingProxy.doBooking(booking);
			}
			else{
				var confirmBookingProxy:ConfirmBookingProxy = new ConfirmBookingProxy(ConfirmBookingProxy.NAME);
				confirmBookingProxy.doBooking(booking);
				facade.registerProxy(confirmBookingProxy);
			}
		}
	}
}
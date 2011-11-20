package model
{
	import flash.events.Event;
	
	import model.services.DashboardUserService;
	import model.vo.Booking;
	
	import mx.controls.Alert;
	import mx.messaging.messages.RemotingMessage;
	import mx.rpc.AsyncToken;
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	import org.puremvc.as3.interfaces.IProxy;
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	public class ConfirmBookingProxy extends Proxy implements IProxy{
		
		private var service:DashboardUserService;
		private var responder:Responder;		
		public static const NAME:String = "ConfirmBookingProxy";
		public var booking:Booking;
		public function ConfirmBookingProxy(proxyName:String){
			super(proxyName);
			service = new DashboardUserService();
			responder = new Responder(onResult, onFault);
		}
		public function doBooking(booking:Booking):void{	
			this.booking = booking;
			var at:AsyncToken = service.doBooking(this.booking.student.id.toString(), 
												  this.booking.supervisor.id.toString(), 
												  this.booking.room.id.toString(), 
												  this.booking.reasonBooking, 
												  this.booking.date);			
			at.addResponder(responder);
		}
		public function onResult(evt:ResultEvent):void{
			switch( (evt.token.message as RemotingMessage).operation){
				case "doBooking":
					if (evt.result == null){
						sendNotification(ApplicationFacade.CONFIRM_BOOKING_SUCCESS, this.booking);
					}
					else{
						sendNotification(ApplicationFacade.CONFIRM_BOOKING_ERROR, evt.result);
					}					
					break;
			}
		}
		public function onFault(evt:FaultEvent):void{
			Alert.show("FAULT Imprevisto :(");
		}
	}
}
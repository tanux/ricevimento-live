package model
{
	import model.services.DashboardUserService;
	
	import mx.messaging.messages.RemotingMessage;
	import mx.rpc.AsyncToken;
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	import org.puremvc.as3.interfaces.IProxy;
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	public class UserBookingListProxy extends Proxy implements IProxy{
		
		private var service:DashboardUserService;
		private var responder:Responder;
		public static const NAME:String = "UserBookingListProxy";
		public function UserBookingListProxy(proxyName:String){
			super(proxyName);
			service = new DashboardUserService();
			responder = new Responder(onResult, onFault);
		}
		public function getBookingList(id_student:String):void{			
			var at:AsyncToken = service.getBookingList(id_student);
			at.addResponder(responder);
		}
		public function onResult(evt:ResultEvent):void{
			switch( (evt.token.message as RemotingMessage).operation){
				case "getBookingList":
					if (evt.result != null){						
						setData(evt.result);
						sendNotification(ApplicationFacade.GET_USER_BOOKINGLIST_SUCCES, evt.result);
					}
					else{
						sendNotification(ApplicationFacade.GET_USER_BOOKINGLIST_ERROR,evt.result);
					}
					break;
			}
		}
		public function onFault(evt:FaultEvent):void{
			
		}

	}
}
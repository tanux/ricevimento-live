package model
{
	import model.services.DashboardUserService;
	
	import mx.controls.Alert;
	import mx.messaging.messages.RemotingMessage;
	import mx.rpc.AsyncToken;
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	import org.puremvc.as3.interfaces.IProxy;
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	public class RoomListProxy extends Proxy implements IProxy{
		
		private var service:DashboardUserService;
		private var responder:Responder;
		public static const NAME:String = "RoomListProxy";
		public function RoomListProxy(proxyName:String){
			super(proxyName);
			service = new DashboardUserService();
			responder = new Responder(onResult, onFault);
		}
		public function getRoomList():void{			
			var at:AsyncToken = service.getRoomList();
			at.addResponder(responder);
		}
		public function onResult(evt:ResultEvent){
			switch( (evt.token.message as RemotingMessage).operation){
				case "getRoomList":
					if (evt.result != null){						
						setData(evt.result);
						sendNotification(ApplicationFacade.GET_ROOMLIST_SUCCES, evt.result);
					}
					else{
						sendNotification(ApplicationFacade.GET_ROOMLIST_ERROR,evt.result);
					}
					break;
			}
		}
		public function onFault(evt:FaultEvent){
			
		}
	}
}
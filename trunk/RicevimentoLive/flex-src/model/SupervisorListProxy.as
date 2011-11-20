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
	
	public class SupervisorListProxy extends Proxy implements IProxy{
		
		private var service:DashboardUserService;
		private var responder:Responder;
		public static const NAME:String = "SupervisorListProxy";
		
		public function SupervisorListProxy(proxyName:String){
			super(proxyName);
			service = new DashboardUserService();
			responder = new Responder(onResult, onFault);
		}
		public function getSupervisorList(id_room:String):void{			
			var at:AsyncToken = service.getSupervisorListByRoom(id_room);
			at.addResponder(responder);
		}
		public function onResult(evt:ResultEvent){
			switch( (evt.token.message as RemotingMessage).operation){
				case "getSupervisorListByRoom":
					if (evt.result != null){
						//setData(evt.result);
						sendNotification(ApplicationFacade.GET_SUPERVISORLIST_BY_ROOM_SUCCESS, evt.result);
					}
					else{
						sendNotification(ApplicationFacade.GET_SUPERVISORLIST_BY_ROOM_ERROR,evt.result);
					}
					break;
			}
		}
		public function onFault(evt:FaultEvent){
			
		}
	}
}
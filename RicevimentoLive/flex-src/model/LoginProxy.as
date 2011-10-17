package model
{
	import model.services.LoginService;
	
	import mx.messaging.messages.RemotingMessage;
	import mx.rpc.AsyncToken;
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	import org.puremvc.as3.interfaces.IProxy;
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	public class LoginProxy extends Proxy implements IProxy
	{
		private var service:LoginService;
		private var responder:Responder;		
		public static const NAME:String = "LoginProxy";	
		
		public function LoginProxy(){
			super(NAME);
			service = new LoginService();
			responder =  new Responder(onResult, onFault);
		}
		
		public function doLogin(username:String, password:String):void{
			var at:AsyncToken = service.UserLogin(username, password);
			at.addResponder(responder);
		}
		
		private function onResult(evt:ResultEvent):void{
			switch ((evt.token.message as RemotingMessage).operation) {
				case "UserLogin":
					if (evt.result != null){
						sendNotification(ApplicationFacade.LOGIN_SUCCESS,evt.result);	
					}						
					break;					
			}	
		}
		
		private function onFault(evt:FaultEvent):void{
			
		}		
		
	}
}
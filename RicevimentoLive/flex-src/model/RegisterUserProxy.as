package model
{
	import mx.rpc.Responder;
	
	import model.services.RegisterUserService;
	
	import mx.messaging.messages.RemotingMessage;
	import mx.rpc.AsyncToken;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	import org.puremvc.as3.interfaces.IProxy;
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	public class RegisterUserProxy extends Proxy implements IProxy{
		
		private var service:RegisterUserService;
		private var responder:Responder;		
		public static const NAME:String = "RegisterUserProxy";
		
		public function RegisterUserProxy(proxyName:String){
			super(proxyName);		
			service = new RegisterUserService();
			responder = new Responder(onResult, onFault);
		}
		public function registerUser(name:String, surname:String, degree:String,
									 email:String, username:String, password:String,
									 personalNumeber:String):void{
			var at:AsyncToken = service.StudentRegister(name, surname, degree, email, username, password, personalNumeber);
			at.addResponder(responder);			
		}
		public function onResult(evt:ResultEvent):void{
			switch( (evt.token.message as RemotingMessage).operation){
				case "StudentRegister":
					sendNotification(ApplicationFacade.REGISTER_SUCCES, evt.result);					
					break;
			}
		}
		public function onFault(evt:FaultEvent):void{
			
		}
	}
}
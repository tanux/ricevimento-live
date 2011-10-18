package view.login
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import model.vo.Student;
	
	import mx.controls.Alert;
	import mx.events.FlexEvent;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import view.component.loginForm;
	
	public class LoginMediator extends Mediator implements IMediator{
		
		public static const NAME:String = "LoginMediator";
		public function LoginMediator(viewComponent:Object=null){
			super(NAME, viewComponent);			
			login.btnLogin.addEventListener(MouseEvent.CLICK, doLogin);
		}
		
		public function doLogin(evt:Event):void{	
			var student:Student = new Student();
			student.username = login.tiUsername.text;
			student.password = login.tiPassword.text;
			facade.sendNotification(ApplicationFacade.DO_LOGIN,student);
		}
		
		override public function handleNotification(notification:INotification):void{ 
			
		}
		
		override public function listNotificationInterests():Array{
			return [];	
		}
		
		public function get login():loginForm{
			return viewComponent as loginForm;
		}		
		
	}
}
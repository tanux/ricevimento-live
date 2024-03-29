package view.login
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	import mx.events.FlexEvent;
	
	import model.vo.Student;	
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import view.component.LoginForm;
	
	public class LoginFormMediator extends Mediator implements IMediator{
		
		public static const NAME:String = "LoginMediator";
		
		public function LoginFormMediator(viewComponent:Object=null){
			super(NAME, viewComponent);			
			login.btnLogin.addEventListener(MouseEvent.CLICK, doLogin);			
			login.btnRegistrati.addEventListener(MouseEvent.CLICK, doRegister);
		}	
		
		public function doLogin(evt:Event):void{	
			var student:Student = new Student();
			student.username = login.tiUsername.text;
			student.password = login.tiPassword.text;
			facade.sendNotification(ApplicationFacade.DO_LOGIN,student);
		}
		
		public function doRegister(evt:Event):void{
			facade.sendNotification(ApplicationFacade.DO_REGISTER);
		}		
		
		override public function handleNotification(notification:INotification):void{ 
			
		}	
		
		override public function listNotificationInterests():Array{
			return [];	
		}		
		
		public function get login():LoginForm{			
			return viewComponent as LoginForm;
		}		
	}
}
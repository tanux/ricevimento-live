package view.register
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import model.vo.Student;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import view.component.RegisterUserForm;
	
	public class RegisterUserFormMediator extends Mediator implements IMediator{
		
		public static const NAME:String = "RegisterUserMediator";
		
		public function RegisterUserFormMediator(viewComponent:Object=null){
			super(NAME, viewComponent);	
			registerUser.btnConfirmRegister.addEventListener(MouseEvent.CLICK, confirmRegister);
			registerUser.btnBackLogin.addEventListener(MouseEvent.CLICK, backLogin);
		}
		
		public function confirmRegister(evt:Event):void{
			var user:Student = new Student();
			user.nome = registerUser.tiName.text;
			user.cognome = registerUser.tiSurname.text;
			user.degree = registerUser.tiDegree.text;
			user.personalNumber = registerUser.tiPersonalNumber.text;
			user.email = registerUser.tiEmail.text;
			user.username = registerUser.tiUsername.text;
			user.password = registerUser.tiPassword.text;
			facade.sendNotification(ApplicationFacade.CONFIRM_REGISTER, user);
		}
		public function backLogin(evt:Event):void{
			facade.sendNotification(ApplicationFacade.BACK_TO_LOGIN);
		}
		
		override public function handleNotification(notification:INotification):void{ 
			
		}
		
		override public function listNotificationInterests():Array{
			return [];	
		}
		
		public function get registerUser():RegisterUserForm{
			return viewComponent as RegisterUserForm;
		}
	}
}
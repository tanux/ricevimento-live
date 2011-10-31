package view.register
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import model.vo.Student;
	
	import mx.controls.Alert;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import view.component.registerUserForm;
	
	public class RegisterUserMediator extends Mediator implements IMediator{
		
		public static const NAME:String = "RegisterUserMediator";
		public function RegisterUserMediator(viewComponent){
			super(NAME, viewComponent);	
			registerUser.btnConfermaRegistrazione.addEventListener(MouseEvent.CLICK, confirmRegister);
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
		
		override public function handleNotification(notification:INotification):void{ 
			
		}
		
		override public function listNotificationInterests():Array{
			return [];	
		}
		
		public function get registerUser():registerUserForm{
			return viewComponent as registerUserForm;
		}
	}
}
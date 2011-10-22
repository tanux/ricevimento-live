package controller.register
{
	import model.RegisterUserProxy;
	import model.vo.Student;	
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class ConfirmRegisterCommand extends SimpleCommand implements ICommand{
		override public function execute(notification:INotification):void{
			var user:Student = notification.getBody() as Student;
			if (facade.hasProxy(RegisterUserProxy.NAME)){
				var registerUserProxy:RegisterUserProxy = facade.retrieveProxy(RegisterUserProxy.NAME) as RegisterUserProxy;
				registerUserProxy.registerUser(user.nome, user.cognome,user.degree,
											   user.email, user.username, user.password, 
											   user.personalNumber);
			}
			else{
				var registerUserProxy:RegisterUserProxy = new RegisterUserProxy(RegisterUserProxy.NAME);
				registerUserProxy.registerUser(user.nome, user.cognome,user.degree,
											   user.email, user.username, user.password, 
											   user.personalNumber);
				facade.registerProxy(registerUserProxy);
			}
		}		
	}
}
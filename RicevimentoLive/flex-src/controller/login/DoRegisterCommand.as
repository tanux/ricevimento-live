package controller.login
{
	import controller.register.ConfirmRegisterCommand;
	
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	import view.register.RegisterUserFormMediator;
	
	public class DoRegisterCommand extends SimpleCommand implements ICommand{
		override public function execute(notification:INotification):void{						
			var mainApplication:MainApplication = notification.getBody() as MainApplication;
			facade.registerCommand(ApplicationFacade.CONFIRM_REGISTER, ConfirmRegisterCommand);
		}
	}
}
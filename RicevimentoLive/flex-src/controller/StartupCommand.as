package controller
{
	import controller.login.DoLoginCommand;
	
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	import view.login.LoginMediator;
	import view.main.MainApplicationMediator;
	
	public class StartupCommand extends SimpleCommand implements ICommand{
		
		override public function execute(notification:INotification):void{
			var mainApplication:MainApplication = notification.getBody() as MainApplication; //prendo il component mxml
			facade.registerMediator(new MainApplicationMediator(mainApplication));
			facade.registerMediator(new LoginMediator(mainApplication.login));
			facade.registerCommand(ApplicationFacade.DO_LOGIN, DoLoginCommand);
		}
	}
}
package controller.login
{
	import model.LoginProxy;
	
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class DoLoginCommand extends SimpleCommand implements ICommand{
		override public function execute(notification:INotification):void{
			var loginProxy:LoginProxy = facade.retrieveProxy(LoginProxy.NAME) as LoginProxy;
			
		}
		
	}
}
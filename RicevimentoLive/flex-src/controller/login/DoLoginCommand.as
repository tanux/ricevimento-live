package controller.login
{
	import controller.dashboard_user.GetRoomListCommand;
	
	import model.LoginProxy;
	import model.vo.Student;
	
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class DoLoginCommand extends SimpleCommand implements ICommand{
		override public function execute(notification:INotification):void{
			var user:Student = notification.getBody() as Student;
			if (facade.hasProxy(LoginProxy.NAME)){
				var loginProxy:LoginProxy = facade.retrieveProxy(LoginProxy.NAME) as LoginProxy;
				loginProxy.doLogin(user.username,user.password);
				facade.registerCommand(ApplicationFacade.GET_ROOMLIST, GetRoomListCommand);
			} else {
				var loginProxy:LoginProxy = new LoginProxy(LoginProxy.NAME);
				loginProxy.doLogin(user.username,user.password);
				facade.registerProxy(loginProxy);
				facade.registerCommand(ApplicationFacade.GET_ROOMLIST, GetRoomListCommand);
			}										
		}		
	}
}
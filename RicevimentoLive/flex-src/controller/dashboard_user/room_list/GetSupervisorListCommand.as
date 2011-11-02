package controller.dashboard_user.room_list
{
	import model.SupervisorListProxy;
	
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class GetSupervisorListCommand extends SimpleCommand implements ICommand{
		override public function execute(notification:INotification):void{
			var id_room:String = notification.getBody() as String;
			if (facade.hasProxy(SupervisorListProxy.NAME)){
				var supervisorListProxy:SupervisorListProxy = facade.retrieveProxy(SupervisorListProxy.NAME) as SupervisorListProxy;
				supervisorListProxy.getSupervisorList(id_room);			
			}
			else{
				var supervisorListProxy:SupervisorListProxy = new SupervisorListProxy(SupervisorListProxy.NAME);
				supervisorListProxy.getSupervisorList(id_room);
				facade.registerProxy(supervisorListProxy);				
			}
		}
	}
}
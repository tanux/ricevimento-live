package controller.dashboard_user
{
	import model.AvailabilityListProxy;
	
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class GetAvailabilityListCommand extends SimpleCommand implements ICommand{
		override public function execute(notification:INotification):void{
			var id_supervisor:String = notification.getBody() as String;
			if (facade.hasProxy(AvailabilityListProxy.NAME)){
				var availabilityListProxy:AvailabilityListProxy = facade.retrieveProxy(AvailabilityListProxy.NAME) as AvailabilityListProxy;
				availabilityListProxy.getAvailabilityList(id_supervisor);			
			}
			else{
				var availabilityListProxy:AvailabilityListProxy = new AvailabilityListProxy(AvailabilityListProxy.NAME);
				availabilityListProxy.getAvailabilityList(id_supervisor);
				facade.registerProxy(availabilityListProxy);				
			}
		}
	}
}
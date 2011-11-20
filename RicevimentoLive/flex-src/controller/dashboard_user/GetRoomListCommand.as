package controller.dashboard_user
{	
	import controller.dashboard_user.GetSupervisorListCommand;
	
	import model.RoomListProxy;
	import model.vo.Room;
	
	import mx.collections.ArrayList;
	import mx.controls.Alert;
	
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class GetRoomListCommand extends SimpleCommand implements ICommand{
		override public function execute(notification:INotification):void{
			if (facade.hasProxy(RoomListProxy.NAME)){
				var roomListProxy:RoomListProxy = facade.retrieveProxy(RoomListProxy.NAME) as RoomListProxy;
				roomListProxy.getRoomList();			
			}
			else{
				var roomListProxy:RoomListProxy = new RoomListProxy(RoomListProxy.NAME);
				roomListProxy.getRoomList();
				facade.registerProxy(roomListProxy);
			}
			facade.registerCommand(ApplicationFacade.GET_SUPERVISORLIST_BY_ROOM, GetSupervisorListCommand);
		}	
	}
}
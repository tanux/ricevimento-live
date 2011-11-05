package view.dashboard_user
{
	import controller.dashboard_user.GetRoomListCommand;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import model.vo.Room;
	import model.vo.Supervisor;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.events.FlexEvent;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import view.component.roomList;
	
	public class RoomListMediator extends Mediator implements IMediator{
		
		public static const NAME:String = "RoomListMediator"; 
		public function RoomListMediator(viewComponent:Object=null){
			super(NAME, viewComponent);			
		}
		override public function handleNotification(notification:INotification):void{ 
			switch (notification.getName()){
				case ApplicationFacade.GET_ROOMLIST_SUCCES:
					var rooms:ArrayCollection = notification.getBody() as ArrayCollection;					
					roomsList.roomlist = rooms;	
					facade.sendNotification(ApplicationFacade.ROOMLIST_CREATED);
					break;
				case ApplicationFacade.GET_ROOMLIST_ERROR:
					Alert.show("Errore in inizializzazione lista stanze");
					break;				
				case ApplicationFacade.ROOM_SELECTED:
					var id_room:String = notification.getBody() as String;					
					facade.sendNotification(ApplicationFacade.GET_SUPERVISOR_BY_ROOM, id_room);
					break;	
			}
		}
		
		override public function listNotificationInterests():Array{
			return [
				ApplicationFacade.GET_ROOMLIST_SUCCES,
				ApplicationFacade.GET_ROOMLIST_ERROR,
				ApplicationFacade.ROOMLIST_CREATED,
				ApplicationFacade.ROOM_SELECTED
			];	
		}
		
		public function get roomsList():roomList{
			return viewComponent as roomList;
		}
	}
}
package view.dashboarduser
{
	import flash.events.Event;
	import model.vo.Room;		
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.events.FlexEvent;	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;	
	import view.component.RoomList;
	
	public class RoomListMediator extends Mediator implements IMediator{
		
		public static const NAME:String = "RoomListMediator"; 
		
		public function RoomListMediator(viewComponent:Object){
			super(NAME, viewComponent);					
			roomList.addEventListener(RoomList.ROOM_SELECTED, notifyRoomSelected);
		}		
		
		public function notifyRoomSelected(evt:Event):void{
			sendNotification(ApplicationFacade.ROOM_SELECTED, roomList.roomSelected);
		}
		
		override public function handleNotification(notification:INotification):void{ 
			switch (notification.getName()){
				case ApplicationFacade.GET_ROOMLIST_SUCCES:
					var rooms:ArrayCollection = notification.getBody() as ArrayCollection;					
					roomList.roomList = rooms;	
					facade.sendNotification(ApplicationFacade.ROOMLIST_CREATED);
				break;
				case ApplicationFacade.GET_ROOMLIST_ERROR:
					Alert.show("Errore nel caricamento della lista stanze");
				break;				
				case ApplicationFacade.ROOM_SELECTED:
					var room:Room = notification.getBody() as Room;
					var idRoom:String = room.id.toString() as String;					
					facade.sendNotification(ApplicationFacade.GET_SUPERVISORLIST_BY_ROOM, idRoom);
				break;	
			}
		}		
		override public function listNotificationInterests():Array{
			return [
				ApplicationFacade.GET_ROOMLIST_SUCCES,
				ApplicationFacade.GET_ROOMLIST_ERROR,				
				ApplicationFacade.ROOM_SELECTED
			];	
		}
		
		public function get roomList():RoomList{
			return viewComponent as RoomList;
		}
	}
}
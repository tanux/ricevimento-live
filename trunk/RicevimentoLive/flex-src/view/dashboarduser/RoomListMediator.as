package view.dashboarduser
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
	
	import view.component.RoomList;
	
	
	public class RoomListMediator extends Mediator implements IMediator{
		
		public static const NAME:String = "RoomListMediator"; 
		public function RoomListMediator(viewComponent:Object){
			super(NAME, viewComponent);	
			
			
		}		
		
		public function notifyRoomSelected(evt:Event):void{
			 
			 
		}
		
		override public function handleNotification(notification:INotification):void{ 
			switch (notification.getName()){
				case ApplicationFacade.GET_ROOMLIST_SUCCES:
					var rooms:ArrayCollection = notification.getBody() as ArrayCollection;					
					roomList.roomList = rooms;	
					facade.sendNotification(ApplicationFacade.ROOMLIST_CREATED);
					break;
				case ApplicationFacade.GET_ROOMLIST_ERROR:
					Alert.show("Errore in inizializzazione lista stanze");
					break;				
				case ApplicationFacade.ROOM_SELECTED:
					var room:Room = notification.getBody() as Room;
					facade.sendNotification(ApplicationFacade.PUT_ROOM_SELECTED_IN_BOOKING, room);
					var idRoom:String = room.id.toString() as String;
					facade.sendNotification(ApplicationFacade.GET_SUPERVISOR_BY_ROOM, idRoom);
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
		public function get roomList():RoomList{
			return viewComponent as RoomList;
		}
		
	}
}
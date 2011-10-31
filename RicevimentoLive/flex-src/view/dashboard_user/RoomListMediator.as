package view.dashboard_user
{
	import controller.dashboard_user.room_list.GetRoomListCommand;
	
	import flash.events.Event;
	
	import model.vo.Room;
	
	import mx.collections.ArrayCollection;	
	import mx.controls.Alert;
	import mx.events.FlexEvent;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import view.component.roomList;
	
	public class RoomListMediator extends Mediator implements IMediator{
		
		public static const NAME:String = "RoomListMediator"; 
		public function RoomListMediator(viewComponent){
			super(NAME, viewComponent);			
			facade.sendNotification(ApplicationFacade.GET_ROOMLIST);		
		}
		
		override public function handleNotification(notification:INotification):void{ 
			switch (notification.getName()){
				case ApplicationFacade.GET_ROOMLIST_SUCCES:
					var rooms:ArrayCollection = notification.getBody() as ArrayCollection;					
					roomsList.roomlist = rooms;
					break;
				case ApplicationFacade.GET_ROOMLIST_ERROR:
					Alert.show("Errore in inizializzazione lista stanze");
					break;
			}
		}
		
		override public function listNotificationInterests():Array{
			return [
				ApplicationFacade.GET_ROOMLIST_SUCCES,
				ApplicationFacade.GET_ROOMLIST_ERROR				
			];	
		}
		
		public function get roomsList():roomList{
			return viewComponent as roomList;
		}
	}
}
package view.dashboard_user
{
	import controller.dashboard_user.room_list.GetRoomListCommand;
	
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
		
		public function selectedRoom(evt:Event){
			var supervisor:Supervisor =  new Supervisor();
			supervisor.id = roomsList.room.currentItem.id;
			Alert.show("Ecco l'id selezionato: "+supervisor.id);
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
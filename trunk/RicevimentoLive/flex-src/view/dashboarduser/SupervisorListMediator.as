package view.dashboarduser
{
	import flash.events.Event;
	
	import model.vo.Supervisor;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import view.component.SupervisorListByRoom;
	
	public class SupervisorListMediator extends Mediator implements IMediator{
		
		public static const NAME:String = "SupervisorListMediator";
		
		public function SupervisorListMediator(viewComponent){
			super(NAME, viewComponent);	
			supervisorsList.addEventListener(SupervisorListByRoom.SUPERVISOR_SELECTED, notifySupervisorSelected);
		}		
		
		public function notifySupervisorSelected(evt:Event):void{
			sendNotification(ApplicationFacade.SUPERVISOR_SELECTED, supervisorsList.supervisorSelected);
		}
		
		override public function handleNotification(notification:INotification):void{ 
			switch (notification.getName()){				
				case ApplicationFacade.GET_SUPERVISORLIST_BY_ROOM_SUCCESS:
					var supervisors:ArrayCollection = notification.getBody() as ArrayCollection;
					supervisorsList.supervisorList = supervisors;
				break;
				case ApplicationFacade.GET_SUPERVISORLIST_BY_ROOM_ERROR:
					Alert.show("Errore nel caricamento della lista del relatori");
				break;
				case ApplicationFacade.SUPERVISOR_SELECTED:	
					var supervisor:Supervisor = notification.getBody() as Supervisor;
					var idSupervisor:String = supervisor.id.toString() as String;
					facade.sendNotification(ApplicationFacade.GET_AVAILABILITY_SUPERVISOR, idSupervisor);
				break;	
			}
		}
		
		override public function listNotificationInterests():Array{
			return [
				ApplicationFacade.GET_SUPERVISORLIST_BY_ROOM_SUCCESS,
				ApplicationFacade.GET_SUPERVISORLIST_BY_ROOM_ERROR,
				ApplicationFacade.SUPERVISOR_SELECTED
			];	
		}
		
		public function get supervisorsList():SupervisorListByRoom{
			return viewComponent as SupervisorListByRoom;
		}
	}
}
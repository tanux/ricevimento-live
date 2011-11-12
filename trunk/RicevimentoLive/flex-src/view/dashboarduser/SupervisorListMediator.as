package view.dashboarduser
{
	import model.vo.Supervisor;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import view.component.SupervisorListByRoom;
	import view.main.MainApplicationMediator;
	
	public class SupervisorListMediator extends Mediator implements IMediator{
		
		public static const NAME:String = "SupervisorListMediator";
		public function SupervisorListMediator(viewComponent:Object=null){
			super(NAME, viewComponent);
		}		
		override public function handleNotification(notification:INotification):void{ 
			switch (notification.getName()){				
				case ApplicationFacade.GET_SUPERVISOR_BY_ROOM_SUCCESS:
					var supervisors:ArrayCollection = notification.getBody() as ArrayCollection;
					supervisorsList.supervisorlist = supervisors;
					break;
				case ApplicationFacade.SUPERVISOR_SELECTED:	
					var supervisor:Supervisor = notification.getBody() as Supervisor;
					facade.sendNotification(ApplicationFacade.PUT_SUPERVISOR_SELECTED_IN_BOOKING, supervisor);
					var idSupervisor:String = supervisor.id.toString() as String;
					facade.sendNotification(ApplicationFacade.GET_AVAILABILITY_SUPERVISOR, idSupervisor);
					break;	
			}
		}
		override public function listNotificationInterests():Array{
			return [
				ApplicationFacade.GET_SUPERVISOR_BY_ROOM_SUCCESS,
				ApplicationFacade.SUPERVISOR_SELECTED
			];	
		}
		public function get supervisorsList():SupervisorListByRoom{
			return viewComponent as SupervisorListByRoom;
		}
	}
}
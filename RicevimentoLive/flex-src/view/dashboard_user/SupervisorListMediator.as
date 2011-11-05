package view.dashboard_user
{
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import view.component.supervisorListByRoom;
	
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
					var id_supervisor:String = notification.getBody() as String;					
					facade.sendNotification(ApplicationFacade.GET_AVAILABILITY_SUPERVISOR, id_supervisor);
					break;	
			}
		}
		override public function listNotificationInterests():Array{
			return [
				ApplicationFacade.GET_SUPERVISOR_BY_ROOM_SUCCESS,
				ApplicationFacade.SUPERVISOR_SELECTED
			];	
		}
		public function get supervisorsList():supervisorListByRoom{
			return viewComponent as supervisorListByRoom;
		}
	}
}
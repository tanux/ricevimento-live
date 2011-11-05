package view.dashboard_user
{
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import view.component.availabilitySupervisorList;
	
	public class AvailabilitySupervisorListMediator extends Mediator implements IMediator {
		
		public static const NAME:String = "AvailabilitySupervisorListMediator";
		
		public function AvailabilitySupervisorListMediator(viewComponent:Object=null){
			super(NAME, viewComponent);			
		}
		override public function handleNotification(notification:INotification):void{ 
			switch (notification.getName()){				
				case ApplicationFacade.GET_AVAILABILITY_SUPERVISOR_SUCCESS:					
					var availabilities:ArrayCollection = notification.getBody() as ArrayCollection;
					availabilityList.availabilitylist = availabilities;					
					break;
			}
		}
		override public function listNotificationInterests():Array{
			return [
				ApplicationFacade.GET_AVAILABILITY_SUPERVISOR_SUCCESS
			];	
		}
		public function get availabilityList():availabilitySupervisorList{
			return viewComponent as availabilitySupervisorList;
		}
	}
}
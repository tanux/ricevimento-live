package view.dashboarduser
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import model.vo.Booking;
	import model.vo.Room;
	import model.vo.Student;
	import model.vo.Supervisor;
	import model.vo.Timewindow;
	
	import mx.collections.ArrayCollection;
	import mx.containers.TitleWindow;
	import mx.controls.Alert;
	import mx.events.CloseEvent;
	import mx.managers.PopUpManager;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import view.MainApplicationMediator;
	import view.component.AvailabilitySupervisorList;
	import view.component.ConfirmBookingWindow;
	
	public class AvailabilitySupervisorListMediator extends Mediator implements IMediator {
		
		public static const NAME:String = "AvailabilitySupervisorListMediator";
		private var confirmBookingTitleWindow:TitleWindow;
		
		
		public function AvailabilitySupervisorListMediator(viewComponent:Object=null){
			super(NAME, viewComponent);
			availabilityList.addEventListener(AvailabilitySupervisorList.AVAILABILITY_SELECTED, showConfirmBookingWindow);
		}	
		
		private function showConfirmBookingWindow(evt:Event):void {
			sendNotification(ApplicationFacade.AVAILABILITY_SELECTED);
			confirmBookingTitleWindow = PopUpManager.createPopUp(availabilityList.parent.parent, ConfirmBookingWindow, true) as TitleWindow;				
			facade.registerMediator( new ConfirmBookingWindowMediator (confirmBookingTitleWindow) );
			PopUpManager.centerPopUp(confirmBookingTitleWindow);
			var mainApplication:MainApplication = facade.retrieveMediator(MainApplicationMediator.NAME).getViewComponent() as MainApplication;
			var booking:Booking = new Booking(); 
			booking.student = mainApplication.student as Student;
			booking.room = mainApplication.roomsList.roomSelected as Room;
			booking.supervisor = mainApplication.supervisorsList.supervisorSelected as Supervisor;
			booking.date = mainApplication.availabilityList.availabilitySelected.window;
			if (facade.hasMediator(ConfirmBookingWindowMediator.NAME)){
				var window:ConfirmBookingWindow =  facade.retrieveMediator( ConfirmBookingWindowMediator.NAME ).getViewComponent() as ConfirmBookingWindow;
				window.booking = booking;
			}
		}
		override public function handleNotification(notification:INotification):void{ 
			switch (notification.getName()){				
				case ApplicationFacade.GET_AVAILABILITY_SUPERVISOR_SUCCESS:					
					var availabilities:ArrayCollection = notification.getBody() as ArrayCollection;
					availabilityList.availabilitylist = availabilities;					
				break;
				case ApplicationFacade.GET_AVAILABILITY_SUPERVISOR_ERROR:
					Alert.show("Errore nel caricamento della lista disponibilità");
				break;
			}
		}
		override public function listNotificationInterests():Array{
			return [
				ApplicationFacade.GET_AVAILABILITY_SUPERVISOR_SUCCESS,
				ApplicationFacade.GET_AVAILABILITY_SUPERVISOR_ERROR,				
			];	
		}
		public function get availabilityList():AvailabilitySupervisorList{
			return viewComponent as AvailabilitySupervisorList;
		}
	}
}
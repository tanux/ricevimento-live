package view
{
	import controller.dashboard_user.ConfirmBookingCommand;
	import controller.dashboard_user.GetRoomListCommand;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import model.LoginProxy;
	import model.vo.Booking;
	import model.vo.Room;
	import model.vo.Student;
	import model.vo.Supervisor;
	import model.vo.Timewindow;
	
	import mx.controls.Alert;
	import mx.events.FlexEvent;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import view.component.ConfirmBookingWindow;
	import view.component.RoomList;
	import view.dashboarduser.AvailabilitySupervisorListMediator;
	import view.dashboarduser.ConfirmBookingWindowMediator;
	import view.dashboarduser.RoomListMediator;
	import view.dashboarduser.SupervisorListMediator;
	import view.dashboarduser.UserBookingListMediator;
	import view.register.RegisterUserFormMediator;
	
	public class MainApplicationMediator extends Mediator implements IMediator{
		
		public static const NAME:String = "MainApplicationMediator";		
		
		public function MainApplicationMediator(viewComponent:Object){
			super(NAME, viewComponent);  
			mainApplication.addEventListener(FlexEvent.CREATION_COMPLETE, init);			
		}		
		
		private function init(evt:Event) : void {}
		
		override public function handleNotification(notification:INotification):void{ 
			switch (notification.getName()){
				case ApplicationFacade.LOGIN_SUCCESS:
					mainApplication.currentState = "stateMainApplication";
					var user:Student = notification.getBody() as Student;
					mainApplication.student = user;
					facade.registerMediator(new RoomListMediator(mainApplication.roomsList));
					facade.registerMediator(new SupervisorListMediator(mainApplication.supervisorsList));
					facade.registerMediator(new AvailabilitySupervisorListMediator(mainApplication.availabilityList));
					facade.registerMediator(new UserBookingListMediator(mainApplication.bookingListUser));
				break;
				case ApplicationFacade.LOGIN_ERROR:
					Alert.show("Autenticazione non riuscita");
					break;
				case ApplicationFacade.DO_REGISTER:
					mainApplication.currentState = "stateRegister";
					facade.registerMediator(new RegisterUserFormMediator(mainApplication.registerUserForm));
					break;	
				case ApplicationFacade.REGISTER_SUCCES:
					Alert.show("Registrazione riuscita");
					mainApplication.currentState = "login"
					break;
				case ApplicationFacade.BACK_TO_LOGIN:
					mainApplication.currentState = "login";
					break;
			}
		}
		
		override public function listNotificationInterests():Array{
			return [
				ApplicationFacade.LOGIN_SUCCESS,
				ApplicationFacade.LOGIN_ERROR,
				ApplicationFacade.DO_REGISTER,
				ApplicationFacade.REGISTER_SUCCES,
				ApplicationFacade.BACK_TO_LOGIN,
			];	
		}		
		public function get mainApplication():MainApplication{ 
			return viewComponent as MainApplication;
		}
	}
}
package view.main
{
	import controller.dashboard_user.room_list.GetRoomListCommand;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import model.LoginProxy;
	import model.vo.Student;
	import model.vo.Supervisor;
	
	import mx.controls.Alert;
	import mx.events.FlexEvent;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import view.component.roomList;
	import view.dashboard_user.RoomListMediator;
	import view.dashboard_user.SupervisorListMediator;
	import view.register.RegisterUserMediator;
	
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
					break;
				case ApplicationFacade.LOGIN_ERROR:
					Alert.show("Autenticazione non riuscita");
					break;
				case ApplicationFacade.DO_REGISTER:
					mainApplication.currentState = "stateRegister";
					facade.registerMediator(new RegisterUserMediator(mainApplication.registerUserForm));
					break;	
				case ApplicationFacade.REGISTER_SUCCES:
					Alert.show("Registrazione riuscita");
					mainApplication.currentState = "login"
					break;
				case ApplicationFacade.GET_ROOMLIST:					
					facade.registerMediator(new RoomListMediator(mainApplication.roomslist));					
					break;
				case ApplicationFacade.GET_SUPERVISOR_BY_ROOM:
					facade.registerMediator(new SupervisorListMediator(mainApplication.supervisorsList));
					break;
			}
		}
		
		override public function listNotificationInterests():Array{
			return [
				ApplicationFacade.LOGIN_SUCCESS,
				ApplicationFacade.LOGIN_ERROR,
				ApplicationFacade.DO_REGISTER,
				ApplicationFacade.REGISTER_SUCCES,
				ApplicationFacade.GET_ROOMLIST,	
				ApplicationFacade.GET_SUPERVISOR_BY_ROOM
			];	
		}
		
		public function get mainApplication():MainApplication{ 
			return viewComponent as MainApplication;
		}
	}
}
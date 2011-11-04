package
{
	/**
	 * Sede di tutte le notifiche Singleton
	 * */
	import controller.StartupCommand;
	
	import org.puremvc.as3.interfaces.IFacade;
	import org.puremvc.as3.patterns.facade.Facade;
	
	public class ApplicationFacade extends Facade implements IFacade{
		
		public static const STARTUP:String = "Startup";
		public static const LOGIN:String = "Login";
		public static const DO_LOGIN:String = "DoLogin";
		public static const DO_REGISTER:String = "DoRegister";
		public static const CONFIRM_REGISTER:String = "ConfirmRegister";
		public static const REGISTER_SUCCES:String = "RegisterSuccess";
		public static const REGISTER_ERROR:String = "RegisterError";		
		public static const LOGIN_SUCCESS:String = "LoginSuccess";
		public static const LOGIN_ERROR:String = "LoginError";
		public static const LOGIN_FAULT:String = "LoginFault";
		public static const ROOMLIST_CREATE:String = "RoomListCreate";
		public static const GET_ROOMLIST:String = "GetRoomList";
		public static const GET_ROOMLIST_SUCCES:String = "GetRoomListSucces";
		public static const GET_ROOMLIST_ERROR:String = "GetRoomListError";
		public static const ROOMLIST_CREATED:String = "RoomListCreated";
		public static const ROOM_SELECTED:String = "RoomSelected";		
		public static const GET_SUPERVISOR_BY_ROOM = "GetSupervisorByRoom";
		public static const GET_SUPERVISOR_BY_ROOM_SUCCESS = "GetSupervisorByRoomSuccess";
		public static const GET_SUPERVISOR_BY_ROOM_ERROR = "GetSupervisorByRoomError";
		
		public static function getInstance() : ApplicationFacade {
			if (instance == null)
				instance = new ApplicationFacade();
			return instance as ApplicationFacade;
		}
		
		override protected function initializeController():void {
			super.initializeController();
			registerCommand(ApplicationFacade.STARTUP, StartupCommand);
		}
	}
}
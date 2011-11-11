package
{
	/**
	 * Sede di tutte le notifiche Singleton
	 * */
	import controller.StartupCommand;
	
	import model.vo.Booking;
	
	import org.puremvc.as3.interfaces.IFacade;
	import org.puremvc.as3.patterns.facade.Facade;
	
	public class ApplicationFacade extends Facade implements IFacade{
		public static const STARTUP:String = "Startup";
		public static const LOGIN:String = "Login";
		public static const LOGOUT:String = "Logout";
		public static const DO_LOGIN:String = "DoLogin";
		public static const DO_REGISTER:String = "DoRegister";
		public static const CONFIRM_REGISTER:String = "ConfirmRegister";
		public static const REGISTER_SUCCES:String = "RegisterSuccess";
		public static const REGISTER_ERROR:String = "RegisterError";
		public static const TORNA_LOGIN:String = "TornaLogin";
		public static const LOGIN_SUCCESS:String = "LoginSuccess";
		public static const LOGIN_ERROR:String = "LoginError";
		public static const LOGIN_FAULT:String = "LoginFault";
		public static const ROOMLIST_CREATE:String = "RoomListCreate";
		public static const GET_ROOMLIST:String = "GetRoomList";
		public static const GET_ROOMLIST_SUCCES:String = "GetRoomListSucces";
		public static const GET_ROOMLIST_ERROR:String = "GetRoomListError";
		public static const ROOMLIST_CREATED:String = "RoomListCreated";
		public static const ROOM_SELECTED:String = "RoomSelected";		
		public static const GET_SUPERVISOR_BY_ROOM:String = "GetSupervisorByRoom";
		public static const GET_SUPERVISOR_BY_ROOM_SUCCESS:String = "GetSupervisorByRoomSuccess";
		public static const GET_SUPERVISOR_BY_ROOM_ERROR:String = "GetSupervisorByRoomError";
		public static const SUPERVISOR_SELECTED:String = "SupervisorSelected";
		public static const AVAILABILITY_SELECTED:String = "AvailabilitySelected";
		public static const GET_AVAILABILITY_SUPERVISOR:String = "GetAvailabilitySupervisor";
		public static const GET_AVAILABILITY_SUPERVISOR_SUCCESS:String = "GetAvailabilitySupervisorSuccess";
		public static const GET_AVAILABILITY_SUPERVISOR_ERROR:String = "GetAvailabilitySupervisorError";		
		public static const PUT_ROOM_SELECTED_IN_BOOKING:String = "PutRoomDataInBooking";
		public static const PUT_SUPERVISOR_SELECTED_IN_BOOKING:String = "PutSupervisorDataInBooking";
		public static const PUT_AVAILABILITY_SELECTED_IN_BOOKING:String = "PutAvailabilityDataInBooking";
		public static const SEND_DATA_BOOKING:String = "SendDataBooking";
		public static const SHOWED_CONFIRM_BOOKING_WINDOW:String = "ShowedConfirmBookingWindow";
		public static const CONFIRM_BOOKING:String = "ConfirmBooking";
		public static const CONFIRM_BOOKING_SUCCESS:String = "ConfirmBookingSuccess";
		public static const CONFIRM_BOOKING_ERROR:String = "ConfirmBookingError";
		public static const GET_USER_BOOKINGLIST:String = "GetUserBookingList";
		public static const GET_USER_BOOKINGLIST_SUCCES:String = "GetUserBookingListSuccess";
		public static const GET_USER_BOOKINGLIST_ERROR:String = "GetUserBookingListError";
		
		
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
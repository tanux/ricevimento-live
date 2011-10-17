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
		public static const LOGIN_SUCCESS:String = "LoginSuccess";
		public static const LOGIN_FAULT:String = "LoginFault";
		
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
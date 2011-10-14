package
{
	import controller.StartupCommand;
	
	import org.puremvc.as3.interfaces.IFacade;
	import org.puremvc.as3.patterns.facade.Facade;
	
	public class ApplicationFacade extends Facade implements IFacade{
		
		public static const STARTUP:String = "Startup";
		public static const LOGIN:String = "Login";
		public static const DO_LOGIN:String = "DoLogin";
		
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
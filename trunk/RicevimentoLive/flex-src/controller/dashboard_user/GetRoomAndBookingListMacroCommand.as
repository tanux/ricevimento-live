package controller.dashboard_user
{
	import mx.states.OverrideBase;
	
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.MacroCommand;
	
	public class GetRoomAndBookingListMacroCommand extends MacroCommand implements ICommand{
		override protected function initializeMacroCommand():void{
			addSubCommand(GetRoomListCommand);
			addSubCommand(GetUserBookingListCommand);
		}
	}
}
package controller.dashboard_user
{
	import model.UserBookingListProxy;
	import model.vo.Student;
	
	import mx.controls.Alert;
	
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	import view.component.UserBookingList;
	import view.dashboarduser.UserBookingListMediator;
	
	public class GetUserBookingListCommand extends SimpleCommand implements ICommand{
		override public function execute(notification:INotification):void{
			var student:Student = notification.getBody() as Student;
			var id_student:String = student.id.toString();
			if (facade.hasProxy(UserBookingListProxy.NAME)){	
				var userBookingListProxy:UserBookingListProxy = facade.retrieveProxy(UserBookingListProxy.NAME) as UserBookingListProxy;
				userBookingListProxy.getBookingList(id_student);
			}
			else{
				var userBookingListProxy:UserBookingListProxy = new UserBookingListProxy(UserBookingListProxy.NAME) as UserBookingListProxy;
				userBookingListProxy.getBookingList(id_student);
				facade.registerProxy(userBookingListProxy);				
			}
		}	
	}
}
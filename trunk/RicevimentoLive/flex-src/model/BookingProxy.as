package model
{
	import model.vo.Booking;
	
	import mx.collections.ArrayCollection;
	
	import org.puremvc.as3.interfaces.IProxy;
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	import view.component.UserBookingList;
	import view.dashboarduser.UserBookingListMediator;
	
	public class BookingProxy extends Proxy implements IProxy{
		public static const NAME = "BookingProxy";
		
		public function BookingProxy(proxyName){
			super(proxyName, new ArrayCollection());
		}
		public function addBooking(item:Booking):void{
			bookings.addItem(item);
		}
		public function removeBooking():void{
			
		}
		public function get bookings() :ArrayCollection {
			var userBookingList:UserBookingList = facade.retrieveMediator(UserBookingListMediator.NAME).getViewComponent() as UserBookingList;
			return userBookingList.bookinglist as ArrayCollection;
		}
	}
}
/**
 * This is a generated class and is not intended for modification.  To customize behavior
 * of this value object you may modify the generated sub-class of this class - Booking.as.
 */

package model.vo
{
import com.adobe.fiber.services.IFiberManagingService;
import com.adobe.fiber.valueobjects.IValueObject;
import flash.events.EventDispatcher;
import model.vo.Room;
import model.vo.Student;
import model.vo.Supervisor;
import mx.collections.ArrayCollection;
import mx.events.PropertyChangeEvent;

import flash.net.registerClassAlias;
import flash.net.getClassByAlias;
import com.adobe.fiber.core.model_internal;
import com.adobe.fiber.valueobjects.IPropertyIterator;
import com.adobe.fiber.valueobjects.AvailablePropertyIterator;

use namespace model_internal;

[ExcludeClass]
public class _Super_Booking extends flash.events.EventDispatcher implements com.adobe.fiber.valueobjects.IValueObject
{
    model_internal static function initRemoteClassAliasSingle(cz:Class) : void
    {
        try
        {
            if (flash.net.getClassByAlias("model.beans.Booking") == null)
            {
                flash.net.registerClassAlias("model.beans.Booking", cz);
            }
        }
        catch (e:Error)
        {
            flash.net.registerClassAlias("model.beans.Booking", cz);
        }
    }

    model_internal static function initRemoteClassAliasAllRelated() : void
    {
        model.vo.Student.initRemoteClassAliasSingleChild();
        model.vo.Supervisor.initRemoteClassAliasSingleChild();
        model.vo.Room.initRemoteClassAliasSingleChild();
        model.vo.Roomsupervisor.initRemoteClassAliasSingleChild();
        model.vo.Timewindow.initRemoteClassAliasSingleChild();
    }

    model_internal var _dminternal_model : _BookingEntityMetadata;
    model_internal var _changedObjects:mx.collections.ArrayCollection = new ArrayCollection();

    public function getChangedObjects() : Array
    {
        _changedObjects.addItemAt(this,0);
        return _changedObjects.source;
    }

    public function clearChangedObjects() : void
    {
        _changedObjects.removeAll();
    }

    /**
     * properties
     */
    private var _internal_id : int;
    private var _internal_time : String;
    private var _internal_student : model.vo.Student;
    private var _internal_supervisor : model.vo.Supervisor;
    private var _internal_status : String;
    private var _internal_reasonAnnulment : String;
    private var _internal_reasonBooking : String;
    private var _internal_date : String;
    private var _internal_room : model.vo.Room;

    private static var emptyArray:Array = new Array();


    /**
     * derived property cache initialization
     */
    model_internal var _cacheInitialized_isValid:Boolean = false;

    model_internal var _changeWatcherArray:Array = new Array();

    public function _Super_Booking()
    {
        _model = new _BookingEntityMetadata(this);

        // Bind to own data or source properties for cache invalidation triggering

    }

    /**
     * data/source property getters
     */

    [Bindable(event="propertyChange")]
    public function get id() : int
    {
        return _internal_id;
    }

    [Bindable(event="propertyChange")]
    public function get time() : String
    {
        return _internal_time;
    }

    [Bindable(event="propertyChange")]
    public function get student() : model.vo.Student
    {
        return _internal_student;
    }

    [Bindable(event="propertyChange")]
    public function get supervisor() : model.vo.Supervisor
    {
        return _internal_supervisor;
    }

    [Bindable(event="propertyChange")]
    public function get status() : String
    {
        return _internal_status;
    }

    [Bindable(event="propertyChange")]
    public function get reasonAnnulment() : String
    {
        return _internal_reasonAnnulment;
    }

    [Bindable(event="propertyChange")]
    public function get reasonBooking() : String
    {
        return _internal_reasonBooking;
    }

    [Bindable(event="propertyChange")]
    public function get date() : String
    {
        return _internal_date;
    }

    [Bindable(event="propertyChange")]
    public function get room() : model.vo.Room
    {
        return _internal_room;
    }

    public function clearAssociations() : void
    {
    }

    /**
     * data/source property setters
     */

    public function set id(value:int) : void
    {
        var oldValue:int = _internal_id;
        if (oldValue !== value)
        {
            _internal_id = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "id", oldValue, _internal_id));
        }
    }

    public function set time(value:String) : void
    {
        var oldValue:String = _internal_time;
        if (oldValue !== value)
        {
            _internal_time = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "time", oldValue, _internal_time));
        }
    }

    public function set student(value:model.vo.Student) : void
    {
        var oldValue:model.vo.Student = _internal_student;
        if (oldValue !== value)
        {
            _internal_student = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "student", oldValue, _internal_student));
        }
    }

    public function set supervisor(value:model.vo.Supervisor) : void
    {
        var oldValue:model.vo.Supervisor = _internal_supervisor;
        if (oldValue !== value)
        {
            _internal_supervisor = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "supervisor", oldValue, _internal_supervisor));
        }
    }

    public function set status(value:String) : void
    {
        var oldValue:String = _internal_status;
        if (oldValue !== value)
        {
            _internal_status = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "status", oldValue, _internal_status));
        }
    }

    public function set reasonAnnulment(value:String) : void
    {
        var oldValue:String = _internal_reasonAnnulment;
        if (oldValue !== value)
        {
            _internal_reasonAnnulment = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "reasonAnnulment", oldValue, _internal_reasonAnnulment));
        }
    }

    public function set reasonBooking(value:String) : void
    {
        var oldValue:String = _internal_reasonBooking;
        if (oldValue !== value)
        {
            _internal_reasonBooking = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "reasonBooking", oldValue, _internal_reasonBooking));
        }
    }

    public function set date(value:String) : void
    {
        var oldValue:String = _internal_date;
        if (oldValue !== value)
        {
            _internal_date = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "date", oldValue, _internal_date));
        }
    }

    public function set room(value:model.vo.Room) : void
    {
        var oldValue:model.vo.Room = _internal_room;
        if (oldValue !== value)
        {
            _internal_room = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "room", oldValue, _internal_room));
        }
    }

    /**
     * Data/source property setter listeners
     *
     * Each data property whose value affects other properties or the validity of the entity
     * needs to invalidate all previously calculated artifacts. These include:
     *  - any derived properties or constraints that reference the given data property.
     *  - any availability guards (variant expressions) that reference the given data property.
     *  - any style validations, message tokens or guards that reference the given data property.
     *  - the validity of the property (and the containing entity) if the given data property has a length restriction.
     *  - the validity of the property (and the containing entity) if the given data property is required.
     */


    /**
     * valid related derived properties
     */
    model_internal var _isValid : Boolean;
    model_internal var _invalidConstraints:Array = new Array();
    model_internal var _validationFailureMessages:Array = new Array();

    /**
     * derived property calculators
     */

    /**
     * isValid calculator
     */
    model_internal function calculateIsValid():Boolean
    {
        var violatedConsts:Array = new Array();
        var validationFailureMessages:Array = new Array();

        var propertyValidity:Boolean = true;

        model_internal::_cacheInitialized_isValid = true;
        model_internal::invalidConstraints_der = violatedConsts;
        model_internal::validationFailureMessages_der = validationFailureMessages;
        return violatedConsts.length == 0 && propertyValidity;
    }

    /**
     * derived property setters
     */

    model_internal function set isValid_der(value:Boolean) : void
    {
        var oldValue:Boolean = model_internal::_isValid;
        if (oldValue !== value)
        {
            model_internal::_isValid = value;
            _model.model_internal::fireChangeEvent("isValid", oldValue, model_internal::_isValid);
        }
    }

    /**
     * derived property getters
     */

    [Transient]
    [Bindable(event="propertyChange")]
    public function get _model() : _BookingEntityMetadata
    {
        return model_internal::_dminternal_model;
    }

    public function set _model(value : _BookingEntityMetadata) : void
    {
        var oldValue : _BookingEntityMetadata = model_internal::_dminternal_model;
        if (oldValue !== value)
        {
            model_internal::_dminternal_model = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "_model", oldValue, model_internal::_dminternal_model));
        }
    }

    /**
     * methods
     */


    /**
     *  services
     */
    private var _managingService:com.adobe.fiber.services.IFiberManagingService;

    public function set managingService(managingService:com.adobe.fiber.services.IFiberManagingService):void
    {
        _managingService = managingService;
    }

    model_internal function set invalidConstraints_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_invalidConstraints;
        // avoid firing the event when old and new value are different empty arrays
        if (oldValue !== value && (oldValue.length > 0 || value.length > 0))
        {
            model_internal::_invalidConstraints = value;
            _model.model_internal::fireChangeEvent("invalidConstraints", oldValue, model_internal::_invalidConstraints);
        }
    }

    model_internal function set validationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_validationFailureMessages;
        // avoid firing the event when old and new value are different empty arrays
        if (oldValue !== value && (oldValue.length > 0 || value.length > 0))
        {
            model_internal::_validationFailureMessages = value;
            _model.model_internal::fireChangeEvent("validationFailureMessages", oldValue, model_internal::_validationFailureMessages);
        }
    }


}

}

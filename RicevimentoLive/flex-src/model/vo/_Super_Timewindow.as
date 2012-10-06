/**
 * This is a generated class and is not intended for modification.  To customize behavior
 * of this value object you may modify the generated sub-class of this class - Timewindow.as.
 */

package model.vo
{
import com.adobe.fiber.services.IFiberManagingService;
import com.adobe.fiber.valueobjects.IValueObject;
import flash.events.EventDispatcher;
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
public class _Super_Timewindow extends flash.events.EventDispatcher implements com.adobe.fiber.valueobjects.IValueObject
{
    model_internal static function initRemoteClassAliasSingle(cz:Class) : void
    {
        try
        {
            if (flash.net.getClassByAlias("model.beans.Timewindow") == null)
            {
                flash.net.registerClassAlias("model.beans.Timewindow", cz);
            }
        }
        catch (e:Error)
        {
            flash.net.registerClassAlias("model.beans.Timewindow", cz);
        }
    }

    model_internal static function initRemoteClassAliasAllRelated() : void
    {
        model.vo.Supervisor.initRemoteClassAliasSingleChild();
    }

    model_internal var _dminternal_model : _TimewindowEntityMetadata;
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
    private var _internal_enabled : int;
    private var _internal_id : int;
    private var _internal_roomsupervisors : ArrayCollection;
    private var _internal_window : String;
    private var _internal_supervisor : model.vo.Supervisor;
    private var _internal_window2 : String;
    private var _internal_name : String;

    private static var emptyArray:Array = new Array();


    /**
     * derived property cache initialization
     */
    model_internal var _cacheInitialized_isValid:Boolean = false;

    model_internal var _changeWatcherArray:Array = new Array();

    public function _Super_Timewindow()
    {
        _model = new _TimewindowEntityMetadata(this);

        // Bind to own data or source properties for cache invalidation triggering

    }

    /**
     * data/source property getters
     */

    [Bindable(event="propertyChange")]
    public function get enabled() : int
    {
        return _internal_enabled;
    }

    [Bindable(event="propertyChange")]
    public function get id() : int
    {
        return _internal_id;
    }

    [Bindable(event="propertyChange")]
    public function get roomsupervisors() : ArrayCollection
    {
        return _internal_roomsupervisors;
    }

    [Bindable(event="propertyChange")]
    public function get window() : String
    {
        return _internal_window;
    }

    [Bindable(event="propertyChange")]
    public function get supervisor() : model.vo.Supervisor
    {
        return _internal_supervisor;
    }

    [Bindable(event="propertyChange")]
    public function get window2() : String
    {
        return _internal_window2;
    }

    [Bindable(event="propertyChange")]
    public function get name() : String
    {
        return _internal_name;
    }

    public function clearAssociations() : void
    {
    }

    /**
     * data/source property setters
     */

    public function set enabled(value:int) : void
    {
        var oldValue:int = _internal_enabled;
        if (oldValue !== value)
        {
            _internal_enabled = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "enabled", oldValue, _internal_enabled));
        }
    }

    public function set id(value:int) : void
    {
        var oldValue:int = _internal_id;
        if (oldValue !== value)
        {
            _internal_id = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "id", oldValue, _internal_id));
        }
    }

    public function set roomsupervisors(value:*) : void
    {
        var oldValue:ArrayCollection = _internal_roomsupervisors;
        if (oldValue !== value)
        {
            if (value is ArrayCollection)
            {
                _internal_roomsupervisors = value;
            }
            else if (value is Array)
            {
                _internal_roomsupervisors = new ArrayCollection(value);
            }
            else if (value == null)
            {
                _internal_roomsupervisors = null;
            }
            else
            {
                throw new Error("value of roomsupervisors must be a collection");
            }
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "roomsupervisors", oldValue, _internal_roomsupervisors));
        }
    }

    public function set window(value:String) : void
    {
        var oldValue:String = _internal_window;
        if (oldValue !== value)
        {
            _internal_window = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "window", oldValue, _internal_window));
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

    public function set window2(value:String) : void
    {
        var oldValue:String = _internal_window2;
        if (oldValue !== value)
        {
            _internal_window2 = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "window2", oldValue, _internal_window2));
        }
    }

    public function set name(value:String) : void
    {
        var oldValue:String = _internal_name;
        if (oldValue !== value)
        {
            _internal_name = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "name", oldValue, _internal_name));
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
    public function get _model() : _TimewindowEntityMetadata
    {
        return model_internal::_dminternal_model;
    }

    public function set _model(value : _TimewindowEntityMetadata) : void
    {
        var oldValue : _TimewindowEntityMetadata = model_internal::_dminternal_model;
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

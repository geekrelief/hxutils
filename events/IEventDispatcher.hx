package hxutils.events;

import hxutils.events.Handler;

interface IEventDispatcher {
    function addEventListener(type:String, h:Handler):Void;
    function removeEventListener(type:String, h:Handler):Void;
    function dispatchEvent(e:Event):Void;
}

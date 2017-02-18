/**
 *  Starling Builder
 *  Copyright 2015 SGN Inc. All Rights Reserved.
 *
 *  This program is free software. You can redistribute and/or modify it in
 *  accordance with the terms of the accompanying license agreement.
 */
package starlingbuilder.demo2
{
    import starling.display.Button;
    import starling.display.Sprite;
    import starling.events.Event;
    import starling.events.Touch;
    import starling.events.TouchEvent;
    import starling.events.TouchPhase;

    import starlingbuilder.engine.UIBuilder;

    public class ExternalElementTest extends Sprite
    {
        //auto bind root layout variables
        public var _root:Sprite;
        public var _popup1:Sprite;
        public var _popup2:Sprite;
        public var _popup3:Sprite;

        //auto bind sub layout variable
        public var _connectButton:Button;

        public function ExternalElementTest()
        {
            var result:Object = UIBuilderDemo.uiBuilder.load(ParsedLayouts.external_element_test, false, this);

            addChild(_root);

            var param:Object = result.params[_popup3];

            //bind sub layout variable to this class using param.externalParams
            UIBuilder.bind(this, param.externalParams);

            _connectButton.addEventListener(Event.TRIGGERED, onConnectButton);

            addEventListener(TouchEvent.TOUCH, onTouch);


        }

        private function onTouch(event:TouchEvent):void
        {
            var touch:Touch = event.getTouch(this);
            if (touch && touch.phase == TouchPhase.ENDED)
            {
                removeFromParent(true);
            }
        }

        private function onConnectButton(event:Event):void
        {
            trace("connect button clicked");
        }
    }
}

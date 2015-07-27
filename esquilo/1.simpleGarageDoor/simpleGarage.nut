/*
 * This class represent a relay
 *   the instance takes 2 GPIO instances
 *   one to drive the relay the other for a
 *   status LED that will come on when the
 *   relay activates
 */
class Relay{
    relay = null;
    led = null;
	/*
	 * pretty self explanatory
	 *   first GPIO for the relay
	 *   second one for the LED (use 46 for the onboard status LED)
	 */
    constructor(_relay, _led){
        relay = _relay;
        relay.output();
        
        led = _led;
        led.output();
        
        this.off();
    }
    
    function on(){
        print("on\n");
        relay.high();
        led.high();
    }
    function off() {
        print("off\n");
        relay.low();
        led.low();
    }
    function ison() {
        return relay.ishigh();
    }
    function isoff(){
        return relay.islow();
    }
    function toggle(){
        print("toggling\n");
        if ( this.ison() ){
            this.off();
        } else {
            this.on();
        }
    }
}

/*
 * this function will be used by the ERPC call
 * in the HTML page to switch the relay on for
 * a second
 */
function garageSwitch(){
    relay.on();
    delay(1000);
    relay.off();
}

relay <- Relay(GPIO(1), GPIO(46));

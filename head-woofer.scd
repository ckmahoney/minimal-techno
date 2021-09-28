// must use headphones to experience the stereo effect

(

var df = 15;
var play = {
	arg freq=100;

    {Out.ar(0,Pan2.ar(SinOsc.ar(freq),0))}.play;
};

    var plays = {arg freqs=[100,200,300];
	freqs.collect(play);
};

plays.value([60,90]); // hard pan each freq

plays.value([75, 75+(df/2), 75-(df/2), 75+(df/4), 75-(df/4)]);
)

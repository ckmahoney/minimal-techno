
(

var play = {
	arg freq=100;

{Out.ar(0,Pan2.ar(SinOsc.ar(freq),0))}.play;

};

play.value(100.01);


play.value(800);
play.value(900);
)
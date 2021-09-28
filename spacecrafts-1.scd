(

var plays = {arg freqs=[];
	freqs.do{|freq|
    {Out.ar(0,Pan2.ar(SinOsc.ar(freq),0))}.play;
	};
};

var freqSpiral = {|root = 60, nSteps = 5|
	var df = root/2,
	    fifth = root + df,
	    freqs = Array.new(2 + (nSteps * 3));

	freqs.add(root);
	freqs.add(fifth);

	nSteps.do({|i|
		var d = df / 2.pow(i),
		    dd = df / 2.pow(i+1),
		    below = (root + dd - d),
		    note = (root + dd),
		    above = (root + dd + d);

		freqs.add(below);
		freqs.add(note);
		freqs.add(above);
	});

	freqs.postln;

	freqs;
};

var techno5 = {|root=40|
	plays.value(freqSpiral.value(root,2));
	plays.value(freqSpiral.value(root*2,4));
	plays.value(freqSpiral.value(root*4,2));
	plays.value(freqSpiral.value(root*8,1));
	plays.value(freqSpiral.value(root*16,0)); // extra
};

var techno4 = {
	plays.value(freqSpiral.value(50,20));
	plays.value(freqSpiral.value(100,10));
	plays.value(freqSpiral.value(200,5));
	plays.value(freqSpiral.value(400,3));
	plays.value(freqSpiral.value(500,2));
	plays.value(freqSpiral.value(600,1));
};

var techno3 = {
	plays.value(freqSpiral.value(170,1));
	plays.value(freqSpiral.value(65,2));
	// plays.value(freqSpiral.value(32.5*6,1));
};


var techno2 = {
	plays.value(freqSpiral.value(60,3));
};


var techno1 = {
    2.do{|i|
	    plays.value(freqSpiral.value(50,i));
    };
};

techno4.value;
)

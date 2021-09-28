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

var techno = {|root=40|
	plays.value(freqSpiral.value(root,1));
	plays.value(freqSpiral.value(root*2,2));
	plays.value(freqSpiral.value(root*4,4));
	plays.value(freqSpiral.value(root*8,8));
	plays.value(freqSpiral.value(root*16,16)); // extra
};

var chord = {|root=40|
	var fundamental = root/4;

	var fifth = root+fundamental;
	var sixth = root+fundamental+fundamental;

	/*
	// take the root to be the 4th partial of the harmonic series
	// for example, [5, 10, 15, 20]hz
	// for example, [10, 20, 30, 40]hz
	*/

	techno.value(root);
	techno.value(fifth);
	techno.value(sixth);
};

chord.value(40);
chord.value(50);
chord.value(60);
)

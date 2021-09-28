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

techno.value(40);
techno.value(50);
techno.value(60);
)

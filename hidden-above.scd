// must use headphones to experience the stereo effect

(
var plays = {arg freqs=[];
	freqs.do{|freq|
    {Out.ar(0,Pan2.ar(SinOsc.ar(freq),0))}.play;
	};
};

var woof = {|root=40, recur=4|
    var fifth = root*1.5,
    	df = (fifth - root)/2,
	    midpoint = root+df;

    plays.value([root,fifth]); // hard pan each freq

	plays.value([midpoint]); // play these stereo

	recur.do{|i|
		plays.value([midpoint + (df/2.pow(i+1)), midpoint - (df/2.pow(i+1))]);
	};
};

var triplets = {|scale = 1|
	var first = 20;
	var second = 40;
	var third = 60;

	woof.value(first*scale,1);
	woof.value(second*scale,2);
	woof.value(third*scale,3);
};

12.do{|i|
	if (i<6 || i.even, {
triplets.value(i+1);
	})
};

)

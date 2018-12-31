
{SinOsc.ar(WhiteNoise.kr(MouseX.kr(2,24)).range(MouseY.kr(80, 400)), mul: (1))}.play;

SynthDef(\noise,{arg out =0,rel  = 0.25,a=4;
var env0 =  EnvGen.ar(Env.new([0.1, 1, 0.3, 0], [0.01, rel], [-4, -2, -4]), doneAction:2);
var sig = LatoocarfianL.ar(
		SampleRate.ir/a,
		LFNoise2.kr([2,2],1.5,1.5),
		LFNoise2.kr([2,2],1.5,1.5),
		LFNoise2.kr([2,2],0.5,1.5),
		LFNoise2.kr([2,2],0.5,1.5);
	);
	sig = HPF.ar (sig,MouseY.kr (1000,4000));
	sig = Limiter.ar (sig,MouseX.kr (0.4,1.5));
	sig =	[sig ,DelayL.ar(sig,0.1,100/44100)];
	//sig = PitchShift.ar(sig,0.2,1*a);
	sig = Compander.ar(sig,In.ar(0,1),0.01,1,0.01,0.01,0.1);
	sig=  sig.tanh;
	Out.ar(out,sig*env0);
}).add;


    Ppar([
		Pbind(
		\instrument, "noise",
		\dur, Pseq([Rest(0),1/4,1/4, 1/4, 1/8], inf),
		\amp, 1.2
	)
	]).play;
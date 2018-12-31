/*{ "audio": true, "pixelRatio": 2}*/

#ifdef GL_ES
precision mediump float;
#endif

uniform float time;
uniform vec2 mouse;

#define N 8

void main( void ) {
	vec2 v = (gl_FragCoord.xy - mouse) / min(mouse.y,mouse.x) * 200.0;

	float x = v.x;
	float y = v.y;

	float t = time * 20.;
	float r;
	for ( int i = 0; i < N; i++ ){
		float d = 3.14159265 / float(N) * float(i) * 200.0;
		r = length(vec2(x,y)) + 1.8;
		float xx = x;
		x = x + cos(y +tan(4.*r) + d) + cos(t);
		y = y - cos(x+sin(8.*r) + d) + sin(t);
	}

	gl_FragColor = vec4( vec3(cos(r*(sin(.5)))), 3.0 );

}

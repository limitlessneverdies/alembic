#version 100
varying lowp vec2 uv;
varying lowp vec4 color;

uniform sampler2D Texture;

void main() {
    gl_FragColor = texture2D(Texture, uv) * color;
}

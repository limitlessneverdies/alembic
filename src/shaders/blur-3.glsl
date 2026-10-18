#version 100
precision highp float;
varying lowp vec2 uv;
uniform sampler2D Texture;
uniform vec2 inv_size;
uniform vec2 direction;
void main() {
    vec4 sum = vec4(0.0);
    float total = 0.0;
    for (int k = -8; k <= 8; k++) {
        float w = 9.0 - abs(float(k));
        vec2 off = direction * float(k) * inv_size;
        sum += texture2D(Texture, uv + off) * w;
        total += w;
    }
    gl_FragColor = sum / total;
}
gas blur shader compile
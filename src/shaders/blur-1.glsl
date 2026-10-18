#version 100
attribute vec3 position;
attribute vec2 texcoord;
attribute vec4 color0;
varying lowp vec2 uv;
uniform mat4 Model;
uniform mat4 Projection;
void main() {
    gl_Position = Projection * Model * vec4(position, 1.0);
    uv = texcoord;
}
#version 100
precision highp float;
varying lowp vec2 uv;
uniform sampler2D Texture;
uniform vec2 inv_size;
uniform vec2 direction;
void main() {
    vec4 sum = vec4(0.0);
    float total = 0.0;
    for (int k = -18; k <= 18; k++) {
        float w = 19.0 - abs(float(k));
        vec2 off = direction * float(k) * inv_size;
        sum += texture2D(Texture, uv + off) * w;
        total += w;
    }
    gl_FragColor = sum / total;
}
inv_sizedirectionbloom blur shader compile
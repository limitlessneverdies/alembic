#version 100
    attribute vec2 position;
    attribute vec2 texcoord;

    varying lowp vec2 uv;

    void main() {
        gl_Position = vec4(position, 0, 1);
        uv = texcoord;
    }#version 100
    varying lowp vec2 uv;

    uniform sampler2D Texture;

    void main() {
        gl_FragColor = texture2D(Texture, uv);
    }positiontexcoord
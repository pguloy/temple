uniform sampler2D mainTex;

varying lowp vec4 colorVecV;
varying lowp vec2 uvVecV;

const lowp float MIN_BLOOM_BRIGHTNESS = 1.25;

void main()
{
    mediump vec4 bloomVec = texture2D(mainTex, uvVecV);
    mediump float bloomVecLength = sqrt(
        (bloomVec.x * bloomVec.x)
        + (bloomVec.y * bloomVec.y)
        + (bloomVec.z * bloomVec.z)
        + (bloomVec.w * bloomVec.w)
    );
    
    if(bloomVecLength < MIN_BLOOM_BRIGHTNESS)
    {
        bloomVec = vec4(0.0);
    }
    
    gl_FragColor = bloomVec * colorVecV;
}

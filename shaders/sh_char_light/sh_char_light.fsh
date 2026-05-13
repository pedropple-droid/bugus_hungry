//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 dist;
uniform vec2 texel;

uniform float u_facing;

vec2 movement = vec2(8.);

void main()
{
    // 1. Get the base color
    vec4 colour = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
    
    // 2. Directional Logic (Is the light above or below?)
    vec2 mult = vec2(sign(dist.y)); 
    float is_above = abs(min(mult.y, 0.0));
    
    // 3. Scale Correction (Bugu's left/right flip)
    vec2 flipped_dist = vec2(dist.x * u_facing, dist.y);
    
    // 4. Calculate the "Rim" (The shadow shape)
    vec2 new_pos = v_vTexcoord - (flipped_dist * texel * movement * mult);
    vec4 new_col = texture2D(gm_BaseTexture, new_pos);
    float rim_shape = is_above + (new_col.a * mult.y);
    
    // 5. Proximity & Light Intensity
	float x_dist = abs(dist.x);
	float y_dist = abs(dist.y);
	float ray_width = 0.1;
    float proximity = clamp(1. - (y_dist - x_dist - ray_width), -1., 1.); 
	float vertical_fade = clamp(1. - (v_vTexcoord.y), 0.1, 1.);
	float horizontal_fade = clamp(1. - (v_vTexcoord.x), 0.1, 1.);
	proximity *= vertical_fade + horizontal_fade;
    float transition_glow = clamp(1.  - (abs(dist.y) / 0.2), 0.0, 1.);
    
    // 6. Final Calculation
    // Start with 1.0 (Total Dark). Proximity brings in the Rim shape. 
    // transition_glow subtracts darkness (adding light).
    float final_darkness = mix(1.0, rim_shape, proximity);
    final_darkness = clamp(final_darkness - transition_glow, 0.0, 1.0);
    
    // 7. Output
    final_darkness *= 0.5; // Try 0.5 for heavy shadows, 0.2 for light
    
    colour.rgb -= vec3(final_darkness);
    colour.b += final_darkness * 0.4; // Blue cavern tint
    
    gl_FragColor = colour; 
}

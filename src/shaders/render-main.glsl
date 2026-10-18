#version 100
precision highp float;
varying lowp vec2 uv;
uniform sampler2D Texture;
uniform sampler2D bloom_tex;
uniform sampler2D gas_tex;
uniform sampler2D kind_tex;
uniform float u_time;
uniform float u_liquid_fx;

const float GRID_W = __GRID_W__;
const float GRID_H = __GRID_H__;

// Element IDs we treat specifically.
const float K_SAND     = 1.0;
const float K_LAVA     = 8.0;
const float K_ICE      = 14.0;
const float K_GLASS    = 16.0;
const float K_HG       = 37.0;
const float K_BATTPOS  = 46.0;
const float K_BATTNEG  = 47.0;

// Physics Kind discriminants (must match enum order).
const float P_SOLID  = 1.0;
const float P_GRAVEL = 2.0;
const float P_POWDER = 3.0;
const float P_LIQUID = 4.0;
const float P_GAS    = 5.0;

// Float-equality helper. Element IDs are small integers stored in u8
// then unpacked to [0..255]; tolerance hides any FP rounding.
bool eq(float a, float b) { return abs(a - b) < 0.5; }

float hash21(vec2 p) {
    return fract(sin(dot(p, vec2(127.1, 311.7))) * 43758.5453123);
}

void main() {
    vec3 base = texture2D(Texture, uv).rgb;
    vec4 ki = texture2D(kind_tex, uv);
    float k      = ki.r * 255.0;     // element id
    float pkind  = ki.g * 255.0;     // physics kind
    float frozen = ki.b * 255.0;     // 0 or 1

    vec2 texel = vec2(1.0 / GRID_W, 1.0 / GRID_H);
    vec2 cell_uv = uv * vec2(GRID_W, GRID_H);
    vec2 within = fract(cell_uv);

    // Neighbor element IDs (for edge detection + ambient-occlusion).
    float k_t  = texture2D(kind_tex, uv + vec2( 0.0, -texel.y)).r * 255.0;
    float k_b  = texture2D(kind_tex, uv + vec2( 0.0,  texel.y)).r * 255.0;
    float k_l  = texture2D(kind_tex, uv + vec2(-texel.x, 0.0)).r * 255.0;
    float k_r  = texture2D(kind_tex, uv + vec2( texel.x, 0.0)).r * 255.0;
    float k_tl = texture2D(kind_tex, uv + vec2(-texel.x, -texel.y)).r * 255.0;
    float k_tr = texture2D(kind_tex, uv + vec2( texel.x, -texel.y)).r * 255.0;
    float k_bl = texture2D(kind_tex, uv + vec2(-texel.x,  texel.y)).r * 255.0;
    float k_br = texture2D(kind_tex, uv + vec2( texel.x,  texel.y)).r * 255.0;

    // Detect SOLID-phase atomic metals only. Liquid metals (molten
    // Hg, molten Au, boiled-then-cooled vapor) fall through to the
    // CPU liquid styling; gas-phase boiled metals fall through to
    // the volumetric gas pipeline ??? both look bad with the
    // surface specular below.
    bool atomic_metal_id =
           eq(k, 25.0) || eq(k, 26.0) || eq(k, 27.0) || eq(k, 32.0)
        || eq(k, 33.0) || eq(k, 34.0) || eq(k, 35.0) || eq(k, 36.0)
        || eq(k, 37.0) || eq(k, 38.0) || eq(k, 48.0) || eq(k, 49.0)
        || eq(k, 50.0) || eq(k, 51.0) || eq(k, 53.0) || eq(k, 54.0);
    bool atomic_metal = atomic_metal_id
        && (eq(pkind, P_SOLID) || eq(pkind, P_GRAVEL));

    // ---- Edge depth shading (non-metal blocks) ----
    // Brighten the top + left band where the cell borders a different
    // element; darken the bottom + right band. Universal "fake light
    // from upper-left" cue for static blocks. Skipped for atomic
    // metals ??? they get a stronger custom version that pushes harder
    // toward white-shine on the lit faces.
    bool is_block = (eq(pkind, P_SOLID) || eq(pkind, P_GRAVEL)
        || eq(pkind, P_POWDER) || frozen > 0.5) && !atomic_metal;
    if (is_block) {
        float ew = 0.30;
        float lit = 0.0;
        float shd = 0.0;
        if (!eq(k_t, k) && within.y < ew) lit += (ew - within.y) / ew;
        if (!eq(k_l, k) && within.x < ew) lit += (ew - within.x) / ew;
        if (!eq(k_b, k) && within.y > (1.0 - ew)) shd += (within.y - (1.0 - ew)) / ew;
        if (!eq(k_r, k) && within.x > (1.0 - ew)) shd += (within.x - (1.0 - ew)) / ew;
        base = mix(base, base * 1.45, clamp(lit * 0.5, 0.0, 0.45));
        base = mix(base, base * 0.55, clamp(shd * 0.5, 0.0, 0.45));
    }

    // ---- Material shading per kind ----
    vec2 fp = gl_FragCoord.xy;

    if (atomic_metal) {
        // Surface-aware metallic shading + light directional AO.
        // Real metal bodies don't go dark in the middle ??? they
        // stay full-bright with hot specular on lit edges and
        // shadow on back edges. AO is kept subtle and biased
        // upward (cells with metal above them dim more than
        // cells with metal below them) so a pile reads as
        // "lit from above" instead of "ambient-occluded into mud".
        bool face_t = !eq(k_t, k);
        bool face_b = !eq(k_b, k);
        bool face_l = !eq(k_l, k);
        bool face_r = !eq(k_r, k);

        // Specular: push toward pure white at 90 % mix on the very
        // edge. Narrow band (ew = 0.35) so it reads as a hot
        // highlight rather than a soft glow.
        float ew = 0.35;
        float spec = 0.0;
        if (face_t) spec = max(spec, smoothstep(ew, 0.0, within.y));
        if (face_l) spec = max(spec, smoothstep(ew, 0.0, within.x) * 0.85);
        base = mix(base, vec3(1.0), spec * 0.90);

        // Back-edge shadow ??? toned down (0.25 ??? 0.45 floor) so
        // the metal still reads as bright on the unlit side.
        float shd = 0.0;
        if (face_b) shd = max(shd, smoothstep(ew, 0.0, 1.0 - within.y));
        if (face_r) shd = max(shd, smoothstep(ew, 0.0, 1.0 - within.x) * 0.85);
        base *= mix(1.0, 0.45, shd);

        // Directional AO: upper neighbors weighted more so cells
        // BURIED beneath other metal (deep in a pile) get shaded
        // while cells with metal below stay bright. Total weight 8;
        // floor lifted from 0.55 ??? 0.80 so bodies stay clearly lit.
        float same_m = 0.0;
        if (eq(k_t,  k)) same_m += 1.8;
        if (eq(k_tl, k)) same_m += 1.4;
        if (eq(k_tr, k)) same_m += 1.4;
        if (eq(k_l,  k)) same_m += 0.8;
        if (eq(k_r,  k)) same_m += 0.8;
        if (eq(k_b,  k)) same_m += 0.5;
        if (eq(k_bl, k)) same_m += 0.65;
        if (eq(k_br, k)) same_m += 0.65;
        float ao_m = same_m / 8.0;
        base *= mix(1.0, 0.80, ao_m);

        // Subtle within-cell vertical gradient ??? top of each cell
        // a touch brighter than the bottom, reinforces "lit from
        // above" for the body interior.
        base *= 1.0 - within.y * 0.08;
    } else if (eq(pkind, P_POWDER)) {
        // Powders: bump-mapped lighting + speckle. Loose particles
        // catching light from above.
        float h_c = hash21(fp);
        float h_r = hash21(fp + vec2(1.0, 0.0));
        float h_d = hash21(fp + vec2(0.0, 1.0));
        float bump = (h_r - h_c) + (h_d - h_c);
        base *= 1.0 + bump * 0.45;
        base += (h_c - 0.5) * 0.18 * (base * 0.5 + vec3(0.04));
        float bright = max(0.0, h_c - 0.94) * 16.7;
        base = mix(base, base * 1.55, clamp(bright * 0.45, 0.0, 0.45));
        float dark = max(0.0, 0.06 - h_c) * 16.7;
        base = mix(base, base * 0.42, clamp(dark * 0.50, 0.0, 0.50));
    } else if (eq(pkind, P_GRAVEL)) {
        // Coarse tonal patches for natural rock variation.
        vec2 q = floor(fp * 0.25);
        float h_patch = hash21(q);
        base *= mix(0.92, 1.08, h_patch);

        // Convex ambient-occlusion: count same-kind among the 8
        // neighbors. Surface cells (few same-kind around) stay
        // bright; interior cells (most/all same-kind around) get
        // darkened, so a stone pile reads as a 3D dome instead of
        // a flat tonal field. AO falls off into the rim, so the
        // pile looks lit from the outside.
        float same = 0.0;
        if (eq(k_t,  k)) same += 1.0;
        if (eq(k_b,  k)) same += 1.0;
        if (eq(k_l,  k)) same += 1.0;
        if (eq(k_r,  k)) same += 1.0;
        if (eq(k_tl, k)) same += 1.0;
        if (eq(k_tr, k)) same += 1.0;
        if (eq(k_bl, k)) same += 1.0;
        if (eq(k_br, k)) same += 1.0;
        float ao = same / 8.0;
        base *= mix(1.10, 0.68, ao);
    } else if (eq(pkind, P_SOLID)) {
        // Non-metal solids (Wood/Quartz/Firebrick/Seed): per-cell
        // stable tint at very low amplitude.
        vec2 ci = floor(cell_uv);
        float pc = hash21(ci);
        base *= mix(0.94, 1.06, pc);
    }

    // ---- Glass / Ice transparency ----
    // Blend with what's a few pixels "behind" (offset down) plus a
    // bright edge band. Glass tints neutral; Ice tints cool blue.
    if (eq(k, K_GLASS) || eq(k, K_ICE)) {
        vec3 behind = texture2D(Texture, uv + vec2(0.0, texel.y * 4.0)).rgb;
        float opacity = eq(k, K_GLASS) ? 0.50 : 0.55;
        base = mix(behind, base, opacity);
        bool top_e = !eq(k_t, k) && within.y < 0.18;
        bool bot_e = !eq(k_b, k) && within.y > 0.82;
        bool lft_e = !eq(k_l, k) && within.x < 0.18;
        bool rgt_e = !eq(k_r, k) && within.x > 0.82;
        if (top_e || bot_e || lft_e || rgt_e) {
            vec3 edge_color = eq(k, K_ICE) ? vec3(0.85, 0.95, 1.0) : vec3(1.0);
            base = mix(base, edge_color, 0.4);
        }
    }

    // ---- Mercury shimmer ----
    if (eq(k, K_HG)) {
        float wave = sin(uv.y * GRID_H * 0.4 + u_time * 1.5) * 0.5 + 0.5;
        base = mix(base, vec3(1.0), wave * 0.20);
    }

    // ---- Lava pulse ----
    if (eq(k, K_LAVA)) {
        float pulse = sin(u_time * 3.0 + (cell_uv.x + cell_uv.y) * 0.3) * 0.5 + 0.5;
        base = mix(base, base * 1.35, pulse * 0.35);
    }

    // ---- ONI-style liquid field ----
    // ALL liquids (water, brine, acid, lava, mercury...) render as ONE
    // smooth field: a tent-filtered coverage function of the liquid
    // mask, evaluated per OUTPUT pixel over the 3x3 cell neighborhood.
    // Thresholding the field gives rounded droplets, soft ribbon
    // streams and an antialiased surface with NO volume/coherence
    // gating ??? gating the effect to "coherent pools" made flowing
    // water flip between two looks side by side (filmed, rejected).
    // Interior color = tent blur of the CPU base blended with a
    // REFRACTED scene sample (the trick that reads as transparency:
    // walls, solutes and the depth gradient wobble through the body).
    // The whole field is evaluated at a wave-displaced position so the
    // silhouette itself undulates. NO high-frequency patterning ??? a
    // 3-cell-wavelength shimmer tiled into repeating chevron wallpaper
    // at game resolution (filmed, rejected); internal light must move
    // in BIG slow bands or not at all.
    // u_liquid_fx: F6 toggles the whole liquid layer for old-vs-new
    // comparison (the CPU depth ramp is gated by the same flag).
    if (frozen < 0.5 && u_liquid_fx > 0.5) {
        // Travelling surface undulation, two incommensurate wavelengths.
        // Amplitude stays WELL under half a pixel at typical zoom ??? a
        // 0.37-cell wave read as pixel-snapped jitter (filmed).
        vec2 fuv = cell_uv + vec2(0.0,
            sin(cell_uv.x * 0.30 - u_time * 1.1) * 0.12
                + sin(cell_uv.x * 0.13 + u_time * 0.55) * 0.08);
        float cov = 0.0;
        float sol = 0.0;
        float wtot = 0.0;
        vec3 lsum = vec3(0.0);
        float lwsum = 0.0;
        vec2 cbase = floor(fuv);
        for (int dy = -1; dy <= 1; dy++) {
            for (int dx = -1; dx <= 1; dx++) {
                vec2 cc = cbase + vec2(float(dx), float(dy)) + vec2(0.5);
                vec2 dv = abs(fuv - cc);
                float w = max(0.0, 1.5 - dv.x) * max(0.0, 1.5 - dv.y);
                if (w > 0.0) {
                    vec2 suv = cc * texel;
                    vec4 kt = texture2D(kind_tex, suv);
                    float pk = kt.g * 255.0;
                    wtot += w;
                    if (abs(pk - P_LIQUID) < 0.5 && kt.b * 255.0 < 0.5) {
                        cov += w;
                        lsum += texture2D(Texture, suv).rgb * w;
                        lwsum += w;
                    } else if ((pk > 0.5 && pk < 3.5) || kt.b * 255.0 > 0.5) {
                        // solid / gravel / powder / frozen
                        sol += w;
                    }
                }
            }
        }
        cov /= max(wtot, 0.001);
        sol /= max(wtot, 0.001);
        float aa = smoothstep(0.22, 0.55, cov);
        if (aa > 0.004 && lwsum > 0.001) {
            // Edge effects (rim + waterline) belong to liquid-AIR
            // boundaries only. Against submerged solids they painted
            // bright animated edging that read as lightning bolts
            // around walls and piles (filmed, rejected).
            float open_edge = clamp(1.0 - sol * 2.5, 0.0, 1.0);
            // Refraction: sample the scene through a slow wobble ??? but
            // only accept the sample if it lands on liquid; walls next
            // to water otherwise smear grey streaks into the body.
            // HORIZONTAL only: a vertical component dragged the bright
            // surface band downward in x-periodic waves ??? "vertical
            // wavy lines coming from the surface" (filmed, rejected).
            // Removing the wobble entirely was tried and is WORSE: the
            // underlying ramp/glow banding shows as dead-straight
            // contour lines (Travis: "straight lines... worse in
            // almost all cases"). The wobble stays; softening the
            // bands themselves is the open task.
            vec2 wob = vec2(
                sin(cell_uv.y * 0.45 + u_time * 0.8)
                    + 0.5 * sin(cell_uv.y * 0.13 - u_time * 0.35),
                0.0) * 0.7;
            vec2 ruv = uv + wob * texel;
            float rpk = texture2D(kind_tex, ruv).g * 255.0;
            vec3 refr = texture2D(Texture, ruv).rgb;
            float rok = abs(rpk - P_LIQUID) < 0.5 ? 1.0 : 0.0;
            // ...and only in the interior ??? at the silhouette edge the
            // wobble samples OUTSIDE the liquid (dark smudges, filmed).
            vec3 lc = mix(lsum / lwsum, refr,
                0.55 * rok * smoothstep(0.55, 0.85, cov));
            // One big, slow internal light band ??? barely there.
            float band = sin(cell_uv.x * 0.16
                + sin(cell_uv.y * 0.09) * 1.7 + u_time * 0.5);
            lc *= 1.0 + band * 0.05;
            // Soft rim, air-facing edges only. Hue-neutral lift so
            // red/grey/green liquids don't pick up a watery blue cast.
            float rim = (1.0 - smoothstep(0.50, 0.90, cov)) * open_edge;
            lc += (lc * 0.9 + vec3(0.10)) * rim * 0.35;
            // Bright animated waterline: needs actual AIR/GAS above
            // (a wall above also fails the "not liquid" test ??? that lit
            // the underside of submerged geometry).
            float ab = texture2D(kind_tex, uv - vec2(0.0, texel.y)).g * 255.0;
            if (ab < 0.5 || abs(ab - P_GAS) < 0.5) {
                float sparkle = 0.55 + 0.45
                    * sin(cell_uv.x * 0.9
                        + sin(cell_uv.x * 0.35 - u_time * 1.3)
                        + sin(cell_uv.x * 0.18 + u_time * 0.7));
                // Hue-neutral: brighten the liquid's OWN color toward
                // white, so bromine sparkles red-white, not cyan.
                lc = mix(lc, lc * 0.4 + vec3(0.6), rim * sparkle * 0.40);
            }
            base = mix(base, lc, aa);
        }
    }

    // ---- Battery terminal caps ----
    // Render BattPos / BattNeg cells so a CONTIGUOUS RUN of them reads
    // as a single polished metal cap, not as a checkerboard of dome
    // gradients. The trick: highlights only appear on the OUTER edge
    // of the cap (where the terminal cell borders something that ISN'T
    // a terminal) ??? interior cells get plain metal. Adjacent terminal
    // cells in the same row/column then look like one continuous bar
    // because they share the same color in their interiors.
    //
    // BattPos: copper gold. BattNeg: brushed silver. Both get a slow
    // animated specular streak so the metal feels polished, not flat.
    if (eq(k, K_BATTPOS) || eq(k, K_BATTNEG)) {
        // Toned-down metallic palette ??? was reading too "wet/chrome";
        // these values land closer to oxidized copper and brushed
        // steel than mirror-polished metal.
        vec3 metal = eq(k, K_BATTPOS)
            ? vec3(0.70, 0.40, 0.16)
            : vec3(0.62, 0.66, 0.72);
        vec3 hi_col = eq(k, K_BATTPOS)
            ? vec3(0.90, 0.68, 0.38)
            : vec3(0.85, 0.88, 0.92);
        vec3 sh_col = eq(k, K_BATTPOS)
            ? vec3(0.32, 0.15, 0.05)
            : vec3(0.22, 0.24, 0.28);

        bool face_t = !eq(k_t, k);
        bool face_b = !eq(k_b, k);
        bool face_l = !eq(k_l, k);
        bool face_r = !eq(k_r, k);

        // Subtler outer-edge band ??? was 0.55, now 0.32.
        float outer = 0.0;
        if (face_t) outer = max(outer, smoothstep(0.50, 0.0, within.y));
        if (face_b) outer = max(outer, smoothstep(0.50, 1.0, within.y));
        if (face_l) outer = max(outer, smoothstep(0.30, 0.0, within.x));
        if (face_r) outer = max(outer, smoothstep(0.30, 1.0, within.x));

        float inner = 0.0;
        if (face_t) inner = max(inner, smoothstep(0.55, 1.0, within.y));
        if (face_b) inner = max(inner, smoothstep(0.55, 0.0, within.y));

        vec3 lit = metal;
        lit = mix(lit, hi_col, outer * 0.32);
        lit = mix(lit, sh_col, inner * 0.30);

        // Animated sheen kept but much weaker ??? 0.18 ??? 0.06. Reads
        // as "light catching the metal occasionally" instead of
        // "wet plastic shimmer".
        float t = u_time * 0.4;
        float band = sin((cell_uv.x + cell_uv.y) * 0.6 + t * 3.0);
        float sheen = pow(max(0.0, band), 6.0);
        lit += hi_col * sheen * 0.06;

        base = lit;
    }

    // ---- Composite bloom + gas ----
    //
    // TWO BUGS LIVED HERE, and together they were the blinding white blob.
    //
    // 1. The gas cloud was ADDED (base + gas.rgb*gd) ??? a steam plume was
    //    literally a lamp. Any dense plume summed with bloom and clipped.
    //    Vapor is FOG: it occludes what is behind it and only its genuinely
    //    hot, bright fraction should emit light.
    //
    // 2. min(col, 1.0) clips each channel INDEPENDENTLY. An overshooting
    //    orange (1.8, 1.2, 0.5) became (1.0, 1.0, 0.5) ??? yellow-white ??? and
    //    anything brighter became pure white. Every hue decision upstream
    //    (colour-temperature warmify, flame tints) was destroyed at this
    //    line, which is why tuning them appeared to do nothing.
    vec3 bloom = texture2D(bloom_tex, uv).rgb;

    // FIRELIGHT. The bloom texture is already a soft-blurred field of every
    // emissive source, so it doubles as a light field for free. Adding it
    // (below) is glow haze; MULTIPLYING the base by it is illumination ???
    // walls, sand and liquid near a flame brighten by their own colour,
    // warm-tinted by the source, falling off with the blur radius. Surfaces
    // read as lit by the fire instead of merely fogged over by it.
    // COMPRESSIVE, not linear. The bloom field swings ~20:1 between an
    // ignition blaze and a settled ember rain, so one linear gain cannot
    // serve both: 5.0 nuked the ignition and still left steady-state pools
    // dull (their bloom is a few percent ??? multiplying almost-zero). The
    // saturating curve b/(b+KNEE) lifts faint light steeply and levels off,
    // with a hard ceiling of (1+GAIN) no matter how fierce the blaze.
    //   bloom 0.04 (ember pool)  -> x1.30
    //   bloom 0.30 (plume edge)  -> x2.08
    //   bloom 1.00 (ignition)    -> x2.50   (old 5.0 linear gave x6)
    const float FIRELIGHT_GAIN = 1.8;
    const float FIRELIGHT_KNEE = 0.20;
    vec3 fl = bloom / (bloom + vec3(FIRELIGHT_KNEE));
    base *= vec3(1.0) + fl * FIRELIGHT_GAIN;

    vec4 gas = texture2D(gas_tex, uv);
    float gd = clamp(gas.a * 8.0, 0.0, 1.0);

    // Gas stays ADDITIVE. A fog/occlusion blend was tried here and produced
    // a dark ring around every non-burning cloud: the blurred gas texture
    // fades its rgb toward black at the plume's edges (the blur averages
    // against empty texels), so mixing toward that colour DARKENS the rim.
    // Un-premultiplying could fix it, but the additive model was never the
    // problem for ordinary gas ??? only clipped combustion light was, and the
    // hue-preserving clip below handles that.
    vec3 gas_color = gas.rgb * gd;
    vec3 final_col = base + bloom + gas_color;

    // Hue-preserving soft clip. Pixels that fit in range are untouched ???
    // identical to the old path ??? but overshoot now compresses along the
    // brightest channel instead of clipping each channel to white. A hot
    // orange core STAYS orange, just bright.
    float peak = max(final_col.r, max(final_col.g, final_col.b));
    if (peak > 1.0) {
        final_col *= (1.0 + (peak - 1.0) * 0.30) / peak;
    }
    gl_FragColor = vec4(min(final_col, vec3(1.0)), 1.0);
}
__GRID_W__
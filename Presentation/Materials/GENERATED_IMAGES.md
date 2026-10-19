# Generated illustration provenance

## Scope

- Lesson: L09 — Porovnání kandidátních modelů: R², adjustované R² a AIC
- **Current status (2026-10-19): the four watercolour replacements and portrait title image have been generated and integrated locally; see „Watercolour redraw and title image (2026-10-19)“ below.** That section is the current specification and execution record. The paper-cut series (2026-10-05) is historical. The deck uses the standard disclosure „Ilustrace vytvořená pomocí AI.“ on slides 1, 2, 42, 47 and 55.
- Status in 2026-10-05: **generated and integrated on 2026-10-05.** The approved plan (G1–G4) is recorded in `Workflow/records/2026-10-05-stage-4-presentation.md`. All four placeholder positions in `Presentation/presentation.qmd` now display the selected illustrations. Human review of the finished presentation remains open.
- Historical generation route (2026-10-05): OpenAI built-in `image_gen`, one generation per image, followed by one targeted edit each for G1 and G3. Those superseded images were opaque landscape PNGs (1672 × 941, approximately 16:9). Their submitted prompts and selected/rejected output identifiers remain in `GENERATED_IMAGE_PROMPTS.json`; the current watercolour execution is recorded separately in `GENERATED_IMAGE_PROMPTS_20261019.json`.
- Student-facing metadata: each current occurrence has Czech alternative text and the visible caption `Ilustrace vytvořená pomocí AI.` in `Presentation/presentation.qmd`.
- Teaching boundary: the illustrations are context and memory devices. Statistical evidence remains attached to the observed tree data and model-derived figures.
- Rejected earlier assets: `Learning_materials/images/model-casting.jpg`, `one-ruler-three-trees.jpg` and `complexity-machine.jpg` were rejected by Ondřej Mottl on 2026-10-05 and are not used in the presentation.

The original scene prompts and generation record below are retained as history. The watercolour specification and execution record at the end of this file govern the current deliverables; the files have not been committed by the assistant.

## Shared visual language

Use these elements in every prompt:

```text
Style/medium: original flat editorial paper-cut illustration, crisp layered shapes, gentle paper texture, playful academic tone (same medium as the course's L08 crab illustrations)
Recurring cast: three recognisably different North American conifers, always drawn the same way —
  (1) western white pine (Pinus monticola): slender trunk, soft long drooping needles, narrow open crown;
  (2) ponderosa pine (Pinus ponderosa): thick orange-brown plated bark, long needle tufts, open rounded crown;
  (3) Douglas fir (Pseudotsuga menziesii): dense conical crown, drooping branch tips, dark grey-brown bark.
  Trees are friendly but have no cartoon faces.
Setting: mountain conifer forest or simple forest field station, uncluttered background, generous negative space
Color palette: muted forest greens, bark browns, warm off-white, graphite; avoid saturated purple and orange so the course's semantic overlays stay free
Global constraints: no text, letters, numbers, formulas, graph axes, tick marks, signs with writing, logos or watermark; no close-up human faces; never imply a statistical result, a winner, or that one species is taller than another
Avoid: photorealism, speech bubbles, decorative statistics, crowded scenery
```

## G1 — `stromy_mereni.png` (slide 2)

- Teaching role: make the measured quantities concrete (species, trunk diameter at 1.3 m, tree height) before students see the data.
- Alt: `Terénní měřiči na lesní stanici měří u tří různých jehličnanů průměr kmene ve výšce prsou a výšku stromu.`
- Acceptance checks: the tape is clearly at chest height; the height measurement reads as an action (sighting the treetop); the three species are distinguishable; no species looks deliberately taller as a "result"; no text or numbers.

```text
Use case: scientific-educational
Asset type: 16:9 lecture-slide illustration for a university biostatistics course
Primary request: A light, humorous but scientifically grounded scene introducing how foresters measure conifers. Two field researchers, seen from behind or in side view and small in the frame, work at a simple forest measuring station. One wraps a plain diameter tape around a trunk at chest height; a short plain marker post next to the tree shows that height. The other sights the top of a tree through a plain handheld clinometer. The three conifer species of the recurring cast stand side by side with similar trunk thickness. A curious squirrel inspects the end of the tape.
Scene/backdrop: mountain conifer forest edge with a small field table; generous clean negative space
Composition/framing: wide landscape, trees and measurers centred, uncluttered, readable when projected
Lighting/mood: bright, curious, lightly comic
[append the shared visual language above]
```

## Generation and acceptance record — 2026-10-05

- Generator: Codex using OpenAI built-in `image_gen`; no CLI/API fallback.
- Prompt adaptation: full approved scene plus shared visual language, explicit course parchment `#F4F1EC` and graphite `#2E2E2E`, and composition clarifications for the acceptance checks. G4 explicitly depicts an age sequence rather than a species ranking. Exact prompts are in `GENERATED_IMAGE_PROMPTS.json`.
- Author visual check: all four outputs inspected at full image size. G1 shows a chest-height trunk measurement and an upward sighting action; G2 has three equally treated candidates and a fourth outside the stage, blank cards and no winner; G3 shows effortful tailoring, a simple coat and a differently shaped waiting tree without faces; G4 shows rising height followed by a gentle plateau while the unmarked stick continues into the clouds. None contains text, numbers, axes or a claimed statistical result.
- Targeted edit for G1 and G3: remove all tick marks and printed markings from the measuring tape, preserving the rest of the image. The initial G1 (`exec-aa247c51-55f0-4516-9b30-5089cfbcb572.png`) and G3 (`exec-d2845884-10ad-4ecb-9aa8-196b213fc11b.png`) outputs were rejected because their tape graduations violated the no-tick-marks constraint. The edited outputs passed the visual check. G2 and G4 were selected from their first outputs.
- This author check does not replace human approval of the finished presentation.

| Image | Selected output | SHA-256 of saved PNG |
|---|---|---|
| G1 — `stromy_mereni.png` | `exec-79642a59-2861-4bb6-9cbb-626137461899.png` | `f8116ce0bb94c930bb6b8fdaa62001c9d8d77a15ce298e14d87658dfcffe7ebc` |
| G2 — `stromy_porota.png` | `exec-16237050-1626-4d51-8a7a-673f924c1ae7.png` | `f8e22cde5136dad0f9d8455742877e8d44c74e1774ebdcfd6d2ced189611299f` |
| G3 — `stromy_krejci.png` | `exec-07dd6e0c-3f41-477b-a444-63f7170c4a7d.png` | `52d4cd542768907b983f206da803123ee33d6202c71d69aa253ec5e707c87589` |
| G4 — `stromy_strop.png` | `exec-78363219-d86c-4109-906d-73bf9c14e3d6.png` | `5294cf14c872d2970f3a3e77fedfc6ffe8947770bbcb8127ea0a6784ee0dcf1a` |

## G2 — `stromy_porota.png` (slide 45)

- Teaching role: a memorable image of the candidate-set limit. We rank only the candidates we invited.
- Alt: `Porota lesních zvířat hodnotí tři kandidáty na pódiu, zatímco čtvrtý, nepozvaný kandidát čeká za dveřmi.`
- Acceptance checks: the three candidates are visually equal; the fourth candidate is clearly outside the judged set; the score cards are blank; no crown, podium ranking or winner.

```text
Use case: scientific-educational
Asset type: 16:9 lecture-slide illustration for a university biostatistics course
Primary request: A small forest-theatre stage. A jury of three forest animals (an owl, a fox and a badger) sits at a simple judging table holding blank score cards. On stage stand three small potted conifers as equal candidates, each with a different simple measuring-stick accessory: one has a single straight stick; one has three parallel sticks; one has three sticks fanning out at different angles. Through a half-open side door, a fourth, different-looking conifer candidate peeks in, unnoticed by the jury. The joke is that the jury can only judge who is on stage.
Scene/backdrop: rustic wooden forest stage with simple curtains; uncluttered
Composition/framing: wide landscape; jury in the foreground left, three candidates centre, side door with the fourth candidate on the right
Lighting/mood: warm, witty, non-competitive
Constraints (in addition to the shared ones): score cards blank; no crown, trophy, ranking or winner
[append the shared visual language above]
```

## G3 — `stromy_krejci.png` (slide 40)

- Teaching role: a metaphor for fit versus complexity. Tailoring to every bump of one tree fits *this* tree but needs many seams; a simple coat fits well enough.
- Alt: `Krejčí obléká jehličnan do obleku s desítkami švů kopírujících každý hrbol; vedle visí jednoduchý dobře padnoucí kabát.`
- Acceptance checks: neither garment is shown as winning; the over-tailored suit looks effortful rather than wrong; the waiting tree introduces the doubt "would it fit another tree?" without any text.

```text
Use case: scientific-educational
Asset type: 16:9 lecture-slide illustration for a university biostatistics course
Primary request: A fox tailor with a plain tape measure and pins fits one conifer into an absurdly over-tailored suit: dozens of seams, patches and pins follow every bump and knot of the trunk. Next to it, on a simple stand, hangs a plain coat with few seams that would fit the same tree shape well enough. A second conifer of slightly different shape waits in line and eyes the over-tailored suit doubtfully, as if it would never fit.
Scene/backdrop: small open-air tailor's workshop in a forest clearing; uncluttered
Composition/framing: wide landscape; over-tailored tree centre-left, simple coat centre-right, waiting tree on the far right
Lighting/mood: bright, clever, playful
Constraints (in addition to the shared ones): neither garment is marked as better; no labels or price tags
[append the shared visual language above]
```

## G4 — `stromy_strop.png` (slide 53)

- Teaching role: an open-question bridge to L10. A straight line can keep rising where real growth levels off.
- Alt: `Obří rovné měřidlo stoupá až do mraků, zatímco staré tlusté stromy vedle něj už do výšky nerostou.`
- Acceptance checks: the levelling-off of height among the thickest trees is visible but gentle; no axes, scale marks or numbers; the image reads as a question, not as evidence about the L09 data.

```text
Use case: scientific-educational
Asset type: 16:9 closing lecture-slide illustration for a university biostatistics course
Primary request: A row of conifers arranged from young and slim on the left to old and very thick on the right. Their heights rise at first and then level off: the oldest, thickest trees are no taller than the middle ones. A giant perfectly straight wooden measuring stick leans along the row and keeps rising past the treetops into the clouds. A small hiker or squirrel at the base looks up at the stick, puzzled.
Scene/backdrop: open mountain slope with a soft sky and a few clouds; uncluttered
Composition/framing: wide landscape; the row of trees along the bottom, the stick rising diagonally to the upper right
Lighting/mood: bright, gently absurd, curious
Constraints (in addition to the shared ones): no tick marks or scale on the stick; no numbers
[append the shared visual language above]
```

## Watercolour redraw and title image (2026-10-19)

- Decision: D4 in `Workflow/records/2026-10-19-polish-review.md` (Ondřej Mottl, 2026-10-19: „use the water color. but only specify the promts (I have another model actually making the images)“). The flat paper-cut series above no longer matches the course illustration style in `_internal/.ai/authoring/presentation.md`; L08 was redrawn in the same way on 2026-10-15.
- Generation: the user requested execution of this specification on 2026-10-19. OpenAI built-in `image_gen` generated the four replacements first and the title afterwards, using the actual inspected reference files. The tool did not expose its underlying model identifier. Exact submitted prompts, reference paths, selected outputs and superseded iterations are in `GENERATED_IMAGE_PROMPTS_20261019.json`.
- Slots: every image is embedded with `include_optional_figure()` and the disclosure `ai_disclosure()` („Ilustrace vytvořená pomocí AI.“, `.text-size-tiny .text-right`), with a speaker note. Keep the file names below so the slots switch automatically. The title slot (`.course-title-illustrated`) shows nothing and no caption until its file exists.
- Alt text: the Czech alt texts and speaker notes on slides 2 and 55 have been switched to the watercolour scenes. Slides 1, 42 and 47 already use matching texts; the existing image helpers and disclosure slots are retained.
- References to supply to the image model: `L08/Presentation/Materials/krabi_titulni_ilustrace.png` and `L10/Presentation/Materials/ostrovy_titulni.png` (style, transparency and vignette only); the current L09 images (composition and teaching role only); for the title, the redrawn G1 and G2 and the slide 18 candidate-model figure, saved unchanged as `Presentation/Materials/title_references/kandidatni_modely.png` (motif only).

| File | Slide | Teaching role | Czech alt text (for the new image) | Status |
|---|---|---|---|---|
| `stromy_titulni_ilustrace.png` | 1 (title) | Introduce „Jak poznáme, že je model dobrý?“: three candidate descriptions of the same trees, judged with no winner | Liška a veverka u terénního stolku s pásmem pod třemi různými jehličnany; opřené dřevěné destičky ukazují tři uspořádání fialových tyček a sova je z větve zamyšleně posuzuje. Ilustrace vytvořená pomocí AI. | Generated 2026-10-19 after G1–G4 |
| `stromy_mereni.png` | 2 | Ground species, diameter at 1,3 m and height before the data | Liška na lesní měřicí stanici omotává pásmo kolem kmene ve výšce prsou a veverka zaměřuje vrchol stromu; vedle sebe stojí tři různé jehličnany. | Replaced 2026-10-19 |
| `stromy_krejci.png` | 42 | Fit versus complexity (parsimony) | Liška krejčí šije jehličnanu oblek s desítkami švů a špendlíků, které kopírují každý hrbol kmene; vedle visí jednoduchý dobře padnoucí kabát a za nimi čeká další strom. | Replaced 2026-10-19 |
| `stromy_porota.png` | 47 | Candidate-set limit: only invited candidates are ranked | Porota lesních zvířat s prázdnými hodnoticími kartičkami posuzuje na pódiu tři kandidáty, každého s jiným uspořádáním rovných tyček; za pootevřenými dveřmi čeká čtvrtý kandidát s prohnutou tyčkou. | Replaced 2026-10-19 |
| `stromy_strop.png` | 55 | Open bridge to the next lesson: a straight line keeps rising where growth levels off | Řada jehličnanů od mladých po staré: jejich výška nejprve roste a pak se ustálí, zatímco obří rovná fialová tyč stoupá dál až do mraků; liška a veverka se na ni udiveně dívají. | Replaced 2026-10-19 |

### Series rules

- Replace the four paper-cut images with one consistent watercolour series and then add the title image. Generate the in-deck images first; the title uses them as references.
- Keep the existing file names in `Presentation/Materials/` so the slots switch automatically: `stromy_mereni.png`, `stromy_krejci.png`, `stromy_porota.png`, `stromy_strop.png`; new `stromy_titulni_ilustrace.png`.
- Formats: in-deck images landscape 16:9 (about 1672 × 941 px, as now, to fit the existing columns); title portrait 3:4 (about 1086 × 1448 px, as in L08). All with a genuinely transparent background around an irregular painted vignette.
- Style references: `L08/Presentation/Materials/krabi_titulni_ilustrace.png` and `L10/Presentation/Materials/ostrovy_titulni.png` (painterly style, transparency and vignette only). The current L09 images are composition and role references only; their paper-cut medium must not be copied.
- Recurring cast: the three conifers of the data, drawn the same way in every image (*Pinus monticola*: slender trunk, soft long drooping needles, narrow open crown; *Pinus ponderosa*: thick orange-brown plated bark, long needle tufts, open rounded crown; *Pseudotsuga menziesii*: dense conical crown, drooping branch tips, dark grey-brown bark), plus three forest animals: a red fox (field researcher and tailor), a red squirrel (assistant) and a tawny owl (thoughtful judge).
- Semantic colour inside the pictures: anything that stands for a straight-line model (plain sticks, poles) is painted in muted course purple `#5D2890`; orange `#F3A712` only as one tiny focus accent where stated; everything else natural forest greens, bark browns, warm parchment and graphite.

### Shared style block (append to every prompt)

```text
Style/medium: rich warm storybook natural-history WATERCOLOUR AND GOUACHE, organic brushwork, dimensional bark, needles, rocks and moss, gentle academic humour, natural animal and tree anatomy; match the painterly quality of the supplied L08 and L10 title references but NOT their subjects.
Recurring cast (draw exactly like this in every image): three North American conifers — (1) western white pine (Pinus monticola): slender trunk, soft long drooping needles, narrow open crown; (2) ponderosa pine (Pinus ponderosa): thick orange-brown plated bark, long needle tufts, open rounded crown; (3) Douglas fir (Pseudotsuga menziesii): dense conical crown, drooping branch tips, dark grey-brown bark. Trees have no faces. Animal characters: a red fox, a red squirrel and a tawny owl, natural anatomy, expressive eyes, no clothing unless stated.
Setting: mountain conifer forest and a simple field station; compact scene, no broad empty sky.
Colour: natural forest greens, bark browns, warm parchment, graphite; any plain stick or pole that stands for a straight model line is painted muted indigo purple #5D2890; no other saturated purple or orange.
Transparency and framing: genuinely transparent RGBA background outside an irregular painted vignette; no rectangular border, sky fill, white wash, glow or checkerboard; complete silhouettes, nothing clipped.
Absolute constraints: no text, letters, numbers, tick marks or scales on any tool, formulas, graph axes, charts, arrows, logos or watermarks; never imply a statistical result, a winner, or that one tree species is taller than another; no photorealism, no flat paper-cut or cartoon style, no human figures.
```

### G1 — `stromy_mereni.png` (slide 2)

- Teaching role: make the three measured quantities concrete (species, trunk diameter at 1,3 m, tree height) before the data appear.
- Czech alt text: „Liška na lesní měřicí stanici omotává pásmo kolem kmene ve výšce prsou a veverka zaměřuje vrchol stromu; vedle sebe stojí tři různé jehličnany.“
- Acceptance: the tape is clearly at chest height beside a marker post; the height measurement reads as an action; the three species are distinguishable and not ranked by height; no markings on the tools.

```text
Use case: scientific-educational lecture illustration. Asset: stromy_mereni.png, landscape 16:9, about 1672 x 941 px, transparent RGBA vignette.
Input images: L08 and L10 title illustrations = painterly style and transparency reference only. The current paper-cut stromy_mereni.png = scene-function and composition reference only; do not copy its medium or its human figures.
Primary request: a light, humorous but scientifically grounded scene showing how foresters measure conifers. At a small forest measuring station, the red fox wraps a plain unmarked diameter tape around a trunk at chest height; a short plain wooden marker post beside the trunk shows that height. The red squirrel sits on a stump and sights the top of a tree through a plain handheld clinometer, as if measuring tree height. The three conifers of the cast stand side by side with similar trunk thickness; their tops are partly framed so no species looks deliberately taller. A small field table with a plain notebook (blank pages) and a pencil sits at one side.
Composition: wide, compact, trees and characters centred, readable when projected at about 900 px wide; the tape, marker post and clinometer action must be readable at first glance.
[append the shared style block]
```

### G3 — `stromy_krejci.png` (slide 42)

- Teaching role: a metaphor for fit versus complexity. Tailoring to every bump of one tree fits this tree but adds many seams; a simple coat fits well enough and would fit another tree too.
- Czech alt text: „Liška krejčí šije jehličnanu oblek s desítkami švů a špendlíků, které kopírují každý hrbol kmene; vedle visí jednoduchý dobře padnoucí kabát a za nimi čeká další strom.“
- Acceptance: neither garment is shown as winning; the over-tailored suit looks effortful rather than wrong; the waiting tree introduces the doubt without text; the tape has no marks.

```text
Use case: scientific-educational lecture illustration. Asset: stromy_krejci.png, landscape 16:9, about 1672 x 941 px, transparent RGBA vignette.
Input images: L08 and L10 title illustrations = painterly style reference only; the current paper-cut stromy_krejci.png = composition and teaching-role reference only.
Primary request: an open-air forest tailor's corner. The red fox, as a tailor with a plain unmarked tape draped over its shoulders, fits one young ponderosa pine into an absurdly over-tailored garment with dozens of seams, patches and pins that trace every bump and knot of the trunk. Beside it, on a simple wooden stand, hangs a plain, well-cut coat with only a few seams that would fit the same tree shape well. Behind them a second, slightly differently shaped Douglas fir waits in line, leaning a little as if doubtful that the over-tailored garment would fit it. Both garments are made of muted indigo-purple wool (#5D2890), because both stand for models; the many pins may carry one tiny orange accent.
Composition: tailor, tree and suit left-centre, coat on its stand right-centre, waiting tree slightly behind; compact, readable at about 900 px wide.
[append the shared style block]
```

### G2 — `stromy_porota.png` (slide 47)

- Teaching role: the candidate-set limit. We rank only the candidates we invited; a model outside the set could describe the trees better.
- Czech alt text: „Porota lesních zvířat s prázdnými hodnoticími kartičkami posuzuje na pódiu tři kandidáty, každého s jiným uspořádáním rovných tyček; za pootevřenými dveřmi čeká čtvrtý kandidát s prohnutou tyčkou.“
- Acceptance: the three candidates are visually equal; the score cards are blank; there is no crown, podium ranking or winner; the fourth candidate is clearly outside the judged set.

```text
Use case: scientific-educational lecture illustration. Asset: stromy_porota.png, landscape 16:9, about 1672 x 941 px, transparent RGBA vignette.
Input images: L08 and L10 title illustrations = painterly style reference only; the current paper-cut stromy_porota.png = composition and teaching-role reference only.
Primary request: a small forest theatre stage made of logs. In the foreground a jury of the tawny owl, the red fox and the red squirrel sits on a log bench, each holding a plain blank score card. On the stage stand three small potted young conifers of equal size, each with a plain stick accessory painted muted indigo purple #5D2890: the first has one straight stick; the second has three parallel straight sticks; the third has three straight sticks that fan out from a common base. Through a half-open side door at the edge of the stage, a fourth potted conifer peeks in, unnoticed by the jury; its single purple stick is gently curved. No crown, medal, podium steps or spotlight on any candidate.
Composition: jury seen from behind or three-quarter view in the lower foreground, three candidates evenly spaced on the stage, the door at the right edge; readable at about 800 px wide.
[append the shared style block]
```

### G4 — `stromy_strop.png` (slide 55)

- Teaching role: open question bridging to the next lesson. A straight line keeps rising where real growth levels off.
- Czech alt text: „Řada jehličnanů od mladých po staré: jejich výška nejprve roste a pak se ustálí, zatímco obří rovná fialová tyč stoupá dál až do mraků; liška a veverka se na ni udiveně dívají.“
- Acceptance: the levelling-off is visible but gentle; it reads as an age sequence, not a species ranking; no scale marks; the image reads as a question, not as evidence about the L09 data.

```text
Use case: scientific-educational lecture illustration. Asset: stromy_strop.png, landscape 16:9, about 1672 x 941 px, transparent RGBA vignette.
Input images: L08 and L10 title illustrations = painterly style reference only; the current paper-cut stromy_strop.png = composition and teaching-role reference only.
Primary request: a row of conifers on a gentle mountain slope, arranged from young and slim on the left to old and very thick on the right. Their heights rise at first and then clearly level off among the oldest, thickest trees. Mix the three species of the cast along the row so it reads as an age sequence, not a species ranking. A giant straight plain pole painted muted indigo purple #5D2890 leans along the row from the base of the youngest tree and keeps rising past the tallest crowns into soft clouds. At the foot of the pole the red fox and the red squirrel look up at it, puzzled.
Composition: wide, the row of trees and the pole dominate, characters small in the lower left; a few soft clouds only where the pole ends; readable at about 1000 px wide.
[append the shared style block]
```

### T — `stromy_titulni_ilustrace.png` (slide 1)

- Teaching role: introduce the lesson question „Jak poznáme, že je model dobrý?“: three candidate descriptions of the same measured trees, judged thoughtfully, with no winner.
- Reference assets to supply: the redrawn G1 and G2 (characters and style); `L08/Presentation/Materials/krabi_titulni_ilustrace.png` and `L10/Presentation/Materials/ostrovy_titulni.png` (portrait composition, painterly style, transparency only); the slide 18 figure of the three candidate models, saved unchanged as `Presentation/Materials/title_references/kandidatni_modely.png` (motif only: one line, three parallel lines, three fanned lines).
- Czech alt text: „Liška a veverka u terénního stolku s pásmem pod třemi různými jehličnany; opřené dřevěné destičky ukazují tři uspořádání fialových tyček a sova je z větve zamyšleně posuzuje. Ilustrace vytvořená pomocí AI.“
- Caption: „Ilustrace vytvořená pomocí AI.“ through `ai_disclosure()`.
- Acceptance: the three boards are equally prominent and none is marked; readable at about 360–380 px wide on the indigo title background.

```text
Use case: scientific-educational title illustration. Asset: stromy_titulni_ilustrace.png, PORTRAIT 3:4, about 1086 x 1448 px, genuinely transparent RGBA background with an irregular natural silhouette; it must look rich and readable at only 360-380 px wide on a deep purple #5D2890 slide.
Input roles: the L08 crab title and the L10 island title = painterly style, portrait composition, depth and transparent-vignette reference ONLY (do not include their animals, islands or objects). The redrawn L09 measurement and jury illustrations = character and style references for the fox, squirrel, owl and the three conifers. The L09 three-panel candidate-model figure = ONLY the idea of three line arrangements (one line; three parallel lines; three fanning lines); no part of the chart may appear.
Primary scene: a compact mountain-forest vignette. The three conifers of the cast rise tall behind a small field table in the lower foreground. At the table the red fox holds a plain unmarked diameter tape and the red squirrel holds a plain clinometer. Leaning against the table stand three small plain wooden boards of equal size; on each board short sticks painted muted indigo purple are fixed: one straight stick on the first, three parallel straight sticks on the second, three straight sticks fanning from a common base on the third. On a low branch above, the tawny owl looks down at the three boards thoughtfully. No board is highlighted, crowned or chosen.
Composition: tall tapered vignette; the fox, squirrel and three boards readable first, the trees framing them; modest breathing room around complete silhouettes; dark/light separation so it reads on purple.
[append the shared style block]
```


### Provenance of the redrawn files

The four in-deck files and the portrait title were generated on 2026-10-19 using OpenAI built-in `image_gen`, following the user's request to execute the prompts above. The underlying model identifier was not exposed by the tool. Each selected PNG was copied unchanged into this directory, retaining genuine RGBA transparency; no raster resizing, recolouring or background removal was performed outside the image-generation tool. Exact submitted prompts, reference paths, selected output identifiers and all targeted corrections are in [`GENERATED_IMAGE_PROMPTS_20261019.json`](GENERATED_IMAGE_PROMPTS_20261019.json). The 2026-10-05 prompt JSON remains unchanged as historical provenance. Visual checks confirmed the recurring forest cast, purple model objects, unmarked measurement tools, blank score cards, the three candidate-stick arrangements and no winner.

| File | Slide | Dimensions | Fully transparent pixels | SHA-256 | Superseded paper-cut SHA-256 |
|---|---|---|---|---|---|
| `stromy_mereni.png` | 2 | 1672 × 941 px, RGBA | 34,0 % | `4D09D3ACEB0CF9E015C978C4BAB34CE6415B7D823EBF8236A8E9D3BA9DECF407` | `f8116ce0bb94c930bb6b8fdaa62001c9d8d77a15ce298e14d87658dfcffe7ebc` |
| `stromy_krejci.png` | 42 | 1672 × 941 px, RGBA | 28,1 % | `094A2A5045E7ACF95EB671C3737B9620868EF8B5BFB403F728351484BC2EF25A` | `52d4cd542768907b983f206da803123ee33d6202c71d69aa253ec5e707c87589` |
| `stromy_porota.png` | 47 | 1672 × 941 px, RGBA | 18,1 % | `5AFB2C720BD784BB3CF9FC1F456E154EE897AD503D259A44A62AD4B2F3F5810E` | `f8e22cde5136dad0f9d8455742877e8d44c74e1774ebdcfd6d2ced189611299f` |
| `stromy_strop.png` | 55 | 1672 × 941 px, RGBA | 46,7 % | `A7950B0AE201CA5ECD4DE54AFFF72B5F648093E07BA0470A92F7B6FD80AEF922` | `5294cf14c872d2970f3a3e77fedfc6ffe8947770bbcb8127ea0a6784ee0dcf1a` |

The alt texts and speaker notes of slides 2 and 55 now describe the new images. The portrait title image `stromy_titulni_ilustrace.png` is also integrated: 1087 × 1446 px, RGBA, SHA-256 `f13f08bd809217467bf2ca67a67012d26c4fef8c8196f42e634689802c67a56c`; there is no superseded title asset. It was generated after the four in-deck scenes and uses the actual selected G1/G2 images and the actual slide 18 candidate-model figure as references.

| File | Selected tool output | Targeted corrections |
|---|---|---|
| `stromy_mereni.png` | `exec-36840f5b-c93b-4f24-8614-68bb3370682c.png` | Two corrections for blank tools and complete treetops |
| `stromy_krejci.png` | `exec-f6357baa-d6aa-4f2f-b60e-572518254989.png` | Framing of the tree crown |
| `stromy_porota.png` | `exec-01a0589a-88ba-49f1-8678-854b43658e57.png` | Initial output selected directly |
| `stromy_strop.png` | `exec-927da647-2145-45a2-839d-1f4c0e662c8d.png` | Framing of the cloud and outer vignette |
| `stromy_titulni_ilustrace.png` | `exec-197d43c5-77b5-4f89-8a9f-256583f5c4ec.png` | Blank measuring props and treetop framing |

Earlier iterations remain outside the repository in the tool output directory. Local pre-edit backups and validation evidence are ignored under `Temp/image-regeneration-20261019/`. No human approval of the finished images is implied by generation.

### Inspected reference assets and reuse terms

The L08/L10 title images and historical L09 illustrations were supplied for the roles specified above, with no reuse of unrelated organisms or settings. The title generation additionally received the actual selected L09 G1/G2 PNGs and the unchanged lesson figure retained in `title_references/`. These are original course illustrations/figures governed by the educational-content terms in their repositories' `LICENSE.md` (CC BY 4.0, credit Ondřej Mottl and contributors, Charles University, 2026). The candidate-model figure uses J. Marshall's University of Idaho tree data (`lgrdata::allometry`, CC0); the generated title uses only its candidate-line motif and does not reproduce a chart, numerical result or species ranking. The new illustrations follow L09's educational-content reuse terms, with AI origin disclosed on every occurrence.

| Reference | Role | SHA-256 of supplied bytes |
|---|---|---|
| `L08/Presentation/Materials/krabi_titulni_ilustrace.png` | Painterly style, portrait vignette and transparency only | `a2ff8b9cf74d22277ca70d5fc69c3da8d7962036462634d6318fd09d566368df` |
| `L10/Presentation/Materials/ostrovy_titulni.png` | Painterly style, portrait vignette and transparency only | `2bfdd5f98300a9e52cfa73fc8052ad893c6934a106a12cc6843680572ec27458` |
| Historical L09 G1–G4 | Composition and teaching role only | Superseded hashes in the table above |
| Current `stromy_mereni.png` | Title: recurring cast, measurement props and style | `4d09d3aceb0cf9e015c978c4bab34ce6415b7d823ebf8236a8e9d3ba9decf407` |
| Current `stromy_porota.png` | Title: recurring cast and three equally prominent candidate motifs | `5afb2c720bd784bb3cf9fc1f456e154ee897ad503d259a44a62ad4b2f3f5810e` |
| `title_references/kandidatni_modely.png` | Actual slide 18 figure; one line, three parallel lines, three fanned lines as motif only | `cd9e9e6e934b37a3b9605b16ed016b27479bcd96244b333895adab3b566a17c6` |

### Local integration and validation (2026-10-19)

The existing slots on slides 1, 2, 42, 47 and 55 consume the selected files. Czech alt text and speaker notes on slides 2 and 55 describe the new animal-led scenes; the existing disclosure helper and the other three alt texts remain in use. This task changes image assets and matching metadata, not the lesson narrative or statistical evidence.

Validation passed with the canonical `Rscript R/render_presentation.R` build and `POLLSLIVE_RENDER_MODE=offline`, without dispatching PollsLive synchronization. The PDF has 55 pages; pages 1, 2, 42, 47 and 55 were rendered to PNG and visually inspected. All five corresponding HTML sections were also inspected in Chromium, including the complete title on its purple background. The local offline HTML has one additional quiz slide, so its displayed positions are 1, 2, 43, 48 and 56. The images are readable, retain the intended three candidate motifs, fit the existing layouts and show visible AI disclosure. PDF/HTML screenshots are under the ignored evidence directory above.

Programmatic checks passed for all five RGBA alpha channels (0–255), exact saved-versus-embedded PNG SHA-256 identity (both `src` and Reveal lazy-load `data-src`), UTF-8 without BOM or replacement characters, and byte identity between `Presentation/presentation.html` and `docs/index.html`. Only the affected image sections were visually reviewed; this was not a new complete-deck pedagogical review or a remote live-quiz acceptance check. No commits, pushes or publication were performed.

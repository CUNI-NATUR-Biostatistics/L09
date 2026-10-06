# Generated illustration provenance

## Scope

- Lesson: L09 — Porovnání kandidátních modelů: R², adjustované R² a AIC
- Status: **generated and integrated on 2026-10-05.** The approved plan (G1–G4) is recorded in `Workflow/records/2026-10-05-stage-4-presentation.md`. All four placeholder positions in `Presentation/presentation.qmd` now display the selected illustrations. Human review of the finished presentation remains open.
- Generation route: OpenAI built-in `image_gen`, one generation per image, followed by one targeted edit each for G1 and G3. Selected images are stored here as opaque landscape PNGs (1672 × 941, approximately 16:9). The exact submitted prompt set and selected/rejected output identifiers are recorded in `GENERATED_IMAGE_PROMPTS.json`.
- Student-facing metadata: each occurrence has Czech alternative text and the visible caption `Ilustrační obraz vytvořen AI.` in `Presentation/presentation.qmd`.
- Teaching boundary: the illustrations are context and memory devices. Statistical evidence remains attached to the observed tree data and model-derived figures.
- Rejected earlier assets: `Learning_materials/images/model-casting.jpg`, `one-ruler-three-trees.jpg` and `complexity-machine.jpg` were rejected by Ondřej Mottl on 2026-10-05 and are not used in the presentation.

The approved scene prompts below remain the design specification. The generation record gives selected outputs, targeted edits, rejected variants and SHA-256 hashes of the local deliverables; the files have not been committed by the assistant.

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

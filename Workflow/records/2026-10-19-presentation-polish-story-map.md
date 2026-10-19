# L09 presentation polishing story map

## Scope and approval record

- Artifact: complete `Presentation/presentation.qmd`, including the PollsLive retrieval block.
- Date: 2026-10-19.
- Branch: `polish/l09-before-teaching`; base: `main` `875fcde` (created 2026-10-19 with explicit authorization).
- Requested work: resolve findings A1–A9 and C1–C9 in [the review](2026-10-19-polish-review.md), with decisions D1–D4 recorded there. C10 rejected by the author; C11 belongs upstream.
- Story-map status: complete.
- Heading-strip audit completed: [x].
- Knowledge-state audit completed: [x].
- Human story-map approval: approved.
- Approver: Ondřej Mottl.
- Approval date: 2026-10-19.
- Decision and requested revisions: „I do not like (C10) keep only what we do know. Other than that, I approve“ (2026-10-19). Row 12 revised: no „Zatím nevíme“ fragment; the slide keeps only the „Známe“ strip.
- This map is separate from the learning-material map and needs its own approval. It is derived from the revised written backbone. The PollsLive quiz content, option order and evidence assets are unchanged.
- Illustrations (D4): this workstream supplies the prompts, alt texts, reference lists and reserved slots; another model generates the images.

## Deck-wide rules

- Slide count stays at 55, with six H1 dividers (8, 14, 21, 33, 41, 48). Fragment states do not count as slides.
- Species palette unchanged (teal `#4E9A8A`, terracotta `#C2613A`, steel blue `#2E6CA4`), now with shapes 16 / 17 / 15 as a second cue in every species figure (D3, same as the written materials and exercise).
- `format_value_cz()` (with `math = TRUE` in LaTeX) replaces `format_cz()` and the inline `format_cz_math()`. `use_ragg_brand_fonts()` replaces `showtext_auto(FALSE)` and `family = ""`. Helpers are ported from L08 into `R/` and `R/Functions/`, including `include_optional_figure()` and `ai_disclosure()`.
- Visible code: newline after `<-` for function calls; visible data path `read.csv(file = "data/allometrie_stromu.csv")` with `root.dir`, as in L08.
- Every illustration uses `include_optional_figure()`, the disclosure „Ilustrace vytvořená pomocí AI.“ through `ai_disclosure()` (`.text-size-tiny .text-right`) and a speaker note explaining the metaphor. The current paper-cut files stay in place until the watercolour replacements, saved under the same file names, are supplied.

## Complete physical story map

„Retain“ means heading and content stay; listed changes apply.

| Order | Internal role | Level | Student-facing heading | Speaker note |
|---|---|---|---|---|
| 1 | Arrival screen | H2 | Jak poznáme, že je model dobrý? | Retain the question, L09, formal title and link. Add `.course-title-illustrated` with the reserved slot `stromy_titulni_ilustrace.png`, caption via `ai_disclosure()` and a speaker note (C1). |
| 2 | Measurement-context hook | H2 | Co vlastně na stromě měříme? | Retain layout and question. Watercolour G1 in the same slot; standard disclosure; note: liška měří průměr ve výšce prsou, veverka zaměřuje vrchol; obraz nic neříká o rozdílech mezi druhy. |
| 3 | Retrieval title | H2 | Co si pamatujete z minulé lekce? | Unchanged generated include. |
| 4 | Retrieval Q1 | H2 | Co ukazují nerovnoběžné přímky modrých krabů? | Unchanged. |
| 5 | Retrieval Q2 | H2 | Co znamená koeficient pohlavisamec v modelu s interakcí? | Unchanged. |
| 6 | Retrieval Q3 | H2 | Čím se liší dva kandidátní modely pro modré kraby? | Unchanged. |
| 7 | Learning contract | H2 | Výsledky učení | Shared five outcomes; „Po absolvování této přednášky budete schopni:“; incremental; restrained highlights; balanced vertical placement. |
| 8 | Section divider | H1 | Jedna přímka pro všechny stromy? | Retain. |
| 9 | Data entry and bridge | H2 | Jeden řádek tabulky představuje jeden strom | Visible `read.csv(file = "data/allometrie_stromu.csv")`; Czech decimals in the data panel. New short line (D2): „Jiné stromy než minule: tři druhy jehličnanů, výška je tentokrát odezva.“ Note: v minulé lekci výška pomáhala odhadnout objem dřeva střemchy. |
| 10 | Anchor graph | H2 | Jak se výška mění s průměrem kmene? | Retain; species shapes added. |
| 11 | Familiar model | H2 | Jedna společná přímka pro všechny druhy | Retain; shapes; visible code formatting. |
| 12 | Summary retrieval | H2 | Co už umíme přečíst ze `summary()`? | Retain unchanged: only the „Známe“ strip (C10 rejected by the author). |
| 13 | Residual evidence | H2 | Zůstává v residuích rozdíl mezi druhy? | Retain; shapes. |
| 14 | Section divider | H1 | Tři představy o růstu stromů | Retain. |
| 15 | Candidate generation | H2 | Jaké jiné přímky by mohly stromy popsat? | Retain; shapes. |
| 16 | Candidate set | H2 | Tři modely vyjadřují tři biologické představy | Retain. |
| 17 | Same response, same trees | H2 | Všechny tři modely odhadneme ze stejných 63 stromů | Retain (63 inline). |
| 18 | Prediction vote | H2 | Který model prochází nejblíže pozorovaným stromům? | Retain; shapes. |
| 19 | Reveal | H2 | Nejblíže procházejí přímky s různými sklony | Grammar fix (C4). |
| 20 | Criteria | H2 | Podle čeho poznáme lepší model? | Retain. |
| 21 | Section divider | H1 | Jak změřit shodu modelu s daty? | Retain. |
| 22 | RSS retrieval | H2 | Co už víme o součtu čtverců residuí? | Card titles „Hledání přímky“, „Typická velikost residuí“, „Skupinové průměry“ instead of L03/L04/L06 (C3). |
| 23 | Mean-only reference | H2 | Je přímka lepší než předpověď průměrem? | Labels A–F offset so they do not cover the points. |
| 24 | Total sum of squares | H2 | Jak velké jsou rozdíly výšek kolem průměru? | Retain; label offset. |
| 25 | RSS on six trees | H2 | Kolik rozdílů zůstane po odhadnutí přímky? | Answer fragment after the question (C7): nejvýše nad přímkou leží strom X, nejvíce k RSS přispívá strom Y (computed); umocnění odstraní znaménko. |
| 26 | Captured proportion | H2 | Jakou část rozdílů přímka zachytila? | Retain; `format_value_cz(math = TRUE)`. |
| 27 | R² named | H2 | Zachycený podíl se jmenuje R² | Retain. |
| 28 | Rotation animation | H2 | Jak se mění RSS a R², když přímku natáčíme? | Retain; brand fonts in frames. |
| 29 | Static fallback | H2 | Stejných šest stromů, čtyři natočení přímky | Retain. |
| 30 | Full-data check | H2 | Dává `summary()` stejné R² pro všech 63 stromů? | Retain. |
| 31 | MCQ (blank heading) | H2 | (blank) | Retain; vertical balance so the options and explanation do not cluster at the top. |
| 32 | R² limits | H2 | Co R² popisuje a na co nestačí? | Retain. |
| 33 | Section divider | H1 | Pomáhá každý koeficient navíc? | Retain. |
| 34 | Prediction vote | H2 | Co udělá R² po přidání druhu a interakce? | Retain options. |
| 35 | Reveal and misconception | H2 | R² po přidání členů neklesne | Reveal sentence covers A and C (C8): „R² poroste, nebo nejhůř zůstane stejné; klesnout nemůže.“ Value labels clear of the points. |
| 36 | Coefficient matching | H2 | Které koeficienty jednotlivé modely odhadují? | Larger card text; one coefficient name per line without mid-name wraps (C6). |
| 37 | Adjusted-R² construction | H2 | Jak R² opravit za počet koeficientů? | Retain. |
| 38 | Prediction vote | H2 | Co udělá adjustované R² po přidání interakce? | Retain; balanced vertical placement. |
| 39 | Reveal | H2 | Adjustované R² po přidání interakce klesne | Retain; larger legend. |
| 40 | Spine return | H2 | Co už o třech modelech víme? | Retain. |
| 41 | Section divider | H1 | Kdy se složitost vyplatí? | Retain. |
| 42 | Parsimony | H2 | Vyplatí se model šitý na míru? | Watercolour G3 in the same slot; standard disclosure; new note: obleček s desítkami švů sedí jen na jeden strom, jednoduchý kabát padne i dalším; obraz nerozhoduje, který model je lepší. |
| 43 | AIC named | H2 | AIC váží shodu i složitost | Retain; balanced vertical placement. |
| 44 | MCQ and comparability | H2 | Model má AIC 398,64. Je to dobrý model? | Retain (value inline); balanced vertical placement. |
| 45 | ΔAIC | H2 | O kolik je AIC každého kandidáta vyšší než nejnižší? | Retain. |
| 46 | Metric synthesis | H2 | Ukazují R², adjustované R² a AIC na stejný model? | Retain. |
| 47 | Candidate-set caveat | H2 | Nejlépe podporovaný kandidát nemusí být dobrý model | Watercolour G2 in the same slot; standard disclosure; new note: porota hodnotí jen pozvané kandidáty; čtvrtý za dveřmi s prohnutou tyčkou připomíná, že lepší popis může ležet mimo sadu. |
| 48 | Section divider | H1 | Obstojí vybraný model? | Retain. |
| 49 | Diagnostic return | H2 | Zůstává v residuích modelu s posunem mezi druhy nějaký vzorec? | Figure enlarged (about `fig-height: 4.6`), normal text size, shapes (C6). The fragment with the curve gains one plain line (A8): „Oranžová křivka jen vyhlazuje průběh bodů, aby byl vzor lépe vidět.“ Note corrected: the curve is new here, not from L08. |
| 50 | Influence check | H2 | Které stromy ovlivňují model nejvíc? | Retain; note: Cookova vzdálenost byla v předchozích lekcích jen v doplňujícím textu, proto ji krátce vysvětlit. |
| 51 | Silent write | H2 | Obhajte model dvěma větami | Retain. |
| 52 | Spine answer | H2 | Který model lze pro tyto stromy nejlépe obhájit? | Retain (arch already among the limits). |
| 53 | Workflow | H2 | Jak porovnávat modely bez automatického hledání? | Retain. |
| 54 | Summary | H2 | Co si odnést | Bullets mirror the shared outcomes. |
| 55 | Closing question | H2 | Co když žádná přímka nestačí? | Watercolour G4 in the same slot; standard disclosure; new note: rovná tyč stoupá dál, i když stromy už nerostou; otázku nechat otevřenou pro následující lekci. |

## Chronological knowledge-state ledger

| Block / rows | May assume before | Introduced or earned here | Must not assume yet | Visible evidence / experience |
|---|---|---|---|---|
| Opening / 1–7 | L08 interaction and the L08 closing question; retrieval uses only L08 crab evidence | Lesson question; outcomes | Tree data, metric meaning | Title and measurement illustrations, retrieval |
| One common line / 8–13 | `lm()`, `summary()`, residual plots; the L08 cherry trees (height as predictor) | New trees with height as response; species structure in residuals | Candidates, metrics | Bridge line, data panel, anchor graph, summary with known/open lines, residual means |
| Candidates / 14–20 | Additive and interaction formulas | Frozen candidate set; same response and rows; closest is not yet best | Metric names | Sketch task, cards, three `lm()` calls, vote and reveal |
| R² / 21–32 | RSS from earlier lessons | Total sum of squares; R² named after it is computed; rotation; full-data equality; limits | Highest R² is best | Six trees, answer fragments, animation and fallback, MCQ |
| Complexity / 33–40 | R² | Nested monotonicity; coefficient counts; adjusted R² | AIC | Votes, matching task, construction, spine return |
| Parsimony and AIC / 41–47 | Fit versus complexity | Parsimony; AIC as relative; comparability; ΔAIC; disagreement; candidate-set limit | Likelihood mechanics | Tailor and jury illustrations, `AIC()` output, MCQ, ΔAIC table |
| Diagnostics and defence / 48–53 | Residual and Q–Q plots | Smoothed curve as a reading aid (new); residual arch; Cook's distance (brief); conditional defence | Remedies for curvature | Enlarged diagnostics, Cook plot, written defence, evidence card |
| Close / 54–55 | Whole lesson | Key ideas; open question about non-straight relationships | Transformations, nonlinear fitting | Summary; closing illustration |

## Illustrations (D4): prompts for the image model

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

### Record and integration after generation

- When the author supplies each file: save it unchanged under the name above, record the tool, date, dimensions, transparency and SHA-256 in `Presentation/Materials/GENERATED_IMAGES.md`, mark the paper-cut versions as superseded (with their recorded hashes), and inspect the slide in HTML and PDF.
- Until the title file exists, the reserved slot shows nothing and no caption.

## Implementation and review contract

- Order: after the written backbone; clean-session run of visible chunks; offline canonical render through `R/render_presentation.R`; full PDF inspection plus HTML inspection of initial, intermediate and final fragment states on changed slides; separate read-only review with `.ai/agents/vision-corrector.md` (capable general-purpose model, balanced effort); human review.
- Author audit: no lesson code in visible copy; no sequencing words; the smoothed curve explained on first appearance; computed values only; Czech decimals; object locality unchanged.

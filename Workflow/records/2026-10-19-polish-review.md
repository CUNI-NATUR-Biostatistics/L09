# L09 polishing review

## Scope

- Date: 2026-10-19.
- Artifacts: `Learning_materials/skripta.qmd`, `Presentation/presentation.qmd`, `Exercises/cviceni.R` at `main` `875fcde` (released L09-v1.1.0 plus the 2026-10-15 PollsLive recolouring).
- Basis: canonical `.ai/` guidance and a two-way comparison with the polished L08 (polish round 2026-10-15 plus the continuous-interaction addition of 2026-10-17) and with the L10 opening, which builds on L09.
- Method: complete source read of all three artifacts and the Stage 2, Stage 4 and exercise records; committed `skripta.pdf` (29 pages) and `presentation.pdf` (55 slides, final fragment states) inspected page by page; roughnotation fragment behaviour checked in the HTML; `cviceni.R` parsed and sourced in a clean `--vanilla` session from a temporary two-file layout, and every hand-typed expected value recomputed (all reproduce).
- Not yet done: HTML inspection of initial and intermediate fragment states, independent reviewer subagents, glossary-coverage pass, novice timing trial. These belong to the implementation stage.
- Branch: none yet. Suggested: `polish/l09-before-teaching` from `main` `875fcde`.

## Key data facts used by the review

- 63 trees (19 *P. monticola*, 22 *P. ponderosa*, 22 *P. menziesii*), no missing values; diameter 4,8–73,7 cm, height 3,6–45,0 m.
- R² 0,768 / 0,793 / 0,797; adjusted R² 0,764 / 0,782 / 0,779; AIC 398,64 / 395,44 / 398,27; ΔAIC 3,20 / 0 / 2,83 (common / additive / interaction).
- Six-tree example: total sum of squares 836,76 m², RSS 147,60 m², R² 0,824. Mean residual of *P. monticola* under the common line +2,7 m.
- Additive model: residual arch over fitted height (recorded in the Stage 4 record), 4 trees above 4/n, largest Cook's distance at row 12.

## Findings

### A — cross-artifact

| ID | Finding | Proposed resolution |
|---|---|---|
| A1 | **The residual arch is missing from the written materials.** The deck (slides 49, 52, 55) and the exercise (U07, U08, recap) name the arch as the main limitation and the bridge to L10. The skripta interprets neither residual plot: the „Detektivní práce s residui“ and „Rozhodnutí po kontrole modelu“ boxes have no payoff, the spine answer cites only the Q–Q plot and sample size, and the L10 box is hypothetical („Pokud…“). L10 now opens by showing this arch and says L09 ended with that open question, so the backbone document is behind both its own deck and the next lesson. Open author decision since 2026-10-06. | Interpret both residual plots in the skripta (species offset for the common line; arch for the additive model), add the arch to the spine answer, and make the closing box concrete. |
| A2 | **L08 now contains a tree example.** Since 2026-10-17 L08 analyses 31 black-cherry trees as `data_stromy` with `prumer_cm` and `vyska_m`, where height is a *predictor* of wood volume. L09 uses `data_stromy`, diameter and height again, with height as the *response*. L09's scope assumed a dataset new to students, and none of the L09 artifacts acknowledge the overlap. | Decision D2. |
| A3 | Three species palettes: skripta `#0072B2`/`#D55E00`/`#5D2890` (two collide with brand semantic orange and purple), deck brand categorical teal/terracotta/steel blue (approved 2026-10-05), exercise `#3B7A57`/`#9A6B35`/`#566D8C` with shapes. The model and mean lines also differ: skripta black common line, purple mean line, orange Q–Q line; deck purple model line and graphite dashed mean. | Use the deck's approved palette everywhere, plus the exercise's shapes as a second cue; use the deck's semantic line colours in the skripta. |
| A4 | Learning outcomes differ: skripta 6 items („Co se v této lekci naučíte“, „Po absolvování lekce budete umět“), deck 5 („Po lekci dokážete“), exercise 4, README 4. | One shared list of five (below), with the course wording used in L08. |
| A5 | The skripta prints decimal points everywhere (prose „4.8 do 73.7 cm“, „76.8 %“, tables, equations), while the deck uses Czech commas. | L08 setup: `format_value_cz()` (with `math = TRUE`) and the hidden-chunk `OutDec` hook. |
| A6 | Data access: visible code in the skripta and deck uses `here::here("data", …)`, and the skripta gives no CSV link or save instruction. The exercise acquisition text is stale: it points to README links and GitHub „Download raw file“ and says the files will be on the web „Po vydání cvičení“, but the exercise was released in v1.1.0. | L08 pattern: stable CSV link, save to `data/`, visible `read.csv(file = "data/allometrie_stromu.csv")` with `root.dir`; exercise preamble with stable HUB URLs and the folder tree. |
| A7 | The parsimony prompt in the skripta compares 2 with 6 coefficients (common vs interaction, R² 0,768 vs 0,797) as models that fit „téměř stejně dobře“. Deck slide 42 was corrected to the genuinely close pair (4 vs 6). | Use the additive vs interaction pair in the skripta. |
| A8 | Slide 49 overlays a loess curve; its speaker note and the Stage 4 ledger say students know it from L08. Polished L08 has no smoothed residual curve (only `geom_smooth(method = "lm")` group lines), and the skripta never shows one. | Add one plain-language sentence where the curve first appears, as L10 does („křivka pouze vyhlazuje průběh bodů“), in both skripta and deck; correct the note and ledger. |
| A9 | Cook's distance is introduced with „Z předchozích lekcí také známe“, but L07 shows it only in a collapsed optional Extra. The slug `cookova-vzdalenost` now exists, so the TODO is stale. | Introduce it as new, keeping the existing short definition; wrap the glossary term. |

### B — learning materials

| ID | Finding | Proposed resolution |
|---|---|---|
| B1 | Setup still uses `if (!require()) install.packages()`, `library(tidyverse)` and an inline `<style>`/`<script>` glossary override. It has no brand theme, no brand fonts in figures, no `OutDec` hook and no `root.dir`. | L08 setup pattern. |
| B2 | No figure has `fig-alt`. Base-R figures are small, with default text size in the PDF (pages 7, 9, 11, 16). The legend overlaps points (p. 7), tree labels A–F overlap points (p. 16), and the three-panel figure (p. 13) is small with a cramped legend. | `fig-alt` everywhere, explicit `cex` sizes, larger figure sizes, `theme_biostat()` for ggplot figures. |
| B3 | Both sums of squares skip the collapsed stage of the equation pattern: the `align` block goes from the expanded squares straight to the total. The squared values appear only in the table. | Add the line of squared values (e.g. 2,86 + 42,01 + …) before the total, for both sums. |
| B4 | The six-tree `kable()` tables print the data-frame row names (1, 11, 22, 32, 43, 58) as an unlabelled first column next to „Strom A–F“ (pp. 14, 15, 17). | `row.names = FALSE`. |
| B5 | The generated coefficient list reads „Různé sklony — 6 koeficienty“ (should be „6 koeficientů“). The long coefficient names also wrap with stray spaces in the PDF (p. 20). | Use Czech plural logic; consider a two-column layout. |
| B6 | The optional Extra „Doplňující: Jak R vypočítá AIC?“ only repeats the `AIC()` table, which is already shown in the main route. It never explains the computation that story-map row 27 planned (likelihood-based fit plus a 2K penalty, in words). | Give the planned intuitive sketch, or retitle the box. |
| B7 | The ending differs from L08: no „Co bude následovat dál“ section and no „Závěrečná otázka“; the L10 bridge is a grey box after a page break. | L08 ending: spine answer → „Co bude následovat dál“ → „Shrnutí“ → „Závěrečná otázka“ → glossary. |
| B8 | Sequencing and authoring wording in prose: „Nejprve zkontrolujeme“, „Výpočet nejprve zapíšeme pomocí názvů veličin“, „Nejprve vztah vyjádříme…“, „Vztah nejprve zapíšeme…“, „Všechny vstupní hodnoty nyní zapíšeme“. „Nyní se vrátíme ke všem 63 stromům“ is also stale, because the previous section already used all 63, and „Dosadíme je přímo do výpočtu:“ is followed by a text-only equation. | Content-led transitions. |
| B9 | Five glossary TODOs remain without slugs: `celkovy-soucet-ctvercu`, `absolutni-hodnota`, `adjustovane-r2`, `princip-uspornosti`, `delta-aic`. | Decide whether to add them to `slovnik`; run a glossary-coverage pass after the edits. |
| B10 | The „Co vidíte v datech?“ callout header is orphaned at the bottom of p. 7, with its body on p. 8. | Re-check after B2 changes the figure size. |
| B11 | Visible-code details: unexplained `stringsAsFactors = FALSE, check.names = FALSE`; unnamed first argument in `table(data_stromy$druh_stromu, useNA = "ifany")`; literal hex colours. | Fix in place. |

### C — presentation

| ID | Finding | Proposed resolution |
|---|---|---|
| C1 | **No lesson-derived title image.** It was waived only for v1.1.0, so it blocks the next release. | Generate it after D4, from lesson figures and the illustration series. |
| C2 | The illustration series (G1–G4) uses the flat paper-cut style, but `presentation.md` now requires the watercolour/gouache storybook style, and L08 redrew its series in that style (its D3 was superseded). The disclosure is non-standard: `fig-cap` „Ilustrační obraz vytvořen AI.“ instead of „Ilustrace vytvořená pomocí AI.“ (`.text-size-tiny .text-right`, or the L08 `ai_disclosure()` helper). Slides 42, 47 and 55 have no speaker note explaining the metaphor. | Decision D4; standard disclosure and notes in either case. |
| C3 | Slide 22 shows the lesson codes „L03“, „L04“ and „L06“ as card titles, which `quarto.md` forbids in student-facing copy. | Content titles, e.g. „Hledání přímky“, „Typická velikost residuí“, „Skupinové průměry“. |
| C4 | Grammar in the slide 19 heading: „Nejblíže prochází přímky s různými sklony“. | „Nejblíže procházejí přímky s různými sklony“. |
| C5 | Brand fonts are switched off in figures (`showtext_auto(FALSE)`, `family = ""`), and `format_cz_math()` is defined inline in setup. | L08: `use_ragg_brand_fonts()` and `format_value_cz(math = TRUE)` from `R/`. |
| C6 | Composition. Slide 49: the diagnostic panels (`fig-height: 3.4`) fill only the top ~45 % in small text, with the prompt and reading in smaller text and an empty lower third. Slides 31, 38, 43 and 44 also leave the lower half empty. On slide 36 the coefficient cards are tiny and the names wrap awkwardly. | Enlarge slide 49 to ~4.6 with normal text and re-balance the others; full-size HTML check of all fragment states. |
| C7 | The slide 25 question („Který strom leží nejvýše nad přímkou? A který nejvíce přispívá k RSS?“) is answered only in the speaker notes, so the PDF and self-study readers get no answer. | Answer fragment, as on slide 31. |
| C8 | Slide 34 offers „poroste / může klesnout / zůstane stejné“, but the rule revealed on slide 35 is „neklesne“, which covers both A and C. | Say this explicitly in the slide 35 reveal. |
| C9 | Visible code puts function calls on the same line as `<-`, against the course style. | Course formatting. |
| C10 | Slide 12 does not mark the two still-open lines (`Multiple`/`Adjusted R-squared`), even though the story map planned to mark them. | A second fragment naming them as open questions. |
| C11 | The offline PollsLive variant has tiny evidence images and a stray „: “ after „Správná odpověď“ (slides 4–6). | Upstream (`_pollslive`/`_brand`); already reported in L08 C12. Not changed in L09. |

### E — exercise

| ID | Finding |
|---|---|
| E1 | The acquisition route is stale (see A6). |
| E2 | Its species palette differs from the deck's (see A3); keep the shapes. |
| E3 | It says „SST“, while the skripta and deck use „celkový součet čtverců“ / $SS_{\mathrm{total}}$. Its outcomes list differs (see A4). |
| E4 | The U03 scaffold lines exceed 80 characters (lines 330–342), and students must copy-edit the scaffold three times; the typing load was left open in October. |
| E5 | `stringsAsFactors = FALSE, check.names = FALSE` are explained as „Textové sloupce ponecháme jako text“, which is already the default in R ≥ 4. |

Timing: core route 70 min against the 85–95 min direct-work budget in `exercises.md` (the same gap as L08 before its polish). There is room for one more core step, for example reading the arch explicitly through per-species residual means (currently N15).

Validation passed: UTF-8 parse; clean `--vanilla` sourcing from a two-file layout. All expected values reproduce (R² 0,768/0,793/0,797, adjusted R² 0,782, SST 8084,56, N04 −4,17 / −3,73 / −5,96, N05/N08 0,374 and 399 vs 398, N12 1674,55, U07 4 trees, N13 row 12, the 7–69 cm grid inside every species' range).

## Shared learning outcomes (proposed)

„Po prostudování této lekce budete schopni:“ (written materials) / „Po absolvování této přednášky budete schopni:“ (deck) / „Po dokončení cvičení budete schopni:“ (exercise)

1. vypočítat koeficient determinace R² z celkového součtu čtverců a součtu čtverců residuí a vysvětlit, co popisuje;
2. vysvětlit, proč nejvyšší R² automaticky neznamená nejlepší model;
3. rozlišit, jak R², adjustované R² a AIC zacházejí se shodou a složitostí, a používat AIC jen k relativnímu porovnání;
4. sestavit malou sadu biologicky zdůvodněných kandidátních modelů se stejnou odezvou a stejnými pozorováními;
5. obhájit volbu modelu pomocí biologické otázky, složitosti, diagnostiky a interpretovatelnosti a pojmenovat její omezení.

## Decisions

| ID | Question | Recommendation |
|---|---|---|
| D1 | Name the residual arch in the written materials (A1)? | Yes. Interpret both residual plots, put the arch into the spine answer and „Co bude následovat dál“, and match the L10 opening. |
| D2 | How to handle the L08 tree example (A2)? | Keep the L09 data. Add one bridging sentence in the skripta and deck: in the previous lesson height helped predict wood volume; here it is the response, and these are different trees and species. The `data_stromy` name can stay, because each practical runs in its own project folder. |
| D3 | Species palette (A3)? | The deck's approved brand categorical palette in all three artifacts, plus shapes. |
| D4 | Illustration style (C2)? | Re-prompt G1–G4 in the course watercolour style (as L08 did), then generate the title image from them and lesson figures. The alternative is to keep paper-cut and record the deviation; the title image is required either way. |
| D5 | Scope of this round? | All three artifacts, as in L08; the exercise mostly needs A3–A6 alignment, not a rewrite. |

## Human decision

- 2026-10-19, Ondřej Mottl: „D1 - yes, D2 - agree, D3 - yes, D4 - yes, use the water color. but only specify the promts (I have another model actually making the images), D5 yes“.
- D1–D3 and D5 accepted as recommended.
- D4: the four in-deck illustrations are redrawn in the course watercolour/gouache style, followed by the title image. This workstream writes the prompts, alt texts, reference lists and reserved slots only; another model generates the images. Generated files are integrated, hashed and recorded in `GENERATED_IMAGES.md` when the author supplies them.
- 2026-10-19, Ondřej Mottl: „I do not like (C10) keep only what we do know. Other than that, I approve“. Both story maps and the exercise blueprint approved; C10 rejected (slide 12 keeps only the „Známe“ strip). Branch `polish/l09-before-teaching` created from `main` `875fcde` with that authorization.
- Story maps: [learning materials](2026-10-19-learning-material-polish-story-map.md), [presentation](2026-10-19-presentation-polish-story-map.md) (with the illustration prompts); exercise: [polish blueprint](2026-10-19-exercise-polish-blueprint.md).

## Implementation (2026-10-19)

- Shared helpers ported from L08: `R/format_value_cz.R`, `R/Functions/use_ragg_brand_fonts.R`, `include_optional_figure.R`, `ai_disclosure.R`.
- Written materials: all approved rows implemented; HTML and 34-page PDF rendered through `R/render_skripta.R` without warnings; every page inspected; manual page breaks reset so no callout header is orphaned and the six-tree tables stay whole.
- Presentation: all approved rows except C10 (rejected) implemented; offline canonical renders during the work, then a synchronized canonical render (`POLLSLIVE_RENDER_MODE=sync`) after the author pushed the branch.
  - The final render has 55 slides, and `Presentation/presentation.html` equals `docs/index.html`; the live QR block is present.
  - Receipt: source `875fcde`, client `17a62da`, `_pollslive` `6a8e0c1`. The quiz inputs are unchanged.
  - The only warnings are the existing Sass „variable used before declaration“ ones and the renv out-of-sync notice.
- Image records: `Presentation/Materials/GENERATED_IMAGES.md` gained a „Watercolour redraw and title image (2026-10-19)“ section (author decision: „Yes, add the GENERATED_IMAGES“). It holds the placement table, shared style block, prompts and pending status for all five files. The slide 18 candidate figure is saved unchanged as `Presentation/Materials/title_references/kandidatni_modely.png` as the title reference.
- Alt text and speaker notes of slides 2 and 55 were rewritten for the watercolour images when they were delivered (slides 42 and 47 already matched both).
- Exercise: approved addendum implemented; clean `--vanilla` sourcing from a two-file layout passes, all numeric expected values reproduce, the new U03 scaffold was solved for all three models and its plots inspected; the only line over 80 characters is the CSV URL (kept whole on purpose).

## Independent review outcomes (2026-10-19)

| Review | Model | Outcome | Resolution |
|---|---|---|---|
| Vision, written materials | Sonnet (capable general-purpose, balanced) | No HIGH. MEDIUM: the arch claim for the interaction model was not evidenced. LOW: `lowess()` explained after use, unnamed `lines()` argument, list punctuation with decimal commas, hidden chunks with `tapply()`/`paste`, table splits and stale page breaks, header hyphenation, „znovu“ in a caption. | All resolved: band means computed for all three models with `purrr`/`dplyr` and quoted as „−5,7; +3,4 a −2,8“; explanation moved before the chunk; named `x =`; tables kept whole; shorter headers; caption reworded. Remaining: the residual table headers still hyphenate in the narrow PDF column. |
| Glossary coverage | Haiku (economical, bounded) | 14 missed first occurrences (průměr, směrodatná odchylka, koeficient, Q–Q graf, pozorování, residuum, rozdělení, variabilita, odezva, součet čtverců residuí). Five TODO slugs still absent from `slovnik`. | All 14 wrapped; one resulting duplicate (`pozorovani` in the Cook paragraph) removed; TODO comments kept. |
| Vision, presentation | Sonnet | HIGH: `r2_adj` computed on slide 38 but first used on 39. MEDIUM: slide 49 figure/sentence, slide 22 card title „Typická velikost residuí“ mislabelled RSS, alt text of 2/55 described the future images, bottom crowding on 25/29/35, clipped code on slide 11, stale `GENERATED_IMAGES.md`. LOW: slide 17 code style and „znovu“, Cook's distance defined only in notes, small composition items. | Fixed: chunk moved to slide 39; slide 49 figure 3.6 in (4.6 overflowed the canvas — deliberate deviation from row 49) with the full curve sentence restored; „Zkratka RSS“; alt text/notes of 2 and 55 reverted to the current images; 25/29/35 shortened and re-checked; slide 11 formula wrapped; slide 17 vertical style without „znovu“; visible Cook definition on slide 50. Open: `GENERATED_IMAGES.md` (awaiting the author's choice), LOW composition items on 16/31/34/36/39 left as is. |

## Follow-up: images, title and retrieval quiz (2026-10-19)

- Watercolour images: the author supplied the four redrawn in-deck images („I have recreate dthe ai generated images“). They are integrated under the existing file names, and their provenance and SHA-256 are in `Presentation/Materials/GENERATED_IMAGES.md`.
- Title image: `stromy_titulni_ilustrace.png` (1087 × 1446 px, RGBA, SHA-256 `f13f08bd809217467bf2ca67a67012d26c4fef8c8196f42e634689802c67a56c`) fills the `.course-title-illustrated` slot; provenance in `GENERATED_IMAGES.md`. This closes the title-image item for this branch.
- PollsLive retrieval quiz: replaced by three harder L08 retrieval questions (key D A C), approved by the author on 2026-10-19. Details, validation and review are in [2026-10-19-pollslive-harder-retrieval.md](2026-10-19-pollslive-harder-retrieval.md).
- Rendering: offline canonical render after both changes, 55 slides. The synchronized render waits for the author to push the new quiz inputs.

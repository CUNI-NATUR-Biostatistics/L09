# L09 learning-material polishing story map

## Scope and approval record

- Artifact: complete `Learning_materials/skripta.qmd`, including the optional boxes.
- Date: 2026-10-19.
- Branch: `polish/l09-before-teaching`; base: `main` `875fcde` (created 2026-10-19 with explicit authorization).
- Requested work: resolve findings A1–A9 and B1–B11 in [the review](2026-10-19-polish-review.md), with decisions D1–D3 recorded there.
- Story-map status: complete.
- Heading-strip audit completed: [x].
- Knowledge-state audit completed: [x].
- Human story-map approval: approved.
- Approver: Ondřej Mottl.
- Approval date: 2026-10-19.
- Decision and requested revisions: „I do not like (C10) keep only what we do know. Other than that, I approve“ (2026-10-19). C10 concerns the deck only; no revisions to this map.
- This is a polishing pass, not a new stage sequence. Preserve the 63-tree data story, the candidate-first order, the six-tree R² construction with both sums of squares, the full-data `summary()` check, the coefficient map, the adjusted-R² construction, the parsimony → AIC → ΔAIC route, the metric synthesis and the conditional defence of the additive model.

## Document-wide rules

- Setup follows L08: `here::i_am()`, `root.dir` at the project root, hidden-chunk `OutDec = ","` hook, `set_r_theme.R`, `format_value_cz()` (ported from L08, replacing all `formatC()` in prose, tables and equations, with `math = TRUE` inside LaTeX), `use_ragg_brand_fonts()`, glossary setup without `install.packages()` or the inline `<style>`/`<script>` override.
- Species palette (D3): `Pinus monticola` `#4E9A8A`, `Pinus ponderosa` `#C2613A`, `Pseudotsuga menziesii` `#2E6CA4`, with point shapes 16 / 17 / 15 as a second cue, defined visibly once in row 5 and reused in every figure.
- Semantic colours as in the deck: observed points grey or species colours; model lines purple `#5D2890`; residual segments orange; the mean-only prediction and deviations from the mean graphite, dashed mean line.
- Every figure gets `fig-alt`; base-R figures get explicit `cex` sizes and larger `fig-width`/`fig-height`; ggplot figures use `theme_biostat()`; point labels do not overlap points; tables use `row.names = FALSE`.
- No sequencing or authoring wording in prose („Nejprve…“, „Nyní…“, „Výpočet nejprve zapíšeme…“); transitions name the quantity or question.
- No hand-typed computed values. The species shift, residual means and arch bands are computed inline.

## Complete story map

One row per major section or concept block. „Retain“ means the heading and content stay; listed changes apply.

| Order | Internal role | Student-facing heading | Speaker note |
|---|---|---|---|
| 1 | Overarching question | (box) Hlavní otázka — retain | Unchanged. |
| 2 | Workflow retrieval | Co už s daty umíme udělat? — retain | Unchanged. |
| 3 | Learning contract | Výsledky učení | Replaces „Co se v této lekci naučíte“. „Po prostudování této lekce budete schopni:“ followed by the shared five outcomes in the review. Glossary wrappers kept on first use. |
| 4 | Data entry and bridge from the previous lesson | Jeden řádek tabulky představuje jeden strom — retain | New bridge sentence (D2): v minulé lekci výška stromu pomáhala odhadnout objem dřeva střemchy; tato data popisují jiné stromy, tři severoamerické jehličnany, a výška je tentokrát odezvou. Stable CSV link (`/L09/current/data/allometrie_stromu.csv`), save-to-`data/` instruction, visible `read.csv(file = "data/allometrie_stromu.csv")` without `stringsAsFactors`/`check.names`; named first argument in `table()`. Ranges with Czech decimals. Provenance box retained. |
| 5 | Whole-data reading | Jak se výška mění s průměrem kmene? — retain | Visible `vec_barvy_druhu` and `vec_symboly_druhu` (D3); legend placed outside the data cloud; larger figure; `fig-alt`. Noticing prompt and payoff retained. |
| 6 | Familiar one-line model | Jak vztah popíšeme jedním lineárním modelem? — retain | Common line purple `#5D2890` instead of black; `fig-alt`. |
| 7 | Model-summary retrieval | Co už umíme přečíst ze `summary()`? — retain | Unchanged. |
| 8 | Residual retrieval with payoff | Co model přehlíží? — retain | After the „Detektivní práce s residui“ box, a new payoff paragraph: residua *Pinus monticola* leží převážně nad nulou (mean residual computed inline, signed), takže společná přímka tento druh soustavně podhodnocuje. Q–Q line graphite. `fig-alt` on both figures. |
| 9 | Pivot to alternatives | Je jeden model jedinou rozumnou možností? — retain | Unchanged. |
| 10 | Candidate claims | Tři modely vyjadřují tři biologické představy — retain | Unchanged. |
| 11 | Visible fit contrast | Který model prochází nejblíže pozorovaným stromům? — retain | `theme_biostat()`, species palette and shapes, common line purple, larger figure with legend under the panels, `fig-alt`. |
| 12 | Comparison question | Jak poznáme, který model je lepší? — retain | Unchanged. |
| 13 | Sums-of-squares retrieval | Co už víme o residuích a jejich čtvercích? — retain | Unchanged (callbacks already name the earlier work without lesson codes). |
| 14 | Mean-only reference | Je přímka lepší než předpověď průměrem? — retain | Six-tree table without row names; Czech decimals. |
| 15 | Total sum of squares | Jak velké jsou rozdíly výšek před použitím prediktorů? — retain | Mean line graphite dashed, deviation segments graphite; `fig-alt`. Equation block gains the collapsed stage (B3): expanded squared deviations → line of squared values → total. „Výpočet nejprve zapíšeme…“ replaced by a content transition. |
| 16 | Residual sum of squares | Kolik rozdílů zůstalo po odhadnutí přímky? — retain | Labels A–F offset from points; `fig-alt`; table without row names; collapsed stage in the RSS equation. |
| 17 | R² reveal | Jakou část variability zachytil model? — retain | „Nejprve vztah vyjádříme…“ replaced; practice box wording: „Napište jednu větu, co by tento výsledek znamenal pro odezvu.“ |
| 18 | Full-data transfer | Dostaneme stejné R² také ze `summary()`? — retain | Czech decimals. |
| 19 | R² interpretation | Co nám R² říká — a co ne? — retain | Czech decimals. |
| 20 | Nested monotonicity | Proč R² po přidání členu neklesne? — retain | „Nyní se vrátíme ke všem 63 stromům“ removed (the previous section already uses all trees). |
| 21 | Coefficient identities | Které koeficienty jednotlivé modely odhadují? — retain | Correct Czech plural („2 koeficienty“, „4 koeficienty“, „6 koeficientů“); coefficient names as a compact table or one name per line so they do not wrap mid-name. |
| 22 | Adjusted-R² construction | Stačí zlepšení R² na další koeficienty? — retain | „Dosadíme je přímo do výpočtu:“ moved below the text-only equation; „nyní“ removed. |
| 23 | Adjusted-R² behaviour | Kdy může adjustované R² klesnout? — retain | Unchanged. |
| 24 | Parsimony | Jak vyvážit shodu a jednoduchost modelu? — retain | Prompt compares the genuinely close pair (A7): posun mezi druhy (4 koeficienty) a různé sklony (6), with their R² inline; payoff „2 koeficienty navíc“. |
| 25 | AIC meaning | Jak AIC vyjadřuje úspornost modelu? — retain | Unchanged. |
| 26 | Relative AIC | Co nám říkají rozdíly AIC mezi kandidáty? — retain | „Vztah nejprve zapíšeme…“ replaced. Optional box (B6) retitled „Doplňující: Z čeho se AIC skládá?“: in words, AIC adds a measure of mismatch with the data and a penalty of 2 for each estimated quantity; for `lm()` the count includes the residual SD, so it is k + 1. Short visible check: `-2 * as.numeric(logLik(object = mod_spolecny)) + 2 * (2 + 1)` equals `AIC(object = mod_spolecny)`. No hand calculation is required later. |
| 27 | Metric synthesis | Ukazují R², adjustované R² a AIC na stejný model? — retain | Unchanged. |
| 28 | Diagnostic return with payoff (D1) | Stačí dobré skóre k tomu, aby byl model dobrý? — retain | Residual plot gains a smoothed curve in visible base R (`lines(x = lowess(…))`), introduced in one plain sentence: křivka jen vyhlazuje průběh bodů, aby byl vzor lépe vidět (A8, matching L10). New payoff after the figure names the arch: mean residual computed inline for fitted heights below 16 m, 16–32 m and above 32 m (negative, positive, negative), so a straight line misses the shape of the relationship; the same arch is present for all three candidates. Cook's distance introduced as new (A9) with the glossary term `cookova-vzdalenost`; TODO removed. New payoff after „Rozhodnutí po kontrole modelu“: the arch and the non-straight Q–Q plot weaken the conclusion, the four trees above 4/n are a reason to check, not to delete. |
| 29 | Answer to the overarching question | Který model lze pro tyto stromy nejlépe obhájit? — retain | Limits list gains the arch („přímky nevystihují zakřivený tvar vztahu“) beside the candidate-set limit, sample size, Q–Q plot and observational data. |
| 30 | Reusable workflow | Jak porovnávat modely bez automatického hledání? — retain | Unchanged. |
| 31 | Bridge (new section, replaces the grey box) | Co bude následovat dál | Concrete: všechny tři kandidáty jsme kreslili jako přímky, a residua přesto tvoří oblouk. Následující lekce ukáže, jak popsat tvar rozdělení a zakřivený vztah, a bude stejně jako tato porovnávat předem zdůvodněné kandidáty. Matches the L10 opening. |
| 32 | Earned recap | Shrnutí — retain | Five bullets mirroring the shared outcomes. |
| 33 | Transfer commitment (new) | Závěrečná otázka (H3 under Shrnutí) | „Vyberte si biologickou otázku ze svého oboru. Jaké dva nebo tři kandidátní modely byste sestavili ještě před analýzou a co by vás přesvědčilo, abyste dali přednost jednoduššímu z nich?“ Collapsed possible answer with one worked example. |
| 34 | Term reference | Slovníček pojmů — retain | Unchanged mechanism. |

## Chronological knowledge-state ledger

| Block / rows | May assume before | Introduced or earned here | Must not assume yet | Visible evidence / experience |
|---|---|---|---|---|
| Opening / 1–3 | Single-model workflow (L03–L08); additive and interaction models (L07–L08) | Lesson question; outcomes as destinations | Any metric meaning | Workflow prompt with checkable payoff |
| Data / 4–5 | `read.csv()`, `factor()`, `str()`, `is.na()`; the L08 cherry-tree example (height as predictor) | New trees, height as response; one tree per row; ranges and overlap | A fitted relationship | Bridge sentence, CSV route, inspection output, scatterplot |
| One line and its residuals / 6–8 | `lm()`, `summary()` coefficients, residual and Q–Q plots | Species offset left in the residuals (*P. monticola* above zero) | Alternative candidates, any comparison measure | Common line, summary, species-coloured residuals with payoff |
| Candidates / 9–12 | Additive and interaction formulas | Three claims fixed before scores; closest fit is not yet „better“ | Metric names | Candidate table, three-panel figure, criteria list |
| R² / 13–19 | RSS (L03–L06), means | Total sum of squares; R² named after it is computed; full-data equality; limits | Highest R² is best | Six trees, both sums with all four equation stages, summary check, MCQ |
| Complexity / 20–24 | R² | Nested monotonicity; coefficient counts; adjusted R²; parsimony | AIC | RSS/R² table, coefficient map, adjusted-R² construction, close-pair prompt |
| AIC / 25–27 | Parsimony | AIC as a relative criterion; comparability conditions; ΔAIC; optional composition (fit mismatch + 2 per estimated quantity) | Likelihood algebra in the main route | `AIC()` output, ΔAIC equations, synthesis table |
| Diagnostics and answer / 28–29 | Residual and Q–Q plots | Smoothed curve as a reading aid; residual arch; Cook's distance as new; conditional defence | Remedies for curvature | Residual plot with curve and computed band means, Q–Q, Cook's distances, evidence card |
| Ending / 30–34 | Whole lesson | Workflow; concrete bridge to L10; recap; transfer | Transformations, nonlinear fitting | Workflow list, bridge, summary, closing question, glossary |

## Audits before approval

- Heading strip: rows 1–34 keep the approved 31-block narrative; the only new headings are „Výsledky učení“, „Co bude následovat dál“ and „Závěrečná otázka“, which match L08.
- First use: the smoothed curve is explained on its first appearance (row 28); Cook's distance is no longer described as known; the arch is named only after the plot that shows it.
- Cross-lesson: the bridge in row 4 names the L08 example by content, not by lesson code; row 31 matches the L10 opening („Předchozí lekce proto skončila otevřenou otázkou…“).
- Glossary: after the edits, run the glossary-coverage pass; the five missing slugs (`celkovy-soucet-ctvercu`, `absolutni-hodnota`, `adjustovane-r2`, `princip-uspornosti`, `delta-aic`) stay as TODO comments unless they are added to `slovnik`.

## Implementation and review contract

- Order: written backbone first, then the presentation, then the exercise.
- Validation: render HTML and PDF through `R/render_skripta.R`; inspect every PDF page; glossary-coverage pass; independent read-only review with `.ai/agents/vision-corrector.md` (capable general-purpose model, balanced effort); resolve findings; human review.

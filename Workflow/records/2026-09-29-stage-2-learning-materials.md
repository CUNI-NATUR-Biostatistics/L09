# Stages 2-3 - Learning Materials and Human Review

## Metadata

- Week: L09
- Date: 2026-09-29
- Author: OpenAI Codex, working with Ondřej Mottl
- Reviewer: Ondřej Mottl (replacement story map approved); independent lesson-vision and glossary reviews completed

## Git checkpoint

- Stage group: Stages 2-3 written materials
- Branch: `lesson/l09-skripta`
- Base branch and commit: `main` at `1723cb5` (merged Stages 0-1 PR #1)
- Stages 0-1 PR merged: [x]
- Branch created from updated default branch: [x]
- `git status --short` reviewed before editing: [x] (clean)
- Written-materials PR: #2, merged into `main` at `fdc6195` on 2026-10-01

## Inspiration consulted

- Relevant sources from `_internal/obecne/nove/biostatistics_course_inspiration_hub.md`: Modern Statistics with R for the model-based analysis spine; CUNY Biostatistics for beginning with a biological question and interpreting models before selection; PH525x for treating formulas as explicit scientific design choices.
- Structural pattern borrowed: pose the overarching model-quality question → retrieve the complete one-model workflow on new data → let the plot and residuals expose a limitation → define several biologically plausible models → ask how they can be compared → introduce R², adjusted R² and AIC one at a time → return to diagnostics → answer the overarching question with a conditional defence.
- Adaptation to this course: use 63 trees and three familiar `lm()` formulas already earned through additive and interaction lessons. Keep visible code in Czech and base R, use one common analysis table for every comparison, and connect each score to the same observed points and fitted lines.
- Intentionally not reused: automated stepwise or all-subsets selection, coefficient p-values as term-selection rules, large interaction hierarchies, universal ΔAIC cut-offs, likelihood derivations, or package-heavy model-ranking output.

## Mandatory story map

- Artifact: Learning materials (`Learning_materials/skripta.qmd`)
- Granularity: one row per major section or concept block
- Story-map status: complete after full-document knowledge-leakage review
- Heading-strip audit completed: [x]
- Knowledge-state audit completed: [x]
- Human story-map approval: approved
- Approved by: Ondřej Mottl
- Approval date: 2026-09-30
- Approval decision and requested revisions: The previously approved 30-block map was reopened after Ondřej Mottl's full-document review on 2026-09-30. He requested a stronger return to prior lessons, explicit emphasis on total and residual sums of squares, a full-data R² calculation checked against `summary()`, visible coefficient identities, an intuitive parsimony-first AIC route, self-study rather than classroom-partner prompts, reproducible data-preparation code, and removal of generated humorous images from the learning materials. The complete 31-block replacement map and matching knowledge-state ledger incorporate those revisions. Ondřej explicitly confirmed approval on 2026-09-30.

`Internal role` and `Speaker note` are backstage planning text. `Student-facing heading` contains only the exact proposed rendered heading; no full student-facing prose has been drafted.

| Order | Internal role | Student-facing heading | Speaker note |
|---|---|---|---|
| 1 | Overarching lesson question | Jak poznáme, že je model dobrý? | Pose the question that organises the entire lesson. Keep model quality open: fit, simplicity, diagnostics and biological meaning will be earned gradually. |
| 2 | Opening retrieval section | Co už s daty umíme udělat? | Ask individual readers to reconstruct the familiar workflow and then provide a brief checkable version. Reserve partner formats for the later presentation. |
| 3 | Learning outcomes | Co se v této lekci naučíte | Use actions such as calculate, explain, compare and defend. Name the target measures only as destinations, with their English terms, without assuming their meaning. |
| 4 | Source, observation unit and reproducibility | Jeden řádek tabulky představuje jeden strom | Introduce the source, observation unit, variables, completeness and common analysis rows. A collapsed Extra contains the complete route for loading `allometry` from the installed `lgrdata` package and preparing the teaching table, not merely a reference to another script. |
| 5 | First visual and biological question | Jak se výška mění s průměrem kmene? | Plot individual trees by species and separate direct observations from claims that still require a model. |
| 6 | Retrieve model fitting | Jak vztah popíšeme jedním lineárním modelem? | Fit one common line and retrieve response, predictor, intercept, slope and fitted values. |
| 7 | Retrieve model-summary reading | Co už umíme přečíst ze `summary()`? | Recall that L08 deliberately parked R² and adjusted R². Interpret only familiar output and make the unexplained lines questions for later. |
| 8 | Retrieve residual reasoning | Co model přehlíží? | Explicitly recall residuals and familiar diagnostic plots from earlier lessons. Use species-coloured residuals to expose remaining structure without redefining residuals as new knowledge. |
| 9 | Pivot from one model to alternatives | Je jeden model jedinou rozumnou možností? | Use the observed and residual patterns to motivate common, additive and interaction structures. No humorous generated image appears in the learning materials. |
| 10 | Candidate set defined before scores | Tři modely vyjadřují tři biologické představy | Translate each familiar formula into a biological claim and freeze the candidate set before calculating comparison measures. |
| 11 | Compare fitted patterns | Který model prochází nejblíže pozorovaným stromům? | Compare fitted lines on common axes. Draw the single common-model line in black and retain species colours only where the model estimates species-specific lines. Predict which candidate leaves the smallest residuals without calling it best. |
| 12 | Model-comparison question | Jak poznáme, který model je lepší? | Establish that fit must be quantified, but that fit alone may reward unnecessary flexibility. |
| 13 | Prior-lesson bridge to sums of squares | Co už víme o residuích a jejich čtvercích? | Retrieve the sum of squares of residuals from L03, its RSS terminology from L04 and the reduction in sums of squares from L06. Fix the course term as “součet čtverců residuí (residual sum of squares, RSS)”. |
| 14 | Mean-only reference model | Je přímka lepší než předpověď průměrem? | Introduce the mean-only prediction as the reference against which the fitted line will be compared. Use six labelled trees only as a transparent worked example. |
| 15 | Total sum of squares | Jak velké jsou rozdíly výšek před použitím prediktorů? | Show deviations from the mean, square and sum them, and name the new quantity “celkový součet čtverců (total sum of squares)”. Emphasise that it is one of two quantities required in the next step. |
| 16 | Residual sum of squares in the worked example | Kolik rozdílů zůstalo po odhadnutí přímky? | Reuse the same six trees and the already known residual concept. Calculate RSS and place it directly beside the total sum of squares so their roles remain visible and terminology remains constant. |
| 17 | Reveal and calculate R² | Jakou část variability zachytil model? | First calculate one minus the ratio of the two earned sums of squares; only then name the result “koeficient determinace R² (coefficient of determination)”. Move from concrete values to the compact formula. |
| 18 | Transfer R² to the full dataset | Dostaneme stejné R² také ze `summary()`? | Return to all 63 trees. Show the common full-data total sum of squares, RSS and R² calculation, then verify that the result equals `summary(mod_spolecny)$r.squared`. Clearly separate this analysis from the six-tree worked example. |
| 19 | R² interpretation and limits | Co nám R² říká — a co ne? | Interpret R² as an in-sample proportion of observed response variability represented by this model. Reject percent-correct, causal, truth and assumption-check interpretations. |
| 20 | R² across nested candidates | Proč R² po přidání členu neklesne? | Compare the full-data RSS and R² values only after block 18 has established their calculation. Show that nested added terms can reproduce the simpler fit or reduce RSS. |
| 21 | Make model complexity concrete | Které koeficienty jednotlivé modely odhadují? | List the actual intercept, diameter, species-contrast and interaction coefficients for the three candidates. The counts 2, 4 and 6 must be traceable to visible names. |
| 22 | Adjusted-R² construction | Stačí zlepšení R² na další koeficienty? | Introduce “adjustované R² (adjusted R-squared)” as a correction using R², sample size and coefficient count. Compute the additive-model example from concrete inputs before showing the compact formula. |
| 23 | Adjusted-R² behaviour | Kdy může adjustované R² klesnout? | Compare candidates and show that the adjustment falls when added coefficients reduce RSS too little. Keep its meaning distinct from ordinary R². |
| 24 | Parsimony principle | Jak vyvážit shodu a jednoduchost modelu? | Introduce parsimony in ordinary language as a separate model-evaluation principle: additional complexity must earn its place through enough improvement in fit. Do not introduce likelihood or an AIC formula yet. |
| 25 | Introduce AIC | Jak AIC vyjadřuje úspornost modelu? | Introduce “Akaikeho informační kritérium (Akaike information criterion, AIC)” as one criterion operationalising the fit-complexity balance. State that lower is better only relative to candidates with the same response and observations. |
| 26 | Relative AIC comparison | Co nám říkají rozdíly AIC mezi kandidáty? | Use AIC values and differences from the minimum to compare the frozen candidate set. Avoid universal cut-offs, truth probabilities and a manual formula derivation in the main route. |
| 27 | Optional computational background | Doplňující: Jak R vypočítá AIC? | In a collapsed Extra only, explain that AIC uses model likelihood and a complexity penalty. If the formula is retained, build its purpose before notation, fix the clipped visual, and do not require students to calculate `-2 log(L) + 2K` by hand. No later main-route conclusion may depend on this Extra. |
| 28 | Metric synthesis | Ukazují R², adjustované R² a AIC na stejný model? | Reveal the combined table only after all three measures have a distinct purpose. Explain disagreement through their different treatment of fit and complexity, not as three votes about truth. |
| 29 | Return to diagnostics and evidence limits | Stačí dobré skóre k tomu, aby byl model dobrý? | Return explicitly to familiar residual, Q–Q and influence checks. Treat Cook's distance as a callback to L07 or explain it briefly without letting it become another lesson objective. |
| 30 | Answer to the overarching question | Který model lze pro tyto stromy nejlépe obhájit? | Build an evidence card and conditionally defend the additive model. Separate support from truth and association from causation. |
| 31 | Reusable workflow and next question | Jak porovnávat modely bez automatického hledání? | Generalise the candidate-first sequence, reject automatic searches as a substitute for biological reasoning, and close by asking what systematic residual structure would motivate in a later lesson. |

## Active-learning plan

The learning materials use active recall and prediction as individual self-study tasks. Every prompt is followed immediately by either a short payoff, a worked answer or a collapsed solution, so readers can check their reasoning without another person or a teacher. Social formats such as partner discussion, voting and PollsLive belong to the separately approved presentation story map.

| Story-map block | Student task | Self-study implementation | Teaching purpose |
|---|---|---|---|
| 1 | Write down two different reasons why a fitted model might or might not be considered good. | Keep the prompt open, then reveal only the evidence categories that the lesson will investigate. | Elicit the lesson question without prematurely supplying a decision rule. |
| 2 | Put inspect, visualise, formulate, fit, interpret and diagnose into a defensible order. | Ask for an individual ordering, then show the course workflow and note where reasonable iteration can occur. | Retrieve the complete workflow rather than isolated terminology. |
| 5 | Describe the strongest visible pattern and one reason a single line might be inadequate. | Follow the prompt with a short observation-versus-inference comparison. | Separate what is visible from what requires a model. |
| 7 | Identify familiar and unfamiliar parts of `summary()`. | Immediately connect the unfamiliar R² lines to the explicit postponement in L08. | Turn unexplained output into the lesson's questions. |
| 8 | Identify one systematic pattern remaining in the residual display. | Provide a concise interpretation after the reader commits to an answer. | Let evidence motivate alternative model structures. |
| 11 | Predict which candidate must leave the shortest residuals. | Reveal the fitted panels and explain why closer in-sample fit does not yet identify the best model. | Secure a prediction before comparison measures. |
| 13 | Recall where students previously calculated or compared sums of squares of residuals. | Supply direct callbacks to L03, L04 and L06 after the prompt. | Activate knowledge that the R² construction will reuse. |
| 15 | Identify which mean deviation contributes most to the total sum of squares and explain why squaring matters. | Follow with the completed contribution table and one-sentence answer. | Make the new total sum of squares concrete. |
| 16 | Match visible residual segments to their squared contributions. | Follow with the completed RSS and a visual pairing check. | Connect known residuals to the paired aggregate quantity. |
| 17 | Calculate the unnamed captured proportion from supplied total and residual sums of squares. | Reveal the numerical result first, then introduce the name and symbol R². | Make meaning precede terminology. |
| 18 | Recalculate R² for the common model on all 63 trees and predict the matching `summary()` value. | Show the full-data substitution and the software equality immediately afterwards. | Complete transfer from worked example to real analysis. |
| 19 | Choose the defensible interpretation of a supplied R² and reject percent-correct, causal and truth claims. | Use an individual MCQ with an explanation for every option. | Address misconceptions at first interpretation. |
| 20 | Predict what happens to R² after adding an unhelpful nested term. | Reveal the RSS and R² comparison with a short proof in words. | Surface why ordinary R² cannot settle model choice. |
| 21 | Match coefficient names to the common, additive and interaction models. | Show the completed coefficient map after the task. | Make complexity counts visible rather than abstract. |
| 22 | Locate the fit, sample-size and coefficient-count parts of one adjusted-R² calculation. | Provide an annotated worked calculation. | Keep the adjustment interpretable. |
| 23 | Predict whether adjusted R² rises or falls after a weak added term. | Reveal the candidate values and link the result back to the calculation. | Connect the penalty to observed behaviour. |
| 24 | Decide whether a tiny improvement in fit justifies many extra coefficients. | Follow with a plain-language definition of parsimony. | Establish the question before naming an AIC solution. |
| 25 | Explain why an isolated AIC value cannot be called good or bad. | Reveal the comparability conditions and direction of preference. | Establish AIC as a relative criterion. |
| 26 | Compare the AIC differences of the three frozen candidates. | Provide a short interpretation below the table without universal cut-offs. | Practise relative comparison without formula manipulation. |
| 28 | Explain why R², adjusted R² and AIC need not favour the same candidate. | Follow with an annotated synthesis table. | Trace disagreement to different treatment of fit and complexity. |
| 29 | Decide whether the numerically favoured candidate remains defensible after diagnostics. | Supply an evidence card with support and limitations. | Re-establish diagnostics as required evidence. |
| 30 | Write a two-sentence model defence containing one reason and one limitation. | Follow with a model answer that remains conditional. | Answer the main question using several kinds of evidence. |

## Generated-illustration disposition

Generated humorous illustrations are not part of the learning-material reading route. The learning materials are already long and their visuals should carry analytical evidence directly. Existing generated assets and their provenance remain in the repository for possible reuse in the separately planned presentation; retaining an asset does not pre-approve its use on a slide.

| Existing asset | Learning-material decision | Possible later role |
|---|---|---|
| `model-casting.jpg` | Remove from `skripta.qmd`; the opening question stands without it. | Optional visual hook in the presentation after separate storyboard approval. |
| `one-ruler-three-trees.jpg` | Remove from `skripta.qmd`; use the exact three-model schematic instead. | Optional light transition before candidate formulas in the presentation. |
| `complexity-machine.jpg` | Remove from `skripta.qmd`; use visible coefficient names and comparison quantities instead. | Optional parsimony metaphor in the presentation. |

## Knowledge-state ledger

Read each row as the state before and after its matching story-map block. A question may foreshadow a later idea, but an answer may use only evidence already shown or supplied in that block.

| Concept block | May assume before | Introduced or earned here | Must not assume yet | Evidence or experience |
|---|---|---|---|---|
| 1 — Overarching question | Students know that fitted models can differ. | Model quality becomes the lesson-wide question. | Any metric meaning, decision rule or preferred candidate. | The question is posed without an answer. |
| 2 — Workflow retrieval | Students have inspected, visualised, fitted, interpreted and diagnosed models. | These actions form one reusable workflow that can include iteration. | New comparison measures. | Individual reconstruction followed by a checkable course workflow. |
| 3 — Outcomes | The familiar workflow is available. | The lesson will add calculable comparison measures and a defended choice. | Definitions, preferred directions or results of those measures. | Outcomes name destinations but do not explain them. |
| 4 — Data overview | Students understand observations and variables. | Provenance, reproducible preparation, unit, variables, completeness and common rows. | A fitted relationship or candidate ranking. | Visible data inspection plus optional executable preparation code. |
| 5 — Observed pattern | Students can read a scatterplot. | Overall association and possible species pattern. | Which model structure is supported. | Species-coloured observations and a self-check prompt. |
| 6 — First model | Students know `lm()`, intercept and slope. | One common line is an explicit first attempt. | That it is adequate or best. | Visible fit and one black fitted line. |
| 7 — Model summary | Students can interpret coefficients and uncertainty and have seen unexplained R² labels in L08. | R² and adjusted R² become explicit questions postponed for later construction. | Their meaning, calculation or preferred direction. | Complete `summary()` output connected to L08. |
| 8 — Residual retrieval | Students know fitted values, residuals and familiar diagnostic displays. | Species-related residual structure motivates alternatives. | A new definition of residuals or any model-comparison score. | Direct callback plus species-coloured residual evidence. |
| 9 — Alternative structures | Students know additive and interaction predictions. | Three line structures are biologically plausible. | Which one is preferred. | Exact analytical schematic without decorative illustration. |
| 10 — Candidate claims | Students know the formula structures. | Three predeclared formulas encode three biological claims. | Any score or ranking. | Candidate cards fixed before calculation. |
| 11 — Visible fit contrast | Students know residuals. | Flexible models can leave shorter residuals; a common model still has one common line. | That closer fit establishes better model quality. | Common-axis panels with correct line encoding. |
| 12 — Comparison question | Three candidate fits are visible. | Fit must be quantified and later balanced with other evidence. | R², adjusted R², parsimony or AIC definitions. | Criteria remain open questions. |
| 13 — Sums-of-squares retrieval | Students calculated sums of squared residuals in L03 and L04 and compared their reduction in L06. | Prior knowledge is consolidated under the stable term RSS. | Total sum of squares or R². | Explicit callbacks to the earlier calculations. |
| 14 — Mean reference | Students know means and residuals from fitted models. | A mean-only prediction provides a reference model for response variability. | Total-sum notation or R². | Six labelled observations and a mean line. |
| 15 — Total sum of squares | Mean deviations are visible. | Squared deviations from the mean form the total sum of squares. | R² name, symbol or interpretation. | Expanded numeric calculation paired with the visual segments. |
| 16 — Residual sum of squares | RSS terminology is already known and the total sum is now available. | RSS is recalculated on the same six observations and paired with the total sum. | The captured proportion or R² name. | Same observations, fitted line, residual segments and expanded RSS. |
| 17 — R² reveal | Both sums of squares and their roles are established. | Their ratio yields an interpretable captured proportion, then named coefficient of determination R². | A rule that highest R² is best or full-data candidate values. | Concrete substitution before compact notation. |
| 18 — Full-data transfer | Students can calculate R² on the worked example. | The same calculation applies to all 63 trees and equals the value reported by `summary()`. | Other candidates' ranking before this equality is checked. | Full-data total sum, RSS, substitution and software comparison. |
| 19 — R² interpretation | Students can calculate and verify R². | R² is an in-sample proportion with explicit interpretive limits. | Complexity correction or parsimony. | Explained correct and incorrect interpretations. |
| 20 — R² monotonicity | Students know least-squares fitting and full-data R². | Nested added terms cannot increase RSS, so R² cannot fall. | Adjusted-R² calculation. | Full-data candidate RSS and R² values. |
| 21 — Coefficient identities | Students see that added terms increase flexibility. | Counts 2, 4 and 6 are grounded in named intercept, slope, contrast and interaction coefficients. | An adjustment formula. | A coefficient-name map for each model. |
| 22 — Adjusted-R² construction | R², sample size and visible coefficient counts are known. | Adjusted R² corrects ordinary R² using sample size and coefficient count. | AIC or equivalence with AIC. | Concrete additive-model substitution, then compact formula. |
| 23 — Adjusted-R² behaviour | Students can calculate both R² versions. | Adjusted R² may fall when added coefficients improve fit too little. | Parsimony as identical to adjusted R². | Candidate comparison plus a weak-term prediction. |
| 24 — Parsimony | Students understand fit improvement and complexity cost separately. | Parsimony becomes a general principle requiring complexity to earn sufficient improvement. | AIC notation, likelihood or a numerical winner. | Plain-language trade-off and a short judgement task. |
| 25 — AIC meaning | Parsimony is available before the criterion is named. | AIC is a relative criterion operationalising fit versus complexity; lower values are preferred among comparable candidates. | A hand derivation, universal threshold or truth probability. | Definition, direction and comparability conditions. |
| 26 — Relative AIC | Students know what AIC is for and how its direction works. | AIC differences compare the frozen candidates without an absolute good/bad scale. | Likelihood mechanics or formula manipulation. | Candidate AIC and difference-from-minimum table. |
| 27 — Optional AIC computation | The main route already supports correct AIC interpretation. | Interested readers may see that software combines likelihood-based fit and a complexity penalty. | Knowledge required by any later core task. | Collapsed Extra with a repaired visual and optional notation. |
| 28 — Metric synthesis | R², adjusted R² and AIC each have an earned purpose and direction. | Their disagreement follows from different treatment of fit and complexity. | A mechanical winner without diagnostics. | Combined table annotated by purpose. |
| 29 — Diagnostic return | Students know familiar diagnostics and Cook's distance has appeared in L07. | Numerical comparisons remain conditional on adequacy, influence and sampling. | That diagnostics prove truth or mandate deletion. | Direct callback and comparable diagnostic evidence. |
| 30 — Defended answer | Claims, fits, measures and diagnostics are available. | A conditional defence of the additive model using several evidence types. | Causal species effects or universal conifer claims. | Evidence card with support and limitations. |
| 31 — General workflow and bridge | Students have completed one candidate comparison. | A reusable candidate-first workflow and a question about remaining nonlinear structure. | Automatic selection, cross-validation, regularisation or fitting nonlinear alternatives now. | Compact workflow followed by the next-lesson question. |

## Story-map audits before human approval

- Heading strip: rows 1-31 form a continuous problem-driven sequence under the main question “Jak poznáme, že je model dobrý?” The lesson retrieves the one-model workflow and previously learned residual sums, establishes candidates, constructs R² on a worked example, transfers it to the full analysis, introduces adjusted R², and only then opens a separate parsimony-to-AIC route before returning to diagnostics.
- Header-hierarchy audit: block 1 is the overarching lesson question. Block 2, “Co už s daty umíme udělat?”, is explicitly a subordinate retrieval section; it does not compete with or replace the lesson question. The model-comparison question in block 12 is likewise a subordinate step towards the final answer.
- Retrieval audit: block 2 asks individual readers to reconstruct the workflow and then offers a self-check. Blocks 4-8 enact the workflow on the tree data. Block 7 recalls that L08 parked R² and adjusted R²; block 13 retrieves the sums-of-squares work from L03, L04 and L06 rather than reteaching residuals as new.
- Pivot audit: remaining species structure in block 8 motivates alternative model structures in block 9. The three candidates are fixed in block 10 before any comparison score is shown. This prevents the candidate set from appearing only to demonstrate R² or AIC.
- R² first-use audit: RSS is established as prior knowledge in block 13, the new total sum of squares is constructed in block 15, and the two quantities are paired in block 16. Block 17 calculates an unnamed captured proportion before revealing the name R². Block 18 repeats the calculation on all 63 observations and checks it against `summary()` before candidate R² values appear in block 20.
- Complexity audit: the student sees the actual coefficients in block 21 before adjusted R² uses their count in block 22. The adjustment is therefore grounded in model terms rather than unexplained integers.
- AIC first-use audit: block 24 establishes parsimony without notation. Block 25 introduces the full Czech and English AIC name, purpose, direction and comparability conditions. Block 26 applies it relatively. Likelihood and the formula are confined to a collapsed optional block 27 and are not prerequisites for synthesis or the final defence.
- Calculation audit: R² and adjusted R² use ordinary-language meaning → visible source quantities → concrete substitution → compact formula → interpretation. The main AIC route is intentionally interpretive rather than a hand derivation; software performs the calculation after students understand what the criterion is for.
- Self-study audit: every learning-material prompt is individual and followed by a payoff, worked answer or collapsed solution. No prompt requires a neighbour, partner, classroom vote or teacher reveal. Live social formats remain a later presentation decision.
- Generated-visual audit: generated humorous images are excluded from `skripta.qmd`. Existing files and provenance are retained only as candidate slide assets. Analytical plots and tables carry the evidence in the learning materials.
- Reproducibility audit: the source section contains a collapsed, executable route that loads `allometry` directly from the installed `lgrdata` package and prepares the teaching table rather than only naming `R/prepare_allometry_data.R`.
- Terminology audit: the route distinguishes “celkový součet čtverců” from “součet čtverců residuí (RSS)” and keeps those names visible through the R² calculation. New named measures include English search terms at first introduction.
- Knowledge-state audit: no main-route conclusion depends on the optional likelihood/AIC-computation Extra. Information theory, automatic selection, cross-validation, regularisation, mixed models and nonlinear fitting remain outside the lesson.
- Prior-lesson boundary: earlier datasets and numerical results do not reappear. Earlier lessons contribute only already earned concepts and are cited as callbacks, not silently assumed or rederived without context.
- Human review focus: please assess whether blocks 13-20 now form a complete R² arc from prior knowledge through the full-data `summary()` check; whether blocks 24-27 make AIC understandable without forcing likelihood algebra; and whether the 31-block sequence remains feasible for self-study.

## Stage 2A - Structural draft

- Replacement story map completed and explicitly human-approved before next prose rewrite: [x]
- Section order complete for the replacement map: [x]
- First visual/table included: [x]
- First interpretation prompt included: [x]
- Misconception checkpoint included: [x]
- Self-study prompts implemented with checkable payoffs: [x]
- Existing generated illustrations retained with provenance as optional slide assets: [x]
- Bridge to next concept included: [x]

### Structural draft notes

- Main lesson heading and organising question: Jak poznáme, že je model dobrý?
- First subordinate section: Co už s daty umíme udělat?
- First data moment: inspect the one-tree-per-row structure, species counts, missingness, ranges and diameter overlap, then visualise the diameter-height relationship.
- First complete analytical pass: fit one common line, read its full `summary()`, park the unfamiliar fit summaries, and inspect residuals in blocks 6-8.
- Where the comparison problem first appears: species-related residual structure motivates alternative model forms in block 9; the candidates are formalised in block 10; “better model” becomes the explicit subordinate question only after students have compared their fitted patterns in block 12.
- The first structural draft implemented on 2026-09-30 is superseded because it exposed and compared R², adjusted R² and AIC without constructing their meaning or calculations.
- HTML and Typst/PDF rendered successfully. The 15-page PDF received a complete contact-sheet inspection plus full-size checks of the dense comparison and closing pages; no clipping, overlap or unreadable glyphs were found.
- The first renewed story-map gate was passed on 2026-09-30. Its resulting prose is now superseded for the next rewrite because the full-document review found an incomplete full-data R² transfer, insufficient prior-lesson callbacks and an inaccessible likelihood-heavy AIC route.
- R² now begins from six actual trees, shows deviations from the mean and residual segments, expands both sums of squares, and only then introduces the compact formula and interpretation.
- Adjusted R² distinguishes the number of regression coefficients from the AIC parameter count. AIC now has a likelihood bridge, a fully substituted calculation, comparability conditions and a component table.
- Three generated illustrations were saved under `Learning_materials/images/` and documented in `Learning_materials/images/README.md`; the replacement map removes them from the learning-material reading route and retains them only as possible slide assets.
- Diagnostics now include residuals, a Q–Q plot and Cook's distances. The lesson closes with the approved candidate-first workflow and nonlinear bridge.
- HTML and Typst/PDF render successfully when the broken inherited `C.UTF-8` variables are cleared and the stalled `renv` autoloader is disabled for the render subprocess. The 25-page final PDF received a complete contact-sheet inspection and full-size checks of illustration, equation, comparison-table and diagnostic pages. The three-candidate table was kept together after reducing one illustration.
- The full-document review identified a clipped normal-density curve, incorrect species colouring of the single common-model line, social classroom wording in a self-study prompt, and the structural issues recorded above. The replacement map was subsequently approved and the prose rewrite was completed within it.

## Stage 2B - Development pass

- Major concept blocks have the replacement visual anchors: [x]
- Interpretation prompts revised for individual self-study: [x]
- Explanatory payoff text aligned with the replacement map: [x]
- Transitions revised for self-study readability: [x]
- Glossary markup and stable terminology rechecked after the replacement: [x]

### Development pass notes

- Which concept block improved most: R² is no longer an unexplained output label. Students can trace it from six visible mean deviations and six visible residuals to the full numerical calculation and general formula.
- Which visual or comparison became the main anchor: the paired mean-deviation and residual-segment displays, followed by the full-data R² transfer and the parsimony-first AIC comparison.
- Coefficient identities and counts are generated from the fitted models and shown explicitly before adjusted R² uses them.
- AIC remains intentionally interpretive in the main route. Optional computational background is confined to a collapsed Extra and is not required later.
- Canonical-glossary follow-ups are recorded by four source TODO markers: total sum of squares, adjusted R², parsimony, and Cook's distance.

## Quality check notes

- What improved most in the finished draft: R² is constructed from the two sums of squares, transferred to all 63 trees and checked against `summary()`; adjusted R² uses visible coefficient identities; and AIC begins with parsimony rather than likelihood notation.
- Human review round on 2026-09-30: corrected the package-based data-origin route, removed premature comparison language, removed duplicated `summary()` guidance, aligned the candidate-figure order with the table, replaced the inaccessible flexibility explanation, added visible `AIC()` code and the ΔAIC name, and made the candidate-set limitation explicit.
- Human review follow-up on 2026-10-01: simplified the package-based reconstruction code, pinned the source package version, separated signed, absolute and squared residuals with a visible worked comparison, and reformatted the R² interpretation check as A/B/C choices.
- Independent lesson-vision review: the follow-up reviewer identified premature hidden computations, an incomplete ΔAIC construction, one stale workflow statement, one reveal-style instruction, and later a notation-order issue in the residual example. All findings were resolved; the final review reported no remaining knowledge or instruction leakage.
- Independent glossary review: first-use, TODO, data-derived wording and residual-distinction findings were resolved; the final review reported no findings.
- Render review: HTML and the final 29-page PDF rendered successfully. Every affected PDF page was inspected after the final edits, including the data-origin Extra, the three-model figure, the complete ΔAIC construction, the optional AIC box and the closing candidate-set caveat. No clipping, overlap, unreadable content, orphaned callout header or broken page flow remained. `qpdf --check` reported no syntax or stream-encoding errors.

## Stage 3 - Human review gate

- Finished headings and transitions compared with the story map: [x]
- Heading-strip, visible-copy, and first-use audits completed: [x]
- Lesson-vision review completed: [x]
- Glossary-coverage review completed: [x]
- Human review completed: [x]
- Credible findings resolved: [x]
- HTML/PDF rendered and checked: [x]
- Reviewer decision: approved by Ondřej Mottl on 2026-10-01 after all requested revisions were implemented; both independent reviewers report no unresolved findings.

## Decision

- [x] Written materials are review-ready
- [x] Replacement story-map status is `complete`
- [x] Replacement human story-map approval is `approved` and recorded
- [x] Diff contains only the intended Stage 2 written-material files and outputs
- [x] Written-materials PR ready to merge
- Notes: Ondřej Mottl approved two earlier versions on 2026-09-30, then completed a full-document review that reopened the gate. He explicitly approved the complete 31-block replacement map and matching ledger on 2026-09-30. The learning-material prose was rewritten within that map and Ondřej's subsequent detailed review findings were implemented. The revised artifact passed follow-up lesson-vision and glossary reviews, produced a visually checked 29-page PDF, and received final human approval from Ondřej Mottl on 2026-10-01. Written-materials PR #2 was merged on 2026-10-01.

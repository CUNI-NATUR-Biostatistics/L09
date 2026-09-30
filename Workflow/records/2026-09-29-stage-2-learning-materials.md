# Stages 2-3 - Learning Materials and Human Review

## Metadata

- Week: L09
- Date: 2026-09-29
- Author: OpenAI Codex, working with Ondřej Mottl
- Reviewer: Ondřej Mottl (story-map approval pending)

## Git checkpoint

- Stage group: Stages 2-3 written materials
- Branch: `lesson/l09-skripta`
- Base branch and commit: `main` at `1723cb5` (merged Stages 0-1 PR #1)
- Stages 0-1 PR merged: [x]
- Branch created from updated default branch: [x]
- `git status --short` reviewed before editing: [x] (clean)
- Written-materials PR: not created

## Inspiration consulted

- Relevant sources from `_internal/obecne/nove/biostatistics_course_inspiration_hub.md`: Modern Statistics with R for the model-based analysis spine; CUNY Biostatistics for beginning with a biological question and interpreting models before selection; PH525x for treating formulas as explicit scientific design choices.
- Structural pattern borrowed: pose the overarching model-quality question → retrieve the complete one-model workflow on new data → let the plot and residuals expose a limitation → define several biologically plausible models → ask how they can be compared → introduce R², adjusted R² and AIC one at a time → return to diagnostics → answer the overarching question with a conditional defence.
- Adaptation to this course: use 63 trees and three familiar `lm()` formulas already earned through additive and interaction lessons. Keep visible code in Czech and base R, use one common analysis table for every comparison, and connect each score to the same observed points and fitted lines.
- Intentionally not reused: automated stepwise or all-subsets selection, coefficient p-values as term-selection rules, large interaction hierarchies, universal ΔAIC cut-offs, likelihood derivations, or package-heavy model-ranking output.

## Mandatory story map

- Artifact: Learning materials (`Learning_materials/skripta.qmd`)
- Granularity: one row per major section or concept block
- Story-map status: complete
- Heading-strip audit completed: [x]
- Knowledge-state audit completed: [x]
- Human story-map approval: pending
- Approved by:
- Approval date:
- Approval decision and requested revisions:

`Internal role` and `Speaker note` are backstage planning text. `Student-facing heading` contains only the exact proposed rendered heading; no full student-facing prose has been drafted.

| Order | Internal role | Student-facing heading | Speaker note |
|---|---|---|---|
| 1 | Overarching lesson question | Jak poznáme, že je model dobrý? | Pose the question that organises the entire lesson. Do not answer it yet; each later section will contribute one part of the eventual defence. |
| 2 | Opening retrieval section | Co už s daty umíme udělat? | Ask students to reconstruct the workflow they have built across earlier lessons: inspect, visualise, formulate a question, fit, interpret and diagnose. This is a subordinate retrieval section, not the lesson title. |
| 3 | Learning outcomes | Co se v této lekci naučíte | State the four approved actions: explain the limitation of R², distinguish the three summaries, compare justified candidates, and defend a choice using scientific and diagnostic evidence. |
| 4 | Source, observation unit and overview | Jeden řádek tabulky představuje jeden strom | Introduce the CC0 `lgrdata::allometry` source, 63 trees, three conifer species, diameter at 1.3 m and tree height. Show representative rows, types, missingness, species counts, ranges and diameter overlap. Confirm one common 63-row analysis table. |
| 5 | First visual and biological question | Jak se výška mění s průměrem kmene? | Plot individual trees by species with stable accessible colours. Ask students to describe the overall relation first and then notice possible species differences. |
| 6 | Retrieve model fitting | Jak vztah popíšeme jedním lineárním modelem? | Fit `vyska_stromu_m ~ prumer_kmene_cm` as a deliberate first attempt. Rehearse response, predictor, intercept and slope without yet treating it as the final model. |
| 7 | Retrieve model-summary reading | Co nám o modelu říká `summary()`? | Read the familiar coefficient information and uncertainty. Display the complete output, notice R² and adjusted R² as two not-yet-explained quantities, and explicitly park them for later. |
| 8 | Retrieve diagnostics and expose a limitation | Co model přehlíží? | Check familiar residual, Q-Q and influence displays for the one-line model. Colour a residual view by species so that remaining group structure becomes a reason to reconsider the model, not merely a technical failure flag. |
| 9 | Pivot from one model to alternatives | Je jeden model jedinou rozumnou možností? | Return to the species pattern in the data and residuals. Recall that one common line, parallel species lines and species-specific slopes encode different biological claims. |
| 10 | Candidate set defined before scores | Tři modely vyjadřují tři biologické představy | Present model cards for `vyska_stromu_m ~ prumer_kmene_cm`, `vyska_stromu_m ~ prumer_kmene_cm + druh_stromu`, and `vyska_stromu_m ~ prumer_kmene_cm * druh_stromu`. Make clear that these are planned candidates, not every possible formula. |
| 11 | Compare fitted patterns and remaining variation | Co jednotlivé modely zachytí a co zůstane v residuích? | Place the three fitted-line panels on common axes and connect each to its residual pattern or residual sum of squares. Let students predict which model follows the observed rows most closely before showing comparison metrics. |
| 12 | Model-comparison question | Jak poznáme, který model je lepší? | Elicit fit, complexity, diagnostics, biological meaning and interpretability as possible evidence. Establish that this is a subordinate comparison question serving the main question, not a replacement for it. |
| 13 | Ordinary R² | Kolik variability zachytí model? | Return to the R² line first seen in `summary()`. Build it from fitted versus residual variation and compare its values across the same three candidates. |
| 14 | Limitation of ordinary R² | Je složitější model vždy lepší? | Show why R² cannot decrease when terms are added to nested least-squares models. The most flexible candidate therefore has the highest R² by construction, creating the need for a fit-complexity compromise. |
| 15 | Adjusted R² | Vyváží lepší shoda další parametry? | Return to the adjusted R² line parked in `summary()`. Explain its penalty intuitively through sample size and number of fitted coefficients; do not derive the formula or equate its meaning with R². |
| 16 | AIC | Který kandidát má silnější relativní podporu? | Introduce lower AIC as stronger relative support within this candidate set. State the same-response and same-observations requirement and explain the fit penalty intuitively without deriving likelihood or treating absolute AIC as meaningful. |
| 17 | Metric synthesis | Ukazují všechna tři kritéria na stejný model? | Reveal one computed comparison table. Ordinary R² is highest for the interaction, while adjusted R² and AIC prefer the additive species model. Emphasise that the summaries answer different questions rather than voting on a true model. |
| 18 | Return to diagnostics and evidence limits | Stačí dobré skóre k tomu, aby byl model dobrý? | Compare the familiar diagnostic evidence for the leading candidates. Keep the modest influence and visible normality caveat; scores do not repair a poor data-generating, sampling or biological story. |
| 19 | Answer to the overarching question | Který model lze pro tyto stromy nejlépe obhájit? | Build an evidence card: biological question, fitted pattern, R², adjusted R², AIC, diagnostics, interpretability and limits. Prefer the additive species model conditionally, not as truth, and answer the lesson question explicitly: model quality is a supported argument, not one score. |
| 20 | Reusable candidate-model workflow | Jak porovnávat modely bez automatického hledání? | Generalise the sequence: inspect and visualise, formulate candidates, keep response and rows fixed, fit, compare metrics, diagnose, interpret, and report uncertainty and limits. Explicitly reject `stepAIC()`, `dredge()` and coefficient-by-coefficient deletion. |
| 21 | Bridge to the next lesson | Co když žádný lineární kandidát nestačí? | Ask what to do if every straight-line candidate leaves systematic structure. Motivate later work on nonlinear forms and transformations without fitting or recommending one here. |

## Knowledge-state ledger

Read each row as the state before and after its matching story-map block. A question may foreshadow a later idea, but an answer may use only evidence already shown or supplied in that block.

| Concept block | May assume before | Introduced or earned here | Must not assume yet | Evidence or experience |
|---|---|---|---|---|
| 1 — Overarching question | Students know that fitted models can differ in their results and assumptions. | Model quality becomes the lesson-wide problem to be answered through accumulated evidence. | A definition of “good”, a comparison rule or a preferred candidate. | The main question is posed without an immediate answer. |
| 2 — Workflow retrieval | Students have previously inspected data, plotted relationships, fitted linear models, interpreted output and checked assumptions. | Those actions form one connected analytical workflow that can be reconstructed and reused. | Any new comparison metric or preferred model. | An open retrieval prompt completed by students before the workflow is shown. |
| 3 — Outcomes | Students have recalled the one-model workflow. | The four new actions and formal limits of this lesson. | Metric definitions or the selected candidate. | Plain-language outcomes connected to extending the familiar workflow and answering the main question. |
| 4 — Data overview | Students understand rows, variables and measured traits. | One row is one tree; species, diameter, height, provenance, types, completeness, ranges and the common 63-row table are established. | A fitted relationship, model ranking or generalisation beyond the sampled trees. | Visible base-R inspection, representative rows and concise summaries. |
| 5 — Observed pattern | Students can read a species-coloured scatterplot. | Height generally increases with diameter, with possible species differences worth investigating. | Whether different intercepts or slopes are sufficiently supported. | Individual points, stable species colours and a noticing prompt. |
| 6 — First model | Students know simple `lm()` formulas and coefficient meanings. | One common diameter-height line is fitted as an explicit first attempt. | That this is the only, best or true model. | Visible `lm()` code and the line over the observed points. |
| 7 — Model summary | Students can interpret coefficient estimates and uncertainty. | Familiar parts of `summary()` are interpreted; R² and adjusted R² are noticed and parked as new questions. | What either R² quantity means or which model it favours. | Complete visible output annotated as known now versus returning later. |
| 8 — First diagnostics | Students know residual, Q-Q and influence checks. | The one-line model leaves structure, including possible species-related residual differences, that motivates revising the model. | Which alternative should be preferred or how it will be scored. | Familiar diagnostics plus a residual view coloured by species. |
| 9 — Alternative structures | Students have interpreted additive and interaction predictions. | One common line, parallel species lines and species-specific slopes are all plausible answers to the biological question. | Which structure the tree data support. | A compact three-card schematic using only the new tree context. |
| 10 — Candidate claims | Students know the three familiar formula structures. | The formulas become three predeclared biological claims; candidate definition precedes comparison scores. | Which candidate fits best or whether any candidate is true. | Formula cards paired with plain-language line diagrams. |
| 11 — Fit and residuals | Students know fitted values and residuals. | More flexible candidates can follow observed rows more closely and leave less residual variation. | The formal meaning or value of R², adjusted R² or AIC. | Three fitted-line panels and comparable residual evidence. |
| 12 — Comparison question | Students have three candidates with visibly different fits. | “Better” requires evidence about fit, complexity, diagnostics and scientific meaning. | A mechanical checklist, metric rule or preferred candidate. | A structured elicitation that turns observations into comparison criteria. |
| 13 — R² | Students have seen R² in `summary()` and fitted-versus-residual variation. | R² describes the fraction of observed response variability represented by a model and summarises in-sample fit. | A complexity penalty or a rule that highest R² is best. | Same-row fits, residual sums of squares and computed R² values. |
| 14 — Complexity problem | Students know that the most flexible candidate has the highest R². | R² cannot decrease when nested least-squares terms are added, so complexity can improve this score without establishing a better model. | How adjusted R² or AIC applies a penalty. | A nested-model thought experiment tied to the three candidates. |
| 15 — Adjusted R² | Students understand why ordinary R² rewards extra flexibility. | Adjusted R² discounts fit gains according to sample size and fitted-parameter count. | A likelihood interpretation, equivalence with AIC or universal threshold. | The parked `summary()` value, parameter counts and changes across the same models. |
| 16 — AIC | Students know that fit and complexity can be weighed together. | AIC is a relative support measure with lower values preferred only among comparable candidates. | That AIC is an absolute quality score, probability of truth or causal evidence. | Same-response candidate table and model-specific AIC values. |
| 17 — Metric contrast | All three summaries have been earned separately. | They answer different questions: the interaction maximises R², while the additive model leads on adjusted R² and AIC. | A mechanical final choice without diagnostics or biological reasoning. | One computed table with direction-of-preference cues and an interpretation prompt. |
| 18 — Diagnostic return | Students know familiar diagnostics and the score comparison. | Score comparisons remain conditional on model adequacy, sampling and observed-range support. | That passing diagnostics proves truth or that a mild violation dictates automatic deletion. | Comparable diagnostic panels and the known small-sample/Q-Q caveat. |
| 19 — Defended answer | Students have the biological claims, fitted patterns, metrics and diagnostics. | A conditional defence of the additive species model and the conclusion that model quality is supported by several kinds of evidence, not established by one score. | General validity for all conifers or a causal species effect. | An evidence card that separates support, interpretation and limitations and answers the main question. |
| 20 — General workflow | Students have extended the one-model workflow to a candidate comparison. | A reusable candidate-first comparison workflow and reasons to avoid automatic searches. | Cross-validation, model averaging, regularisation or post-selection inference. | A compact workflow diagram populated with the tree example. |
| 21 — Next question | Students can recognise remaining structure after comparing linear candidates. | Systematic residual structure can motivate alternative functional forms in a later lesson. | Polynomial fitting, transformations or nonlinear-model selection. | A residual-pattern question that ends before a new method is introduced. |

## Story-map audits before human approval

- Heading strip: rows 1-21 form a continuous problem-driven sequence under the main question “Jak poznáme, že je model dobrý?” The lesson retrieves what students can already do with one model, applies that workflow to new data, discovers a limitation, formulates alternatives, learns how to compare them, and returns to the main question with a conditional defence.
- Header-hierarchy audit: block 1 is the overarching lesson question. Block 2, “Co už s daty umíme udělat?”, is explicitly a subordinate retrieval section; it does not compete with or replace the lesson question. The model-comparison question in block 12 is likewise a subordinate step towards the final answer.
- Retrieval audit: block 2 asks students to reconstruct the workflow rather than displaying it. Blocks 4-8 then enact that workflow on the tree data: overview, plot, fit, `summary()`, diagnostics. New quantities visible in `summary()` are parked rather than explained prematurely.
- Pivot audit: remaining species structure in block 8 motivates alternative model structures in block 9. The three candidates are fixed in block 10 before any comparison score is shown. This prevents the candidate set from appearing only to demonstrate R² or AIC.
- First-use sequence: the data are inspected before plotting; one simple model is fitted and diagnosed before alternatives are introduced; candidate fits and residuals are compared in block 11; the explicit comparison question follows in block 12; R² is introduced in block 13 and its complexity problem isolated in block 14; adjusted R² and AIC follow in blocks 15-16; the combined comparison appears only in block 17; the main question is answered only after returning to diagnostics in block 18.
- Knowledge-state audit: every model uses the same 63-row continuous-response table. No block assumes likelihood, information theory, nonlinear fitting, mixed models, GLMs, automated selection or model averaging.
- Prior-lesson boundary: L08 contributes only the meaning of additive and interaction prediction structures. Crab data, coefficients and results do not reappear.
- Human review focus: please assess whether the main-question/subsection hierarchy is now unambiguous, whether the one-model retrieval sequence is long enough to create continuity but short enough to leave room for the new comparison material, and whether the residual-species pattern provides a convincing pivot to multiple candidates.

## Stage 2A - Structural draft

- Story map completed and explicitly human-approved before full prose: [ ]
- Section order complete: [ ]
- First visual/table included: [ ]
- First interpretation prompt included: [ ]
- Misconception checkpoint included: [ ]
- Bridge to next concept included: [ ]

### Structural draft notes

- Main lesson heading and organising question: Jak poznáme, že je model dobrý?
- First subordinate section: Co už s daty umíme udělat?
- First data moment: inspect the one-tree-per-row structure, species counts, missingness, ranges and diameter overlap, then visualise the diameter-height relationship.
- First complete analytical pass: fit one common line, read its full `summary()`, park the unfamiliar fit summaries, and inspect residuals in blocks 6-8.
- Where the comparison problem first appears: species-related residual structure motivates alternative model forms in block 9; the candidates are formalised in block 10; “better model” becomes the explicit subordinate question only after students have compared their fitted patterns in block 12.

## Stage 2B - Development pass

- Major concept blocks have visual anchors: [ ]
- Interpretation prompts expanded: [ ]
- Explanatory payoff text improved: [ ]
- Transitions revised for self-study readability: [ ]
- Glossary markup checked where relevant: [ ]

### Development pass notes

- Which concept block improved most:
- Which visual or comparison became the main anchor:
- Where the lesson still feels thin:

## Quality check notes

- What improved most:
- What remains weak:
- What needs reviewer focus:

## Stage 3 - Human review gate

- Finished headings and transitions compared with the story map: [ ]
- Heading-strip, visible-copy, and first-use audits completed: [ ]
- Lesson-vision review completed: [ ]
- Glossary-coverage review completed: [ ]
- Human review completed: [ ]
- Credible findings resolved: [ ]
- HTML/PDF rendered and checked: [ ]
- Reviewer decision:

## Decision

- [ ] Written materials are review-ready
- [x] Story-map status is `complete`
- [ ] Human story-map approval is `approved` and recorded
- [x] Diff contains only the Stage 0 approval record and Stage 2 workflow records
- [ ] Written-materials PR ready to merge
- Notes: Full student-facing prose has not been drafted. Work must stop at this gate until Ondřej Mottl explicitly approves the story map and knowledge-state ledger.

# L09 exercise blueprint

## Metadata and authoring gate

- Week: L09, Porovnání kandidátních modelů
- Date: 2026-10-08 (Europe/Prague)
- Author: OpenAI Codex with Ondřej Mottl
- Human plan approval: Ondřej Mottl explicitly requested implementation of the eight-core-task and twenty-optional-task plan in the current conversation on 2026-10-08.
- Branch: `lesson/l09-exercises`, created without tracking `origin/main`
- Base: updated `main`, `24b4a8a`
- Presentation dependency: Stage 5 approval by Ondřej Mottl on 2026-10-06; presentation PR #3 and subsequent publication/quiz changes already merged.
- Status: worksheet complete, validated and independently reviewed; ready for human review; exercise human approval pending.

## Intended use and timing

The current user instruction establishes a 120-minute practical and overrides the older 90-minute default in the canonical authoring and reviewer instructions for this artifact. Allocate 70 minutes to direct core work, 10 to obtaining/opening/checking files, 20 to short explanations, 15 to joint interpretation and discussion, and 5 to recovery. This is a planning budget, not an observed classroom completion time. Optional tasks are a revision bank, not an expectation for the same session.

Keep demonstrations interleaved: one common-model example, supplied prediction-grid mechanics, one R² calculation, one adjusted-R² calculation, AIC extraction, and diagnostic scaffolds. Explanation pauses belong here, not in the public worksheet. Experienced groups can skip the short refresher on `+`, `*`, factors, `$`, and commented code; every new metric accessor remains explained at first use.

## Outcomes, core route, and object flow

| Task | Student action and outcome | Starting state / output | Minutes |
| --- | --- | --- | ---: |
| L09-U01 | Establish the biological question, observation unit and usable data; outcome 3 | Supplied import creates `data_stromy`; student checks rows, species, missingness and draws the scatterplot | 7 |
| L09-U02 | Define candidates before scores; outcome 3 | Common-model worked example creates `mod_spolecny`; student creates `mod_aditivni` and `mod_interakce` on the same 63 rows | 10 |
| L09-U03 | Connect model terms to predicted relationships; outcomes 3–4 | Supplied `data_predikce` uses each species and the shared 7–69 cm range; student creates the additive and interaction prediction columns and graphs | 8 |
| L09-U04 | Explain ordinary R² and its monotonic change; outcome 1 | Supplied common-model RSS/SST example; student obtains R² for the other candidates | 10 |
| L09-U05 | Explain adjusted R² versus ordinary R²; outcome 2 | Three models; supplied single-model calculation; student counts 2/4/6 coefficients and compares adjusted R² | 8 |
| L09-U06 | Assemble and interpret relative comparison metrics; outcomes 2–3 | Three models; supplied table scaffold; student creates `data_porovnani` with `model`, `n`, `k`, `r2`, `r2_adj`, `aic`, `delta_aic` | 9 |
| L09-U07 | Check suitability beyond ranking; outcome 4 | `mod_aditivni`; student plots residuals, Q–Q and Cook's distances, and creates `vec_cook` | 10 |
| L09-U08 | Defend a conditional biological conclusion; outcome 4 | Original data, model plots, comparison table and diagnostics; written defence with at least two kinds of evidence and a limitation | 8 |

All core models have an intercept, height in metres as the response and the same complete observations. `k` denotes regression coefficients, including the intercept, not the full parameter count used internally by AIC. Do not derive AIC from `k`; obtain it with `AIC()`. Rank metrics at full precision; round only for display. The additive model has strongest support among the three, but the residual arch means it is not a fully adequate description of the shape.

## Prerequisites and dependencies

- Statistics: L07 additive models, L08 interaction formulas and conditional predictions; earlier residuals, Q–Q plots, influence, uncertainty and observational-versus-causal reasoning.
- R: data frames, indexing, factors, `lm()`, `coef()`, `summary()`, `predict()`, `fitted()`, `residuals()`, base plots and confidence intervals. Explain new accessors and mechanics before use.
- Dataset: `data/allometrie_stromu.csv`, 63 trees, one row per tree, three species; provenance and CC0 reuse terms remain in `data/README.md`.
- Responses: `vyska_stromu_m`, optional `hmotnost_vetvi_kg` (dry branch mass, kg) and `plocha_listu_m2` (leaf area, m²). Diameter is measured at 1.3 m, in cm.
- External packages: none. No private helpers, automatic package installation, session changes or network reads from sourced code.
- Student setup: download the reviewed script and existing CSV, create `L09_praktikum/data`, then an Existing Directory RStudio Project. Public stable routes only become available for the exercise after a separately approved release; until then review the branch-local draft.
- Empty worksheet: executable preflight/import and independent worked examples; answer-dependent scaffolds are comments. Run completed tasks in order using Ctrl + Enter; no automatic answer repair or hidden solution objects.
- Solutions: external untracked reference harness, outside the public repository. Full solution code, private reviewer correspondence and operational notes must not be added to the public bundle.

## Optional bank and prerequisites

Optional tasks are selected by purpose after completing the named core tasks. N17–N18 is the only optional-to-optional dependency. New temporary datasets and model objects use distinct names; never overwrite core objects. Deliberately missing values and exclusions are labelled demonstrations, never edits to the CSV.

| ID | Purpose | Required core objects / optional prerequisite | Estimated minutes |
| --- | --- | --- | ---: |
| N01 | Expanded versus compact interaction formula | `data_stromy`, `mod_interakce` | 6 |
| N02 | Reference-level invariance | `data_stromy`, `data_predikce`, `mod_aditivni`; explained `relevel()` scaffold | 8 |
| N03 | Coefficient names and species contrasts | All three core models | 5 |
| N04 | Species predictions at 30 and 60 cm | `data_stromy`, additive and interaction models; supplied six-row grid | 8 |
| N05 | Full precision versus rounded rankings | `data_porovnani` | 5 |
| N06 | Reconstruct adjusted R² | `mod_interakce` | 6 |
| N07 | RSS by two routes, then R² | `mod_aditivni`, `sst_vyska`; explained `deviance()` | 6 |
| N08 | Change the candidate set, recalculate ΔAIC | `data_porovnani` | 8 |
| N09 | Artificial missing species value and common-case repair | `data_stromy`; explained `complete.cases()` and row identities | 10 |
| N10 | Equal counts, different tree identities | `data_stromy`; explicit first-62 and last-62 subsets | 7 |
| N11 | Invalid cross-response AIC comparison | `data_stromy`, `mod_spolecny`; separate mass model | 5 |
| N12 | Incorrect square/sum order | `mod_aditivni` | 6 |
| N13 | Investigate the largest Cook distance | `mod_aditivni`, `data_stromy`; reconstruct `vec_cook` locally | 8 |
| N14 | Labelled one-tree sensitivity analysis | `mod_aditivni`, `data_stromy`; reconstruct index locally, no N13 dependency | 12 |
| N15 | Zero residual means versus curved patterns | `mod_aditivni`, `data_stromy`; explained `aggregate()` scaffold | 8 |
| N16 | Prediction uncertainty and extrapolation | `mod_aditivni`, `data_stromy`; students build the 30/100 cm grid following the U03 pattern | 8 |
| N17 | Branch-mass hypotheses and three candidate fits | `data_stromy`; creates `mod_vetve_spolecny`, `mod_vetve_aditivni`, `mod_vetve_interakce` | 12 |
| N18 | Branch-mass comparison, diagnostics and defence | N17 models, `data_stromy` | 15 |
| N19 | Independent leaf-area analysis | `data_stromy`; own three `mod_listy_*` objects | 20 |
| N20 | Evidence-based correction of a misleading conclusion | Core comparison and diagnostic outputs | 10 |

Estimated optional direct-work total: 173 minutes across several sessions. Repetition and transfer are distinct: branch mass changes the ranking and has pronounced influence; leaf area supports the additive candidate again but still requires diagnostics. Do not make a shared conclusion mandatory across responses. For N14, compare rankings within each row set only; do not compare absolute AIC between the 63-tree and 62-tree fits. For N16, an interval at 100 cm remains conditional on an extrapolated model.

## Teacher facilitation and timing walkthrough

Use the 20-minute explanation allocation as five short pauses: 4 minutes on question/formula meaning before U02, 3 on plotting mechanics before U03, 5 on RSS/SST before U04, 4 on the coefficient count before U05, and 4 on conditional metrics and diagnostics before U06–U07. Allocate the 15-minute discussion to comparing candidate hypotheses (4), reading the disagreement among metrics (4), and defending the conclusion with the residual arch (7). Keep the 5-minute recovery allocation for reopening the correct project, repairing file placement, or rerunning saved earlier answers; do not use it to require optional tasks.

The author walkthrough followed setup and the eight tasks in order, executed supplied scaffolds, inspected graphs, and checked the intended verbal responses in the external harness. This is a reproducible author rehearsal, not a timed novice classroom trial. Retain the 70-minute direct-work estimate: U01 4 minutes checks plus 3 graph/question; U02 4 hypotheses plus 6 model fitting; U03 4 predictions/scaffold copying plus 4 interpretation; U04 6 arithmetic plus 4 comparison; U05 5 coefficient/formula work plus 3 interpretation; U06 6 table assembly plus 3 interpretation; U07 6 graph construction plus 4 reading; U08 5 drafting plus 3 evidence checking. U03 and U06 are the main typing bottlenecks; keep their mechanical scaffolds visible and use the explanation pauses for errors in syntax. Slower groups may finish U08 during the allocated discussion. Optional-task estimates remain separate in the table above and have not been measured in a student cohort.

## Release boundary

No automated variable selection, transformations, nonlinear terms, AICc/BIC, model averaging, cross-validation, new data acquisition or causal identification. No changes to the approved Quarto sources, their rendered outputs, PollsLive, or the original CSV. Adding an exercise to the manifest prepares delivery; it does not approve the script for release. The missing lesson-derived title-slide image is a separate public-release blocker under the updated course policy.

## Validation and review record

- Parsing and clean-session execution: passed using R 4.5.1 `Rscript.exe --vanilla` in a temporary student directory containing only the worksheet and CSV.
- All 28 tasks solved in an external reference harness: passed; optional work uses fresh environments populated with core objects, with N17–N18 explicitly linked. Full answers and 21 graph PNGs remain outside the repository under the operating-system temporary validation directory.
- Expected checks mechanically derived and verified: passed; six inline numeric checks generated from the reference calculations, with Czech decimal formatting. Regression counts, full-precision rankings, row identities, reference-level invariance, deliberate invalid comparisons, and unchanged original data checked.
- Student distribution and missing-file recovery: local two-file layout passed; missing CSV gives the intended Czech error and copying it into `data/` restores execution. New stable script route is not yet published; acquisition instructions point to named README links, explain the GitHub Download raw file control, and label stable URLs as available after the new release. README separates the current release from the draft. GUI setup was audited against L08; no actual beginner RStudio trial or live release download was performed.
- Distribution metadata: manifest loaded with Ruby's safe YAML parser; schema, all ten resource paths and their exact case, exercise/data entries, local README links and distributed file bytes verified. The canonical course packager maps the script to `code/cviceni.R` and the CSV to `data/allometrie_stromu.csv`. No release bundle or deployment was produced.
- UTF-8, prohibited-pattern and first-use checks: passed; 28 unique ordered IDs and all task fields checked. Optional `deviance()` and `which.max()` meanings are repeated where needed so N12 and N14 do not depend on other optional tasks.
- Saved graph inspection: all 21 PNGs inspected by author and independent reviewer for labels, legends, species distinctions, residual shape, QQ plots and influence, including all three candidate relationships. Actual commented plotting, reference-change, prediction-grid, complete-case and aggregate scaffolds were executed, including the named `x` argument used by `aggregate()` in R 4.5.1.
- Core-route rehearsal and timing assessment: author walkthrough complete; estimated 70 direct-work minutes within the confirmed 120-minute allocation, not a measured novice completion time. Optional bank estimated at 173 minutes across later sessions.
- Independent exercise reviewer: separate read-only Codex exercise reviewer using the canonical `.ai/agents/exercise-reviewer.md` prompt, 2026-10-08. Final outcome: **No findings.** Worksheet and blueprint ready for human review. Confirmed scope and estimated timing against the explicit 120-minute instruction.
- Human exercise approval: pending; plan approval above does not approve the finished script.

### Review revisions and remaining gates

The independent reviewer requested clearer axes in N13 and N15 and an actionable draft acquisition route. N13 now explicitly puts height on y and diameter on x; N15 puts residuals on y and diameter on x. The worksheet names the README links and raw-file download control instead of assuming Git knowledge. The reviewer rechecked the revisions and all 21 graphs. Clean-session execution, missing-file recovery, all 28 solutions and numeric checks were rerun after these changes and passed. No Quarto render was needed because the approved written and slide sources and outputs were unchanged; their source hashes and the CSV hash match the pre-edit baseline.

### Second review round (Claude Code, 2026-10-08)

A follow-up author review with Claude Code re-verified all core expected values in R 4.5.3 (`--vanilla`) and made five small worksheet edits:

- The setup comment now states that `vec_barvy_druhu[data_stromy$druh_stromu]` selects by factor-level order, not by name.
- N02 now warns not to plot `data_reference` with the supplied colours after `relevel()`, which would mismatch species and colours.
- The N05 expected result is corrected. Rounded adjusted R² of the two species models coincides (0.78). Rounded AIC of the common and interaction models is 399 versus 398, although the true difference is about 0.37.
- N04 now states its own run instruction instead of pointing to N02, so optional tasks remain independent as the script promises.
- Two hint/task calls now use named-argument forms, and the U01 hint refers to the existing `colSums()` example output.

A separate read-only Claude subagent used `.ai/agents/exercise-reviewer.md` to review the complete script. It reported no genuine defects, one low-severity finding (the N04 cross-reference, now fixed) and optional polish (the named-argument consistency, now applied). Its U03 typing-load suggestion was left for the human reviewer. The clean-session run passed after these edits. The optional-task solutions and graphs from the first round were not regenerated, because these edits changed no code or data.

### Language rewrite (Claude Code, 2026-10-08)

Ondřej Mottl judged the student-facing wording unclear: from U02 onward it was not clear what students should do. All student-facing comments were rewritten in the L08 style. The rewrite covers the setup, explanations, all eight core tasks and all twenty optional tasks. The wording changes are:

- `Zadání` is split into numbered steps.
- Prose uses full sentences, with blank lines between task fields.
- Terminology is consistent: "odezva" (as in the written lesson), "model s interakcí" and "modely s druhem".
- Objects students must create are named in `Zadání`, for example `rss_aditivni`, `r2_aditivni` and the N04 columns.
- Self-check values were added: U04 R² values, N04 species differences, N07 R² and the N13 row.
- The Code > Comment/Uncomment Lines shortcut taught in L08 is reintroduced for uncommenting scaffolds.
- N11's model is renamed `mod_hmotnost`, because the invalid part is the comparison, not the model.

No executable code or code scaffold changed; a diff of all code lines confirmed this. The worksheet sources cleanly from a clean R 4.5.3 `--vanilla` session.

A separate read-only Claude subagent reviewed the complete script using `.ai/agents/exercise-reviewer.md` and `student-facing-language.md`. It numerically re-verified every expected result and new factual claim. It reported three clarity defects, all fixed:

- U03 put the scaffold edit only in a hint.
- U03's first hint repeated the task.
- U04 did not name its output objects.

It also reported four minor factual imprecisions, all fixed (U05 output, N10 overlap, N03 intercept scope, Q–Q timing note), and Czech polish, nearly all applied. Not re-verified in this round: visual plot inspection, a full 28-task reference rerun (numeric claims were checked directly instead) and a novice timing trial. Human exercise approval is still pending.

Manifest and README prepare the script/data routes for a future release and explicitly retain pending approval. Human approver: Ondřej Mottl; decision: pending; approval date: not yet recorded; requested revisions: not yet received. Do not treat implementation-plan approval or the independent review as finished-exercise human approval. No commit, push, PR, tag, deployment or public release was performed in this workstream. The title-slide image remains a separate release blocker.

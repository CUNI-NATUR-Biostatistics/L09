# Stage 0 - Scope lock

## Metadata

- Week: L09
- Date: 2026-09-28
- Author: OpenAI Codex, working with Ondřej Mottl
- Reviewer: Ondřej Mottl
- Status: in review; awaiting explicit human approval

## Git checkpoint

- Stage group: Stages 0-1 planning
- Branch: `lesson/l09-scope-data`
- Base branch and commit: `main` at `dd5bd94`
- `git status --short` reviewed: [x]
- Previous-stage PR merged: N/A
- Planned PR: Stages 0-1 planning, after scope and dataset approval

## Topic sentence

Move from interpreting one fitted model to comparing a small set of models defined in advance by biological questions. Students should see that adding terms can only maintain or increase ordinary R², while adjusted R² and AIC impose different complexity penalties and answer different questions. No metric chooses a scientifically useful model by itself: the final defence must also use the biological question, diagnostics, and interpretability.

## Weekly outcomes (mapped)

Canonical source: `_internal/osnova_lekci.md`, section **L09 – Porovnání kandidátních modelů: R², adjustované R² a AIC**.

1. Vysvětlit, proč nejvyšší R² automaticky neznamená nejlepší model.
2. Rozlišit účel R², adjustovaného R² a AIC.
3. Sestavit malou sadu biologicky zdůvodněných kandidátních modelů a porovnat je.
4. Obhájit volbu modelu s ohledem na otázku, složitost, diagnostiku a interpretovatelnost.

## Inspiration consulted

- Authoring problem to solve: prevent model comparison from becoming an automatic search for the smallest number while keeping the three metrics concrete for beginners.
- Relevant sources from the course inspiration hub: [Modern Statistics with R, regression models](https://www.modernstatisticswithr.com/regression.html#variable-selection), [CUNY Biostatistics, combining numerical and categorical predictors](https://jsgosnell.github.io/cuny_biostats_book/content/chapters/Combining_numerical_and_categorical_predictors.html), and [PH525x, expressing a design formula](https://genomicsclass.github.io/book/pages/expressing_design_formula.html).
- Pattern worth borrowing: begin with a biological question and a small set of explicit model cards; keep the same response and rows; compare predictions and residuals before the metric table; interpret only metric differences; finish by checking whether the preferred candidate remains biologically meaningful and diagnostically acceptable.
- Pattern explicitly rejected: `stepAIC()`, `dredge()`, all-subsets search, selecting terms by coefficient p-values, presenting a universal ΔAIC threshold as a mechanical rule, or treating the candidate with the smallest AIC as true.
- Why the selected pattern fits this course: L07 introduced additive models and collinearity, and L08 compared additive and interaction predictions. L09 can reuse those model structures as candidates while changing the new intellectual task from interpreting coefficients to defending a model comparison.

## Concrete student actions

1. Translate one biological question into a small, ordered set of candidate model formulas before inspecting comparison metrics.
2. Use fitted values and residual variation to explain why ordinary R² cannot decrease when a predictor or interaction is added.
3. Read R², adjusted R², and AIC as three different summaries rather than interchangeable scores, and compare AIC only for models fitted to the same response and observations.
4. Defend one candidate using the biological question, complexity, diagnostics, effect interpretability, and the pattern across metrics.

## Out of scope this week

- Automated forward, backward, stepwise, or all-subsets variable selection; post-selection inference; model averaging; and exhaustive searches over every available variable.
- A mathematical derivation of likelihood or AIC, AICc and BIC, cross-validation, regularisation, and prediction-focused machine learning.
- New nonlinear forms or transformations (L10), dependence and mixed models (L11), and non-Gaussian response models (L12).
- Treating model comparison as causal identification or treating an observational candidate model as proof of a mechanism.

## Formal depth boundary

### Core and student-visible

- A candidate model as a biological claim encoded in a familiar `lm()` formula.
- Ordinary R² as the fraction of observed response variability described by the fitted model.
- The monotonic behaviour of ordinary R² when terms are added to nested least-squares models.
- Adjusted R² and AIC as different fit-versus-complexity compromises.
- AIC as a relative comparison within the candidate set, where a lower value indicates stronger relative support; absolute AIC has no standalone interpretation.
- The same-response, same-observations requirement for valid comparison, plus familiar residual and influence checks.

### Intuitive only

- The complexity penalty in adjusted R² depends on the number of fitted coefficients and the sample size.
- AIC combines lack of fit expressed through likelihood with a penalty for estimated parameters.
- Small metric differences should not erase distinctions in biological meaning, diagnostics, or interpretability.

### Deferred

- Deriving adjusted R² or likelihood, estimating Kullback–Leibler information loss, Akaike weights and model averaging, AICc/BIC, cross-validation, regularisation, and formal post-selection uncertainty.

## Risks and dependencies

- Risk: a table of scores could turn the lesson into a ranking exercise. Mitigation: define the candidate questions first and require a written biological defence after diagnostics.
- Risk: students may hear “AIC is lower” as “this model is true”. Mitigation: use only relative language and include a deliberately scientifically weak or diagnostically problematic high-scoring option.
- Risk: comparing models with different missing-data rows would invalidate the intended contrast. Mitigation: construct one complete-case teaching table before fitting every candidate.
- Dependency: the final L08 lesson must have established additive versus interaction predictions. Retrieval should use abstract model cards or a schematic only; no dataset from L01-L08 will be reused in L09.
- Inspiration risk: the CUNY source demonstrates automated selection and large interaction sets. Borrow its relative-AIC cautions, not its automated workflow or complexity.

## Decision

- [ ] Human reviewer approved this scope
- [ ] Scope locked for implementation
- [x] Continue Stage 1 research on this same planning branch
- Notes: The canonical outcomes are internally coherent. On 2026-09-28 the human reviewer explicitly required a genuinely new dataset rather than the L08 crabs or any other L01-L08 dataset. Human review should confirm the proposed depth boundary; Stage 1 now evaluates only new data stories.

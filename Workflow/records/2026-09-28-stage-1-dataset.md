# Stage 1 - Dataset research and decision

## Metadata and Git checkpoint

- Week: L09
- Date: 2026-09-28
- Author: OpenAI Codex, working with Ondřej Mottl
- Reviewer: Ondřej Mottl
- Branch: `lesson/l09-scope-data`, based on `main` at `dd5bd94`
- `git status --short` reviewed before research: [x]
- Stage 0 record is on this branch: [x]
- Decision status: **approved and locked**
- Human approval: Ondřej Mottl, 2026-09-29
- Planning PR: not created

## Human constraint and exclusion audit

On 2026-09-28 the reviewer rejected the provisional reuse of `MASS::crabs` and required a dataset not seen in an earlier lesson. The search was therefore restarted rather than merely reranking the old shortlist.

| Lesson | Dataset excluded from L09 |
|---|---|
| L01 | `ggplot2::msleep` |
| L02 | Palmer Penguins |
| L03 | `iris` |
| L04 | Old Faithful 2024 eruptions |
| L05 | Atlantic fiddler crab (`Minuca pugnax`) salt-marsh data |
| L06 | Palmer Penguins |
| L07 | Japanese knotweed populations and climate |
| L08 | `MASS::crabs` |

No excluded dataset remains in the shortlist or recommendation.

## Dataset requirements

The dataset must support one continuous response, 2-4 familiar predictor terms, at least three biologically defensible candidate formulas fitted to exactly the same observations, and a visible but manageable contrast among R², adjusted R², and AIC. At least one added term should raise R² while receiving little or negative support from a complexity-aware metric. The main route must remain in `lm()`; strongly nonlinear, non-Gaussian, longitudinal, hierarchical, phylogenetically structured, and high-dimensional problems are deferred.

## Broad discovery gate

- Independent source families consulted: CRAN `lgrdata`; OpenIntro/DAAG; CRAN `Stat2Data`; CRAN `faraway`; Dryad; Figshare/AVONET; CRAN `Sleuth3`.
- Credible examples reviewed: 10.
- Primary dataset documentation or domain repositories included: [x]
- Previously used L01-L08 datasets excluded before shortlisting: [x]
- Minimum of 8 examples from at least 4 source families reached without padding trivial variants: [x]

| New example | Proposed question | Provenance and reuse | Main complication and disposition |
|---|---|---|---|
| [Tree allometry](https://cran.r-project.org/package=lgrdata), `lgrdata::allometry` | Does tree height depend only on trunk diameter, also on species, or on a species-specific diameter slope? | 63 trees, three conifer species; data credited to John Marshall, University of Idaho; package is CC0 | Small sample and some Q-Q deviation, but stable spread and moderate influence; **finalist** |
| [Australian and New Guinean possums](https://www.openintro.org/data/index.php?data=possum) | Do total length, sex, age, and population explain head length? | 104 trapped possums; derived from the DAAG data and Lindenmayer et al. (1995) | Excellent diagnostics and story, but item-level reuse terms are not explicit on the dataset page; **finalist** |
| [Hawks](https://stat.ethz.ch/CRAN/web/packages/Stat2Data/Stat2Data.pdf), `Stat2Data::Hawks` | Do wing length, species, age, and sex explain body mass? | 908 hawks sampled at Lake MacBride, Iowa, by Cornell College students and faculty; distributed in a GPL-3 package | Sex is undocumented/blank for almost all red-tailed hawks and several influential observations dominate; **finalist, lower rank** |
| [Australian forest birds](https://www.openintro.org/data/index.php?data=forest.birds) | Do patch area, isolation, grazing, and altitude explain mean bird abundance? | 56 forest patches; based on Loyn's habitat-fragmentation study | The response is an average count, grazing adds four coefficients, and the area-only model has Cook's distance above 2; **reject** |
| [Tibetan frog maternal investment](https://www.openintro.org/data/index.php?data=frog) | Do maternal body size and altitude explain egg size? | 431 clutches from eastern Tibetan Plateau ponds; source links to Dryad | Maternal body size is absent for 302 rows and observations are clustered by site/pond; **reject** |
| [Fruit-fly longevity](https://stat.ethz.ch/CRAN/web/packages/faraway/refman/faraway.html), `faraway::fruitfly` | Does sexual activity alter longevity after accounting for thorax size? | 124 observed male flies; Partridge and Farquhar (1981) | Five activity levels create a ten-coefficient interaction and item-level redistribution terms are unclear; **reject after probe** |
| [Plains zebra morphology](https://datadryad.org/dataset/doi:10.5061/dryad.4qrfj6qsk) | Which body dimensions and sex explain measured mass? | 442 Serengeti zebras measured in 1969-1971; Dryad record is explicitly reusable | Extensive missingness, predicted mass is mixed with measured mass, and the published analysis is nonlinear; **reject** |
| [AVONET](https://figshare.com/articles/dataset/AVONET_morphological_ecological_and_geographical_data_for_all_birds_Tobias_et_al_2021_Ecology_Letters_/16586228) | Which traits explain bird body mass across species? | Global bird-trait database, CC BY 4.0 | Phylogenetic non-independence, scale, and high dimensionality belong beyond L09; **reject** |
| [Human body dimensions](https://www.openintro.org/book/statdata/?data=bdims) | Do height, sex, and body girths explain mass? | 507 physically active adults; based on Heinz et al. (2003) | Many interchangeable predictors invite automatic selection and the story is less aligned with the biological course; **reject** |
| [Parental care and clutch volume](https://stat.ethz.ch/CRAN/web/packages/Sleuth3/refman/Sleuth3.html), `Sleuth3::ex1031` | Does adult mass and parental-care system explain clutch volume? | 443 groups of birds, crocodiles, and dinosaurs | Requires log transformations and raises phylogenetic non-independence; **reject** |

## Finalist comparison

| Finalist | Outcome fit | Practical feasibility | Main risk | Rank |
|---|---|---|---|---|
| Tree allometry | Excellent: the interaction raises R² but both adjusted R² and AIC prefer the additive species model | 63 complete rows, three familiar variables, CC0, simple model cards and plots | Some residual non-normality must be shown rather than hidden | 1 |
| Possum morphology | Excellent: the fullest model has the highest R², while adjusted R² and AIC prefer the model without population | 102 common complete rows; intuitive measurements; clean residual spread and modest influence | Reuse permission for a locally redistributed copy is not explicit | 2 |
| Hawk morphology | Good metric contrast across wing, species, sex, and age models | Large sample and memorable field story | Sex coding is severely incomplete by species and influence is excessive | 3 |

## Numerical feasibility probes

All models within each finalist were fitted to the same response rows. R² and adjusted R² come from `summary.lm`; AIC comes from base R `AIC()`. Cook's distance is a descriptive influence screen, not a deletion rule.

### Finalist 1: tree allometry

- Proposed response: tree height (m).
- Proposed candidates:
  1. size-only: `height ~ diameter`
  2. additive species: `height ~ diameter + species`
  3. species-specific slopes: `height ~ diameter * species`

| Candidate | R² | Adjusted R² | AIC |
|---|---:|---:|---:|
| Size-only | 0.7678 | 0.7640 | 398.6 |
| Additive species | 0.7929 | 0.7823 | 395.4 |
| Species-specific slopes | 0.7967 | 0.7789 | 398.3 |

The interaction increases ordinary R², but adjusted R² falls and AIC worsens. Absolute residual size has essentially no relation to fitted height (correlations -0.01 to -0.12), maximum Cook's distance is 0.13-0.23, and 2-6 rows exceed the descriptive `4/n` screen. The additive and interaction residuals deviate from normality, so the preferred candidate still requires an honest Q-Q check and a qualified conclusion.

### Finalist 2: possum morphology

- Proposed response: head length (mm).
- Common table: 102 possums complete for head length, total length, sex, age, and population.
- Proposed candidates: `head_l ~ total_l`; add sex; add age; then add population.

| Candidate | R² | Adjusted R² | AIC |
|---|---:|---:|---:|
| Body size | 0.4547 | 0.4492 | 489.8 |
| Sexual dimorphism | 0.5062 | 0.4962 | 481.6 |
| Age structure | 0.5304 | 0.5160 | 478.5 |
| Age plus geography | 0.5307 | 0.5113 | 480.5 |

Adding population increases R² by only 0.0003, while adjusted R² and AIC both worsen. Residual spread is stable, Shapiro-Wilk p-values are 0.08-0.22, maximum Cook's distance is 0.09-0.11 for the first three candidates, and 5-7 rows exceed `4/n`. The teaching fit is strong; reuse terms are the deciding limitation.

### Finalist 3: hawk morphology

- A clean comparison using Cooper's and sharp-shinned hawks retains 323 complete rows.
- Candidate sequence: wing length; add species; add sex; add age; add a wing-by-species interaction.
- Probe: R² rises from 0.7393 to 0.7774; adjusted R² changes from 0.7384 to 0.7739; AIC falls from 3733 to about 3690 and then barely separates the larger candidates.
- Rejection signal: maximum Cook's distance is 2.5-5.0 in the larger candidates, and the sex field is blank for 573 of 577 red-tailed hawks. Cleaning decisions would dominate the metric lesson.

## Approved decision

- **Approved dataset:** `lgrdata::allometry`, prepared as `data/allometrie_stromu.csv`.
- **Approved response:** tree height.
- **Approved predictors:** trunk diameter and tree species.
- **Main biological question:** Is a common diameter-height relationship adequate for all three conifer species, or is there enough support for species shifts or species-specific slopes?
- **Why it is the best L09 fit:** it is genuinely new to the course, biologically legible, openly reusable under CC0, complete, and produces the exact conceptual contrast required: R² rewards the interaction while both complexity-aware summaries prefer the simpler additive model.
- **First figure:** show the 63 trees coloured by species with one common diameter-height line. Ask students to choose among three unseen model cards before revealing the species-shift and species-specific-slope predictions.
- **Caveat to teach, not conceal:** the preferred model is not automatically "true"; its Q-Q pattern and the small sample keep the conclusion conditional.
- **Decision:** Ondřej Mottl approved the recommended tree-allometry data story on 2026-09-29. Possum and hawk morphology remain documented rejected alternatives.
- **Acquisition:** `R/prepare_allometry_data.R` downloads the pinned CRAN source package, reproduces the Czech teaching table, and leaves all 63 observations and measured values unchanged.

## Decision checklist

- [x] At least 4 independent source families were consulted
- [x] At least 8 genuinely new examples were reviewed
- [x] L01-L08 primary datasets were explicitly excluded
- [x] Three finalists were compared and numerically probed
- [x] Provenance, access, reuse, missingness, and modelling risks were checked proportionally
- [ ] Human reviewer approved the Stage 0 scope
- [x] Human reviewer approved the selected dataset
- [x] Dataset locked for implementation
- [x] README and release metadata updated to the approved public data story
- [ ] Planning PR ready for human review
- Notes: The earlier crab recommendation is superseded. The approved CC0 dataset is stored locally with reproducible acquisition and provenance documentation. Stage 0 scope approval remains a separate open gate.

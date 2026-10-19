# L09 PollsLive retrieval quiz: harder replacement questions

- Date: 2026-10-19
- Branch: `polish/l09-before-teaching` (the retrieval block is part of this polishing round)
- Workstream: focused PollsLive revision, matching the 2026-10-19 revision of L04–L08 and L10
- Status: **approved and implemented locally**; independent review recorded below; synchronized render pending the author's push
- Approver: Ondřej Mottl
- Decision (2026-10-19): „ye, i approve“ — the three exact questions, option order and key D A C as proposed below

Integration-map status: unchanged (slides 3–6, after the hook and before `Výsledky učení`). Exact-question status: approved 2026-10-19.

## Review of the current L09 questions

The current set (key A B D) has the same weaknesses that triggered the revision in the other lessons:

| ID | Problem |
|---|---|
| `changing-sex-difference` | Definitional („Co ukazují nerovnoběžné přímky…?“). The correct option is the longest and the only fully qualified one. The evidence plot is not needed to answer it. |
| `conditional-sex-coefficient` | Recalls a rule („při délce 0 mm“) without using the printed numbers. The evidence card highlights exactly the row the stem names. |
| `additive-versus-interaction` | Again the longest, only fully qualified option. Two distractors („jiné kraby“, „jinou odezvu“) are implausible after L08. |

None of the three asks students to compute or read a value from the evidence. L08 now also has a two-numeric-predictor example (31 felled trees), which the old set predates.

## Integration map

| Position | Teaching move | Student knowledge used (L08) | Bridge to L09 |
|---|---|---|---|
| Q1 | Compute the sex difference at a chosen length from four printed coefficients | Conditional coefficients; the composed difference at 30 mm (L08 slides „Rozdíl při 30 mm skládají dva známé příspěvky“, written materials „Co model předpovídá pro stejně dlouhou samici a samce?“) | A model with more terms is read conditionally; „lepší“ is not visible from one coefficient. |
| Q2 | Compute the difference of differences from four group means | L08 second example, „Interakce je rozdíl dvou rozdílů“ and its means table | The interaction is one extra coefficient; whether it is worth it is the L09 question. |
| Q3 | Separate a computable slope from a supported one outside the observed heights | L08 third example, `mod_stromy`, slides „`prumer_cm * vyska_m`: sklon průměru závisí na výšce“ and „Pro který strom platí koeficient `prumer_cm`?“, outcome „omezit závěr na pozorovaný rozsah dat“ | L09 also works with trees, diameter and height; the bridge line on slide 9 picks this up, and the closing arch in L09 is again about where a straight line stops describing data. |

## Approved exact questions

Values were checked in a fresh R session on L08 `data/krabi.csv` (100 blue crabs; reference level `samice`) and `data/stromy.csv` (31 trees).

### Q1 — `rozdil-pohlavi-pri-30-mm` (correct: D)

- Text: `Podle koeficientů modelu s interakcí: jaký je odhadovaný rozdíl zadní šířky samec − samice u krabů s délkou krunýře 30 mm?`
- Options:
  - A `+1,97 mm`
  - B `−0,12 mm`
  - C `+5,71 mm`
  - D `−1,76 mm` **correct**
- Distractors: A reads `pohlavisamec` as the difference at every length; B reads the interaction term alone; C adds the interaction contribution with the wrong sign.
- Explanation: `Koeficient pohlavisamec platí jen při délce 0 mm. Při 30 mm k němu přičteme 30 × interakční koeficient: 1,973 + 30 × (−0,1245) = −1,76 mm. Samec má tedy při 30 mm užší zadní část krunýře.`
- Evidence: new coefficient card of `zadni_sirka_mm ~ delka_krunyre_mm * pohlavi` with all four rows and **no row highlighted** (replaces `l08-koeficient-pohlavi.png`). Values: intercept 0,708; `delka_krunyre_mm` 0,407; `pohlavisamec` 1,973; `delka_krunyre_mm:pohlavisamec` −0,1245.
- Alt: `Tabulka čtyř koeficientů modelu s interakcí délky krunýře a pohlaví modrých krabů.`

### Q2 — `rozdil-dvou-rozdilu` (correct: A)

- Text: `Obrázek ukazuje průměrné délky krunýře ve čtyřech skupinách. Jakou hodnotu má v modelu forma * pohlavi interakční koeficient formaoranžová:pohlavisamec?`
- Options:
  - A `−4,84 mm` **correct**
  - B `−0,93 mm`
  - C `+3,91 mm`
  - D `+6,52 mm`
- Distractors: B is the sex difference in the orange form only; C is the sex difference in the blue form (`pohlavisamec`); D is the form difference among females (`formaoranžová`).
- Explanation: `Interakce je rozdíl dvou rozdílů: (33,69 − 34,62) − (32,01 − 28,10) = −0,93 − 3,91 = −4,84 mm. O tolik je rozdíl samec − samice u oranžové formy menší než u modré.`
- Evidence: redraw of the L08 four-group means figure with the four means printed (blue F 28,10; blue M 32,01; orange F 34,62; orange M 33,69 mm), in the L08 sex colours `#009E73`/`#CC79A7`.
- Alt: `Průměrné délky krunýře samic a samců modré a oranžové formy; u modré formy jsou samci delší, u oranžové jsou obě pohlaví téměř stejně dlouhá.`

### Q3 — `sklon-mimo-rozsah-vysek` (correct: C)

L08 already asks „Pro který strom platí koeficient `prumer_cm`?“ (answer: only for a tree 0 m tall), so Q3 does not repeat it. It retrieves L08 outcome 5 (limit conclusions to the observed range) on the same model.

- Text: `Podle modelu s interakcí průměru a výšky: můžeme odhadnout, o kolik dřeva přibude s každým centimetrem průměru u stromu vysokého 35 m?`
- Options:
  - A `Ano, sklon je +0,107 m³ na 1 cm.`
  - B `Ano, sklon je −0,065 m³ na 1 cm.`
  - C `Spočítat lze, ale 35 m je mimo data.` **correct**
  - D `Ne, u dvou číselných znaků sklon nespočítáme.`
- Distractors: A computes the slope correctly but trusts the extrapolation; B reads `prumer_cm` as the slope at every height; D denies that the slope at a chosen height can be computed at all.
- Explanation: `Vzorec −0,065 + 35 × 0,0049 dá +0,107 m³ na 1 cm, ale změřené stromy byly vysoké jen 19–27 m. Mimo tento rozsah data tvar vztahu nepodporují, takže číslo je extrapolace. Uvnitř dat je sklon např. +0,038 (21 m) a +0,058 (25 m) m³ na 1 cm.`
- Evidence: coefficient card of `objem_m3 ~ prumer_cm * vyska_m` (intercept 1,965; `prumer_cm` −0,0653; `vyska_m` −0,1205; `prumer_cm:vyska_m` 0,00493) with the observed ranges in a subtitle (průměr 21,1–52,3 cm, výška 19,2–26,5 m).
- Alt: `Tabulka čtyř koeficientů modelu objemu dřeva s interakcí průměru a výšky kmene a pozorované rozsahy obou prediktorů.`

Option lengths are deliberately similar within each question; the correct option is never the only fully qualified one.

## Knowledge-state ledger

| Item | Available before quiz? | Evidence in L08 |
|---|---|---|
| Main coefficient in an interaction model is the contrast at 0 of the other predictor | yes | slides „Koeficient pohlaví porovnává skupiny při délce 0 mm“, MCQ „Platí koeficient `pohlavisamec` při každé délce?“ |
| Group difference at a chosen value = main coefficient + value × interaction | yes | slide „Rozdíl při 30 mm skládají dva známé příspěvky“ |
| Interaction of two categorical predictors = difference of differences | yes | slides „Jak velký je rozdíl samec minus samice v každé formě?“, „Interakce je rozdíl dvou rozdílů“, MCQ on the orange-form difference |
| Numeric × numeric: the slope of one predictor at a chosen value of the other; report it only inside the data | yes | written materials „Co znamená koeficient průměru, když se sklon mění s výškou?“ with its warning box and the spine answer („platí to jen v pozorovaném rozsahu průměrů a výšek“); slides „Pro který strom platí koeficient `prumer_cm`?“ |

## Answer key and course balance

Proposed L09 key: **D A C** (three distinct positions; not used by any other lesson).

With the approved revisions (L02 B C A, L03 A D C, L04 C A D, L05 B D A, L06 A B D, L07 D B C, L08 C A B, L10 D C B), the 27 four-option questions give A 7, B 6, C 7, D 7. At each question number every position is correct two or three times. This is the closest possible balance with nine lessons.

## Implementation

- `R/render_pollslive_assets.R` rewritten: it verifies both source copies, refits the three L08 models, stops if any keyed value changes (`stopifnot`), and renders the three assets with decimal commas and U+2212 minus signs.
- `pollslive/source/l08-stromy.csv` added (L08 `data/stromy.csv` at revision `bfb80b0a7469f20519f3cb1f3b52a8f333aef5bf`, line-ending-normalised SHA-256 `eb74a2ee1e2a567e7638fc3a4af03659af3e53443c3298b577d88c49c72e912e`). `l08-krabi.csv` is unchanged (revision `48a02706b17ef01d16ef84ec5d962e81710d2c4a`, SHA-256 `b88686865d6ef17e852495ee368a5d35919be6cefe20f0f6e308104ff68701de`; the L08 file is identical up to `bfb80b0`).
- `pollslive/quiz.json`: the three approved questions with Czech option IDs (as in L08), media paths, alt texts and provenance with both source pins and the asset SHA-256.
- `R/verify_pollslive_assets.R`: checksums pinned to the new assets. The previous assets `l08-nerovnobezne-primky.png`, `l08-koeficient-pohlavi.png` and `l08-dva-kandidati.png` are removed.

Changes from the approved proposal, kept within its meaning: the offline static PDF showed the answer panel of Q2 and Q3 running off the slide, because the stems took three or four heading lines. The stems were shortened to 80–91 characters (other lessons use about 75–120). Options, key, explanations and evidence are unchanged, and number–unit pairs in the stems use non-breaking spaces.

| Q | Approved stem | Implemented stem |
|---|---|---|
| Q1 | Podle koeficientů modelu s interakcí: jaký je odhadovaný rozdíl zadní šířky samec − samice u krabů s délkou krunýře 30 mm? | Jaký je podle modelu s interakcí rozdíl zadní šířky samec − samice při délce krunýře 30 mm? |
| Q2 | Obrázek ukazuje průměrné délky krunýře ve čtyřech skupinách. Jakou hodnotu má v modelu forma * pohlavi interakční koeficient formaoranžová:pohlavisamec? | Jakou hodnotu má v modelu forma * pohlavi koeficient formaoranžová:pohlavisamec? |
| Q3 | Podle modelu s interakcí průměru a výšky: můžeme odhadnout, o kolik dřeva přibude s každým centimetrem průměru u stromu vysokého 35 m? | Co platí o přírůstku objemu na 1 cm průměru u stromu vysokého 35 m? (with the reworded options below) |

The Q2 figure title („Průměrná délka krunýře ve čtyřech skupinách“) and the Q3 card title and subtitle carry the context removed from the stems.

Q3 options were reworded after the independent review (see Review). Author decision 2026-10-19: „Parallel statements (Recommended)“. Key and option IDs are unchanged.

| ID | Approved option | Implemented option |
|---|---|---|
| A `duvera-extrapolaci` | Ano, sklon je +0,107 m³ na 1 cm. | Je +0,107 m³ na 1 cm; vzorec platí pro každou výšku. |
| B `koeficient-prumeru` | Ano, sklon je −0,065 m³ na 1 cm. | Je −0,065 m³ na 1 cm; to je koeficient prumer_cm. |
| C `mimo-data` (correct) | Spočítat lze, ale 35 m je mimo data. | Vyjde +0,107 m³ na 1 cm; 35 m je ale mimo data. |
| D `nelze-spocitat` | Ne, u dvou číselných znaků sklon nespočítáme. | Nelze ho spočítat; u dvou číselných prediktorů sklon nemá smysl. |

The Q3 explanation now glosses „extrapolace“ as „odhad mimo pozorované výšky“, because the L08 slides teach the idea but not the word.

## Evidence

The assets are saved wider than 16:9 (cards 10 × 4,2 and 10 × 4,4 in, means figure 10 × 4 in, at 160 dpi), because the quiz slide caps evidence at a fixed height; they are therefore shown about 1,3–1,4× larger than 16:9 assets. The Q3 card header gives units („Odhad (m³, m³/cm, m³/m)“).

| Asset | Content | SHA-256 |
|---|---|---|
| `l08-koeficienty-interakce.png` | Coefficient card of `zadni_sirka_mm ~ delka_krunyre_mm * pohlavi` (100 blue crabs, reference `samice`), four rows at 4 decimals, no row highlighted | `dc0b3b1d33b1139ed9b24175ddd5e47b17972c7b65a214db397e1e7c739154c1` |
| `l08-ctyri-prumery.png` | Four-group jitter plot of carapace length by form and sex, mean diamonds joined within form, the four means labelled beside them; L08 sex colours `#009E73`/`#CC79A7` | `9868f88ed65b55a06e060e7deff795b20eb24bca3bb1930f12b5d2ea57744656` |
| `l08-stromy-koeficienty.png` | Coefficient card of `objem_m3 ~ prumer_cm * vyska_m` (31 trees) at 5 decimals; subtitle with the observed ranges (průměr 21,1–52,3 cm, výška 19,2–26,5 m) | `650eacea1c0f352e31823c225bd6e18cca940514986897baf53fd284bdced75c` |

## Validation

- `node pollslive/validate.mjs`: passed without credentials.
- `Rscript R/verify_pollslive_assets.R`: passed.
- `POLLSLIVE_RENDER_MODE=offline Rscript R/render_presentation.R`: 55 slides. Static PDF pages 4–6 were rendered to PNG and inspected after every change (stems, Q3 options, wider assets): stem, evidence, four options and answer panel fit on each slide, number–unit pairs no longer break, and the keyed option and explanation match `quiz.json`.
- Synchronized render: not run. It needs the quiz inputs (`pollslive/quiz.json`, `pollslive/assets/`, `pollslive/source/l08-stromy.csv`, both R scripts) committed and pushed by the author first.

## Review

Independent read-only review: completed on 2026-10-19 by a separate reviewer subagent (canonical prompt `.ai/agents/vision-corrector.md` with the PollsLive balance rules, scoped to the L09 retrieval block; Sonnet, chosen as a capable general-purpose model for a focused content and numeric review of three items). The reviewer recomputed every value from the source CSVs, confirmed the L08 knowledge-state ledger against the L08 slides and written materials, and verified the checksums and the course balance (A 7, B 6, C 7, D 7; each question number within one). No blockers.

Should-fix, resolved: (1) Q3 key was the only hedged option („ale“) among Ano/Ne options, and the stem „Můžeme… odhadnout?“ could be answered „Ano“; options rewritten as parallel statements (author decision above). (2) Q3 option D used „znaků“ instead of the course term „prediktorů“; corrected. (3) Evidence too small when projected; assets saved wider, Q3 card units added.

Minor, resolved: „30 mm“ and „35 m“ broke across lines (non-breaking spaces); „extrapolace“ not taught on L08 slides (glossed). Minor, kept: Q3 evidence prints the observed ranges (approved design, so the item checks the habit rather than recall of the ranges); Q2 stem no longer names the response (the figure title does); mean labels overlap a few jittered points; the lone „: −1,76 mm“ in the static answer panel is a framework artefact shared by L08 and L10.

Focused re-check by the same reviewer (2026-10-19): no blockers, no should-fix. It confirmed C as the single defensible Q3 answer, A, B and D as wrong after L08, the checksums, legibility of the cards and the non-breaking spaces. Two minors were then resolved: C now uses the same semicolon form as the other options („Vyjde +0,107 m³ na 1 cm; 35 m je ale mimo data.“), and the means figure is saved wider (10 × 4 in) so it is shown larger. Kept: C is the only option that mentions the data, which is the concept being tested; options and explanations use ordinary spaces (no visible break).

## Operational boundary

No staging, commits, pushes, live PollsLive operations, response submissions or activation changes were made.

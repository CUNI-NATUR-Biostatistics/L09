# L09 PollsLive evidence: L08 crab sex colours

## Scope

- Date: 2026-10-15. Branch: `pollslive/l09-crab-sex-colours` from `main` `4c13781` (created with explicit authorization: „make new branch for L09 and L10 and fix that").
- Trigger: L08 author decision 2026-10-15 (L08 `Workflow/records/2026-10-15-polish-review.md`, „Revised decision D2"). In L08 blue and orange mark the two crab colour forms, so the sexes are coloured bluish green `#009E73` (samice) and reddish purple `#CC79A7` (samec), repeated by shape (● samice, ▲ samec). The L09 retrieval quiz reuses L08 crab figures and must look the way students saw them in L08.
- Teaching content unchanged: question text, options, option order (key unchanged), correct answers, explanations, alt text, source data (`pollslive/source/l08-krabi.csv`, pinned L08 revision `48a0270`) and the coefficient-card image.
- L10 was checked and needs no change: it mentions the L08 crab example only in text.

## Changes

- `R/render_pollslive_assets.R`: sex palette `#009E73` / `#CC79A7`, shapes 16/17, point alpha 0.85.
- Re-rendered `pollslive/assets/l08-nerovnobezne-primky.png` (SHA-256 `C5EE7001714A10C48D6F19C662BF69EF27133467DDAE6DC3AD686B63DBCC6E48`) and `l08-dva-kandidati.png` (`E56490D44CE5D555EA8F6FA6CE21F953711EE9846990012AF32066D5D376D22A`); `l08-koeficient-pohlavi.png` is byte-identical.
- `pollslive/quiz.json` provenance and `R/verify_pollslive_assets.R` approved-asset pins updated to the new checksums.

## Validation

- `node pollslive/validate.mjs`: passed.
- Offline canonical render (`POLLSLIVE_RENDER_MODE=offline`): 55 slides; quiz slides 4–6 inspected in the static PDF with the new colours.
- The committed outputs were a synchronized render; the working tree now holds the offline variant until the synchronized render is rerun.

## Remaining steps (each needs separate authorization)

1. Commit and push the lesson-owned inputs (`quiz.json`, both assets, both R scripts) so the synchronized render can compare them with the upstream revision.
2. Synchronized render (`POLLSLIVE_RENDER_MODE=sync`), which updates the registered poll content before the lecture on 2026-11-30.
3. PR and merge. The `_internal` activation row for L09 is still disabled with no pinned checksums, so no activation change is needed now; activation follows the usual separate gate.
4. Human acceptance of the recoloured evidence.

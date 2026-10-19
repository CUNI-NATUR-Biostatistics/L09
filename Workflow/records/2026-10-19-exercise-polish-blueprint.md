# L09 exercise polishing blueprint

## Scope

- Artifact: `Exercises/cviceni.R`; addendum to [the approved exercise blueprint](2026-10-08-exercise-blueprint.md), which remains valid for outcomes mapping, prerequisites, reference values and the optional bank unless changed below.
- Date: 2026-10-19. Branch: `polish/l09-before-teaching`.
- Authorization: D5 „yes“ (2026-10-19) in [the review](2026-10-19-polish-review.md); blueprint approved by Ondřej Mottl on 2026-10-19 („Other than that, I approve“).
- Requested work: resolve E1–E5 and the cross-artifact findings A2, A3, A4 and A6 in the exercise.
- Stable task IDs: all 28 IDs (`L09-U01`–`L09-U08`, `L09-N01`–`L09-N20`) keep their numbers and purpose. Code objects used across tasks keep their names (`sst_vyska`, `data_porovnani`, `vec_cook`).

## Changes

| Finding | Change |
|---|---|
| A6 / E1 | „Jak získat a otevřít soubory“ follows L08: the two stable URLs (`/L09/current/code/cviceni.R`, `/L09/current/data/allometrie_stromu.csv`), saving steps, a note about moving files out of the Downloads folder, and the box-drawing folder tree with `L09_praktikum.Rproj`. The README/GitHub „Download raw file“ route and „Po vydání cvičení…“ are removed. „Jak se skriptem pracovat“ names the task dependencies (which core objects later tasks use), as in L08. |
| A2 | One bridging sentence after the variable list: these are different trees from the previous lesson, and height is now the response, not a predictor. |
| A3 / E2 | `vec_barvy_druhu` uses the deck palette `#4E9A8A` / `#C2613A` / `#2E6CA4`; `vec_symboly_druhu` (16 / 17 / 15) stays. The U01 expected result names colours and shapes if needed. |
| A4 | Shared five outcomes, „Po dokončení cvičení budete schopni:“. |
| E3 | The R² section and U04 introduce „celkový součet čtverců (anglicky total sum of squares, zkratka SST)“, so the object name `sst_vyska` stays but the wording matches the written materials. |
| E4 | The U03 plotting scaffold defines three logical row selectors once in supplied code (e.g. `vec_radky_monticola <- data_predikce$druh_stromu == "Pinus monticola"`), so each `lines()` call fits within 80 characters and students change only the `y =` column. Hint 2 and the expected result are adjusted accordingly. No other code line exceeds 80 characters. |
| E5 | `read.csv()` without `stringsAsFactors`/`check.names`; the explanatory comment is shortened accordingly. |

## Timing

Unchanged core budget of about 70 minutes of direct work; the U03 selector change saves about a minute of copy-editing, and the longer preparation text adds about two minutes of reading. This is still below the 85–95-minute ceiling; the optional bank (N15 for reading the arch through residual means) absorbs faster groups. No new core task is added in this round.

## Review outcomes (2026-10-19)

- Independent exercise review (Sonnet, capable general-purpose, balanced): no High or Medium findings; five Low:
  - F1: run, restart and dependency instructions incomplete.
  - F2: function calls on the `<-` line.
  - F3: unexplained `KEEP.OUT.ATTRS`/`stringsAsFactors` and a redundant `factor()` step in the `expand.grid()` code of U03, N04 and N16.
  - F4: the pointer to the data README went nowhere for students.
  - F5: U03 Nápověda 1 restated the task, plus wrapping nits and RSS not glossed.
- All five resolved:
  - the preparation run instruction now covers the palette vectors, and a sentence says to run uncommented worked examples;
  - restart means rerunning the script from the top, including examples, and the dependency list names the U04 and U05 objects;
  - vertical assignments throughout;
  - `expand.grid()` simplified, with one sentence on why the factor levels match;
  - the course-site link label „Původ dat o allometrii stromů“;
  - a new conceptual Nápověda 1 for U03;
  - RSS glossed as „součet čtverců residuí (residual sum of squares, RSS)“.
- Revalidated after the fixes:
  - clean `--vanilla` sourcing passes and all numeric expected values reproduce;
  - the U03 scaffold was solved for all three models;
  - the N04 grid factor levels match `data_stromy`;
  - the only line over 80 characters is the CSV URL.
- Timing: the reviewer estimates 80–100 minutes of direct novice work, against this blueprint's 70. The upper end touches the 85–95-minute band, and U08 can move into discussion or home study. No restructuring; a classroom timing trial is advisable.

## Validation required

Parse and UTF-8 checks; clean `--vanilla` source run from a temporary student-style folder with only `cviceni.R` and `data/allometrie_stromu.csv`; untracked reference harness solving all 28 tasks with every stated expected value checked; visual inspection of the recoloured plots; longest-line check (≤ 80 characters); prohibited-pattern and first-use audits; independent read-only review with `.ai/agents/exercise-reviewer.md` (capable general-purpose model, balanced effort); human approval.

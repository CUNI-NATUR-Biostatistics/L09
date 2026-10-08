# L09 PollsLive answer-position balance

- Date: 2026-10-08
- Approver: Ondrej Mottl (human author)
- Decision: implement the human request to rebalance L03 onward; L01 and L02 are locked.
- Requested revision: avoid quizzes with all answers in the same position and reduce the excess of A answers.
- Scope: permute existing option objects and add a credential-free validator check against three identical correct-answer positions.

## Approved teaching scope

The existing retrieval integration map, quiz placement, question order, knowledge-state ledger, correct option IDs, explanations, evidence, alt text, and provenance are preserved. This is a focused ordering correction to approved questions, not a new authoring stage. Earlier workflow records retain the historical order; this addendum and pollslive/quiz.json define the current option order.

## Answer key and current option order

| Question ID | Before | After | A option ID | B option ID | C option ID | D option ID |
|---|---|---|---|---|---|---|
| changing-sex-difference | A | A | difference-changes | constant-difference | lines-must-cross | predictor-correlation |
| conditional-sex-coefficient | A | B | difference-everywhere | difference-at-zero | difference-at-mean | slope-difference |
| additive-versus-interaction | A | D | additive-ignores-sex | different-crabs | different-response | slope-difference-term |


## Cross-lesson balance

| Lesson | Correct positions (Q1-Q3) |
|---|---|
| L01 (locked, onboarding) | BBA |
| L02 (locked) | BCA |
| L03 | ADC |
| L04 | DCB |
| L05 | CDA |
| L06 | BAC |
| L07 | CBD |
| L08 | DAB |
| L09 | ABD |

Across the 24 four-option retrieval questions in L02-L09, A, B, C, and D are each correct six times (25%). At each question number separately, every position is correct twice. L03-L09 alone has A=5, B=5, C=5, D=6, the closest possible balance across 21 questions. Every L03-L09 quiz has three distinct answer positions.

## Validation

- The lesson validator and canonical definition validation pass without credentials.
- Isolated negative checks reject AAA, BBB, CCC, and DDD for this lesson.
- Before/after semantic comparison confirms that only option order changed; all option labels and IDs are preserved.
- The canonical payload builder retains the new option order.
- Canonical offline and static quiz includes contain the new option order and unchanged correct answers and explanations; both quiz blocks render to standalone RevealJS HTML in an isolated temporary directory, with all three evidence images verified as embedded image data URLs.
- Evidence hashes, configuration, asset sources and presentation source match their pre-change bytes. UTF-8 has no BOM or replacement characters.
- Independent read-only review: passed on 2026-10-08 by the separate quiz_order_review subagent using the canonical vision-corrector prompt. Final source, answer positions, evidence lettering, and all 14 isolated HTML variants were checked; no findings remain. The complete production rerender and subsequent visual review are recorded below.

## Full-deck rerender and review

- Human follow-up: carry the changes to a new branch, rerender the slides, commit, and open a PR; exclude L04.
- Branch: fix/pollslive-answer-balance, based on the verified current main revision.
- Canonical command: Rscript R/render_presentation.R in a fresh R session, with POLLSLIVE_RENDER_MODE=offline and the verified local client pinned to 8f85e9f9e31dc1b0f05912d5605e4c9cc557e8e6.
- Refreshed outputs: Presentation/presentation.html, Presentation/presentation.pdf, and docs/index.html; 55 PDF pages.
- Production HTML/PDF checks confirm the ABD key, exact option order, correct answers, unchanged explanations, and embedded evidence. Presentation HTML and docs/index.html are byte-identical.
- Independent read-only review by quiz_order_review using the canonical vision-corrector prompt: complete-deck PDF overviews, all three full-size quiz pages, and all six initial/revealed HTML quiz states checked; no focused findings remain.
- Incidental theme/helper refreshes produced by the render were restored from exact pre-render snapshots. Presentation source and evidence remain byte-identical.
- Source diff whitespace checks pass. Generated HTML may contain tinytable's renderer-produced trailing spaces and randomized table identifiers.

## Operational boundary

The rendered decks use offline quiz fallbacks. This correction does not authorize live PollsLive operations, response submissions, activation, merging, tags, or releases. Changed quiz definitions require an immutable pushed revision, guarded synchronization, and matching activation checksum approval before live use. L06 needs no teaching-content synchronization because its definition is unchanged. The six scoped lesson PRs exclude L04, internal guidance changes, and unrelated existing workflow records.
